# Tasarım Girdileri ve Kaynaklar

Bu dosya, global tasarım girdileri ve kaynak okuma kurallarının primary owner'ıdır. Diğer teknik dosyalar burada sabitlenen sayıları kullanır; aynı global sayı başka dosyalarda uzun uzun yeniden türetilmemelidir.

[README özetine dön](README.md)

## Bu Dosyanın Amacı

Bu dosya şu konuları tek yerde toplar:

- G94 spec snapshot,
- güncel tasarım omurgası,
- paylaşılan `fsw`, duty ve zaman alanı mantığı,
- global hedefler ve türetilmiş ortak girdiler,
- kullanılan ana kaynaklar,
- calculator / WEBENCH / datasheet / defter rollerinin ayrımı,
- cross-check owner haritası.

Bu dosya komponent hesabı owner'ı değildir. Bobin, kapasitör, MOSFET, termal, kompanzasyon ve EMI detayları kendi teknik dosyalarında yaşar.

## Kapsadığı Eski README Başlıkları

- `## 3. Güncel Tasarım Omurgası ve Paylaşılan Tasarım Girdileri`
- `### 3.1 Paylaşılan fsw, duty ve zaman alanı owner'ı`
- `### 3.2 Startup / pin-programming handoff özeti`
- `## 4. Kullanilan Ana Kaynaklar`
- `### 4.1 Cross-check ciktılarinin owner haritasi`
- `### 4.2 Arac ciktisi okuma kurali`

## Upstream / Downstream Okuma Bağlantıları

- Upstream: [00_proje_durumu_ve_okuma_rehberi.md](00_proje_durumu_ve_okuma_rehberi.md)
- Downstream: [02_startup_pin_programlama_ve_ortak_sabitler.md](02_startup_pin_programlama_ve_ortak_sabitler.md)
- Downstream: [03_bobin_ve_cikis_kapasitorleri.md](03_bobin_ve_cikis_kapasitorleri.md)
- Downstream: [04_giris_kapasitorleri_ve_giris_agi.md](04_giris_kapasitorleri_ve_giris_agi.md)
- Downstream: [05_mosfet_secimi_ve_dayanim_mantigi.md](05_mosfet_secimi_ve_dayanim_mantigi.md)
- Downstream: [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md)
- Downstream: [07_kontrolcu_ve_kompanzasyon.md](07_kontrolcu_ve_kompanzasyon.md)
- Downstream: [08_emi_giris_filtresi_ve_yerlesim.md](08_emi_giris_filtresi_ve_yerlesim.md)
- Downstream: [09_simulasyon_gorseller_ve_acik_sorular.md](09_simulasyon_gorseller_ve_acik_sorular.md)

## Owner Notu

[Güncel Omurga] `Vin`, `Vout`, `Pout`, `Iout`, load-step, ripple sınırları, `fsw`, duty ailesi, minimum verim, EMI hedefi, termal hedef ve kaynak rol haritası burada yaşar.

[Açık Kontrol] Bir teknik dosya bu sayılardan birini kullanıyorsa değeri tekrar sahiplenmemeli; yalnız hangi global girdinin hangi yerel hesapta kullanıldığını belirtmelidir.

## G94 Spec Snapshot

Ana kaynak: [G94_SPEC.txt](G94_SPEC.txt)

| Parametre | Hedef / sınır | Rol |
|---|---:|---|
| Giriş gerilimi | `24 V - 36 V` | ana çalışma aralığı |
| Giriş gerilimi transient dayanım | `44 V`, `1 ms` | survive-only sınır; bu sırada regülasyon zorunlu değil |
| Çıkış gerilimi, statik | `14 V ± 3%` | ana setpoint zarfı |
| Çıkış gerilimi, transient | `14 V ± 20%` | load-step sırasında kabul zarfı |
| Çıkış gücü | `50 W - 125 W` | rezistif yük |
| Çıkış ripple | `100 mVpp` | herhangi bir `Rload` için |
| Giriş ripple | `0.24 Vpp` | giriş gerilimi peak-to-peak |
| Giriş transient sapması | `0.36 V` | undershoot veya overshoot limiti |
| Giriş akımı ripple | `50 mApp` | ideal kaynak varsayımı |
| Minimum verim | `90%` | gerilim ve yük boyunca hedef |
| EMI hedefi | `CISPR 25 Class 5` / `EN55025` bağlamı | input π-stage EMI filter ve paralel damping |
| Worst-case board sıcaklığı | `76 °C` | termal kapanış hedef girdisi |
| Load-step | `3.571 A -> 9 A` | yaklaşık `5.429 A` step |
| Anahtarlama frekansı | `332 kHz` | mevcut tasarım seçimi |
| Harici bias / VCC | kullanılmayacak | dahili VCC/LDO bağlamı kontrol edilecek |

Not: `44 V / 1 ms` satırı normal çalışma hedefi değildir; yalnız hayatta kalma koşuludur.

## Türetilmiş Ortak Girdiler

Çıkış akımı aralığı, G94 güç aralığından türetilir:

```text
Iout = Pout / Vout
```

| Büyüklük | Değer | Nereden geliyor? |
|---|---:|---|
| `Iout,min` | `50 W / 14 V ≈ 3.571 A` | minimum güç noktası |
| `Iout,max` | `125 W / 14 V ≈ 8.929 A` | maksimum güç noktası |
| Load-step büyüklüğü | `9 A - 3.571 A ≈ 5.429 A` | G94 load-step notu |

Bu üç değer; bobin, çıkış kapasitörü, MOSFET kaybı, termal ve simülasyon dosyalarında tekrar kullanılabilir. Ancak primary tanım bu dosyadadır.

## Shared `fsw`, Duty ve Timing Owner Mantığı

[Güncel Omurga] `fsw`, duty ailesi ve zaman alanı ilişkileri global girdidir. Bu dosyada tam tanımlanır; [02_startup_pin_programlama_ve_ortak_sabitler.md](02_startup_pin_programlama_ve_ortak_sabitler.md) bu değerleri RT pini, startup ve timing bağlamında kullanır.

Ortak anahtarlama frekansı:

```text
fsw = 332 kHz
Tsw = 1 / fsw ≈ 3.01 us
```

İdeal senkron buck ilk yaklaşımı:

```text
Dideal ≈ Vout / Vin
```

| Koşul | Duty |
|---|---:|
| `Vin = 36 V`, `Vout = 14 V` | `Dmin,ideal ≈ 14 / 36 ≈ 0.389` |
| `Vin = 24 V`, `Vout = 14 V` | `Dmax,ideal ≈ 14 / 24 ≈ 0.583` |

Minimum verim varsayımıyla korumacı duty ailesi:

```text
Deta ≈ Vout / (Vin * eta)
eta ≈ 0.9
```

| Koşul | Duty |
|---|---:|
| `Vin = 36 V`, `Vout = 14 V`, `eta = 0.9` | `Dmin,eta ≈ 0.432` |
| `Vin = 24 V`, `Vout = 14 V`, `eta = 0.9` | `Dmax,eta ≈ 0.648` |

[Tasarım İzi] `D = 0.5`, final duty sınırı değil; duty aralığının ortasına yakın pratik kontrol noktasıdır. Defterde özellikle giriş kapasitörü, RMS ve hızlı EMI tarafında kullanılmıştır.

Duty'nin zaman alanı:

```text
tON  = D * Tsw
tOFF = (1 - D) * Tsw
```

İdeal duty zarfı ve `332 kHz` için:

| Büyüklük | Yaklaşık değer |
|---|---:|
| `tON,max,ideal` | `0.583 * 3.01 us ≈ 1.76 us` |
| `tON,min,ideal` | `0.389 * 3.01 us ≈ 1.17 us` |
| `tOFF,min,ideal` | `(1 - 0.583) * 3.01 us ≈ 1.25 us` |
| `tOFF,max,ideal` | `(1 - 0.389) * 3.01 us ≈ 1.84 us` |

LM5146 zaman sınırları yalnız büyüklük kontrolü olarak okunur:

| Kontrolcü sınırı | Değer / sonuç |
|---|---:|
| `tON(min)` | `40 ns` |
| `tOFF(min)` | `140 ns` |
| Donanımsal `Dmax` kontrolü | `(Tsw - tOFF,min) / Tsw ≈ 0.953` |
| Donanımsal `Dmin` kontrolü | `tON,min * fsw ≈ 0.013` |

[Açık Kontrol] Donanımsal duty limitleri proje duty ailesi değildir. Dead-time, propagation delay ve gerçek kontrolcü davranışı ayrı doğrulama ister.

## Startup Handoff Özeti

Startup ve pin-programming ayrıntılarının primary owner'ı: [02_startup_pin_programlama_ve_ortak_sabitler.md](02_startup_pin_programlama_ve_ortak_sabitler.md)

Bu dosyada yalnız global bağlam kalır:

- LM5146 dahili `7.5 V` VCC/LDO kullanımı bu iterasyonun ana varsayımıdır.
- Harici VCC/bias kullanılmayacak kabul edilmiştir.
- EN/UVLO, SS/TRK, RT ve VCC UVLO ayrıntıları [02_startup_pin_programlama_ve_ortak_sabitler.md](02_startup_pin_programlama_ve_ortak_sabitler.md) dosyasında yaşar.
- VCC/LDO güç kaybı ve termal etkisi [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) dosyasına bağlanır.

## Kullanılan Ana Kaynaklar

Kaynak listesi "her ihtimale karşı arşiv" değildir; tasarım hesabı veya cross-check içinde fiilen geri dönülen kaynakları gösterir.

| Kaynak | Link | Rol |
|---|---|---|
| G94 spec | [G94_SPEC.txt](G94_SPEC.txt) | hedefleri ve sınırları sabitler |
| LM5146-Q1 datasheet | [references/pdfs/G32_lm5146-q1.pdf](references/pdfs/G32_lm5146-q1.pdf) | kontrolcü sınırları, pin/topoloji ve elektriksel referans |
| LM5146-Q1 EVM user guide | [references/pdfs/G46_LM5146-Q1EVM User's Guide.pdf](<references/pdfs/G46_LM5146-Q1EVM User's Guide.pdf>) | EVM topolojisi ve fiziksel referans |
| LM5146 quickstart calculator | [LM5146_quickstart_calculator_revB1.xlsm](LM5146_quickstart_calculator_revB1.xlsm), [references/pdfs/LM5146_quickstart_calculator_revB1.xlsm](references/pdfs/LM5146_quickstart_calculator_revB1.xlsm) | hızlı komponent ve loop checkpoint |
| BOM izleri | [BOM/](BOM/), [BOM/malzeme_yeni_bom_list.xlsx](BOM/malzeme_yeni_bom_list.xlsx), [BOM/gayri_resmi_bom.xlsx](BOM/gayri_resmi_bom.xlsx) | seçilen/satın alınan parça izleri |
| Kaynak listesi | [references/used_sources.md](references/used_sources.md) | kullanılan kaynakların düzenli takibi |

Diğer kaynak PDF'leri [references/pdfs/](references/pdfs/) altında tutulur. Dosya adlarında boşluk/özel karakter bulunan kaynaklar için bu klasör en güvenli giriş noktasıdır.

## Kaynak Rolleri ve Güven Seviyesi

| Kaynak sınıfı | Rol | Güven seviyesi | Tek başına neyi kapatmaz? |
|---|---|---|---|
| G94 spec | hedefleri ve sınır değerleri koyar | yüksek, tasarım girdisi | komponent seçimi ve doğrulama |
| Datasheet / EVM | parça sınırları, pin/topoloji ve fiziksel referans verir | yüksek, teknik dayanak | proje koşulundaki final performans |
| Temel güç katı / kontrol kaynakları | denklem ve yöntem dayanaklarını verir | orta-yüksek | seçilen BOM ile final sayısal sonuç |
| EMI / input-filter kaynakları | filtre, layout ve Middlebrook mantığını kurar | orta-yüksek | gerçek LISN/PCB/ölçüm sonucu |
| LM5146 calculator | hızlı komponent ailesi ve loop checkpoint'i verir | çapraz teyit | MLCC dc-bias, ESR/ESL, termal, layout ve EMI etkileri |
| WEBENCH | operating-values, ripple, verim, EMI ve loop snapshot verir | çapraz teyit / erken simülasyon | final LTspice/PSpice, termal ve köşe koşul doğrulaması |
| Defter sayfaları | tasarım düşüncesinin izini taşır | tasarım izi | tek başına final tasarım kanıtı |

Bir kaynakla defter notu farklı görünürse önce rolüne bakılır. Farklı sayılar sessizce birleştirilmez; ilgili owner dosyasında `[Eski İterasyon]`, `[Güncel Omurga]`, `[Çapraz Teyit]` veya `[Açık Kontrol]` etiketiyle ayrılır.

## Cross-check Owner Haritası

| Çıktı / konu | Primary owner dosyası |
|---|---|
| `Vin`, `Vout`, `Pout`, `Iout`, load-step, global ripple ve termal hedefler | bu dosya |
| `fsw`, duty ailesi ve `tON/tOFF` global tanımı | bu dosya |
| RT, EN/UVLO, SS/TRK, startup ve VCC/LDO çalışma koşulu | [02_startup_pin_programlama_ve_ortak_sabitler.md](02_startup_pin_programlama_ve_ortak_sabitler.md) |
| Bobin, DCR, ripple akımı | [03_bobin_ve_cikis_kapasitorleri.md](03_bobin_ve_cikis_kapasitorleri.md) |
| Çıkış kapasiteleri, `Vout` ripple, `Zout`, output bulk | [03_bobin_ve_cikis_kapasitorleri.md](03_bobin_ve_cikis_kapasitorleri.md) |
| Giriş kapasiteleri, `Vin` ripple, MLCC/bulk/RMS | [04_giris_kapasitorleri_ve_giris_agi.md](04_giris_kapasitorleri_ve_giris_agi.md) |
| MOSFET seçimi, SOA, avalanche, Qg/Qoss/dvdt | [05_mosfet_secimi_ve_dayanim_mantigi.md](05_mosfet_secimi_ve_dayanim_mantigi.md) |
| MOSFET kayıpları, bootstrap, current-limit, termal kapanış | [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) |
| Feedback divider, plant, `fc`, phase margin, Type-III kompanzasyon | [07_kontrolcu_ve_kompanzasyon.md](07_kontrolcu_ve_kompanzasyon.md) |
| EMI spektrumu, input filter stability, Middlebrook, layout | [08_emi_giris_filtresi_ve_yerlesim.md](08_emi_giris_filtresi_ve_yerlesim.md) |
| LTspice/PSpice test planı, görsel mantığı, açık sorular | [09_simulasyon_gorseller_ve_acik_sorular.md](09_simulasyon_gorseller_ve_acik_sorular.md) |

## Calculator / WEBENCH / Datasheet / Defter Okuma Kuralı

- Calculator güçlü olduğu yerde global omurgayı hızlı yoklar: `Vin/Vout/Iout`, `fsw`, bobin, soft-start ve kompanzasyon ailesi.
- WEBENCH statik çalışma, ripple, verim, EMI ve loop-response için erken snapshot verir.
- Datasheet ve EVM dokümanları sınır, pin, topoloji ve fiziksel referans sağlar.
- Defter sayfaları karar zincirinin nasıl geliştiğini gösterir.

[Açık Kontrol] Calculator veya WEBENCH içinde geçen bir sayı tek başına final kabul edilmez. İlgili teknik owner dosyasında aynı koşul setiyle BOM, derating, LTspice/PSpice, termal veya layout bağlamında tekrar kapanmalıdır.

## İlgili Klasörler

- [references/](references/) - kaynak arşivi ve kullanılan kaynak listesi.
- [references/pdfs/](references/pdfs/) - PDF ve bazı tool dosyaları.
- [BOM/](BOM/) - seçilen/satın alınan komponent izleri.
- [tracking/](tracking/) - manifest, audit, açık soru ve editörlük izleri.
- [tracking/README_before_index_rewrite_2026-05-30.md](tracking/README_before_index_rewrite_2026-05-30.md) - split öncesi uzun README arşivi; primary teknik kaynak değildir.
- [images/](images/) - defter, ODT ve seçilmiş teknik görseller.

## README Summary'ye Dönüş

Ana indeks için [README.md](README.md) dosyasına dön.
