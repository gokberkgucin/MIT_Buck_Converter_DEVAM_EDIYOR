# LM5146-Q1 Tabanlı Buck Converter Tasarımı

Bu repo, LM5146-Q1 tabanlı senkron buck converter çalışmasının yaşayan tasarım defteridir. Eski README çok büyük bir teknik aktarım dosyasıydı: defter kırpımları, WEBENCH/calculator çıktıları, EVM notları, BOM izleri ve ara hesaplar aynı yerde tutuluyordu.

Bu yeni README artık repo'nun uzun özet ve ana indeks dosyasıdır. Bütün hesapları burada yeniden taşımıyor; teknik owner dosyalarına, kaynak klasörlerine ve tracking raporlarına yönlendiriyor.

> Arşiv notu: Eski devasa README gövdesi [tracking/README_before_index_rewrite_2026-05-30.md](tracking/README_before_index_rewrite_2026-05-30.md) altında yedeklendi. Bu dosya artık primary okuma rotası değildir; teknik anlatım 00-09 owner dosyalarına bölündü.

## Repo Nedir?

Bu repo şu işleri bir arada tutar:

- LM5146-Q1 ile 24-36 V girişten 14 V çıkış üreten synchronous buck converter tasarım çalışması.
- G94 proje şartnamesinden gelen hedefler.
- LM5146-Q1 EVM, datasheet, quickstart calculator, WEBENCH ve defter sayfalarıyla yapılan cross-check izleri.
- Seçilen/satın alınan komponentlerin BOM ve datasheet izleri.
- Rework planı, açık kontroller, simülasyon planı ve görsel/defter arşivi.

Bu repo klasik kısa bir "nasıl build edilir" README'si değildir. Aynı zamanda tamamlanmış bir donanım doğrulama raporu da değildir. Daha doğru tanım: hesapları, izleri ve durdurulmuş fiziksel rework planını koruyan düzenlenmiş bir tasarım defteri.

## Mevcut Proje Durumu

[Güncel Omurga] Hesaplar sonucunda LM5146-Q1 EVM üzerinde birçok elemanın değiştirilmesi planlandı. Bu rework; bobin, giriş/çıkış kapasitörleri, MOSFET seçimi, bootstrap, current-limit, kompanzasyon ağı, input filter ve termal kapanış gibi alanlara yayıldı.

[Tasarım İzi] Hesap zinciri oldukça ileri bir noktaya geldi: calculator, WEBENCH, datasheet/EVM görselleri ve defter sayfalarıyla birçok tasarım kararı çapraz kontrol edildi.

[Açık Kontrol] Projenin fiziksel kısmı tamamlanmadı:

- Komponentler seçildi ve satın alındı.
- Ancak bileşenler karta takılmadı.
- LM5146-Q1 EVM üzerinde planlanan modifikasyon uygulanmadı.
- Rework sonrası ölçüm, osiloskop doğrulaması, termal test ve EMI testi yapılmadı.
- Proje daha sonra durduruldu.

Bu yüzden repo, "planlanan ve hesaplanan tasarım" ile "fiziksel olarak doğrulanmış kart" arasında bilinçli bir ayrım yapar.

## G94 Spec Snapshot

G94 şartnamesinden bu repoda kullanılan ana hedefler:

| Konu | Hedef / sınır |
|---|---|
| Giriş gerilimi | 24-36 V |
| Giriş ripple | ΔVIN_PP <= 0.24 V |
| Giriş transient undershoot/overshoot | ΔVIN_Tran <= 0.36 V |
| Giriş transient survive limiti | 44 V, 1 ms'ye kadar; converter bu sırada çalışmak zorunda değil |
| Çıkış gücü | 50-125 W, resistive load |
| Çıkış gerilimi statik hedef | 14 V ± 3% |
| Çıkış gerilimi transient sınırı | 14 V ± 20% |
| Çıkış ripple | 100 mVpp |
| Giriş akım ripple | 50 mApp, ideal source |
| Minimum verim | 90% |
| Anahtarlama frekansı | 332 kHz |
| EMI hedefi | CISPR 25 Class 5 / EN55025 bağlamı; input π-stage EMI filter ve damping |
| Worst-case board sıcaklığı | 76 °C |
| Load-step | 3.571 A'den 9 A'e, yani yaklaşık 5.429 A step |
| VCC yaklaşımı | Harici VCC kaynağı kullanılmayacak; dahili VCC/LDO bağlamı kontrol edilecek |

Tam kaynak izi: [G94_SPEC.txt](G94_SPEC.txt). Global girdi owner'ı ve türetilmiş değerler için [01_tasarim_girdileri_ve_kaynaklar.md](01_tasarim_girdileri_ve_kaynaklar.md) okunur.

## Bu Repo Nasıl Okunmalı?

Bu repo iki katmanlı okunmalı:

1. Önce bu README ile genel durumu, doküman haritasını ve fiziksel statüyü öğren.
2. Sonra teknik owner dosyalarına geç.
3. Eğer bir sayı başka yerde farklı görünüyorsa, hemen tek değere indirme; önce etiketine ve owner'ına bak.
4. Defter görselleri ve eski iterasyonlar silinmesi gereken gürültü değil; kararın nasıl geliştiğini gösteren izlerdir.

Teknik belgeler 00-09 owner dosyalarına bölündü. Eski uzun README yalnız arşiv ve editörlük izi olarak korunur; yeni okuma rotasında primary kaynak değildir.

## Etiketler

- [Güncel Omurga]: Şu anda tasarımın ana hattı olarak kabul edilen değer, karar veya yapı.
- [Tasarım İzi]: O karara nasıl gidildiğini gösteren ara hesap, not, defter sayfası veya kaynak parçası.
- [Eski İterasyon]: Bugünkü kararı tek başına temsil etmeyen ama süreci anlamak için korunan eski aday.
- [Çapraz Teyit]: Datasheet, EVM, calculator, WEBENCH, defter veya simülasyonla yapılan karşılaştırma.
- [Açık Kontrol]: Final BOM, simülasyon, termal, layout, ölçüm veya kaynak eşleştirmesiyle kapanması gereken konu.

## Doküman Haritası

| Dosya | Ne için okunur? | Durum |
|---|---|---|
| [00_proje_durumu_ve_okuma_rehberi.md](00_proje_durumu_ve_okuma_rehberi.md) | Belge felsefesi, çalışma planı, arka plan, durum özeti, değişiklik izi | Dolu owner dosyası |
| [01_tasarim_girdileri_ve_kaynaklar.md](01_tasarim_girdileri_ve_kaynaklar.md) | Global girdiler, G94 hedefleri, kaynak güven seviyesi, cross-check haritası | Dolu owner dosyası |
| [02_startup_pin_programlama_ve_ortak_sabitler.md](02_startup_pin_programlama_ve_ortak_sabitler.md) | `fsw`, duty/timing, startup, EN/UVLO, SS/TRK, RT, VCC/LDO varsayımları | Dolu owner dosyası |
| [03_bobin_ve_cikis_kapasitorleri.md](03_bobin_ve_cikis_kapasitorleri.md) | Bobin, Cout, Zout, output bulk, energy buffer, plant handoff | Dolu owner dosyası |
| [04_giris_kapasitorleri_ve_giris_agi.md](04_giris_kapasitorleri_ve_giris_agi.md) | Cin, MLCC, dc-bias, RMS, ESR/ESL, helper MLCC, giriş bulk | Dolu owner dosyası |
| [05_mosfet_secimi_ve_dayanim_mantigi.md](05_mosfet_secimi_ve_dayanim_mantigi.md) | MOSFET aday parça, SOA, avalanche, RDS(on), Qg/Qoss, dv/dt | Dolu owner dosyası |
| [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) | MOSFET kayıpları, bootstrap, ILIM/Rilim/Cilim, termal kapanış | Dolu owner dosyası |
| [07_kontrolcu_ve_kompanzasyon.md](07_kontrolcu_ve_kompanzasyon.md) | Feedback divider, plant, crossover, phase margin, K-factor, Type-III | Dolu owner dosyası |
| [08_emi_giris_filtresi_ve_yerlesim.md](08_emi_giris_filtresi_ve_yerlesim.md) | EMI, input filter stability, hot-loop, common-mode/differential-mode, layout | Dolu owner dosyası |
| [09_simulasyon_gorseller_ve_acik_sorular.md](09_simulasyon_gorseller_ve_acik_sorular.md) | LTspice/PSpice planı, görsel mantığı, açık sorular | Dolu owner dosyası |

## Hızlı Okuma Rotaları

Hızlı genel bakış:

1. Bu README
2. [00_proje_durumu_ve_okuma_rehberi.md](00_proje_durumu_ve_okuma_rehberi.md)
3. [01_tasarim_girdileri_ve_kaynaklar.md](01_tasarim_girdileri_ve_kaynaklar.md)

Güç katı odaklı okuma:

1. [01_tasarim_girdileri_ve_kaynaklar.md](01_tasarim_girdileri_ve_kaynaklar.md)
2. [02_startup_pin_programlama_ve_ortak_sabitler.md](02_startup_pin_programlama_ve_ortak_sabitler.md)
3. [03_bobin_ve_cikis_kapasitorleri.md](03_bobin_ve_cikis_kapasitorleri.md)
4. [04_giris_kapasitorleri_ve_giris_agi.md](04_giris_kapasitorleri_ve_giris_agi.md)
5. [05_mosfet_secimi_ve_dayanim_mantigi.md](05_mosfet_secimi_ve_dayanim_mantigi.md)
6. [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md)

Kontrol / kompanzasyon odaklı okuma:

1. [01_tasarim_girdileri_ve_kaynaklar.md](01_tasarim_girdileri_ve_kaynaklar.md)
2. [03_bobin_ve_cikis_kapasitorleri.md](03_bobin_ve_cikis_kapasitorleri.md)
3. [07_kontrolcu_ve_kompanzasyon.md](07_kontrolcu_ve_kompanzasyon.md)
4. [09_simulasyon_gorseller_ve_acik_sorular.md](09_simulasyon_gorseller_ve_acik_sorular.md)

EMI / giriş filtresi odaklı okuma:

1. [01_tasarim_girdileri_ve_kaynaklar.md](01_tasarim_girdileri_ve_kaynaklar.md)
2. [04_giris_kapasitorleri_ve_giris_agi.md](04_giris_kapasitorleri_ve_giris_agi.md)
3. [08_emi_giris_filtresi_ve_yerlesim.md](08_emi_giris_filtresi_ve_yerlesim.md)
4. [09_simulasyon_gorseller_ve_acik_sorular.md](09_simulasyon_gorseller_ve_acik_sorular.md)

## BOM, Images ve Tracking Bağlantıları

BOM ve satın alınan/seçilen parça izleri:

| Link | Rol |
|---|---|
| [BOM/](BOM/) | satın alınan/seçilen komponent datasheet arşivi |
| [BOM/malzeme_yeni_bom_list.xlsx](BOM/malzeme_yeni_bom_list.xlsx) | seçilmiş parça listesi |
| [BOM/gayri_resmi_bom.xlsx](BOM/gayri_resmi_bom.xlsx) | gayri resmi/ara BOM izi |
| [LM5146_quickstart_calculator_revB1.xlsm](LM5146_quickstart_calculator_revB1.xlsm) | kökteki calculator kopyası |
| [references/pdfs/LM5146_quickstart_calculator_revB1.xlsm](references/pdfs/LM5146_quickstart_calculator_revB1.xlsm) | kaynak arşivindeki calculator kopyası |

Görseller:

- [images/foto_selected/](images/foto_selected/) - seçilmiş datasheet/EVM/calculator/defter görselleri ve ekran kırpımları.
- [images/defter_full_pages/](images/defter_full_pages/) - defter DOCX'inden iki sayfalık pass'lerle çıkarılan tam sayfa kaynak görseller.
- [images/defter_snippets_web/](images/defter_snippets_web/) - defter sayfası kırpımları.
- [images/odt_embedded/](images/odt_embedded/) - eski ODT aktarımından gelen gömülü görseller.
- `images/project_status/` - henüz yok; rework öncesi/sonrası fiziksel kart fotoğrafları eklenirse burada tutulacak.

Tracking ve editörlük dosyaları:

| Link | Rol |
|---|---|
| [tracking/open_questions.md](tracking/open_questions.md) | açık kontrollerin canlı takip listesi |
| [tracking/master_plan.md](tracking/master_plan.md) | genel çalışma planı |
| [tracking/readme_split_manifest.md](tracking/readme_split_manifest.md) | split öncesi başlık taşıma manifest'i |
| [tracking/readme_canonical_structure.md](tracking/readme_canonical_structure.md) | hedef owner mimarisi |
| [tracking/readme_move_plan.md](tracking/readme_move_plan.md) | blok taşıma planı |
| [tracking/readme_reorder_inventory.md](tracking/readme_reorder_inventory.md) | owner ihlali / envanter izi |
| [tracking/readme_fragmentation_report.md](tracking/readme_fragmentation_report.md) | dağınık konu kümeleri raporu |
| [tracking/readme_redteam_report.md](tracking/readme_redteam_report.md) | son red-team editör incelemesi |
| [tracking/README_before_index_rewrite_2026-05-30.md](tracking/README_before_index_rewrite_2026-05-30.md) | eski uzun README arşivi; primary okuma rotası değil |

## Fiziksel Durum / Satın Alınan Parçalar / EVM Kartlar

[Güncel Omurga] Hesapların hedefi, LM5146-Q1 EVM/kart bağlamında rework uygulanabilecek bir buck converter tasarımını çıkarmaktı.

[Tasarım İzi] Hesaplar sonucunda EVM üzerinde birçok komponentin değiştirilmesi planlandı. BOM klasöründe bu seçilen/satın alınan parçalara ait datasheet izleri bulunuyor. Örnek aileler:

- `L1` ve input-filter indüktörü
- `Cin`, `Cout`, `Cbst`, `Cilim`, `Css`, `Cvcc`
- kompanzasyon kapasitörleri ve dirençleri
- feedback divider dirençleri
- UVLO/RT/PGOOD/ILIM dirençleri
- input-filter damping ve bulk elemanları
- MOSFET adayı

[Açık Kontrol] Fiziksel gerçekleşme durumu:

- Parçalar seçildi ve satın alındı.
- Karta takılmadı.
- EVM modifikasyonu uygulanmadı.
- Ölçüm ve doğrulama yapılmadı.
- Proje durduruldu.

Repo içinde teknik görseller ve EVM/datasheet ekran kırpımları var; fakat rework uygulanmış kartı gösteren fiziksel proje durumu fotoğrafı yok. Bu nedenle README'de fiziksel fotoğraf galerisi kullanılmadı. İleride eklenecek fotoğraflar için hedef klasör: `images/project_status/`.

## Bu Repo'nun Ne Olmadığı

Bu repo:

- tamamlanmış donanım doğrulama raporu değildir,
- planlanan rework uygulanmış son kart değildir,
- EMI/termal/lab ölçümüyle kapatılmış final rapor değildir,
- doğrudan üretime verilecek temiz BOM/PCB release paketi değildir,
- tüm eski iterasyonları silip yalnız final sayıları gösteren akademik steril rapor değildir.

Bu repo daha çok şunu yapar: nerede hangi hesabın kurulduğunu, hangi parçaların seçildiğini, hangi kaynaklarla çapraz kontrol edildiğini ve projenin fiziksel olarak nerede durduğunu dürüstçe gösterir.

## Ayrıntılı Teknik Belgeler

Ayrıntılı teknik anlatım bu dosyalarda tutuluyor:

- [00_proje_durumu_ve_okuma_rehberi.md](00_proje_durumu_ve_okuma_rehberi.md)
- [01_tasarim_girdileri_ve_kaynaklar.md](01_tasarim_girdileri_ve_kaynaklar.md)
- [02_startup_pin_programlama_ve_ortak_sabitler.md](02_startup_pin_programlama_ve_ortak_sabitler.md)
- [03_bobin_ve_cikis_kapasitorleri.md](03_bobin_ve_cikis_kapasitorleri.md)
- [04_giris_kapasitorleri_ve_giris_agi.md](04_giris_kapasitorleri_ve_giris_agi.md)
- [05_mosfet_secimi_ve_dayanim_mantigi.md](05_mosfet_secimi_ve_dayanim_mantigi.md)
- [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md)
- [07_kontrolcu_ve_kompanzasyon.md](07_kontrolcu_ve_kompanzasyon.md)
- [08_emi_giris_filtresi_ve_yerlesim.md](08_emi_giris_filtresi_ve_yerlesim.md)
- [09_simulasyon_gorseller_ve_acik_sorular.md](09_simulasyon_gorseller_ve_acik_sorular.md)
