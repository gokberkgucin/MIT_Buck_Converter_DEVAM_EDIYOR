# Simülasyon, Görseller ve Açık Sorular

[README özetine dön](README.md)

## Bu Dosyanın Amacı

Bu dosya LTspice/PSpice doğrulama planı, simülasyon-sonuç kayıt disiplini, seçilmiş görsellerin kanıt olarak kullanılması ve genel açık soru haritasının primary owner'ıdır.

Burada güç katı, kontrol, EMI, termal veya BOM hesapları yeniden sahiplenilmez. Bu dosyanın işi, teknik owner dosyalarında kurulmuş sayıların nasıl doğrulanacağını, hangi simülasyon dosyası/aşamasıyla test edileceğini, hangi görselin hangi karara kanıt olduğunu ve hangi açık kontrollerin hâlâ kapanmadığını görünür tutmaktır.

## Kapsadığı Eski README Başlıkları

- `## 8. LTspice Dogrulama Plani`
- `### 8.1 Baslangic model seti`
- `### 8.2 Simulasyon asamalari`
- `### 8.3 Steady-state kontrol listesi`
- `### 8.4 Dinamik testler`
- `### 8.5 Giris filtresi ve EMI ile baglantili testler`
- `### 8.6 44 V transient notu`
- `### 8.7 Hesapla simulasyonun birlestirilmesi`
- `## 9. Secilmis Gorseller`
- `## 10. Acik Sorular`

## Upstream / Downstream Okuma Bağlantıları

- Upstream proje durumu ve okuma rehberi: [00](00_proje_durumu_ve_okuma_rehberi.md)
- Upstream global girdiler, G94 snapshot ve kaynak rolleri: [01](01_tasarim_girdileri_ve_kaynaklar.md)
- Upstream startup, pin-programming, `fsw`, duty ve timing: [02](02_startup_pin_programlama_ve_ortak_sabitler.md)
- Upstream bobin, çıkış kapasiteleri, `Zout`, output bulk ve plant handoff: [03](03_bobin_ve_cikis_kapasitorleri.md)
- Upstream giriş kapasitörleri, input bulk, helper MLCC ve giriş ağı: [04](04_giris_kapasitorleri_ve_giris_agi.md)
- Upstream MOSFET seçim ve dayanım mantığı: [05](05_mosfet_secimi_ve_dayanim_mantigi.md)
- Upstream kayıplar, bootstrap, protection/current-limit ve termal kapanış: [06](06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md)
- Upstream feedback, plant, kompanzasyon ve loop hedefleri: [07](07_kontrolcu_ve_kompanzasyon.md)
- Upstream EMI, giriş filtresi ve yerleşim: [08](08_emi_giris_filtresi_ve_yerlesim.md)
- Ayrıntılı açık soru takibi: [tracking/open_questions.md](tracking/open_questions.md)

Downstream teknik owner yoktur. Bu dosya doğrulama, görsel kanıt ve açık kapanış katmanıdır.

## Owner Notu

Bu dosyada tam anlatımı yapılacak kümeler:

- LTspice/PSpice model setinin rolü,
- simülasyon aşamaları,
- steady-state kontrol listesi,
- load/line/startup dinamik testleri,
- giriş filtresi ve EMI ile bağlantılı simülasyon testleri,
- `44 V / 1 ms` transient survive kontrolü,
- hesapla simülasyonun nasıl birleştirileceği,
- seçilmiş görsel / defter kırpımı / ekran görüntüsü kullanım kuralı,
- repo-geneli açık soru haritası.

Owner dışı kalanlar:

- `Vin`, `Vout`, `Pout`, `Iout`, `fsw`, duty ve ortak timing değerlerinin ana tanımı: [01](01_tasarim_girdileri_ve_kaynaklar.md) ve [02](02_startup_pin_programlama_ve_ortak_sabitler.md)
- Bobin, `Cout`, `Zout`, load-step ve output bulk hesabı: [03](03_bobin_ve_cikis_kapasitorleri.md)
- `Cin`, dc-bias, RMS, ESR/ESL, helper MLCC ve giriş bulk seçimi: [04](04_giris_kapasitorleri_ve_giris_agi.md)
- MOSFET seçimi ve dayanım gerekçesi: [05](05_mosfet_secimi_ve_dayanim_mantigi.md)
- MOSFET kayıpları, bootstrap, current-limit ve termal kapanış: [06](06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md)
- Type-III kompanzasyon, `fc`, faz marjı ve loop-response hesabı: [07](07_kontrolcu_ve_kompanzasyon.md)
- EMI filtresi, Middlebrook, differential/common-mode ayrımı ve layout kuralları: [08](08_emi_giris_filtresi_ve_yerlesim.md)

## Okuma Haritası

| Sıra | Blok | Neyi kapatır? |
|---:|---|---|
| 1 | Doğrulama felsefesi | Simülasyonun hesap yerine geçmediğini ve hangi kararlara ikinci göz olduğunu netler |
| 2 | Başlangıç model seti | Average, switching ve PSpice modellerinin hangi soruya cevap verdiğini ayırır |
| 3 | Simülasyon aşamaları | Hangi modelden hangi sonuç satırının beklendiğini tanımlar |
| 4 | Steady-state testleri | Köşe koşulları, kabul pencereleri ve kayıt alanlarını toplar |
| 5 | Dinamik testler | Load-step, line-step, startup ve timing limitlerini bağlar |
| 6 | EMI/input-filter testleri | Filtreli/filtersiz simülasyon, damping ve ölçüm portu disiplinini verir |
| 7 | `44 V` transient | Survive testinin regülasyon testi olmadığını ayırır |
| 8 | Hesap-simülasyon birleşimi | Plot, hesap satırı, model revizyonu ve karar etiketini birbirine bağlar |
| 9 | Görsel mantığı | Görsellerin süs değil kanıt olarak nasıl kullanılacağını tarif eder |
| 10 | Açık sorular | Genel kapanış haritasını `tracking/open_questions.md` ile bağlar |

## Doğrulama Felsefesi

[Güncel Omurga] Simülasyon bu projede hesapların yerine geçmez. Hesap zinciri teknik owner dosyalarında yaşar; simülasyon o zincirin ikinci kontrolüdür.

Simülasyonun ana görevi:

- loop cevabının ve kompanzasyon kararının davranışa dönüşüp dönüşmediğini görmek,
- load transient ve line transient sırasında `Vout`, `IL`, `COMP`, `SW` ve giriş düğümlerinin beklenen sırayla hareket edip etmediğini kontrol etmek,
- giriş filtresi rezonansı ve damping ihtiyacını yakalamak,
- EMI/input-filter tarafında ölçüm portlarını ve frekans-domain varsayımlarını netleştirmek,
- `44 V / 1 ms` transient survive koşulunda hangi elemanın hangi gerilimi gördüğünü ayırmak.

[Açık Kontrol] Rework uygulanmadığı için bu dosyadaki simülasyon planı fiziksel ölçümle kapanmış bir doğrulama raporu değildir. Planlanan model/plot/karar satırları, ölçüm veya final model importu yapılınca kapanacak kanıt kapılarıdır.

## Başlangıç Model Seti

[Tasarım İzi] Eski README'de başlangıç model seti aşağıdaki dosya aileleriyle kurulmuştu. Bunlar burada simülasyon rolüyle korunur; dosya varlığı, versiyon ve gerçek komponent değerleriyle eşleşme ayrıca kontrol edilecektir.

| Model ailesi | Eski README'deki aday dosya | Rol |
|---|---|---|
| Averaged closed-loop | `LTspice_InputFilterDesign/SyncBuck_average_CL.asc` | Kompanzasyon ve loop cevabı için hızlı ilk kontrol |
| Averaged closed-loop + input filter | `LTspice_InputFilterDesign/SyncBuck_average_CL_IF.asc` | Giriş filtresi rezonansı, Middlebrook ve damping etkisini hızlı görmek |
| Switching closed-loop | `LTspice_InputFilterDesign/SyncBuck_switching_CL.asc` | Ripple, switching davranışı, MOSFET stress ve load-step için daha gerçekçi kontrol |
| Switching closed-loop + input filter | `LTspice_InputFilterDesign/SyncBuck_switching_CL_IF.asc` | Filtreli switching modelde ringing, damping ve giriş akımı dalga şeklini görmek |
| Switching open-loop + input filter | `LTspice_InputFilterDesign/SyncBuck_switching_OL_IF.asc` | Giriş filtresi etkisini loop davranışından daha izole okumak |
| TI PSpice transient macro-model | `LM5146-Q1_PSPICE_TRANS/LM5146-Q1_TRANS.DSN` | LM5146-Q1 kontrolcü, soft-start, driver ve pin davranışlarını TI makro-modeliyle kontrol etmek |

[Açık Kontrol - model dosya hijyeni] `*_CL` ve `*_CL_IF` dosyaları yalnız giriş filtresi farkıyla ayrılmalıdır. Aynı `Vin`, yük, kompanzatör, `Vout`, ölçüm düğümü ve komponent değerleri kullanılmadan filtre etkisi okunamaz.

Model setinde isim tutarlılığı beklenen düğümler:

- `Vout`
- `SW`
- `IL`
- `Vin_src` veya `Vin_LISN`
- `Vin_pre_filter`
- `Vin_post_filter`
- `Iin_src`
- `Iin_conv`
- `COMP`
- `HO`
- `LO`
- `Z_filter,out`
- `Z_in`

## Simülasyon Aşamaları

Simülasyon sırası, hızlı ve izole modellerden daha gerçekçi modellere doğru ilerlemelidir.

| Aşama | Model tipi | Ana soru | Karar etiketi |
|---:|---|---|---|
| 1 | Averaged closed-loop | Loop/kompanzasyon yönü doğru mu, input filter ortalama modelde riskli mi? | [Çapraz Teyit] veya [Açık Kontrol] |
| 2 | Switching closed-loop | Ripple, duty sınırları, MOSFET stress ve load transient kabul pencerelerine uyuyor mu? | [Çapraz Teyit] |
| 3 | TI PSpice macro-model | LM5146-Q1 startup, soft-start, driver ve pin davranışı hesapla aynı varsayımı kullanıyor mu? | [Çapraz Teyit] |
| 4 | Parazitik / damping detayı | Ringing, snubber ihtiyacı, input-filter damping ve layout hassasiyetleri görünür mü? | [Açık Kontrol] |

Her simülasyon sonucu tek başına ekran görüntüsü olarak bırakılmamalı; kısa bir sonuç satırı taşımalıdır:

```text
Model:
Revizyon / değişen komponentler:
Koşul: Vin, Iout, yük/line step, filtre/damping durumu
Gözlenen düğümler:
Kabul penceresi:
Karar: pass / suspicious / recheck
İlgili hesap owner'ı:
```

Bu kayıt formatı, eski plotların "güzel görünüyor" diye değil, hangi hesabı teyit ettiği için tutulmasını sağlar.

## Steady-State Kontrol Listesi

[Güncel Omurga] Steady-state kontrolleri nominal davranışı, köşe koşullarını ve component stress seviyesini görür. Hesap owner'ı burada kurulmaz; bu blok, [01](01_tasarim_girdileri_ve_kaynaklar.md), [03](03_bobin_ve_cikis_kapasitorleri.md), [04](04_giris_kapasitorleri_ve_giris_agi.md), [05](05_mosfet_secimi_ve_dayanim_mantigi.md), [06](06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) ve [07](07_kontrolcu_ve_kompanzasyon.md) dosyalarındaki sayıların modelde birlikte çalışıp çalışmadığını kontrol eder.

### Köşe Koşulları

| Köşe | `Vin` | Yük | Not |
|---|---:|---:|---|
| Minimum giriş, düşük yük | `24 V` | `50 W`, yaklaşık `3.571 A` | duty yüksek tarafa yaklaşır |
| Minimum giriş, yüksek yük | `24 V` | `125 W`, yaklaşık `8.929 A`; pratikte `9 A` | iletim kaybı, bobin akımı, termal stress |
| Maksimum giriş, düşük yük | `36 V` | `50 W`, yaklaşık `3.571 A` | duty düşük, switching stress yüksek |
| Maksimum giriş, yüksek yük | `36 V` | `125 W`, yaklaşık `8.929 A`; pratikte `9 A` | MOSFET switching, input ripple ve termal stress |

Bu köşeler, gerekirse filtersiz model ve `*_IF` filtreli model için ayrı ayrı çalıştırılmalıdır.

### Kaydedilecek Büyüklükler

| Kayıt alanı | Owner dosya | Simülasyonda okunacak şey |
|---|---|---|
| `Vout` statik doğruluk | [01](01_tasarim_girdileri_ve_kaynaklar.md), [03](03_bobin_ve_cikis_kapasitorleri.md) | `14 V ± 3%` penceresi içinde kalıyor mu? |
| Output ripple | [03](03_bobin_ve_cikis_kapasitorleri.md) | `100 mVpp` hedefiyle uyumlu mu? |
| Input ripple / giriş darbeleri | [04](04_giris_kapasitorleri_ve_giris_agi.md), [08](08_emi_giris_filtresi_ve_yerlesim.md) | converter input ve filtre portları ayrılmış mı? |
| Bobin ripple / `ILpeak` | [03](03_bobin_ve_cikis_kapasitorleri.md) | ripple ve tepe akım `Isat` bağlamıyla uyumlu mu? |
| MOSFET V/I stress | [05](05_mosfet_secimi_ve_dayanim_mantigi.md), [06](06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) | `VDS`, akım ve edge stress seçim gerekçesiyle uyumlu mu? |
| Verim / kayıp dağılımı | [06](06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) | hesapla aynı eğilimde mi, sapma nereden geliyor? |
| Loop davranışı | [07](07_kontrolcu_ve_kompanzasyon.md) | `fc`, faz marjı ve transient cevabı aynı hikâyeyi anlatıyor mu? |

### Kabul Pencereleri

| Büyüklük | Pencere / hedef | Not |
|---|---|---|
| `Vout` statik | `14 V ± 3%` | G94 statik regülasyon penceresi |
| `Vout` ripple | `100 mVpp` | Output capacitor owner'ına bağlı |
| Giriş ripple | `ΔVIN_PP <= 0.24 V` | Ölçüm noktası net yazılmalı |
| Giriş transient | `ΔVIN_Tran <= 0.36 V` | Normal 24-36 V çalışma bandındaki transient için |
| Verim | minimum `90%` varsayımı | Termal/kayıp kapanışıyla beraber okunur |
| Termal | board-level worst-case `76 °C` bağlamı | Fiziksel ölçüm yapılmadı; simülasyon tek başına kapanış değildir |

### WEBENCH Operating Values Cross-Check

[Çapraz Teyit] WEBENCH operating values görseli final tasarım tablosu değildir. Burada simülasyon kayıt disiplinine bağlanan bir çapraz teyit ekranıdır.

![WEBENCH operating values cross-check](images/foto_selected/p107_webench_operating_values_detail.png)

Bu ekranın owner haritası:

| WEBENCH alanı | Primary owner |
|---|---|
| `Frequency / Mode` | [02](02_startup_pin_programlama_ve_ortak_sabitler.md) |
| `ILpp` | [03](03_bobin_ve_cikis_kapasitorleri.md) |
| `Vout Actual`, `Vout p-p` | [03](03_bobin_ve_cikis_kapasitorleri.md) |
| `Vin p-p` | [04](04_giris_kapasitorleri_ve_giris_agi.md) ve [08](08_emi_giris_filtresi_ve_yerlesim.md) |
| Efficiency / loss trend | [06](06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) |
| Loop response | [07](07_kontrolcu_ve_kompanzasyon.md) |

[Açık Kontrol] WEBENCH değerleri gerçek LTspice/PSpice model satırıyla aynı komponent, aynı derating ve aynı ölçüm noktası üzerinden eşleştirilmeden final doğrulama sayılmayacaktır.

## Dinamik Testler

Dinamik testler, steady-state köşelerinde iyi görünen tasarımın gerçek geçiş davranışını gösterir. Bu blok özellikle [03](03_bobin_ve_cikis_kapasitorleri.md), [04](04_giris_kapasitorleri_ve_giris_agi.md), [06](06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) ve [07](07_kontrolcu_ve_kompanzasyon.md) dosyalarına geri bağlanır.

### Load-Step Testleri

[Güncel Omurga] Ana load-step:

- `3.571 A -> 9 A`
- `9 A -> 3.571 A`
- step büyüklüğü yaklaşık `5.429 A`

İleri load-step, `Vout` undershoot, bobin slew-rate, output capacitor enerji tamponu ve loop recovery hızını gösterir. Geri load-step, overshoot, damping, output bulk etkisi ve kompanzasyon davranışını gösterir.

Kaydedilecek düğümler:

- `Vout`
- `IL`
- `COMP`
- `SW`
- `Vin_post_filter`
- `Iin_conv`

[Açık Kontrol] Load edge hızı ve dwell time açık yazılmalıdır. Çok ideal ve dik bir akım adımı gereğinden sert sonuç verebilir; fazla yavaş bir adım da loop problemini saklayabilir. Simülasyon temiz steady-state noktasından başlatılmalıdır.

Kabul odağı:

- `14 V ± 20%` transient penceresi,
- settling time,
- ringing / snubber ihtiyacı,
- output bulk'sız yaklaşımın yeterliliği,
- loop recovery sırasında `COMP` saturasyonu olup olmadığı.

### Line-Step Testleri

Line-step testi:

- `24 V -> 36 V`
- `36 V -> 24 V`

Bu test [01](01_tasarim_girdileri_ve_kaynaklar.md) dosyasındaki normal giriş aralığının ve [02](02_startup_pin_programlama_ve_ortak_sabitler.md) dosyasındaki duty/timing varsayımlarının transient davranışta çakışmadığını kontrol eder.

Özellikle izlenecek noktalar:

- duty ve `tON(min) / tOFF(min)` sınırlarına yaklaşma,
- `Vout` regülasyon geçişi,
- `SW` ve MOSFET `VDS` stress,
- giriş filtresi varsa filtre önü/sonu gerilim farkı,
- `COMP` hareketi ve loop toparlanması.

### Startup / Soft-Start

Startup testi, [02](02_startup_pin_programlama_ve_ortak_sabitler.md) dosyasındaki `SS/TRK`, EN/UVLO, VCC/LDO ve RT varsayımlarını davranışa bağlar. PSpice macro-model burada özellikle değerlidir; çünkü LM5146-Q1 pin davranışını ideal average modelden daha doğrudan gösterebilir.

Kaydedilecekler:

- `VCC`
- `EN/UVLO`
- `SS/TRK`
- `Vout`
- `IL`
- `COMP`
- `HO/LO`
- `SW`

[Açık Kontrol] Startup simülasyonu, planlanan EVM rework uygulanmadığı için fiziksel osiloskop doğrulamasıyla kapanmamıştır.

## Giriş Filtresi ve EMI Bağlantılı Testler

Bu bölüm [08](08_emi_giris_filtresi_ve_yerlesim.md) dosyasındaki EMI/input-filter owner'ını tekrar etmez; oradaki filtre, damping ve Middlebrook kararlarının simülasyonla nasıl kontrol edileceğini listeler.

### Filtreli / Filtersiz Karşılaştırma

Çalıştırılacak temel karşılaştırmalar:

- filtersiz baseline,
- filtreli line transient,
- filtreli load transient,
- damping var / damping yok giriş ringing karşılaştırması,
- averaged modelde filtre rezonansı,
- gerekirse LISN-benzeri conducted EMI ilk taraması.

Zaman domeninde izlenecekler:

- `Vin_src` veya `Vin_LISN`,
- `Vin_pre_filter`,
- `Vin_post_filter`,
- `Iin_src`,
- `Iin_conv`,
- `Vout`.

Frekans domeninde izlenecekler:

- `V(lisn)`,
- filtre öncesi/sonrası oran,
- `Z_filter,out`,
- `Z_in`,
- port tanımı,
- referans birim ve dB tanımı.

[Açık Kontrol] Tek bir dB değeri, port ve referans tanımı olmadan EMI doğrulaması değildir. `43-47 dB` differential-mode attenuation hedefi ve `19-22 kHz` giriş filtresi rezonansı [08](08_emi_giris_filtresi_ve_yerlesim.md) içinde owner'dır; burada simülasyon sonucu o hesaba bağlanmalıdır.

### LISN Cursor Görseli

[Tasarım İzi] Eski README'de `p90` görseli LISN-benzeri bir simülasyon ekranı olarak korunmuştu. Cursor yaklaşık `200.0001 kHz` civarında ve `|V(lisn)| ≈ 31.87 dB` okunuyordu.

![LISN cursor 200 kHz](images/foto_selected/p90_lisn_sim_cursor_200khz.jpg)

[Çapraz Teyit] Bu görsel doğrudan `W.103-W.137` aralığındaki `43-47 dB` attenuation hesabının final kanıtı değildir. Görselin değeri, ölçüm düğümü ve cursor mantığını korumasıdır.

[Açık Kontrol] LISN portu, referans gerilimi, filtre öncesi/sonrası oran ve standartla ilişkisi netleşmeden bu ekran "CISPR geçti" sonucu olarak okunmayacaktır.

## `44 V / 1 ms` Transient Notu

[Güncel Omurga] `44 V / 1 ms` koşulu normal regülasyon şartı değildir. Bu koşul, giriş transient survive kontrolüdür.

Bu ayrım özellikle korunur:

| Konu | Anlamı |
|---|---|
| Normal giriş aralığı | `24-36 V` çalışma bandı |
| Normal giriş ripple hedefi | `ΔVIN_PP <= 0.24 V` |
| Normal giriş transient hedefi | `ΔVIN_Tran <= 0.36 V` |
| Survive transient | `44 V`, `1 ms`'ye kadar; converter bu sırada regüle etmek zorunda değildir |

`44 V` simülasyonunda cevap aranacak sorular:

- LM5146-Q1 VIN pininde hangi gerilim görülüyor?
- Giriş MLCC ve bulk kapasitörlerin voltaj margin'i yeterli mi?
- HS/LS MOSFET `VDS` stress ve `SW` spike ne oluyor?
- Bootstrap, `VCC` ve driver tarafı hangi gerilimleri görüyor?
- TVS, clamp veya input filter revizyonu gerekebilir mi?
- TVS/filter normal `24-36 V` çalışma ve EMI filtresi kararlılığını bozuyor mu?

Kaynak modeli net yazılmalıdır:

- pulse başlangıç gerilimi,
- rise/fall time,
- source resistance veya LISN modeli,
- yük koşulu,
- input filter var/yok,
- damping var/yok.

[Açık Kontrol] Bu testin sonucu "44 V'ta regüle ediyor" şeklinde yazılmamalıdır. Doğru sonuç satırı, hangi elemanın hangi gerilimi gördüğünü ve survive margin'in kapanıp kapanmadığını söylemelidir.

## Hesapla Simülasyonun Birleştirilmesi

Her plot bir hesap satırına veya G94 spec maddesine bağlanmalıdır. Bağlantı yoksa görsel kanıt değil, yalnız ekran görüntüsüdür.

Bir simülasyon sonucu saklanırken şu alanlar yazılmalıdır:

| Alan | Neden gerekli? |
|---|---|
| Hesap owner'ı | Sayının hangi dosyada sahiplenildiğini gösterir |
| Defter / kaynak izi | `W.xx`, `p.xx`, datasheet, WEBENCH veya calculator satırına bağlar |
| Model dosyası | Aynı sonucun hangi `.asc` veya `.DSN` ile üretildiğini gösterir |
| Model revizyonu | Değişen komponentleri görünür kılar |
| Koşul | `Vin`, `Iout`, load/line step, filtre/damping durumu |
| Ölçüm düğümü | Yanlış porttan doğru sonuç çıkarılmasını engeller |
| Kabul penceresi | Pass/recheck kararını keyfilikten çıkarır |
| Karar | `pass`, `suspicious`, `recheck` gibi kısa etiket |

Uyuşmazlık durumunda sıra:

1. Önce model varsayımı kontrol edilir.
2. Sonra hesap varsayımı kontrol edilir.
3. Sonra komponent derating / sıcaklık / parasitik farkı kontrol edilir.
4. Son olarak karar etiketi güncellenir.

[Tasarım İzi] Eski trace ve ekran görüntüleri silinmez. Bugünkü kararı temsil etmiyorsa [Eski İterasyon] veya [Tasarım İzi] etiketiyle bırakılır ve neden zayıfladığı yazılır.

### Simülasyon Dosyası - Soru Haritası

| Model | Asıl soru |
|---|---|
| `SyncBuck_average_CL.asc` | Kompanzasyon / loop response için hızlı kontrol |
| `SyncBuck_average_CL_IF.asc` | Giriş filtresi rezonansı ve Middlebrook etkisi |
| `SyncBuck_switching_CL.asc` | Ripple, MOSFET stress, load-step ve gerçek switching davranışı |
| `SyncBuck_switching_CL_IF.asc` | Filtreli switching modelde ringing, damping ve giriş akım dalga şekli |
| `SyncBuck_switching_OL_IF.asc` | Open-loop filtre etkilerinin daha izole okunması |
| `LM5146-Q1_TRANS.DSN` | TI macro-model ile startup, soft-start, driver ve kontrolcü davranışı |

## Seçilmiş Görsellerin Kullanım Mantığı

[Güncel Omurga] Görseller bu repoda süs değildir. Bir görsel yalnız şu işlerden birini yapıyorsa ana metinde kalır:

- bir hesap izini taşır,
- bir datasheet/EVM kararını teyit eder,
- bir calculator / WEBENCH / LTspice ekranını owner'a bağlar,
- defterdeki tarihsel karar yolunu görünür tutar,
- açık kontrol için eksik kanıt kapısını gösterir.

Görsel kaynak aileleri:

| Klasör / dosya | Rol |
|---|---|
| [images/odt_embedded/](images/odt_embedded/) | Eski ODT taslağından gelen şema, figür ve karar izleri |
| [images/foto_selected/](images/foto_selected/) | Datasheet, calculator, WEBENCH, LTspice ve seçim ekran görüntüleri |
| [images/defter_snippets_web/](images/defter_snippets_web/) | Defter sayfası kırpımları ve `W.xx` izleri |
| [tracking/photo_archive_inventory.md](tracking/photo_archive_inventory.md) | Fotoğraf ve görsel arşiv envanteri |
| [tracking/odt_embedded_images.md](tracking/odt_embedded_images.md) | ODT'den taşınan görsellerin takip izi |
| [tracking/notebook_ingestion.md](tracking/notebook_ingestion.md) | Defter ingestion süreci ve dosya bağlantıları |

Görsel kullanım kuralları:

- Tam sayfa yerine ilgili küçük kırpım tercih edilir.
- Görsel, desteklediği teknik paragrafın yanında durur.
- Caption veya yakın metin `W.xx`, `p.xx`, ODT veya sim kaynağını söyler.
- Görselin hangi hesap/karar/açık kontrole destek verdiği yazılır.
- Eski veya zayıf görseller silinmez; `eski aday`, `ara kontrol`, `source note` veya `recheck` diye etiketlenir.
- Aynı görsel farklı owner'larda uzun açıklamayla tekrar edilmez; gerekiyorsa ikinci yerde yalnız kısa referans kalır.

[Açık Kontrol] Fiziksel proje fotoğrafları ayrı bir proje durumu kanıtı olarak kullanılacaksa README summary ve [00](00_proje_durumu_ve_okuma_rehberi.md) tarafında kısa bağlamla yer almalıdır. Teknik owner dosyalarında fotoğraf ancak bir komponent, rework veya ölçüm noktasını kanıtlıyorsa kalır.

## Açık Sorular Özeti

Ayrıntılı takip dosyası: [tracking/open_questions.md](tracking/open_questions.md)

Bu bölüm, açık soruların kısa haritasıdır. Check-box'ların varlığı "hiç bakılmadı" anlamına gelmez; çoğu, final BOM/simülasyon/ölçüm/revizyon eşleşmesiyle kapanması gereken kanıt kapısıdır.

### Spec ve Global Girdiler

Owner: [01](01_tasarim_girdileri_ve_kaynaklar.md)

Kapanacak başlıklar:

- `24-36 V` giriş aralığı, `44 V / 1 ms` survive koşulu, `14 V ± 3%` statik hedef ve `14 V ± 20%` transient zarfı tek spec zinciri olarak son kez kontrol edilecek.
- Ripple ve transient limitleri aynı ölçüm noktası ve aynı birimle yazılacak.
- EMI ve termal hedefler G94/spec bağlamında açık kalacak; fiziksel ölçüm yapılmadığı için doğrulandı diye yazılmayacak.

### Startup, Duty ve Timing

Owner: [02](02_startup_pin_programlama_ve_ortak_sabitler.md)

Kapanacak başlıklar:

- `tON(min)` ve `tOFF(min)` etkileri köşe koşullarında simülasyonla kontrol edilecek.
- Bootstrap hesabında kullanılan duty değerleri ile ideal/verim dahil duty ailesi aynı bağlamda okunacak.
- LM5146 internal `VCC/LDO`, EN/UVLO, `SS/TRK` startup ve controller thermal margin aynı internal-supply varsayımıyla kapanacak.

### Bobin ve Çıkış Kapasitörleri

Owner: [03](03_bobin_ve_cikis_kapasitorleri.md)

Kapanacak başlıklar:

- Bobin ripple, `ILpeak`, DCR ve saturation değerleri datasheet ile yeniden teyit edilecek.
- Load transient simülasyonları `14 V ± 20%` zarfını, undershoot/overshoot ve settling davranışını gösterecek.
- Output bulk eklenirse plant ve kompanzasyon etkisi sayısal olarak yeniden kontrol edilecek.
- Çıkış sapması ile kapalı-çevrim çıkış empedansı ilişkisi simülasyonla bağlanacak.

### Giriş Kapasitörleri ve Giriş Ağı

Owner: [04](04_giris_kapasitorleri_ve_giris_agi.md)

Kapanacak başlıklar:

- MLCC etkin kapasite, dc-bias, tolerance, ESR/ESL, RMS ve sıcaklık artışı aynı BOM koşuluyla tekrar kontrol edilecek.
- Helper MLCC / düşük ESL stratejisi switching simülasyonunda spike ve ringing açısından incelenecek.
- Bulk giriş kapasitörünün transient enerji tamponu ve damping sezgisi EMI/filter owner'ına karıştırılmadan bağlanacak.

### MOSFET, Bootstrap, Protection ve Termal

Owner: [05](05_mosfet_secimi_ve_dayanim_mantigi.md) ve [06](06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md)

Kapanacak başlıklar:

- MOSFET `RDS(on)`, `Qg`, `Qgd`, `Coss`, `VDS` spike, avalanche/UIS ve SOA yorumları datasheet koşuluyla tekrar bağlanacak.
- Kayıp hesapları ile switching modelin stress/ripple sonucu aynı eğilimi veriyor mu kontrol edilecek.
- Bootstrap `Rboot`, `CBST`, `CVCC`, diode, UVLO ve driver charge varsayımları aynı koşul setiyle kapanacak.
- Termal varsayımlar yalnız EVM çıkarımına dayalı kalmayacak; ölçüm ve hesap parametreleri ayrılacak.

### Kontrolcü ve Kompanzasyon

Owner: [07](07_kontrolcu_ve_kompanzasyon.md)

Kapanacak başlıklar:

- Modülatör kazancı ve gerçek plant transfer fonksiyonu seçilen `L/C/ESR/DCR` değerleriyle tekrar kurulacak.
- K-factor yerleşimi, Type-III komponent seti, faz marjı ve kazanç marjı calculator, averaged LTspice ve switching transient ile aynı yönde sonuç verecek.
- `fc` hedefi yalnız `fsw/10` sezgisiyle kalmayacak; gerçek plant ve output/input filtre etkileşimiyle kontrol edilecek.

### EMI, Giriş Filtresi ve Layout

Owner: [08](08_emi_giris_filtresi_ve_yerlesim.md)

Kapanacak başlıklar:

- Hot-loop alanı, gate-drive akım yolları, switch-node keep-out ve analog/sense hat ayrımı gerçek yerleşim üzerinden kontrol edilecek.
- Differential-mode ve common-mode kaynakları ayrı yazılacak.
- Giriş filtresi rezonans frekansı, damping, Middlebrook uyumu ve LISN-benzeri ölçüm portları simülasyonla kapanacak.
- `35 kHz` crossover ile input-filter rezonansı arasındaki etkileşim açıkça değerlendirilecek.

### Simülasyon ve Görsel Kanıt

Owner: bu dosya

Kapanacak başlıklar:

- Steady-state simülasyonu hazır / model satırı yazıldı.
- Startup simülasyonu hazır / pin davranışı kontrol edildi.
- Load transient simülasyonu hazır / kabul penceresiyle etiketlendi.
- Line transient simülasyonu hazır / duty, input filter ve stress sonuçları kaydedildi.
- Parazitik etkiler için ikinci tur model hazır.
- Görsellerin her biri owner'a bağlı kısa kanıt metniyle tutuldu.

## Kapanış Kuralı

Bir açık kontrol kapatılırken yalnız checkbox işaretlemek yetmez. Kapanış notunda şu üç şey görünmelidir:

- hangi owner dosyasında kapandı,
- hangi model / görsel / datasheet / defter iziyle kapandı,
- kararın sonucu: kabul, recheck veya eski iterasyon.

Bu kural, projenin "düzenlenmiş yaşayan tasarım defteri" kalmasını sağlar: izler korunur, ama okuyucu hangi bilginin güncel omurga, hangisinin tasarım izi, hangisinin açık kontrol olduğunu kaybetmez.
