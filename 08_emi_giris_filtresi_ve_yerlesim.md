# EMI, Giriş Filtresi ve Yerleşim

[README özetine dön](README.md)

## Bu Dosyanın Amacı

Bu dosya hot-loop, differential-mode EMI, common-mode EMI, giriş filtresi kararlılığı, Middlebrook / damping ilişkisi ve PCB yerleşim kurallarının primary owner'ıdır.

Giriş kapasitörlerinin fiziksel seçimi [04](04_giris_kapasitorleri_ve_giris_agi.md) dosyasında kalır. Bu dosya, o giriş ağının EMI ve kararlılık tarafında nasıl kullanıldığını anlatır: hangi akım yolları gürültü üretir, hangi filtre rezonansı risklidir, hangi porttan `Zfilter,out` ölçülür, hangi layout kararı EMI'yi büyütür veya azaltır.

## Kapsadığı Eski README Başlıkları

- `## 7. EMI, Giris Filtresi ve Yerlesim`
- `### 7.1 Hot-loop ve kritik akim yollari`
- `### 7.2 Differential-mode EMI`
- `### 7.3 Common-mode EMI`
- `### 7.4 Giris filtresi kararliligi`
- `### 7.5 Yerlesim kurallari`

## Upstream / Downstream Okuma Bağlantıları

- Upstream global girdiler: [01](01_tasarim_girdileri_ve_kaynaklar.md)
- Upstream startup / `fsw` / duty: [02](02_startup_pin_programlama_ve_ortak_sabitler.md)
- Upstream giriş kapasitörleri ve giriş ağı: [04](04_giris_kapasitorleri_ve_giris_agi.md)
- Upstream MOSFET seçim / `dV/dt` / switching edge riski: [05](05_mosfet_secimi_ve_dayanim_mantigi.md)
- Upstream gate-drive, bootstrap, protection ve termal kapanış: [06](06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md)
- Upstream kontrol loop / `fc` / faz marjı: [07](07_kontrolcu_ve_kompanzasyon.md)
- Downstream simülasyon ve açık sorular: [09](09_simulasyon_gorseller_ve_acik_sorular.md)

## Owner Notu

Bu dosyada tam anlatımı yapılacak kümeler:

- hot-loop ve kritik yüksek `di/dt` akım yolları,
- differential-mode EMI ve gerekli attenuation izleri,
- common-mode EMI ve switch-node / `dv/dt` kaynaklı riskler,
- giriş EMI filtresi rezonansı,
- damping kolu ve `R_D-C_D` mantığı,
- Middlebrook / negatif giriş empedansı,
- filtre portları ve ölçüm düğümleri,
- PCB yerleşim checklist'i.

Owner dışı kalanlar:

- `Cin` MLCC / bulk / helper kapasitör seçimi: [04](04_giris_kapasitorleri_ve_giris_agi.md)
- MOSFET `dV/dt`, Miller ve yanlış turn-on seçim mantığı: [05](05_mosfet_secimi_ve_dayanim_mantigi.md)
- `Rboot`, gate-drive, dead-time, kayıp ve termal kapanış: [06](06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md)
- loop compensation ve `fc/PM` hedefi: [07](07_kontrolcu_ve_kompanzasyon.md)

## 04 Dosyasıyla İlişki

[Referans Notu] [04](04_giris_kapasitorleri_ve_giris_agi.md) dosyası giriş kapasitör bankının komponent owner'ıdır. Bu dosya o seçimleri yeniden sahiplenmez; EMI/filter/layout tarafında kullanır.

04'ten bu dosyaya gelen ana handoff'lar:

| 04 girdisi | 08'deki kullanım |
|---|---|
| `5 x 4.7 uF / 50 V / X7R` ana MLCC bankı | hot-loop akımı, etkin `Cin`, differential-mode attenuation hesabı |
| etkin `Cin ≈ 8.195-8.228 uF` | `W.137` attenuation hesabında hangi `Cin` etkili sorusu |
| helper `10 nF` MLCC'ler | yüksek frekans spike / ringing / layout bypass |
| bulk giriş kapasitörleri | düşük frekans ve transient rezerv; EMI damping ile etkileşim |
| `0.24 Vpp` giriş ripple hedefi | converter input tarafı hedefi; filtre / ölçüm noktasıyla tekrar okunacak |
| `50 mApp` input current ripple hedefi | EMI / input-filter kalite hedefi; yalnız MLCC hesabıyla kapanmaz |
| `WEBENCH Vin p-p = 2.951 V` | ölçüm noktası ve filtre koşulu belirsiz açık kontrol |

[Açık Kontrol] EMI attenuation hesabında hangi `Cin` etkili sayılıyor, bulk frekansta gerçekten hesaba giriyor mu, filtre öncesi/sonrası port neresi, hepsi bu dosyada açık yazılacak. `Cin` değerini yeniden seçmek için 04'e geri dönülür.

## Okuma Haritası

| Sıra | Blok | Neyi kapatır? |
|---:|---|---|
| 1 | Hot-loop | gürültünün fiziksel kaynağı ve kritik akım yolları |
| 2 | Differential-mode EMI | darbeli giriş akımı, attenuation hedefi, WEBENCH checkpoint |
| 3 | Common-mode EMI | switch-node `dv/dt`, kapasitif kaçak yollar, küçük sinyal hatları |
| 4 | Giriş filtresi kararlılığı | `L_IN-C_F`, rezonans ve damping |
| 5 | Middlebrook | `Zfilter,out < Zin` port mantığı ve worst-case `Zin` |
| 6 | Yerleşim checklist'i | PCB üzerinde uygulanacak somut kontrol listesi |

## Hot-loop ve Kritik Akım Yolları

Senkron buck yapısında en kritik yüksek `di/dt` döngüsü, giriş kapasitörleri ile yarım köprü arasındaki sıcak döngüdür. Pratik olarak bu döngü şu elemanlar üzerinden kapanır:

- giriş MLCC / bulk kapasitörleri,
- high-side MOSFET,
- low-side MOSFET,
- tekrar giriş kapasitörlerinin dönüş yolu.

Bu alan büyüdükçe parasitik endüktans artar; anahtarlama anındaki gerilim sivrilmeleri ve yayılan EMI ağırlaşır.

### Hot-loop Görsel İzleri

![LM5146, yarı köprü ve high-frequency power loop'u bir arada gösteren notlu çizim](images/foto_selected/p44_high_frequency_power_loop.jpg)

![Yarı köprü ve switch-node alanını daha belirgin gösteren notlu çizim](images/foto_selected/p45_switch_node_half_bridge_highlight.jpg)

![Gate-drive ve hot-loop akım yollarını temiz şekilde gösteren kaynak şekil](images/foto_selected/p48_gate_drive_current_loops_clean.jpg)

![High-frequency power loop ile gate-drive dönüşlerini aynı şekilde toplayan ikinci temiz kaynak şekil](images/foto_selected/p51_hot_loop_gate_drive_clean.jpg)

Bu dört görsel aynı riski farklı açıdan gösterir:

- yüksek frekanslı güç döngüsü küçük kalmalı,
- high-side / low-side gate-drive dönüşleri de kısa ve temiz kapanmalı,
- `CIN` bankı yarım köprüye fiziksel olarak yakın durmalı,
- switch-node alanı gereksiz büyütülmemeli,
- analog `FB`, `COMP`, `SS/TRK` gibi sakin hatlar sıcak döngü üzerinden geçmemeli.

Pratik kontrol:

```text
CIN MLCC pozitif ucu -> high-side drain tarafına kısa/düşük ESL yol
CIN MLCC negatif ucu -> low-side source / PGND dönüşüne kısa/düşük ESL yol
gate-drive dönüşleri -> kendi kapalı yolunu bulmalı
switch-node bakırı -> akım ve termal ihtiyacı kadar, kontrollü büyüklükte
```

İkinci önemli akım yolu bobin ve çıkış kapasitörleri etrafındaki çıkış akış yoludur. Bu yol hot-loop kadar sert `dv/dt` üretmese de ripple, transient ve ölçüm kalitesi üzerinde belirgindir; ayrıntılı çıkış kapasitörü owner'ı [03](03_bobin_ve_cikis_kapasitorleri.md) dosyasıdır.

## Differential-mode EMI

Differential-mode EMI'nin ana kaynağı, buck dönüştürücünün kaynaktan çektiği darbeli giriş akımıdır. Bu tasarımda ilgili hedef doğrudan zorlayıcıdır:

```text
CISPR 25 Class 5
pi-stage giriş EMI filtresi
elektrolitik parallel damping hedefi
```

Bu nedenle differential-mode EMI "sonradan filtre eklenir" mantığıyla kapatılamaz. Giriş akımı, giriş kapasitörlerinin gerçek ESR/ESL/dc-bias davranışı, filtre öncesi/sonrası kapasitör dağılımı, EMI bobini, rezonans ve damping birlikte okunur.

![Buck giriş akımının darbeli yapısını ve `Tsw ≈ 3 us` olduğunu notladığın ekran](images/foto_selected/p96_input_current_pulses_333khz.jpg)

Bu ekran differential-mode EMI'nin soyut bir standart maddesi değil, doğrudan kaynaktan çekilen darbeli akım dalga şekliyle ilişkili olduğunu gösterir. Üzerindeki `I_L,peak ≈ 11 A` ve `Tsw ≈ 3 us` notları, `1/Tsw ≈ 333.3 kHz` ile proje `fsw` çizgisini zaman alanında bağlar.

### WEBENCH EMI Checkpoint

![WEBENCH raporundan EMI sonrası spektrum, filtre / converter empedans karşılaştırması ve operating values özeti](images/foto_selected/p106_webench_emi_and_operating_values.png)

[Çapraz Teyit] WEBENCH snapshot'ında filtre sonrası giriş gürültüsü `61.79 dBuV`, aynı raporda verilen `67.75 dBuV` sınırının altında görünür. Bu olumlu bir checkpoint'tir.

[Açık Kontrol] Bu sonuç `W.103-W.137` attenuation hesabıyla birebir aynı şey değildir. Final EMI yorumu için şunlar açık yazılmalı:

- LISN / ölçüm düğümü,
- filtre öncesi ve sonrası oran,
- referans birim,
- ölçülen `dBuV` seviyesi,
- istenen `dB` attenuation,
- filtreli / filtresiz koşul.

### `W.103`: İlk Harmonik Üzerinden Attenuation İzi

![W.103'ten küçük kırpım: ilk harmonik yaklaşımı ile gereken EMI attenuation hesabı](images/defter_snippets_web/d195_w103_required_emi_attenuation.jpg)

![Defter p199 / W.103: EMI süzgecinin gerekli attenuation hesabı, ilk harmonik tanımı, `Cin = 4.7 uF` ara girdisi ve `Attn ≈ 46.8 dB` izi](images/defter_full_pages/defter_p199.jpg)

`W.103`, differential-mode EMI filtresinin ne kadar attenuation sağlaması gerektiğini ilk harmonik yaklaşımıyla kestirmeye çalışır.

Korunan ilişki:

$$
Attn \approx 20\log_{10}\left(
\frac{I_{L,peak}}{\pi^2 f_{sw} C_{in}}
\sin(\pi D_{max})\frac{1}{1\,\mu V}
\right)-V_{max}
$$

Sayfadaki girdiler:

```text
I_L,peak = 11 A
fsw = 332.333 kHz
Cin = 4.7 uF
Dmax = 0.5833
Vmax = 30 dBuV
```

Sonuç:

```text
Attn ≈ 46.80 dB
```

Bu değer final standart uyum sonucu değildir. Filtre hedefinin artık "biraz bastırsın" seviyesinden çıkıp `~40 dB` üstü bir zayıflatma ihtiyacına geldiğini gösteren tasarım izidir.

[Tasarım İzi] Tam sayfa `p199`, bu hesabın sözlü bağlamını tamamlar. Sayfa "EMI süzgecinin ne kadar attenuation sağlaması gerektiği" sorusuyla başlar; `I_L(peak)` giriş akımının birinci harmonik bileşeni / anahtarlama frekansı civarındaki darbeli akım izi olarak tanımlanır. `Dmax` için duty'nin en yüksek olduğu `24 V` giriş koşulundan `14/24` satırı kullanılır. `Vmax`, EMI standardına göre izin verilen maksimum gürültü seviyesi `dBµV` olarak açıklanır. Notun alt tarafı ilk harmonik bileşenin sisteme en çok EMI yayan bileşen olduğunu, bunun `Cin` tarafından bastırıldığını ve `Cin` yeterli değilse ek süzgeç bileşenleri gerekeceğini yazar.

[Açık Kontrol] Tam sayfa `p199` üzerinde `Vmax = 70 dBµV`, `fsw = 333.333 kHz`, `Cin = 4.7 uF`, `Dmax = 0.5833` ve `Attn = 46.8 dB` gibi okunan izler vardır. Yukarıdaki küçük kırpım/OCR hattında ise `Vmax = 30 dBuV` ve `fsw = 332.333 kHz` korunmuştu. Bu farklar sessizce harmonize edilmedi. `Cin = 4.7 uF` burada tek kapasitör / ara EMI girdisi gibi okunur; gerçek etkin giriş kapasitansı ve bulk dahil/dahil değil ayrımı [04](04_giris_kapasitorleri_ve_giris_agi.md) owner'ından gelecek.

### `W.137`: Etkin `Cin` Seçimine Göre Attenuation

![W.137'den küçük kırpım: etkin `Cin` seçimine göre attenuation hesabının değiştiğini gösteren not](images/defter_snippets_web/d196_w137_attenuation_vs_effective_cin.jpg)

![Defter p200 / W.137: etkin `Cin = 8.22 uF`, bulk hariç yüksek frekans EMI yorumu, `Ipeak ≈ 10.9 A` ve `Attn > 43.14 dB` hesabı](images/defter_full_pages/defter_p200.jpg)

`W.137`, aynı attenuation hesabına "hangi `Cin` etkili sayılmalı?" sorusunu ekler:

```text
I_L,peak ≈ 10.9 A ≈ 11 A
fsw ≈ 332 kHz
Dmax ≈ 0.6481
Vmax ≈ 63 dBuV
Cin,etkin ≈ 8.22 uF
```

Sayfadaki kritik not:

```text
dikkat dikkat bulk cap hariç tutulursa
```

Sonuç:

```text
Attn >= 43.14 dB
```

Okuma:

- `46.8 dB` ve `43.14 dB` aynı final sonuç değil; farklı `Cin` ve limit varsayımlarıyla kurulan iki tasarım izidir.
- `Cin` azalırsa gereken attenuation artar.
- Bulk kapasitör düşük frekans ve transientte güçlü olabilir; yüksek frekans EMI hesabında aynı ağırlıkta davranmayabilir.

[Tasarım İzi] Tam sayfa `p200`, `W.137` küçük kırpımının geniş halidir. Sayfa `Ipeak = Ioutmax + DeltaIL/2 = 9 A + 3.8 A/2 = 10.9 A ≈ 11 A` hesabını açık yazar. `Cin,etkin = 8.22 uF` satırının yanına "bulk cap hariçtir" uyarısı düşülür; gerekçe olarak EMI attenuation hesabında esas belirleyici olanın yüksek frekanstaki etkin sığa olduğu, bulk kapasitörlerin daha düşük frekanslarda ve transient olaylarda etkili olduğu not edilir.

[Çapraz Teyit] Sayfanın altındaki tekrar hesapta `Dmax = 0.6481`, `fsw ≈ 332 kHz`, `Cin,etkin ≈ 8.22 uF` ve limit olarak `67.75 dBµV` gibi okunan değerlerle `Attn > 43.14 dB` sonucuna gidilir. Bu çizgi, [04](04_giris_kapasitorleri_ve_giris_agi.md) dosyasındaki gerçek ana MLCC etkin kapasite ayrımına bağlıdır; burada yeni giriş kapasitörü seçimi yapılmaz.

[Açık Kontrol] Final attenuation tablosunda her satırın şu bilgileri olacak: harmonik/frekans noktası, `Cin,etkin`, bulk dahil mi değil mi, limit çizgisi, LISN portu, filtre öncesi/sonrası düğüm ve birim.

## Common-mode EMI

Bu aşamada common-mode EMI için sayısal hesap yoktur. Buradaki amaç, switch-node ve yarım köprü etrafındaki hızlı `dv/dt` alanlarını layout aşamasında görünür tutmaktır.

Common-mode EMI, yalnız giriş akımı dalgalanmasından değil, hızlı `dv/dt` üreten switch-node'un parasitik kapasiteler üzerinden çevreye enerji bağlamasından kaynaklanır.

Hassas bölgeler:

- switch-node bakırı,
- yarım köprüye yakın sıcak alanlar,
- kabloya, şaseye veya ölçüm düzenine kapasitif bağ yapabilecek yüzeyler,
- `FB`, `COMP`, `SS/TRK`, `RT` gibi küçük sinyal hatları,
- gate-drive dönüşleri ve bootstrap alanı.

İlk yerleşim kararları:

- switch-node bakırını gereksiz büyütme,
- feedback ve `COMP` hatlarını switch-node altından / yakınından geçirme,
- kirli güç alanı ile sakin analog alanı fiziksel olarak ayır,
- `dV/dt` hızını gate direnci, `Rboot`, snubber ihtiyacı ve EMI hedefiyle birlikte düşün,
- shield / ekranlama seçeneklerini en sonda değerlendir.

[Referans Notu] MOSFET `dV/dt`, Miller yanlış turn-on ve gate yolu seçimi [05](05_mosfet_secimi_ve_dayanim_mantigi.md) dosyasında; gate-drive ve `Rboot` elektriksel kapanışı [06](06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) dosyasındadır. Bu dosya onların common-mode EMI ve layout etkisini sahiplenir.

[Açık Kontrol] Common-mode tarafında ilk kabul sayısı yoktur; PCB üzerinde işaretlenecek risk bölgeleri vardır. Final kontrolde switch-node alanı, kablo/LISN bağlamı, şaseye kapasitif yol ve küçük sinyal hatlarının rotası birlikte incelenecek.

## Giriş Filtresi Kararlılığı

Giriş EMI filtresi eklendiğinde mesele yalnız bastırma elde etmek değildir; dönüştürücünün bu filtre ile birlikte kararlılığını koruması gerekir.

Ana fikir:

- EMI filtresinin çıkış empedansı ile dönüştürücünün giriş tarafı dinamik davranışı tehlikeli etkileşime girmemeli,
- filtre rezonansı kontrol döngüsü ve güç katıyla problemli çift-kutup / negatif empedans etkisi oluşturmamalı,
- gerekirse elektrolitik parallel damping veya ayrı damping ağı kullanılmalı.

[Açık Kontrol] `22.46 kHz` ve `19.21 kHz` gibi rezonans notları `35 kHz` crossover hedefinin altında ama ona yakındır. Bu tek başına "filtre olmadı" demek değildir; `Zfilter,out` ve `Zin` aynı port tanımıyla, dampingli/dampingsiz ve özellikle `Vin_min / Pout_max` koşulunda karşılaştırılacak.

### `W.100`: Filtre Rezonansı ve Middlebrook Notu

![W.100'den küçük kırpım: `fres = 1/(2*pi*sqrt(LIN*CF))` ve Middlebrook uyumu notu](images/defter_snippets_web/d200_w100_middlebrook_and_filter_resonance.jpg)

Filtre rezonans frekansı:

$$
f_{res}=\frac{1}{2\pi\sqrt{L_{IN}C_F}}
$$

Sayfadaki örnek:

$$
f_{res}\approx
\frac{1}{2\pi\sqrt{10.68\,\mu H \times 4.7\,\mu F}}
\approx22.46\,kHz
$$

Sayfanın ana uyarısı:

- `L_IN` ve `C_F` bu frekansta kendi rezonansına sahip olur,
- bu rezonans buck'in kontrol davranışını dolaylı etkileyebilir,
- open-loop / closed-loop cevap bozulabilir,
- phase margin azalabilir,
- sistem osilasyona gidebilir.

Middlebrook notu:

$$
\left|Z_{filter,out}(j\omega)\right|<
\left|Z_{in}(j\omega)\right|
$$

Bu, giriş kaynağı / filtre tarafının converter girişine doğru gördüğü çıkış empedansının, dönüştürücünün giriş empedansından küçük tutulması gerektiğini söyler.

### `W.101`: Damping Kolu

![W.101'den küçük kırpım: `CD >> 4 CIN` damping kuralı](images/defter_snippets_web/d205_w101_cd_much_greater_than_4cin.jpg)

`W.101`, rezonansı yumuşatmak için seri `R_D-C_D` damping kolu fikrini taşır:

$$
C_D \gg 4C_{IN}
$$

Okuma:

- `C_D`, rezonans frekansında düşük empedanslı davranmalı,
- `R_D` ile birlikte rezonans tepesini bastırmalı,
- DC'de `R_D` üzerinden sürekli ısı kaybı oluşturmamalı,
- `C_D` bu yüzden `C_IN`den çok daha büyük seçilmek istenmiş.

Bu kural final eşitlik değildir; damping kolu için yönlendirici tasarım izidir.

### `W.102`: İlk `L_IN-C_F` Boyutlandırma

![W.102'den küçük kırpım: `L_IN = 4.7 uH` seçimi ve `C_F ≈ 10.68 uF` ilk boyutlandırma notu](images/defter_snippets_web/d197_w102_lin_cf_initial_sizing.jpg)

![Defter p201 / W.102: `L_IN` seçim aralığı, ilk harmonik yaklaşımı, `Attn = 46.8 dB`, `L_IN = 4.7 uH` ve `C_F = 10.68 uF` hesabı](images/defter_full_pages/defter_p201.jpg)

`W.102`, ilk EMI filtre boyutlandırma izidir:

$$
C_F=\frac{1}{L_{IN}}\left(\frac{10}{2\pi f_{sw}}\right)^2
$$

Kullanılan değerler:

```text
L_IN = 4.7 uH
fsw = 332 kHz
```

Sonuç:

$$
C_F\approx
\frac{1}{4.7\,\mu H}
\left(\frac{10}{2\pi\cdot332\,kHz}\right)^2
\approx10.68\,\mu F
$$

[Tasarım İzi] Tam sayfa `p201`, bu boyutlandırmanın nereden geldiğini açar. Defter, EMI filtresi tasarımında giriş akımını kare dalga gibi kabul edip özellikle ilk harmonik bileşeni bastırma yaklaşımını not eder. `L_IN` için `1 uH - 10 uH` aralığı ve yüksek akım uygulamalarında daha düşük indüktans seçme eğilimi yazılır; daha düşük `L_IN` değerinin genelde daha düşük `RDC` anlamına geldiği, `P_LIN = I^2 * R_DC` üzerinden verimi etkilediği not edilir.

[Tasarım İzi] Aynı sayfa `L_IN = 4.7 uH seçtik`, `Attn = 46.8 dB`, `Fsw = 332 kHz` satırlarıyla denklem (19)'u uygular ve `C_F = 10.68 uF` sonucunu verir. Bu sonuç, `W.103`teki `46.8 dB` ilk attenuation izinden türemiş ilk filtre boyutlandırma denemesidir; `W.137`deki `43.14 dB` etkin-`Cin` hattıyla sessizce tek final filtre değeri yapılmayacak.

[Açık Kontrol] `W.100` satırında `10.68 uH x 4.7 uF` gibi, `W.102`de ise `L_IN = 4.7 uH`, `C_F = 10.68 uF` gibi görünür. Çarpım aynı kaldığı için `fres` benzer çıkar; fakat final tasarımda bobin ve kapasitör etiketleri yer değiştirmiş gibi davranamaz. `L_IN`, `C_F`, doyma akımı, DCR, ESR/ESL ve damping kolu tek satırda netleşecek.

### `W.138`: Alternatif Filtre Rezonansı

![W.138'den küçük kırpım: alternatif `L_IN-C_F` çifti için `f_EMI` kontrolü](images/defter_snippets_web/d198_w138_alt_filter_resonance_freq.jpg)

Alternatif aday:

$$
f_{EMI}=\frac{1}{2\pi\sqrt{L_{IN}C_F}}
$$

Sayfadaki iz:

```text
L_IN ≈ 2.2 uH
C_F = onlarca uF mertebesinde
f_EMI ≈ 19.21 kHz
```

Bu değer `fc ≈ 35 kHz` ile kıyaslanır ve `f_EMI << fs` olması gerektiği not edilir. `0.7 fs` benzeri hızlı kontrol notu da vardır; bağlamı net olmadığı için nihai kural gibi kullanılmayacak.

### `W.139`: Karakteristik Empedans

![W.139'dan küçük kırpım: `R0 = sqrt(LIN/CIN)` ile karakteristik empedans notu](images/defter_snippets_web/d199_w139_filter_characteristic_impedance.jpg)

`W.139`, `W.138` adayına karakteristik empedans gibi bir ölçek ekler:

$$
R_0=\sqrt{\frac{L_{IN}}{C_{IN}}}
$$

```text
L_IN = 2.2 uH
C_IN = 25 uF
R0 ≈ sqrt(2.2 uH / 25 uF) ≈ 0.296 ohm
```

Bu `0.296 ohm`, doğrudan `R_D` seçimi değildir. Damping direnci seçilirken `C_D` empedansı, `R_D` ısınması, filtre tepesinin ne kadar bastığı ve `Zfilter,out` eğrisi birlikte görülecek.

### `W.104`: Dampingli Filtre Empedansı

![W.104'ten küçük kırpım: EMI filtresi, `C_F` ve seri `R_D-C_D` damping kolunun topolojik çizimi](images/defter_snippets_web/d201_w104_filter_impedance_expression.jpg)

`W.104`, filtreyi ideal `L_IN-C_F` çifti olmaktan çıkarıp damping ağıyla birlikte yazar:

- seri kolda `L_IN`,
- ana filtre kapasitörü `C_F`,
- seri `C_D-R_D` damping kolu.

Defterdeki empedans iskeleti:

$$
Z_{Filter}=
\left(R_D+\frac{1}{j\omega C_D}\right)
\parallel
\left(j\omega L_{IN}+\frac{1}{j\omega C_F}\right)
$$

[Açık Kontrol - port tanımı] Bu ifade devrenin empedans iskeletidir; Middlebrook karşılaştırmasında kullanılacak büyüklük converter girişine doğru bakılan `Zfilter,out` olmalıdır. Kaynak/LISN tarafı, seri `L_IN` konumu, `C_F` noktası ve damping kolunun hangi düğüme bağlı olduğu portu değiştirir. Final AC sweep'te enjeksiyon noktası ve ölçüm düğümü açık yazılacak.

## Middlebrook, Negatif Giriş Empedansı ve Damping

### `W.105`: Negatif Giriş Empedansı Fikri

![W.105'ten küçük kırpım: negatif giriş empedansı ve `Z0`, `Zin` notları](images/defter_snippets_web/d202_w105_negative_input_impedance_note.jpg)

`W.105`, giriş filtresi kararlılığının neden dikkat istediğini açıklar:

$$
Z_{IN}=\frac{V_{IN}}{I_{IN}}
$$

Sabit güce yakın çalışan converter'ın küçük-sinyal giriş davranışı pasif yük gibi olmayabilir. Bazı frekans aralıklarında negatif artımsal empedans gibi davranabilir. Bu yüzden filtre rezonansı converter `Zin` davranışıyla kötü etkileşirse salınım riski artar.

Sayfadaki uyarı:

```text
Z0 > Zin ise
LC filtresinin giriş empedansı converter'ın negatif empedansı ile etkileşir
```

Bu işaret değil; büyüklük ve frekans bağlamında okunacak uyarıdır.

### `W.106`: Worst-case `Zin` İfadesi

![W.106'dan küçük kırpım: `|Zin| = |-Vin(min)^2 / Pin|` worst-case ilişkisi](images/defter_snippets_web/d203_w106_zin_min_equation.jpg)

Worst-case giriş empedansı için kullanılan büyüklük:

$$
\left|Z_{IN}\right|_{min}=
\left|-\frac{V_{IN(min)}^2}{P_{IN}}\right|
$$

Burada:

- `VIN(min)`: minimum giriş gerilimi,
- `PIN`: giriş gücü,
- daha düşük `|Zin|`: daha büyük enerji emme eğilimi ve filtreyle daha kritik etkileşim.

Bu sabit direnç modeli değildir; constant-power yaklaşımından gelen referans büyüklüktür. Gerçek `Zin(jw)` kontrol döngüsü, feedforward, giriş kapasitörleri, ESR/ESL ve çalışma noktasıyla frekansa göre değişir.

### `W.136`: Proje Sayılarıyla `Zin`

![W.136'dan küçük kırpım: projeye göre sayısal `|Zin|` sonucu](images/defter_snippets_web/d204_w136_numeric_zin_result.jpg)

`W.136`, aynı ilişkiyi proje değerleriyle uygular:

```text
VIN(min) = 24 V
Pout,max = 125 W
eta ≈ 0.90
```

Önce:

$$
P_{IN}=\frac{P_{out}}{\eta}=\frac{125\,W}{0.9}\approx138.88\,W
$$

Sonra:

$$
\left|Z_{IN}\right|=
\left|-\frac{24^2}{138.88}\right|\approx4.15\,\Omega
$$

Sayfa notu:

```text
Bu Z_N = 4.15 ohm değerimiz
```

Bu değer tek başına "filtre tamam" sonucu değildir; `Zfilter,out` ile aynı frekansta, aynı port tanımıyla ve damping dahil edilerek karşılaştırılacak referans çizgisidir.

![Negatif giriş empedansı ve `|Zfilter(fres)| < |ZIN(min)|` kriterini notladığın ekran](images/foto_selected/p95_input_filter_middlebrook_note.jpg)

Bu ekran `|ZFilter(fres)| < |ZIN(min)|` karşılaştırmasını görsel olarak toparlar. `W.105-W.106-W.136` zincirindeki negatif giriş empedansı düşüncesini destekler.

### Middlebrook Kapanışı İçin Yapılacaklar

[Açık Kontrol] Giriş filtresi kararlılığı şu adımlarla kapanacak:

1. Seçilen `L_IN`, `C_F`, `R_D`, `C_D` değerleri tek tabloda netleştirilecek.
2. `fres` / `fEMI` dampingli ve dampingsiz hesaplanacak.
3. `Zfilter,out(jw)` converter giriş portuna doğru tanımlanacak.
4. `Zin(jw)` aynı porttan, özellikle `Vin_min / Pout_max` koşulunda çıkarılacak.
5. `|Zfilter,out| < |Zin|` aynı frekans ekseninde kontrol edilecek.
6. `fc ≈ 35 kHz` kontrol loop hedefiyle `19-22 kHz` filtre rezonansı arasındaki etkileşim averaged AC sweep ile kontrol edilecek.
7. Switching transientte filtreli / filtresiz `Vin_post_filter`, `Iin_conv`, `Vout` ve `COMP` davranışı karşılaştırılacak.

## Yerleşim Kuralları

Bu bölüm `hot-loop`, EMI ve giriş filtresi notlarını PCB üzerinde kontrol listesine çevirir. Yeni hesap yoktur; amaç kirli akım yollarını, sakin analog bölgeyi, filtre portlarını ve ölçüm noktalarını baştan ayırmaktır.

### Güç Yolu ve Hızlı Döngüler

- [ ] Ana giriş MLCC bankını high-side / low-side güç yoluna olabildiğince yakın koy.
- [ ] `CIN` pozitif ucunu high-side drain tarafına en kısa ve düşük endüktanslı yolla bağla.
- [ ] `CIN` negatif ucunu low-side source / PGND dönüşüne en kısa ve düşük endüktanslı yolla bağla.
- [ ] Hot-loop alanını küçük tut; katman geçişi ve via sayısını bu döngüde bilinçli seç.
- [ ] Switch-node bakırını minimumda tut; analog hatları bu bölgeden uzaklaştır.
- [ ] Bobin ve çıkış kapasitörü dönüş yolunu hot-loop ile karıştırma.

### Gate-drive, Bootstrap ve Switch-node

- [ ] Bootstrap yolu, `BST-HO-SW` çevresi ve high-side gate-drive döngüsünü kısa tut.
- [ ] Low-side gate-drive dönüşünü PGND'ye kısa ve temiz döndür.
- [ ] Gate-drive akımları için analog ground üzerinden dönüş yolu oluşturma.
- [ ] `Rboot`, gate direnci veya snubber gerekiyorsa bunları switch-node / gate yoluna fiziksel olarak yakın düşün.
- [ ] Switch-node'u geniş soğutma alanı gibi büyütmeden önce common-mode EMI etkisini kontrol et.

### Küçük Sinyal ve Referans Hatları

- [ ] Feedback gerilimini gürültülü switch-node'dan değil, sakin çıkış düğümünden Kelvin benzeri mantıkla al.
- [ ] `FB`, `COMP`, `SS/TRK`, `RT` hatlarını switch-node, high-side gate ve bootstrap alanından uzak tut.
- [ ] Analog ground ile power ground ilişkisini LM5146 datasheet mantığına göre kur.
- [ ] Kirli güç dönüş akımlarını analog referans üzerinden geçirme.
- [ ] Feedback divider ve compensator komponentlerini kontrolcü pinlerine yakın, sakin bölgede tut.

### Giriş EMI Filtresi ve Portlar

- [ ] Giriş EMI filtresinin "kirli taraf" ve "temiz taraf" yerleşimini fiziksel olarak ayır.
- [ ] LISN / kaynak tarafı, filtre sonrası düğüm ve converter giriş düğümünü ayrı isimlendir.
- [ ] `Vin_src/LISN`, `Vin_pre_filter`, `Vin_post_filter`, `Iin_src`, `Iin_conv` düğümlerini şemada açık tut.
- [ ] Middlebrook için kullanılan `Zfilter,out` portu ile LISN/EMI ölçüm düğümünü aynı şey sanma.
- [ ] `R_D-C_D` damping kolunu rezonans akım yolunu gerçekten sönümleyecek fiziksel konuma yerleştir.
- [ ] Filtre kapasitörlerinin ground dönüşlerini hot-loop dönüşüyle kontrolsüz birleştirme.

### Test ve Doğrulama Noktaları

- [ ] Filtre öncesi, filtre sonrası ve converter girişinde ölçüm/test noktası bırak.
- [ ] `SW`, `HO`, `LO`, `COMP`, `FB`, `Vout`, `Vin_post_filter` gibi kritik düğümler için erişilebilir ölçüm noktaları düşün.
- [ ] EMI / LISN ölçüm düğümü ile Middlebrook AC injection noktası ayrı ayrı etiketlensin.
- [ ] Ölçüm ground bağlantısının hot-loop'a gereksiz loop alanı eklemeyeceğini kontrol et.

## Açık Teknik Doğrulamalar

[Açık Kontrol] Bu owner kapanmadan önce:

- `W.103` ve `W.137` attenuation hesapları aynı `Cin,etkin`, aynı limit ve aynı LISN portuyla yeniden yazılacak.
- `46.8 dB` ve `43.14 dB` değerleri final pass/fail sonucu gibi kullanılmayacak.
- WEBENCH `61.79 dBuV < 67.75 dBuV` checkpoint'i gerçek filtre/ölçüm koşuluyla doğrulanacak.
- `W.100` ve `W.102` içindeki `L_IN/C_F` etiket karışıklığı final filtre tablosunda düzeltilecek.
- `fres ≈ 22.46 kHz` ve `fEMI ≈ 19.21 kHz` değerleri `fc ≈ 35 kHz` ile birlikte AC sweep'te değerlendirilecek.
- `R0 ≈ 0.296 ohm` doğrudan damping direnci yapılmayacak; `R_D-C_D` empedansı ve ısınmasıyla kontrol edilecek.
- `Zfilter,out` ve `Zin` aynı port tanımıyla çıkarılacak.
- `|Zin| ≈ 4.15 ohm` constant-power referansı, frekans bağımlı `Zin(jw)` yerine final kabul gibi kullanılmayacak.
- Common-mode EMI için switch-node alanı, kablo/şase kapasitif yolları ve küçük sinyal hatları gerçek PCB üzerinde işaretlenecek.
- Yerleşim checklist'i EVM / son PCB görüntüsü üzerinde madde madde işaretlenecek.

## Owner Dışı Kısa Referanslar

- Giriş MLCC / bulk / helper kapasitör seçimi: [04](04_giris_kapasitorleri_ve_giris_agi.md)
- MOSFET `dV/dt`, Miller, SOA ve seçim dayanımı: [05](05_mosfet_secimi_ve_dayanim_mantigi.md)
- Bootstrap, gate-drive, protection ve termal kapanış: [06](06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md)
- Kontrol loop, `fc`, faz marjı ve Type-III kompanzasyon: [07](07_kontrolcu_ve_kompanzasyon.md)
- Simülasyon planı, filtreli/filtresiz testler ve açık sorular: [09](09_simulasyon_gorseller_ve_acik_sorular.md)
