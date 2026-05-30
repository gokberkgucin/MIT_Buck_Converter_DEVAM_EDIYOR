# Giriş Kapasitörleri ve Giriş Ağı

Bu dosya, buck katının girişten çektiği darbeli akımı karşılayan kapasitör ağının primary owner'ıdır. MLCC `Cin`, dc-bias, tolerans, voltage derating, RMS akımı, sıcaklık artışı, ESR, ESL, küçük yardımcı MLCC'ler, giriş bulk'u, transient enerji tamponu ve damping sezgisi burada birlikte okunur.

[README özetine dön](README.md)

## Bu Dosyanın Amacı

Bu dosya şu konuları tek giriş-kapasitörü akışı altında toplar:

- giriş sığaçlarının neden gerekli olduğu,
- eklenen giriş ripple / transient gereksinimleri,
- MLCC + helper MLCC + bulk genel stratejisi,
- minimum etkin `Cin` hesabı,
- katalog değeri ile dc-bias altındaki etkin değer ayrımı,
- RMS akımı ve giriş MLCC sıcaklık bakışı,
- ESL, küçük yardımcı MLCC ve hot-loop bypass mantığı,
- bulk seçimi, transient enerji tamponu ve damping sezgisi,
- EMI / input-filter tarafına kısa handoff.

[Güncel Omurga] Giriş kapasitörleri, çıkış kapasitörleri gibi kontrol plant'inin ana `LC` kutuplarını doğrudan belirlemez; ama hot-loop, `Vin` ripple, input transient, EMI filtresi, Middlebrook kararlılığı ve termal davranış üzerinden tasarımı etkiler. Bu yüzden burada primary owner `Cin` / giriş ağıdır; ana EMI hesabı [08_emi_giris_filtresi_ve_yerlesim.md](08_emi_giris_filtresi_ve_yerlesim.md) dosyasına gider.

## Kapsadığı Eski README Başlıkları

- `### 5.5 Giris kapasiteleri`
- `#### 5.5.1 Giris sigaçlari`
- `#### 5.5.2 Yeni eklenen giris gereksinimleri`
- `#### 5.5.3 Secilen genel strateji`
- `#### 5.5.4 MLCC Cin hesabi`
- `#### 5.5.5 RMS akimi ve termal bakis`
- `#### 5.5.6 ESL ve kucuk degerli yardimci MLCC'ler`
- `#### 5.5.7 Bulk kapasitör secimi mantigi`
- `#### 5.5.8 Acik teknik dogrulamalar`

## Upstream / Downstream Okuma Bağlantıları

- Upstream global girdiler: [01_tasarim_girdileri_ve_kaynaklar.md](01_tasarim_girdileri_ve_kaynaklar.md)
- Upstream startup / duty / timing referansı: [02_startup_pin_programlama_ve_ortak_sabitler.md](02_startup_pin_programlama_ve_ortak_sabitler.md)
- Upstream bobin ve çıkış filtresi: [03_bobin_ve_cikis_kapasitorleri.md](03_bobin_ve_cikis_kapasitorleri.md)
- Downstream kayıp / termal kapanış: [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md)
- Downstream EMI / input filter / layout: [08_emi_giris_filtresi_ve_yerlesim.md](08_emi_giris_filtresi_ve_yerlesim.md)
- Downstream simülasyon ve açık sorular: [09_simulasyon_gorseller_ve_acik_sorular.md](09_simulasyon_gorseller_ve_acik_sorular.md)

## Owner Notu

[Güncel Omurga] MLCC `Cin` hesabı, dc-bias, tolerans, voltage derating, RMS akımı, ESR, ESL, helper MLCC'ler, giriş bulk'u, transient enerji tamponu ve damping sezgisi burada yaşar.

[Açık Kontrol] EMI / input-filter bölümü bu değerleri kullanabilir; ancak `Cin` komponent seçimini yeniden primary owner gibi anlatmayacak. EMI attenuation, LISN, filtre rezonansı, Middlebrook ve layout kapanışı [08](08_emi_giris_filtresi_ve_yerlesim.md) tarafında primary owner'dır.

## Kullanılan Global Girdiler

Bu dosya aşağıdaki değerleri [01](01_tasarim_girdileri_ve_kaynaklar.md) ve [02](02_startup_pin_programlama_ve_ortak_sabitler.md) dosyalarından alır; burada yeniden türetmez.

| Girdi | Değer / rol |
|---|---:|
| Normal `Vin` aralığı | `24 V - 36 V` |
| Survive-only input transient | `44 V`, `1 ms` |
| `Vout` | `14 V` |
| `Pout` | `50 W - 125 W` |
| `Iout,max` | pratik hesaplarda `9 A` |
| Load-step | `3.571 A -> 9 A`, fark `≈ 5.429 A` |
| `fsw` | `332 kHz` |
| `Tsw` | `≈ 3.01 us` |
| Minimum verim varsayımı | `eta ≈ 0.9` |
| İdeal duty ailesi | `0.389 / 0.583` |
| Korumacı duty ailesi | `0.432 / 0.648` |
| Pratik giriş-kap kontrol noktası | `D = 0.5` |
| İzin verilen `Vin` ripple | `0.24 Vpp` |
| İzin verilen `Vin` transient sapması | `0.36 V` |
| İdeal kaynak giriş akımı ripple hedefi | `50 mApp` |

[Tasarım İzi] `D = 0.5`, bu dosyada minimum `Cin` ve RMS akım için kullanılan pratik kontrol noktasıdır; global duty owner'ının yerine geçmez.

## Katalog Değeri ve Etkin Değer Dili

[Güncel Omurga] Bu dosyada her kapasitör satırı iki dille okunur:

| Dil | Anlam |
|---|---|
| Katalog / nominal değer | Parçanın datasheet üzerinde yazan `uF`, voltage rating, dielektrik ve paket bilgisi |
| Dc-bias altındaki etkin değer | `24-36 V` çalışma gerilimi, tolerans, sıcaklık ve gerçek frekans davranışı altında kalan kapasite |

Bu ayrım özellikle şu iki yerde kritiktir:

- `5 x 4.7 uF / 50 V / X7R` ana giriş MLCC grubu katalogda `23.5 uF` görünür; `36-37 V` dc-bias altında etkin toplam yaklaşık `8.2 uF` seviyesine iner.
- `2 x 47 uF / 50 V / X7R` bulk adayı katalogda `94 uF` görünür; `36.3 V` civarında etkin toplam yaklaşık `34 uF` olarak okunur.

Bu yüzden bu dosyada "toplam kapasite" dendiğinde hangi dilin kullanıldığı ayrıca belirtilir.

## Giriş Gereksinimleri

Eski ODT notunda eklenen iki teknik şart:

```text
Delta_VIN_PP   <= 0.24 V
Delta_VIN_Tran <= 0.36 V
```

Bu iki sınır aynı hesap değildir:

| Gereksinim | Bu dosyadaki okuma |
|---|---|
| `0.24 Vpp` | steady-state / switching ripple; MLCC etkin `Cin`, `ESR`, hot-loop ve input filter attenuation ile okunur |
| `0.36 V` | input transient; bulk enerji tamponu, `ESR_B`, kaynak empedansı ve load/line geçişiyle okunur |
| `50 mApp` input current ripple | yalnız kapasitörle kapanmaz; EMI / input filter hedefi olarak [08](08_emi_giris_filtresi_ve_yerlesim.md) dosyasına gider |

### `W.53`: Giriş Şartları ve Giriş Akımı İzleri

![W.53'ten seçilen el yazısı parça: ripple hedefleri, transient limitleri ve giriş akımı hesabı](images/defter_snippets_web/d02_w53_requirements_summary.jpg)

`W.53`, ek gereksinimleri ve verim varsayımıyla giriş akımı sınırlarını yan yana tutar:

```text
Allowed output voltage ripple p-p, any load = 100 mV
Allowed input ripple current p-p, ideal source = 50 mA
Delta_VIN_PP <= 0.24 V
Delta_VIN_Tran <= 0.36 V
```

Verim yaklaşık `eta = 0.9` alınırsa:

```text
I_IN,max = 125 W / (0.9 * 24 V) ≈ 5.79 A
I_IN,min = 125 W / (0.9 * 36 V) ≈ 3.86 A
```

[Tasarım İzi] `50 mA` ideal-source giriş akım ripple hedefi, defterde EMI / input filter eklenmesiyle karşılanacak kalite hedefi gibi tutulur; yalnız MLCC `Cin` hesabı ile kapanmış sayılmaz.

## Genel Strateji

[Güncel Omurga] Giriş tarafında tek tip kapasitörle her şeyi çözmeye çalışmıyorum.

| Eleman ailesi | Ana rol | Burada nasıl okunacak? |
|---|---|---|
| Ana MLCC bankı | yüksek frekans ripple, düşük `ESR`, hot-loop akımı | katalog `uF` değil, dc-bias altındaki etkin `C` ve RMS akım ile değerlendirilecek |
| Küçük yardımcı MLCC'ler | düşük `ESL`, spike/ringing bastırma, phase-node / input spike desteği | enerji deposu değil; hot-loop'a çok yakın hızlı bypass elemanı |
| Bulk giriş kapasitörü | daha yavaş enerji tamponu, input transient, damping sezgisi | nominal `uF` değil, bias altındaki etkin `C`, `ESR_B`, ripple akımı ve frekans davranışıyla değerlendirilecek |
| EMI input filter | conducted EMI, kaynak akımı, Middlebrook / damping | primary owner [08](08_emi_giris_filtresi_ve_yerlesim.md) |

Çıkış bulk'u ile giriş bulk'u aynı karar değildir. Çıkış bulk'u kontrol plant ve kompanzasyonu doğrudan değiştirir; giriş bulk'u ise kaynak ripple'ı, hot-loop, transient enerji rezervi, EMI filtresi ve damping ile birlikte değerlendirilir.

## Giriş Kapasitörü Neden Gerekli?

[Tasarım İzi] Buck converter girişten darbeli akım çeker. Kaynak bu ani akımı tek başına ve sonsuz hızla sağlayamaz; hızlı fark akımı giriş kapasitör ağı tarafından taşınır.

### `W.47`, `W.48`, `W.52`: Darbeli Giriş Akımı

![W.47'den seçilen el yazısı parça: giriş akımının darbeli olması ve DeltaVin ripple sezgisi](images/defter_snippets_web/d44_w47_input_cap_pulsating_current_note.jpg)

`W.47` tarafındaki ilk kapasitif ripple ilişkisi:

```text
Delta_Vripple ≈ Iout * D * (1-D) / (fsw * CIN)
```

Bu ilişki yalnız kapasitif ilk alt sınırı verir. `ESR/ESL`, kaynak / LISN empedansı, layout parazitleri ve input filter etkisi bu tek satırla kapanmaz.

![W.48'den seçilen el yazısı parça: bulk, MLCC ve LISN üzerine test soruları ve notlar](images/defter_snippets_web/d46_w48_input_cap_test_questions.jpg)

`W.48`, giriş kapasitörü konusunu test ve EMI bağlamına bağlar:

- bulk kapasitör kullanımı ripple'ı nasıl değiştirir,
- MLCC etkisi ne kadar olur,
- `LISN = Line Impedance Stabilization Network`,
- kaynak ideal değil; belirli hat empedansı ve EMI ölçüm bağlamı vardır.

![W.52'den seçilen el yazısı parça: CIN ve COUT akım rollerini gösteren işaretli akım döngüleri](images/defter_snippets_web/d45_w52_input_output_current_loops.jpg)

`W.52`, `Q1 ON` / `Q1 OFF` akım yollarını gösterir. `I_CIN`, kaynağın anlık sağlayamadığı hızlı akım bileşenini taşır. Bu aynı zamanda layout kuralıdır: ana giriş MLCC bankı high-side drain / low-side source hot-loop'una yakın durmalıdır.

### `W.49`, `W.50`, `W.94`: Kavramsal ve Kaynak İzleri

![W.49'dan seçilen el yazısı parça: switching periyot bölgeleri ve giriş kapasitörü akım dalga biçimi örneği](images/defter_snippets_web/d47_w49_switching_waveform_example.jpg)

[Eski İterasyon / Kaynak İzi] `W.49` ders / video örneği gibi durur. `fsw ≈ 200 kHz`, `Tsw ≈ 5 us`, `t_rise / t_fall ≈ 30 ns` notları bu projenin `332 kHz` final girdisi değildir. Burada tutulan fikir: giriş kapasitörü akımı yalnız ortalama/RMS değil, hızlı anahtarlama kenarlarıyla da şekillenir.

![W.50'den seçilen el yazısı parça: bulk ve MLCC'nin farklı rollerini anlatan kavramsal notlar](images/defter_snippets_web/d48_w50_bulk_vs_mlcc_notes.jpg)

`W.50`, MLCC ve bulk ayrımını kavramsal kurar:

- MLCC: yüksek frekans ripple / EMI bastırma,
- bulk: daha yavaş enerji tamponu, brown-out / giriş düşüşü riskine destek.

![W.94'ten seçilen el yazısı parça: G39/TI uygulama notu üzerine alınmış input capacitor selection notları](images/defter_snippets_web/d49_w94_g39_input_cap_article_notes.jpg)

`W.94`, giriş kapasitörü seçiminde iki ekseni kaynak notu olarak gösterir:

1. input ripple voltage'u azaltmak,
2. input current / pulse-current kapasitesini doğru seçmek.

![Duty cycle'a göre input RMS/load current oranı üzerine alınmış not](images/foto_selected/p21_input_rms_vs_duty.jpg)

![Input ripple gerilimi denkleminin not alındığı ekran görüntüsü](images/foto_selected/p22_input_ripple_equation.jpg)

Bu iki ekran görüntüsü, `D = 0.5` bölgesinin giriş pulse / RMS akımı için pratik worst-case kontrol noktası gibi kullanılmasını destekler. Bu, global duty owner'ı değildir; sadece `Cin` hesabı için tasarım izidir.

## MLCC Minimum `Cin` Hesabı

[Güncel Omurga] İlk hedef, `0.24 Vpp` giriş ripple sınırı için gereken minimum etkin `Cin` mertebesini bulmaktır. Buradaki `28.4 uF` ve `31.1 uF` değerleri katalog kapasitesi değil, etkin kapasite ihtiyacıdır.

### `W.27`: İlk Minimum Etkin `Cin`

![W.27'den seçilen el yazısı parça: minimum etkin Cin için ilk hand-calculation ve 28.4 uF sonucu](images/defter_snippets_web/d50_w27_minimum_cin_hand_calc.jpg)

Kullanılan ilişki:

```text
Cin >= D*(1-D)*Iout / (Delta_VIN_PP * fsw)
```

Defter yerleştirmesi:

| Büyüklük | Değer |
|---|---:|
| `D` | `0.5` |
| `Iout,max` | `≈ 9 A` |
| `Delta_VIN_PP` | `0.24 V` |
| `fsw` | `332 kHz` |
| Minimum etkin `Cin` | `≈ 28.4 uF` |

### `W.30-W.35`: ESR Dahil Etkin `Cin` Bandı

![W.30'dan seçilen el yazısı parça: seramik kapasitör, ESR ve toplam Delta V_IN mantığının aynı sayfada toplanması](images/defter_snippets_web/d52_w30_ceramic_esr_reasoning.jpg)

![W.31'den seçilen el yazısı parça: giriş kapasitörü RMS akımı ve ripple gerilimi formüllerinin yan yana kurulması](images/defter_snippets_web/d53_w31_input_cap_rms_and_ripple.jpg)

`W.30-W.31`, kapasitif terime `ESR` etkisini ekler:

```text
Delta_VIN ≈ Iout*D*(1-D)/(fsw*Cin) + Iout*R_ESR
```

![W.32'den seçilen el yazısı parça: daha sıkı Delta V_IN hedefi ile tekrar hesap ve yapılacaklar listesi](images/defter_snippets_web/d54_w32_stricter_dvin_exercise.jpg)

[Eski İterasyon / Hassasiyet İzi] `W.32`, `Delta_VIN = 50 mV` gibi daha sıkı bir hedefle yapılmış egzersizdir. Güncel hedef `0.24 Vpp` olduğundan final gereksinim gibi okunmaz; ripple hedefi sıkılaşırsa kapasitans / filtre ihtiyacının büyüyeceğini gösterir.

![W.33'den seçilen el yazısı parça: 50 mA input ripple maddesinin Delta V_IN, Z_in ve Cin ile yorumlanması](images/defter_snippets_web/d55_w33_50ma_input_ripple_interpretation.jpg)

`W.33`, `50 mA` input ripple maddesini kaynak tarafının gördüğü empedans ve input filter bağlamına açar. Bu hesap [08](08_emi_giris_filtresi_ve_yerlesim.md) tarafında EMI / input-filter owner'ına bağlanır.

![W.35'ten seçilen el yazısı parça: ESR terimini açıkça ekleyip minimum Cin'i 31.1 uF civarına taşıyan hesap](images/defter_snippets_web/d51_w35_esr_including_min_cin.jpg)

`W.35` yerleştirmesi:

```text
R_ESR = 3 mOhm
Iout = 9 A
D = 0.5
fsw = 332 kHz
Delta_VIN = 0.24 V
Cin >= 0.5*(1-0.5)*9 / (332 kHz*(0.24 - 0.003*9)) ≈ 31.1 uF
```

Bu grup tek final rakam değildir. Okuma:

- `28.4 uF`: kapasitif ilk etkin `Cin` ihtiyacı,
- `31.1 uF`: `ESR` terimi dahil daha korumacı etkin `Cin` ihtiyacı,
- `50 mV` egzersizi: güncel hedef değil, hassasiyet izi.

### Calculator ve WEBENCH Teyitleri

[Çapraz Teyit] `LM5146_quickstart_calculator_revB1.xlsm` erken / sade checkpoint olarak:

| Satır | Değer |
|---|---:|
| Minimum ideal `CIN` | `≈ 28.172 uF` |
| Toplam derated `CIN` | `≈ 30 uF` |
| `ESR` | `≈ 1 mOhm` |
| Hesaplanan giriş ripple | `≈ 236.07 mVpp` |
| `I_Cin,RMS` | `≈ 4.495 A` |

Bu checkpoint `28.4-31.1 uF` etkin ihtiyaç bandını destekler; fakat gerçek BOM kararı değildir. Gerçek karar `dc-bias`, tolerans, RMS akımı ve bulk tamamlamasıyla yapılır.

[Açık Kontrol] `WEBENCH` snapshot'ında `Vin p-p = 2.951 V` görünür; bu `0.24 Vpp` hedefiyle uyumlu değildir. Ölçüm noktası `Vin_src / Vin_post_filter / converter input`, kaynak empedansı ve input-filter modeli netleşmeden final pass/fail sonucu gibi okunmayacak.

### `W.51`: Gerçek Parçaya Geçiş Kontrolleri

![W.51'den seçilen el yazısı parça: ripple-current, rated-voltage ve dc-bias kontrollerini aynı yerde toplayan gerçek parça seçim notu](images/defter_snippets_web/d56_w51_real_cap_selection_checks.jpg)

`W.51`, teorik minimum `Cin` hesabının yeterli olmadığını gösterir. Gerçek parça için üç kapı vardır:

| Kapı | Kontrol |
|---|---|
| Akım | ripple current / RMS current rating yeterli mi? |
| Gerilim | `50 V` ve varsa daha yüksek voltage rating normal `24-36 V`, `44 V / 1 ms` survive ve derating için yeterli mi? |
| Etkin kapasite | dc-bias, tolerans ve sıcaklık sonrası kalan `Cin`, `28-31 uF` ihtiyacını karşılıyor mu? |

Bu üç kapıdan biri açık kalırsa parça seçimi final sayılmaz.

## Ana Giriş MLCC Bankı

[Güncel Omurga] Ana MLCC bankı için defterde öne çıkan hat `5 x 4.7 uF / 50 V / X7R` grubudur. Katalog toplamı `23.5 uF` gibi görünür; dc-bias altında etkin toplam `~8.2 uF` seviyesine iner.

### `W.76`: Gerçek MLCC Adayları ve EVM İzi

![W.76'dan seçilen el yazısı parça: gerçek giriş MLCC adayları ve frekansa göre ESR eşitliği üzerinden yapılan ilk seçim notu](images/defter_snippets_web/d76_w76_real_mlcc_candidates_and_esr.jpg)

![EVM şeması üzerinde C29 ile C10-C14 giriş kapasitör bankasını aynı anda gösteren ekran görüntüsü](images/foto_selected/p79_evm_input_output_cap_bank.jpg)

`W.76`, `C29` küçük yüksek-frekans seramik adayını ve `C10-C14` gibi `4.7 uF` MLCC grubunu birlikte gösterir. Sayfadaki `4 adet` paralel `ESR` egzersizi ara izdir; EVM üzerinde `C10-C14` beş konum olarak görünür ve sonraki `W.78-W.79` daha net `5 adet` hattına gider.

### `W.77-W.78`: RMS Paylaşımı, ESL ve Dc-bias

![W.77'den seçilen el yazısı parça: dc-bias altındaki gerçek kapasite ve kapasitör başına düşen RMS akım kontrolleri](images/defter_snippets_web/d77_w77_dc_bias_and_rms_share.jpg)

`W.77`, katalog değeri yerine bias altındaki kapasiteye bakılması gerektiğini tekrar açar. Bazı `8332 pF` / `33.568 nF` ara notları küçük yardımcı adaylar için iz gibi durur; ana `4.7 uF x 5` bankın temiz sayısal hattı `W.78`tedir.

![W.78'den seçilen el yazısı parça: 5 adet 4.7 uF MLCC bankası için ESL, RMS ve derated C hesabının sayısal kontrolü](images/defter_snippets_web/d78_w78_five_mlcc_bank_numeric_check.jpg)

`W.78` ana MLCC bankını sayıya döker:

| Büyüklük | Değer / okuma |
|---|---:|
| Katalog bank | `5 x 4.7 uF = 23.5 uF` |
| Toplam `I_RMS` | `≈ 4.54 A_RMS` |
| Kapasitör başına RMS, eşit paylaşım varsayımı | `4.54 / 5 ≈ 0.908 A_RMS` |
| Tek MLCC `ESL_max` izi | `≈ 0.0007 uH` |
| İdeal paralel `ESL` izi | `0.0007 uH / 5 ≈ 0.00014 uH ≈ 0.14 nH` |
| Dc-bias kaynaklı kapasite kaybı | `%63.9` azalma |
| Tek MLCC etkin kapasite | `≈ 1.639 uF` |
| `5 adet` toplam etkin kapasite | `≈ 8.195 uF` |

![Seçilen 4.7 uF MLCC için yüksek frekansta okunan endüktans değeri](images/foto_selected/p67_input_mlcc_inductance_4mhz.jpg)

![Aynı 4.7 uF MLCC için ripple akımından doğan sıcaklık artış grafiği](images/foto_selected/p68_input_mlcc_ripple_temp_rise.jpg)

![Aynı 4.7 uF MLCC için 36.8 V civarında DC-bias altındaki kapasitans değişim yüzdesi](images/foto_selected/p69_input_mlcc_dc_bias_change.jpg)

![Aynı 4.7 uF MLCC için 37 V civarında gerçek etkin kapasitans ekranı](images/foto_selected/p70_input_mlcc_dc_bias_capacitance.jpg)

[Açık Kontrol] `0.14 nH` ideal paralel `ESL` sonucudur. Gerçek PCB'de pad/via endüktansı, loop geometrisi, kapasitörlerin MOSFET'lere uzaklığı ve mutual coupling bu değeri büyütebilir.

### `W.79`: ESR ve Toplam Derated Kapasite Özeti

![W.79'dan seçilen el yazısı parça: 5x4.7 uF MLCC grubunun ESR_eq ve toplam derated kapasitesini özetleyen sayfa](images/defter_snippets_web/d79_w79_mlcc_bank_summary.jpg)

`W.79`, ana MLCC bankının frekansa göre `ESR` izini özetler:

| Frekans bölgesi | Tek MLCC `ESR` | `5 adet` paralel `ESR_eq` |
|---|---:|---:|
| `fsw = 332 kHz` civarı | `≈ 4 mOhm` | `≈ 0.8 mOhm` |
| `fc = 35 kHz` civarı | `≈ 10 mOhm` | `≈ 2 mOhm` |

![Seçilen 4.7 uF giriş MLCC için 0.3 MHz civarında okunan ESR yaklaşık 4 mOhm ekranı](images/foto_selected/p72_input_mlcc_esr_300khz.jpg)

![Seçilen 4.7 uF giriş MLCC için 0.03 MHz civarında okunan ESR yaklaşık 10 mOhm ekranı](images/foto_selected/p73_input_mlcc_esr_30khz.jpg)

![Ana giriş MLCC adayı için 4.7 uF, 50 V, 1206, X7R temel spesifikasyon ekranı](images/foto_selected/p75_input_mlcc_spec_4u7_1206.jpg)

`W.79` toplam derated MLCC kapasitesini yaklaşık:

```text
C_MLCC,toplam,etkin ≈ 8.228 uF
```

olarak toplar. `8.195 uF` ile `8.228 uF` farkı yeni tasarım kararı değildir; küçük yardımcı kapasitörlerin kenarda göründüğü özet farkı gibi okunur. Pratik sonuç: nominal `23.5 uF` bank, çalışma bias'ı altında `~8.2 uF` civarına düşer.

## RMS Akımı ve Termal Bakış

[Güncel Omurga] `Cin` seçimi yalnız `uF` ile kapanmaz. Giriş MLCC bankı yaklaşık `4.5-4.6 A_RMS` ana çizgiyi ve korunmacı `4.94 A_RMS` izini taşıyabilecek mi, kapasitör başına sıcaklık artışı ne olacak, bunlar aynı owner altında görünür kalır.

### Kaba ve Ayrıntılı RMS Hesapları

![MLCC RMS akımı kaba hesap](images/odt_embedded/fig_06_input_mlcc_rms_kaba_hesap.jpg)

ODT kaba okuması:

```text
Iin_RMS / Iload ≈ 0.5   (D = 0.5)
Iin_RMS ≈ 9 A * 0.5 = 4.5 A_RMS
```

Daha ayrıntılı ifade defterde şu ailede tutulur:

```text
Iin_RMS,max = ILOAD,max *
sqrt(D*(1-D) + (1/12)*(VOUT/(L*fsw*Imax))^2*(1-D)^2*D)
```

`D = 0.5`, `Vout = 14 V`, `L = 6.8 uH`, `fsw = 332 kHz`, `Imax = 9 A` ile yaklaşık `4.55 A_RMS` çıkar.

![W.29'dan seçilen el yazısı parça: daha korumacı 4.94 Arms sonucuna giden ayrıntılı I_Cin,RMS denemesi](images/defter_snippets_web/d57_w29_detailed_input_rms_estimate.jpg)

[Tasarım İzi / Korunmacı Kontrol] `W.29`:

```text
I_Cin,RMS ≈ sqrt(D*(Iout^2*(1-D) + Delta_IL^2/12)) ≈ 4.94 A
```

![W.36'dan seçilen el yazısı parça: temiz yeniden yerleştirmeyle 4.566 Arms sonucunu veren I_Cin,RMS teyidi](images/defter_snippets_web/d58_w36_clean_input_rms_result.jpg)

`W.36` aynı aileyi daha temiz tekrar eder:

```text
I_Cin,RMS ≈ 4.566 A_RMS
```

![W.90'dan seçilen el yazısı parça: 4.544 Arms sonucu, 0.5 Iload yaklaşımı ve paralel MLCC notu](images/defter_snippets_web/d59_w90_rms_recheck_and_half_iload_rule.jpg)

`W.90`:

```text
Iin_RMS,max ≈ 4.544 A_RMS
Iin_RMS ≈ 0.5 * Iload ≈ 4.5 A
```

Bu nedenle ana okuma:

| İz | Değer |
|---|---:|
| Kaba `D = 0.5` | `4.5 A_RMS` |
| Temiz tekrarlar | `4.544-4.566 A_RMS` |
| Korunmacı alternatif | `4.94 A_RMS` |
| `5` paralel MLCC için kaba pay | `0.91-0.99 A_RMS / parça` |

Eşit paylaşım yalnız ilk varsayımdır. Gerçek akım paylaşımı layout, `ESR/ESL` farkı ve kapasitörlerin hot-loop'a uzaklığına bağlıdır.

### MLCC Sıcaklık Artışı

[Güncel Omurga] Giriş MLCC sıcaklık kontrolü bu dosyada tutulur; [06](06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) toplam termal closure içinde buna referans verebilir.

![MLCC sıcaklık / X7R-X5R civarı](images/odt_embedded/fig_07_input_mlcc_temp_x7r_x5r.png)

![MLCC sıcaklık civarı - 1](images/odt_embedded/fig_08_input_mlcc_temp_grafik_01.png)

![MLCC sıcaklık civarı - 2](images/odt_embedded/fig_09_input_mlcc_temp_grafik_02.png)

![MLCC sıcaklık civarı - 3](images/odt_embedded/fig_10_input_mlcc_temp_grafik_03.png)

ODT / EVM sıcaklık izleri:

```text
48 V / 8 A -> Main MOSFET Marker1: 73.9 degC
24 V / 8 A -> Main MOSFET Marker1: 64.8 degC
Bu proje için Vinmax = 36 V tarafında yaklaşık 70 degC board tahmini
```

Bu `~70 degC` yalnız mühendislik referansıdır. Finalde kapasitör başına düşen RMS akım, datasheet `temperature-rise` grafiği, board sıcaklığı, ortam sıcaklığı ve MLCC dielektriği birlikte kontrol edilmelidir.

`X7R`, `X5R`'ye göre sıcaklık davranışı açısından daha güvenli tercih gibi not edilmiştir; fakat bu tek başına yeterlilik kanıtı değildir.

## ESL ve Küçük Yardımcı MLCC'ler

[Güncel Omurga] Ana MLCC bankı enerji/ripple işini taşır; küçük yardımcı MLCC'ler ise düşük `ESL` sayesinde spike, ringing, phase-node davranışı ve EMI riski için kullanılır. Bunlar `0.24 Vpp` minimum `Cin` hesabının veya `0.36 V` bulk transient hesabının yerine geçmez.

### ODT ESL ve Küçük MLCC İzleri

![MLCC ESL ve paralelleme civarı - 1](images/odt_embedded/fig_11_input_esl_parallel_mlcc.png)

![MLCC ESL ve paralelleme civarı - 2](images/odt_embedded/fig_12_input_esl_not_01.png)

![MLCC ESL ve paralelleme civarı - 3](images/odt_embedded/fig_13_input_esl_not_02.png)

![MLCC ESL ve paralelleme civarı - 4](images/odt_embedded/fig_14_input_esl_not_03.png)

ODT ana fikirleri:

- yüksek frekansta `ESL` belirleyicidir,
- düşük `ESL`, spike ve ringing bastırma için kritiktir,
- MLCC'leri paralel bağlamak etkin `ESR` ve `ESL`'yi düşürür,
- büyük ana MLCC'lerin yanına `1 uF`, `0.1 uF`, `10 nF` gibi daha küçük bypass elemanları eklenebilir.

![Küçük MLCC ekleme civarı - 1](images/odt_embedded/fig_15_small_mlcc_high_freq_01.png)

![Küçük MLCC ekleme civarı - 2](images/odt_embedded/fig_16_small_mlcc_high_freq_02.png)

Küçük paketli `0402/0603` MLCC'ler, enerji deposu değil; hızlı kenarlarda düşük `ESL` destek elemanıdır.

### Yardımcı `10 nF` MLCC Adayı

Bu yardımcı MLCC izi `GCM188R72A103KA37` sınıfında `10 nF`, `0603`, `100 V`, `X7R` küçük seramik adayına dayanır.

![Küçük ve daha düşük ESL'li yardımcı kapasitör arayışını gösteren notlu seçim ekranı](images/foto_selected/p71_helper_mlcc_selection_note.jpg)

![Küçük yardımcı MLCC için yüksek frekansta görülen endüktans davranışı](images/foto_selected/p61_helper_mlcc_inductance_1mhz.jpg)

![Aynı yardımcı MLCC için sıcaklığa bağlı kapasitans değişimi](images/foto_selected/p62_helper_mlcc_temp_stability.jpg)

![Aynı yardımcı MLCC için 36 V civarında DC-bias altındaki kapasitans değişimi](images/foto_selected/p63_helper_mlcc_dc_bias_change.jpg)

![Aynı yardımcı MLCC için 36 V civarında gerçek etkin kapasitans ekranı](images/foto_selected/p64_helper_mlcc_dc_bias_capacitance.jpg)

![Aynı yardımcı MLCC için 40 kHz civarındaki direnç / ESR davranışı](images/foto_selected/p65_helper_mlcc_esr_40khz.jpg)

![Aynı yardımcı MLCC için 0.3 MHz civarındaki direnç / ESR davranışı](images/foto_selected/p66_helper_mlcc_esr_300khz.jpg)

![Aynı yardımcı MLCC için 0603, 100 V, X7R, 10 nF sınıfındaki temel spesifikasyon ekranı](images/foto_selected/p74_helper_mlcc_spec_10nf_0603.jpg)

Okuma:

- `1 MHz` mertebesinde endüktans yaklaşık `0.0008 uH` civarında okunur,
- `36 V` dc-bias altında `10 nF` sınıfında da azalma vardır, fakat büyük `uF` sınıfı MLCC'lere göre daha sınırlı görünür,
- `40 kHz` civarında direnç / `ESR` daha yüksekken `0.3 MHz` civarında `0.5 ohm` mertebesine iner,
- bu eleman ana enerji deposu değil, hot-loop yakınında yüksek frekans bypass elemanıdır.

### `W.86-W.89`: Büyük / Küçük MLCC ve Ringing Mantığı

![W.86'dan seçilen el yazısı parça: büyük-küçük MLCC, ESR-ESL dengesi ve paralel bağlama notlarını özetleyen sayfa](images/defter_snippets_web/d60_w86_esr_esl_small_vs_large_mlcc.jpg)

`W.86`:

```text
ESR_total ≈ ESR / n
```

Mesaj:

- büyük MLCC: `ESR` düşük olabilir, `ESL` daha büyük olabilir,
- küçük MLCC: `ESL` düşük olabilir, dc-bias / akım sınırları daha zorlayıcı olabilir,
- büyük + küçük MLCC birlikte daha dengeli frekans davranışı verebilir.

`W.87`, MOSFET switching sırasında ringing/spike gözlemini problem olarak açar. `Vin = 36 V` civarında `22.7 V` seviyesine kadar inen spike / sapma gibi bir not vardır; bu final ölçüm değil, problem tipi izidir. Çözüm sırası: hot-loop yakın küçük MLCC, gerekirse `Rboot`, gerekirse snubber RC.

![W.88'den seçilen el yazısı parça: üstte küçük seramik eklemenin switch-node davranışına etkisi, altta bulk transient mantığı](images/defter_snippets_web/d64_w88_small_mlcc_and_bulk_bridge.jpg)

`W.88`, küçük seramik eklemenin switch-node davranışını iyileştirebildiğini ve aynı sayfanın alt tarafında bulk transient rolünü gösterir. Bu sayfa helper MLCC'den bulk'a geçiş köprüsüdür.

![W.89'dan seçilen el yazısı parça: küçük yardımcı kapasitör, bulk görevi ve ESR'nin damping etkisini özetleyen not](images/defter_snippets_web/d65_w89_bulk_summary_and_esr_note.jpg)

`W.89` kaynak figürü üzerinden `22.9 V -> 20.5 V` gibi spike azalma örneği not eder. Bu proje final ölçümü değildir; küçük, düşük-`ESL` seramik eklemenin aynı problem ailesinde ringing'i azaltabildiğini gösterir.

### `W.95-W.96-W.99`: Empedans, Q ve Damping Sezgisi

![W.95'ten seçilen el yazısı parça: kapasitörün frekansa bağlı empedans modeli ve farklı C değerlerinin eğimleri](images/defter_snippets_web/d61_w95_cap_impedance_model.jpg)

`W.95` gerçek kapasitörü şu modelle hatırlatır:

```text
Z ≈ Z_C + Z_ESL + ESR
Z ≈ R_ESR + j*w*L_ESL - j/(w*C)
|Z| = sqrt(R_ESR^2 + (X_L + X_C)^2)
```

![W.96'dan seçilen el yazısı parça: MLCC ve polymer kapasitörleri Q, f0 ve damping açısından karşılaştıran not](images/defter_snippets_web/d62_w96_mlcc_vs_polymer_q.jpg)

`W.96` MLCC / polymer frekans davranışını karşılaştırır:

| Aday / örnek | Not edilen değerler | Okuma |
|---|---|---|
| MLCC | `C ≈ 1.4 uF`, `ESR ≈ 1.3 mOhm`, `ESL ≈ 1.6 nH`, `f0 ≈ 3362 kHz`, `R0 ≈ 33.8 mOhm`, `Q ≈ 26` | düşük empedans, keskin rezonans / underdamped risk |
| Polymer | `C ≈ 100 uF`, `R_ESR ≈ 0.36 ohm`, `ESL ≈ 20 nH`, `f0 ≈ 112.5 kHz`, `Q ≈ 0.04` | daha sönümlü / overdamped davranış |

![W.99'dan seçilen el yazısı parça: aynı C ve ESL için ESR değişince Q davranışının nasıl keskinleştiğini gösteren eskiz](images/defter_snippets_web/d63_w99_esr_changes_q_behavior.jpg)

`W.99` aynı `C = 4 uF`, `ESL = 2.5 nH` için iki `ESR` örneği verir:

```text
R0 = sqrt(2.5 nH / 4 uF) ≈ 7.29 mOhm
ESR1 = 250 mOhm -> Q1 ≈ 0.029
ESR2 = 1 mOhm   -> Q2 ≈ 7.29
```

Bu üç sayfa yeni BOM kararı değildir. Mesaj: sadece düşük `ESR` iyi demek değildir; damping kaybolursa ringing keskinleşebilir.

## Bulk Seçimi Mantığı

[Güncel Omurga] Ana MLCC bankı dc-bias altında `~8.2 uF` kaldığı için, `28.4-31.1 uF` etkin ihtiyaçla arasında açık vardır. Giriş bulk'u bu açığı, transient enerji tamponunu ve damping sezgisini kapatmak için düşünülür.

### ODT Bulk İzleri ve Eski Aday

![Giriş bulk capacitor seçimi - 1](images/odt_embedded/fig_17_input_bulk_selection_01.png)

![Giriş bulk capacitor seçimi - 2](images/odt_embedded/fig_18_input_bulk_selection_02.png)

![Giriş bulk capacitor seçimi - 3](images/odt_embedded/fig_19_input_bulk_selection_03.png)

![Giriş bulk capacitor seçimi - 4](images/odt_embedded/fig_20_input_bulk_selection_note.jpg)

ODT notu:

- MLCC'ler düşük `ESR` ile yüksek frekans ripple'da güçlüdür,
- fakat dc-bias ve sıcaklık altında etkin kapasiteleri düşer,
- bu nedenle transient enerji için bulk desteği gerekir.

[Eski İterasyon] `W.29` içinde görülen `68 uF / 50 V / ESR ~20 mOhm` notu eski / ara bulk adayıdır. Güncel ana aday gibi değil, bulk ihtiyacının erken izi olarak korunur.

### `W.38-W.45`: Bulk Kriterleri

![W.38'den seçilen el yazısı parça: bulk capacitor için ripple-current ve ESR tabanlı ikinci seçim kriteri](images/defter_snippets_web/d66_w38_bulk_rms_and_esr_criterion.jpg)

`W.38`, bulk'un yalnız `uF` değil ripple-current / `ESR` / ısınma kriteriyle seçilmesi gerektiğini söyler:

```text
I_CB,RMS,allowed > I_CB,RMS
I_CB,RMS ≈ Delta_VIN_PP / (2*sqrt(3)*ESR_B)
```

![Bulk capacitor RMS akımı ile ESR/ripple ilişkisini gösteren notlu ekran görüntüsü](images/foto_selected/p23_bulk_rms_esr_constraint.jpg)

Bu formül gerçek akım paylaşımını tam çözmez; hızlı seçim sanity check'idir.

![W.39'dan seçilen el yazısı parça: T_rip, I_step ve mevcut MLCC katkısını birlikte düşünerek C_B alt sınırı arayan hesap](images/defter_snippets_web/d67_w39_bulk_min_cap_estimate.jpg)

`W.39`, bulk kapasite alt sınırını transient enerji penceresiyle düşünür. Okunan izler:

```text
ilk ara sonuç: C_B >= 5.27 uF
marjlı hedef izi: C_bulk >= 18.32 uF
```

![W.40'tan seçilen el yazısı parça: ESR_B üst sınırını Delta V_IN,tran, I_step ve D_max ile bağlayan kontrol](images/defter_snippets_web/d68_w40_esrb_transient_limit.jpg)

`W.40`, erken bulk `ESR_B` kontrolünü yazar:

```text
ESR_B <= Delta_VIN,tran / (I_step * Dmax)
Delta_VIN,tran = 0.36 V
I_step ≈ 3 A
Dmax ≈ 0.121
ESR_B <= 0.991 ohm
```

[Eski İterasyon] Buradaki `Dmax ≈ 0.121`, güncel duty ailesi değildir. `0.991 ohm` sonucu final sınır değil, erken "ESR aşırı büyük olmasın" sanity check'idir.

![W.44'ten seçilen el yazısı parça: ESR_B eşitliğinde D_max vurgusunu tekrar eden kısa hatırlatıcı not](images/defter_snippets_web/d69_w44_esrb_dmax_reminder.jpg)

`W.44`, aynı ilişkiyi tekrar eder ve `Dmax` duyarlılığını vurgular.

![W.41'den seçilen el yazısı parça: ESR_B kaynaklı ilk spike ile bulk enerji tamponu kaynaklı ikinci düşüşü ayıran kavramsal not](images/defter_snippets_web/d70_w41_two_spike_bulk_reasoning.jpg)

`W.41`, transientte iki mekanizmayı ayırır:

```text
V_spike ≈ I_step * ESR_B
```

İlk hızlı düşüş `ESR_B` kaynaklıdır; daha yavaş düşüş bulk enerjisinin boşalmasıyla ilgilidir.

![W.43'ten seçilen el yazısı parça: MLCC ile bulk arasındaki görev paylaşımını sözlü olarak kuran özet sayfa](images/defter_snippets_web/d71_w43_mlcc_vs_bulk_roles.jpg)

`W.43`: MLCC yüksek frekans ripple'ı, bulk ise transient enerji rezervini destekler.

![W.45'ten seçilen el yazısı parça: input cap'in enerji tamponu rolünü çizim ve dalga biçimleriyle anlatan kavramsal sayfa](images/defter_snippets_web/d72_w45_input_cap_concept_sketch.jpg)

`W.45`: kaynak akımı ile converter'ın anlık akım ihtiyacı aynı anda değişemez; farkı giriş kapasitörleri taşır.

### `W.67`, `W.74`, `W.75`: İki Spike, RMS ve Frekans Rolleri

![W.67'den seçilen el yazısı parça: ESR_B kaynaklı ilk spike ile ikinci daha yavaş spike'ı ayıran not](images/defter_snippets_web/d73_w67_two_spike_explanation.jpg)

`W.67`, iki input transient mekanizmasını daha net ayırır:

1. `ESR_B` kaynaklı hızlı spike,
2. kaynak akımı `I_PS` ile converter talebi `I_IN-D` arasındaki farktan gelen daha yavaş sapma.

`0.36 V` transient hedefi bu ikisinin toplam davranışında kontrol edilir; yalnız `ESR_B` düşüşüne ayrılmış tek bütçe değildir.

![W.74'ten seçilen el yazısı parça: bulk RMS akımı ve toplam etkili C ile Delta V_IN,PP kontrolünü birleştiren sayfa](images/defter_snippets_web/d74_w74_bulk_rms_and_total_c_check.jpg)

`W.74`:

```text
I_CB,RMS ≈ (1/(2*sqrt(3))) * Delta_VIN_PP / ESR_B
I_CB,RMS ≈ (1/(2*sqrt(3))) * 0.24 V / 0.103 ohm ≈ 0.677 A_RMS
```

Bu `0.103 ohm -> 0.677 A_RMS` satırı, sonraki `W.81` gerçek aday `ESR ≈ 4 mOhm` değeriyle aynı aşama değildir. Burada amaç bulk ripple-current / ESR ilişkisini kontrol etmektir.

![W.75'ten seçilen el yazısı parça: bulk ile MLCC'nin frekansa göre görev paylaşımını empedans sezgisiyle anlatan not](images/defter_snippets_web/d75_w75_bulk_vs_mlcc_frequency_roles.jpg)

`W.75`, bulk ve MLCC'nin frekans rollerini ayırır:

- yüksek frekans bypass: MLCC,
- daha düşük frekans / yavaş enerji: bulk,
- bulk tek başına yüksek frekanslı ripple bastırma elemanı değildir.

### `W.80`: MLCC Açığı ve Bulk Kararı

![W.80'den seçilen el yazısı parça: MLCC bankasının tek başına yetmediğini ve bulk ekleme kararını doğuran kilit sayfa](images/defter_snippets_web/d80_w80_need_for_bulk_decision.jpg)

`W.80`, bulk kararını sayıya bağlar:

```text
CIN,ideal ≈ 28.4 uF
C_MLCC,etkin ≈ 8.195 uF
Delta_C ≈ 28.4 - 8.195 ≈ 20 uF
```

Bu açığı kapatmak için `~30 uF` sınıfında, `ESR_B < 0.10233 ohm` koşulunu sağlayan ek bulk düşünülür. Buradaki "alüminyum elektrolit / polimer" notu teknoloji arama izidir; bir sonraki sayfada ana aday büyük X7R seramik bulk'a kayar.

### `W.81`: `2 x 47 uF / 50 V / X7R` Bulk Adayı

[Güncel Omurga] Ana bulk adayı olarak en net defter hattı `2 x 47 uF / 50 V / X7R` seramik bulk'tur. Bu nominal `94 uF` diye değil, bias altındaki etkin `~34 uF` diye okunur.

![W.81'den seçilen el yazısı parça: 2x47 uF bulk seçimi için ESR ve etkin kapasite kontrolünün kısa özet notu](images/defter_snippets_web/d81_w81_bulk_candidate_check.jpg)

![Seçilen 47 uF / 50 V bulk MLCC için 36.3 V civarında okunan etkin kapasitans ekranı](images/foto_selected/p76_bulk_capacitance_47uf_36v.jpg)

![Aynı bulk MLCC için 0.3 MHz civarında okunan ESR yaklaşık 4 mOhm ekranı](images/foto_selected/p77_bulk_esr_300khz.jpg)

![Aynı bulk MLCC için 47 uF, 50 V, X7R temel spesifikasyon ekranı](images/foto_selected/p78_bulk_spec_47uf_50v_x7r.jpg)

![Aynı bulk MLCC için frekansa bağlı toplam empedans eğrisi](images/foto_selected/p80_bulk_impedance_curve.jpg)

Okunan ana değerler:

| Büyüklük | Katalog / etkin ayrımı |
|---|---:|
| Tek parça nominal | `47 uF`, `50 V`, `X7R` |
| Tek parça dc-bias altı etkin | `≈ 17 uF`, p76'da `17.013 uF` |
| `2 adet` nominal | `94 uF` |
| `2 adet` dc-bias altı etkin | `≈ 34 uF` |
| Tek parça `ESR` | `≈ 4 mOhm` |
| `2 adet` paralel `ESR_eq` | `≈ 2 mOhm` |
| Transient kapasite alt sınırı | `C_B > 27.93 uF` |
| Sonuç | `34 uF > 27.93 uF` |

`2 mOhm` paralel aday, `0.1023 ohm` transient `ESR_B` sınırının çok altındadır; ancak bu yalnız ani ESR düşüşü tarafını rahatlatır. Frekansa bağlı empedans, damping, akım paylaşımı ve layout yine açık kontrol olarak kalır.

### `W.82`: Toplam Giriş Ağı Kontrolü

![W.82'den seçilen el yazısı parça: toplam seçilen giriş kapasitansı ile 0.2006 V < 0.24 V kontrolünün kapandığını gösteren kısım](images/defter_snippets_web/d82_w82_total_c_and_dvin_check.jpg)

`W.82`, MLCC + bulk toplam etkin ağıyla `0.24 Vpp` hedefini tekrar kontrol eder:

```text
Delta_VIN_PP,hesap ≈ D*(1-D)*Iout,max /
                    (C_CE,total * fsw * (1 - TOL))

D = 0.5
Iout,max = 9 A
fsw = 332 kHz
C_CE,total ≈ 8.228 uF + 34 uF
TOL = 0.20
Delta_VIN_PP,hesap ≈ 0.2006 V
0.2006 V < 0.24 V
```

[Güncel Omurga] Bu sonuç yalnız steady-state / switching ripple hedefi için kapanış gibi okunur. `0.36 V` transient, bulk-MLCC akım paylaşımı, EMI filtresiyle etkileşim ve layout kaynaklı `ESL` / ringing problemini otomatik kapatmaz.

`W.82` sağ tarafındaki `100 uF polymer` notu alternatif / karşılaştırma izidir. Ana aday hattı hala `2 x 47 uF / 50 V / X7R`; polymer satırı daha sönümlü bulk alternatifi / damping sezgisi olarak kalır.

### `W.83`, `W.91`, `W.97`, `W.92`: Transient Enerji Penceresi

![W.83'ten seçilen el yazısı parça: ESR_B koşulu ile T_rip zaman ölçeğini aynı yerde kuran köprü sayfa](images/defter_snippets_web/d83_w83_esrb_and_trip_time.jpg)

`W.83`, bulk transient hesabını ikiye ayırır:

1. hızlı ilk düşüş: `ESR_B`,
2. daha yavaş enerji tamponu: `C_B`.

İlk zaman ölçeği:

```text
T_rip ≈ 1 / (f_BW * 4)
f_c ≈ f_sw / 10 ≈ 33.2 kHz
T_rip ≈ 1 / (33.2 kHz * 4) ≈ 7.53 us
```

![W.91'den seçilen el yazısı parça: 0.1023 ohm ESR_B sınırı ve 7.14 us T_rips notunu daha temiz veren sayfa](images/defter_snippets_web/d84_w91_clean_esrb_and_trips.jpg)

`W.91` aynı hesabı daha güncel değerlerle temizler:

```text
ESR_B < V_IN-tran / (I_step * Dmax,verimli)
V_IN-tran = 0.36 V
I_step = 5.429 A
Dmax ≈ 0.6481
ESR_B < 0.36 / (5.429 * 0.6481) ≈ 0.1023 ohm

T_rips ≈ 1 / (35 kHz * 4) ≈ 7.14 us
```

`7.53 us` ve `7.14 us` aynı ailede tutulur; biri `f_sw/10 = 33.2 kHz` ilk kuralından, diğeri `35 kHz` crossover hedefinden gelir.

`W.97` silik ama şu alternatif zaman ölçeğini verir:

```text
f_c = 33.2 kHz
tau ≈ 1 / (2*pi*f_c) ≈ 4.8 us
```

[Tasarım İzi] `4.8 us`, `~7 us` penceresini iptal eden yeni ana süre değildir; bulk hesabının `4.8-7.5 us` aralığında duyarlılık kontrolü gerektirdiğini gösterir.

![W.92'den seçilen el yazısı parça: kapasitif terim ile ESR terimini ayırmayı hatırlatan kaynak-üstü not](images/defter_snippets_web/d86_w92_ripple_components_figure.jpg)

`W.92` sembol olarak `VOUT/COUT` kullansa da burada tutulmasının nedeni, giriş bulk/transient hesabı için de geçerli olan ayrımı hatırlatmasıdır:

```text
Delta_V(pp) ≈ kapasitif terim + ESR terimi
```

Yani sapma yalnız kapasite eksikliği değildir; hızlı `ESR` düşüşü ve daha yavaş kapasite/enerji penceresi ayrılmalıdır.

## EMI / Input Filter Handoff

[Referans Notu] Bu dosya giriş kapasitör bankının komponent owner'ıdır. EMI / input-filter hesabı burada uzun anlatılmayacak.

Bu dosyadan [08](08_emi_giris_filtresi_ve_yerlesim.md) tarafına giden açık sorular:

- EMI attenuation hesabında hangi `Cin` etkin sayılacak?
- Yalnız ana MLCC etkin kapasitesi `~8.2 uF` ile MLCC + bulk toplamı `8.228 uF + 34 uF` aynı frekansta aynı işi yapar mı?
- Bulk düşük frekans / transientte güçlüdür; yüksek frekans EMI ve hot-loop tarafında helper MLCC ve yerleşim daha belirleyici olabilir.
- `100 uF polymer` gibi daha sönümlü bulk alternatifi EMI filtre damping'i açısından anlamlı mı?
- Input filter eklendiğinde `Z_filter,out`, converter `Z_in`, `35 kHz` crossover ve `~19-22 kHz` filtre rezonans izleri aynı port tanımıyla kapanacak mı?

Bu soruların ana owner'ı [08](08_emi_giris_filtresi_ve_yerlesim.md) dosyasıdır. Bu dosya yalnız kapasitör bankının değerlerini ve seçilme mantığını sabitler.

## Güncel Giriş Ağı Özeti

| Aile | Katalog / nominal | Dc-bias altı etkin / rol |
|---|---:|---|
| Ana giriş MLCC bankı | `5 x 4.7 uF / 50 V / X7R`, toplam `23.5 uF` | `≈ 8.195-8.228 uF`; yüksek frekans ripple ve hot-loop |
| Ana MLCC `ESR_eq` | tek parça `4 mOhm @ 0.3 MHz`, `10 mOhm @ 0.03 MHz` | `5 adet` paralelde `0.8 mOhm @ fsw`, `2 mOhm @ fc` |
| Ana MLCC RMS | toplam `4.5-4.6 A_RMS`, korunmacı `4.94 A_RMS` | `5 adet` eşit paylaşımda `0.91-0.99 A_RMS / parça` |
| Helper MLCC | `10 nF / 0603 / 100 V / X7R` ve `1 uF / 0.1 uF` ailesi | enerji deposu değil; düşük `ESL`, spike/ringing bypass |
| Bulk adayı | `2 x 47 uF / 50 V / X7R`, nominal `94 uF` | `≈ 34 uF` etkin; `ESR_eq ≈ 2 mOhm`; transient / enerji tamponu |
| Eski / alternatif bulk izleri | `68 uF / 50 V / 20 mOhm`, `100 uF polymer` | eski aday / daha sönümlü karşılaştırma izi |
| Toplam etkin kontrol | `C_CE,total ≈ 8.228 uF + 34 uF` | `Delta_VIN_PP ≈ 0.2006 V < 0.24 V`, yalnız steady-state ripple kapısı |

## Açık Teknik Doğrulamalar

[Açık Kontrol] Bu dosya komponent owner'ını toparlar; final donanım doğrulaması değildir. Kapanması gereken maddeler:

- minimum etkin `Cin` ihtiyacı `28.4-31.1 uF` bandı ile gerçek BOM aynı tabloda eşleşti mi?
- `5 x 4.7 uF` ana MLCC bankı için katalog `23.5 uF` ve dc-bias altı `~8.2 uF` ayrımı BOM'da net mi?
- `2 x 47 uF` bulk adayında katalog `94 uF` ve dc-bias altı `~34 uF` ayrımı BOM'da net mi?
- `0.2006 V < 0.24 V` kontrolü aynı kaynak empedansı ve aynı ölçüm noktasıyla LTspice/PSpice'ta görülüyor mu?
- `WEBENCH Vin p-p = 2.951 V` açık uyumsuzluğu hangi ölçüm noktası / input-filter koşulundan geliyor?
- `4.5-4.6 A_RMS` ana çizgi ve `4.94 A_RMS` korunmacı iz, gerçek parça ripple-current rating ve sıcaklık grafiğiyle kapandı mı?
- kapasitör başına `0.91-0.99 A_RMS` paylaşımı layout nedeniyle bozuluyor mu?
- MLCC sıcaklık artışı `~70 degC` board tahminiyle birlikte güvenli mi?
- helper MLCC'ler gerçekten hot-loop'a yakın yerleşebiliyor mu?
- `ESL`, via/pad endüktansı ve switching ringing dalga şekli simülasyon/ölçümle görüldü mü?
- bulk `ESR_B < 0.1023 ohm` ve `C_B > 27.93 uF` izleri gerçek aday ve toleranslarla kapanıyor mu?
- `4.8-7.5 us` transient enerji penceresi load-step simülasyonuyla yeterli mi?
- EMI input filter tarafında hangi `Cin` değerinin kullanıldığı açıkça etiketlendi mi?
- input filter / damping / Middlebrook hesabı [08](08_emi_giris_filtresi_ve_yerlesim.md) tarafında aynı kapasitör bankıyla yapıldı mı?

## Owner Dışı Kısa Referanslar

- Global `Vin`, `Vout`, `fsw`, duty ve input requirement snapshot: [01_tasarim_girdileri_ve_kaynaklar.md](01_tasarim_girdileri_ve_kaynaklar.md).
- `RT`, timing ve controller startup bağlamı: [02_startup_pin_programlama_ve_ortak_sabitler.md](02_startup_pin_programlama_ve_ortak_sabitler.md).
- Çıkış kapasitörü ve output bulk karar ayrımı: [03_bobin_ve_cikis_kapasitorleri.md](03_bobin_ve_cikis_kapasitorleri.md).
- Giriş MLCC/bulk termal toplam kapanışı: [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md).
- EMI, LISN, input filter, damping, Middlebrook ve layout: [08_emi_giris_filtresi_ve_yerlesim.md](08_emi_giris_filtresi_ve_yerlesim.md).
- LTspice/PSpice giriş ripple, filtreli/filtresiz ve transient testleri: [09_simulasyon_gorseller_ve_acik_sorular.md](09_simulasyon_gorseller_ve_acik_sorular.md).
