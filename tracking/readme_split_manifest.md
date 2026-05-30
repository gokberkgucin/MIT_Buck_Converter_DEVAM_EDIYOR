# README Split Manifest

Tarih: 2026-05-29  
Girdi: güncel `README.md`  
Amaç: README içeriğini henüz taşımadan, ileride kök dosyalara bölmek için başlık envanteri ve hedef dosya haritası çıkarmak.

Bu manifest yalnız plan dosyasıdır:

- `README.md` kısaltılmadı.
- Yeni teknik kök dosyalar oluşturulmadı.
- Hiçbir ana teknik içerik taşınmadı.
- Görsel, defter sayfası, kaynak izi veya hesap kaybı yapılmadı.

## Repo Kökü Mevcut Yapı Özeti

| Öğe | Tür | Not |
|---|---|---|
| `BOM/` | klasör | BOM ve komponent datasheet izleri |
| `images/` | klasör | README içindeki defter/görsel kırpımları |
| `references/` | klasör | PDF/kaynak arşivi ve kullanılan kaynak notları |
| `tracking/` | klasör | plan, envanter, audit ve manifest dosyaları |
| `.git` | git metadata | repo çalışma alanı |
| `G32_lm5146-q1.pdf` | kök PDF | LM5146-Q1 datasheet kopyası |
| `G94_SPEC.txt` | kök metin | tasarım spesifikasyon kaynağı |
| `LM5146_quickstart_calculator_revB1.xlsm` | kök spreadsheet | LM5146 quickstart calculator |
| `README.md` | ana belge | bölünecek yaşayan tasarım defteri |

Not: Hedef split dosyaları henüz kökte yok; bu turda oluşturulmayacak.

## Hedef Kök Dosya Planı

| Hedef dosya | Rol | README'de kalacak özet |
|---|---|---|
| `00_proje_durumu_ve_okuma_rehberi.md` | Belge felsefesi, okuma kuralı, çalışma planı, tarihçe, durum özeti ve değişiklik izi | README'nin kısa giriş / indeks kısmı |
| `01_tasarim_girdileri_ve_kaynaklar.md` | Global hedefler, tasarım girdileri, kaynak güven seviyesi ve cross-check haritası | README'de hedef ve kaynak dosyasına link |
| `02_startup_pin_programlama_ve_ortak_sabitler.md` | Paylaşılan `fsw`, duty/timing, startup, pin programming, RT, SS/TRK, EN/UVLO | README'de ortak sabitler ve startup linki |
| `03_bobin_ve_cikis_kapasitorleri.md` | Bobin, çıkış kapasiteleri, Cout/Zout/output bulk/energy buffer | README'de bobin+Cout owner linki |
| `04_giris_kapasitorleri_ve_giris_agi.md` | Cin, MLCC, RMS, ESR/ESL, helper MLCC, giriş bulk, transient enerji ve giriş ağı sezgisi | README'de giriş kapasitörü owner linki |
| `05_mosfet_secimi_ve_dayanim_mantigi.md` | MOSFET aday parça, dayanım, SOA, avalanche, RDS/Qg/Qoss/dvdt seçim mantığı | README'de MOSFET seçim owner linki |
| `06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md` | MOSFET kayıpları, bootstrap, protection/current-limit/sensing ve termal kapanış | README'de kayıp/bootstrap/termal linki |
| `07_kontrolcu_ve_kompanzasyon.md` | Feedback divider, plant, fc/PM, K-factor, Type-III ve loop cross-checkleri | README'de kontrol/kompanzasyon linki |
| `08_emi_giris_filtresi_ve_yerlesim.md` | EMI, input filter stability, hot-loop, common-mode/differential-mode ve layout | README'de EMI/layout linki |
| `09_simulasyon_gorseller_ve_acik_sorular.md` | LTspice/PSpice planı, seçilmiş görseller mantığı, açık sorular | README'de doğrulama/görsel/açık soru linki |

## Kolon Anlamları

- **Tam taşınacak:** Mevcut blok gövdesi hedef dosyaya içerik kaybı olmadan taşınır.
- **Kısa yönlendirme bırakılacak:** Bölme sonrası README veya üst dosyada yalnız 1-3 cümlelik link/handoff kalır.
- **README özetine kısaca taşınacak:** Gelecekteki kısa README indeksinde bu başlığın özeti yer alır.

## Başlık Envanteri ve Split Yönlendirme Tablosu

| Mevcut heading path | Hedef dosya | Tam taşınacak | Kısa yönlendirme bırakılacak | README özetine kısaca taşınacak | Not |
|---|---|---:|---:|---:|---|
| `# LM5146-Q1 Tabanli Buck Converter Tasarimi` | `README.md` + `00_proje_durumu_ve_okuma_rehberi.md` | Kısmen | Evet | Evet | Ana başlık README'de kalır; felsefe/okuma kuralları `00`a gider. |
| `## 0. Calisma Plani` | `00_proje_durumu_ve_okuma_rehberi.md` | Evet | Evet | Evet | Plan ve belge kullanım rehberi. |
| `## 1. Arka Plan` | `00_proje_durumu_ve_okuma_rehberi.md` | Evet | Evet | Evet | Proje bağlamı ve tarihçe. |
| `## 2. Durum Ozeti` | `00_proje_durumu_ve_okuma_rehberi.md` | Evet | Evet | Evet | İlk/yeni tasarım özetinin ana sahibi `00`. |
| `### 2.1 Ilk tasarim` | `00_proje_durumu_ve_okuma_rehberi.md` | Evet | Hayır | Kısmen | Eski iterasyon tarihçesi; README'de yalnız bir cümle. |
| `### 2.2 Yeni tasarim` | `00_proje_durumu_ve_okuma_rehberi.md` | Evet | Hayır | Kısmen | Güncel yönün kısa tarihçesi. |
| `### 2.3 Tasarim yaklasimindaki degisim` | `00_proje_durumu_ve_okuma_rehberi.md` | Evet | Hayır | Kısmen | Linear-regulator geçmişinden buck tasarıma geçiş izi. |
| `## 3. Güncel Tasarım Omurgası ve Paylaşılan Tasarım Girdileri` | `01_tasarim_girdileri_ve_kaynaklar.md` | Evet | Evet | Evet | Global hedefler ve ana tasarım girdileri. |
| `### 3.1 Paylaşılan fsw, duty ve zaman alanı owner'ı` | `02_startup_pin_programlama_ve_ortak_sabitler.md` | Evet | Evet | Evet | Shared `fsw` / duty / timing için tek owner. |
| `### 3.2 Startup / pin-programming handoff özeti` | `02_startup_pin_programlama_ve_ortak_sabitler.md` | Evet | Evet | Kısmen | `5.1` startup owner'ına bağlanan kısa köprü. |
| `## 4. Kullanilan Ana Kaynaklar` | `01_tasarim_girdileri_ve_kaynaklar.md` | Evet | Evet | Evet | Kaynak güven seviyesi ve rol haritası. |
| `### 4.1 Cross-check ciktılarinin owner haritasi` | `01_tasarim_girdileri_ve_kaynaklar.md` | Evet | Evet | Kısmen | Cross-check owner map; teknik sayıları sahiplenmez. |
| `### 4.2 Arac ciktisi okuma kurali` | `01_tasarim_girdileri_ve_kaynaklar.md` | Evet | Evet | Kısmen | WEBENCH/calculator okuma kuralı. |
| `## 5. Guc Katinin Tasarimi` | README indeks + ilgili `02`-`06` dosyaları | Kısmen | Evet | Evet | Ana kapı README'de özet linklere dönüşür. |
| `### 5.1 Controller pin programming ve startup owner` | `02_startup_pin_programlama_ve_ortak_sabitler.md` | Evet | Evet | Evet | Controller pin programming primary owner. |
| `#### 5.1.1 LM5146-Q1 dahili LDO siniri` | `02_startup_pin_programlama_ve_ortak_sabitler.md` | Evet | Hayır | Hayır | Startup/VCC koşulu; termal sonuç `06`ya referans verir. |
| `#### 5.1.2 Ek notlar: dusuk Vin bolgesinin etkisi` | `02_startup_pin_programlama_ve_ortak_sabitler.md` | Evet | Hayır | Hayır | Low-Vin ve VCCX kullanılmaması. |
| `#### 5.1.3 FB divider referans notu` | `02_startup_pin_programlama_ve_ortak_sabitler.md` + `07_kontrolcu_ve_kompanzasyon.md` | Kısmen | Evet | Hayır | Startup içinde kısa referans; tam FB anlatımı `07`de. |
| `#### 5.1.4 EN/UVLO, SS/TRK ve startup notlari` | `02_startup_pin_programlama_ve_ortak_sabitler.md` | Evet | Hayır | Hayır | EN/UVLO ve SS/TRK defter izleriyle beraber taşınır. |
| `#### 5.1.5 RT pini ve anahtarlama frekansi` | `02_startup_pin_programlama_ve_ortak_sabitler.md` | Evet | Evet | Hayır | RT programlama burada; `fsw` shared owner'ıyla komşu. |
| `### 5.2 Ortak sabitler, duty ve timing referans geçidi` | `02_startup_pin_programlama_ve_ortak_sabitler.md` | Evet | Evet | Evet | README'de yalnız shared constants linki kalır. |
| `#### 5.2.1 Donanımsal zaman sınırı kaynak notu` | `02_startup_pin_programlama_ve_ortak_sabitler.md` | Evet | Hayır | Hayır | Timing kaynak izi. |
| `#### 5.2.2 Bootstrap duty referans notu` | `02_startup_pin_programlama_ve_ortak_sabitler.md` + `06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md` | Kısmen | Evet | Hayır | Duty `02`; bootstrap uygulaması `06`. |
| `### 5.3 Bobin secimi` | `03_bobin_ve_cikis_kapasitorleri.md` | Evet | Evet | Evet | Bobin primary owner. |
| `#### 5.3.1 Cikis bobini` | `03_bobin_ve_cikis_kapasitorleri.md` | Evet | Hayır | Hayır | L/DCR/Isat/ripple burada kalır. |
| `#### 5.3.2 Slew-rate mantigi` | `03_bobin_ve_cikis_kapasitorleri.md` | Evet | Evet | Hayır | Bobin-Cout energy buffer ilişkisine kısa köprü. |
| `#### 5.3.3 Mevcut durum` | `03_bobin_ve_cikis_kapasitorleri.md` | Evet | Hayır | Hayır | Güncel bobin kararı. |
| `#### 5.3.4 Bu bolumde acik tuttugum maddeler` | `03_bobin_ve_cikis_kapasitorleri.md` + `09_simulasyon_gorseller_ve_acik_sorular.md` | Kısmen | Evet | Hayır | Yerel açık kontrol `03`; genel takip `09`. |
| `### 5.4 Cikis kapasiteleri` | `03_bobin_ve_cikis_kapasitorleri.md` | Evet | Evet | Evet | Output caps / Cout primary owner. |
| `#### 5.4.1 Cikis sigaçlari` | `03_bobin_ve_cikis_kapasitorleri.md` | Evet | Hayır | Hayır | Cout giriş özeti. |
| `#### 5.4.2 Bu iterasyondaki tasarim karari` | `03_bobin_ve_cikis_kapasitorleri.md` | Evet | Hayır | Hayır | Güncel Cout kararı. |
| `#### 5.4.3 Overshoot / Undershoot gerilimi ve acik-cevrim cikis impedance` | `03_bobin_ve_cikis_kapasitorleri.md` | Evet | Evet | Hayır | Zout(fc), transient window ve load-step ilişkisi. |
| `#### 5.4.4 Vripple ve fsw civarindaki Zout` | `03_bobin_ve_cikis_kapasitorleri.md` | Evet | Evet | Hayır | Büyük blok; plant/Type-III köprülerine kısa cross-file referans bırakılacak. |
| `#### 5.4.5 Bulk kapasitör eklemenin getirdigi sifirlar` | `03_bobin_ve_cikis_kapasitorleri.md` | Evet | Hayır | Hayır | Çıkış bulk, giriş bulk'tan ayrı tutulur. |
| `#### 5.4.6 Slew-rate ve cikis kapasitörlerinin enerji tamponu rolu` | `03_bobin_ve_cikis_kapasitorleri.md` | Evet | Evet | Hayır | Cout energy buffer primary owner. |
| `#### 5.4.7 Acik teknik dogrulamalar` | `03_bobin_ve_cikis_kapasitorleri.md` + `09_simulasyon_gorseller_ve_acik_sorular.md` | Kısmen | Evet | Hayır | Yerel açık kontrol `03`; genel takip `09`. |
| `### 5.5 Giris kapasiteleri` | `04_giris_kapasitorleri_ve_giris_agi.md` | Evet | Evet | Evet | Input caps primary owner. |
| `#### 5.5.1 Giris sigaçlari` | `04_giris_kapasitorleri_ve_giris_agi.md` | Evet | Hayır | Hayır | Cin görev tanımı. |
| `#### 5.5.2 Yeni eklenen giris gereksinimleri` | `04_giris_kapasitorleri_ve_giris_agi.md` | Evet | Hayır | Hayır | MLCC/bulk/RMS gereksinimleri. |
| `#### 5.5.3 Secilen genel strateji` | `04_giris_kapasitorleri_ve_giris_agi.md` | Evet | Hayır | Hayır | MLCC + helper + bulk stratejisi. |
| `#### 5.5.4 MLCC Cin hesabi` | `04_giris_kapasitorleri_ve_giris_agi.md` | Evet | Evet | Hayır | MLCC hesapları; duty sadece `02`ye kısa referans. |
| `#### 5.5.5 RMS akimi ve termal bakis` | `04_giris_kapasitorleri_ve_giris_agi.md` + `06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md` | Kısmen | Evet | Hayır | RMS hesabı `04`; sıcaklık kapanışı `06`. |
| `#### 5.5.6 ESL ve kucuk degerli yardimci MLCC'ler` | `04_giris_kapasitorleri_ve_giris_agi.md` | Evet | Evet | Hayır | Helper MLCC/ESL; layout/EMI `08`e kısa referans. |
| `#### 5.5.7 Bulk kapasitör secimi mantigi` | `04_giris_kapasitorleri_ve_giris_agi.md` + `08_emi_giris_filtresi_ve_yerlesim.md` | Kısmen | Evet | Hayır | Giriş bulk `04`; input-filter stability ayrıntısı `08`. |
| `#### 5.5.8 Acik teknik dogrulamalar` | `04_giris_kapasitorleri_ve_giris_agi.md` + `09_simulasyon_gorseller_ve_acik_sorular.md` | Kısmen | Evet | Hayır | Yerel açık kontrol `04`; genel takip `09`. |
| `### 5.6 MOSFET secimi ve kayiplar` | `05_mosfet_secimi_ve_dayanim_mantigi.md` + `06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md` | Kısmen | Evet | Evet | Selection/losses ayrılacak. |
| `#### 5.6.1 Mevcut aday parca` | `05_mosfet_secimi_ve_dayanim_mantigi.md` | Evet | Hayır | Hayır | Aday MOSFET bilgisi. |
| `#### 5.6.2 Secim mantigi` | `05_mosfet_secimi_ve_dayanim_mantigi.md` | Evet | Evet | Hayır | SOA, avalanche, RDS, Qg/Qoss, dvdt seçim mantığı. |
| `#### 5.6.3 Ilk kayip notlari` | `06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md` | Evet | Evet | Hayır | MOSFET loss model primary owner `06`. |
| `#### 5.6.4 Thermal ve datasheet yorumu referans notu` | `06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md` | Evet | Evet | Hayır | Termal/datasheet yorumları `06`. |
| `#### 5.6.5 Bu bolumde acik tuttugum maddeler` | `05_mosfet_secimi_ve_dayanim_mantigi.md` + `06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md` + `09_simulasyon_gorseller_ve_acik_sorular.md` | Kısmen | Evet | Hayır | Seçim açıkları `05`; loss/thermal açıkları `06`; genel takip `09`. |
| `### 5.7 Bootstrap agi` | `06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md` | Evet | Evet | Evet | Bootstrap primary owner. |
| `#### 5.7.1 Bootstrap direncini (Rboot) hesaplama ve secim mantigi` | `06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md` | Evet | Evet | Hayır | Duty/Qg/VCC için `02`/`05` kısa referansları kalır. |
| `### 5.8 Protection, current-limit ve sensing owner` | `06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md` | Evet | Evet | Evet | ILIM/Rilim/Cilim primary owner. |
| `### 5.9 Termal ve Kayıp Kapanışı` | `06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md` | Evet | Evet | Evet | Termal closure primary owner. |
| `#### 5.9.1 Controller VCC/LDO, thermal shutdown ve exposed pad` | `06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md` | Evet | Evet | Hayır | VCC/LDO termal kayıp; startup dosyasına kısa referans. |
| `#### 5.9.2 Giriş MLCC RMS kaynaklı sıcaklık artışı` | `06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md` | Evet | Evet | Hayır | Cin RMS kaynağı `04`; termal yorum `06`. |
| `#### 5.9.3 MOSFET termal yolu, datasheet current ve T_J` | `06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md` | Evet | Evet | Hayır | MOSFET thermal path. |
| `#### 5.9.4 Board worst-case ve kayıp kapanış sırası` | `06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md` + `09_simulasyon_gorseller_ve_acik_sorular.md` | Kısmen | Evet | Hayır | Kapanış sırası `06`; genel açık takip `09`. |
| `## 6. Kontrolcu ve Kompanzasyon Owner` | `07_kontrolcu_ve_kompanzasyon.md` | Evet | Evet | Evet | Control/compensation primary file. |
| `### 6.1 Feedback divider` | `07_kontrolcu_ve_kompanzasyon.md` | Evet | Evet | Evet | RFB owner. |
| `### 6.2 Plant modeli ve modulator referansi` | `07_kontrolcu_ve_kompanzasyon.md` | Evet | Evet | Evet | Plant model; L/C physical owner'larına kısa referans. |
| `#### 6.2.1 Genel kontrol yapisi` | `07_kontrolcu_ve_kompanzasyon.md` | Evet | Hayır | Hayır | Kontrol blok akışı. |
| `#### 6.2.2 Modulator blogunun rolu` | `07_kontrolcu_ve_kompanzasyon.md` | Evet | Hayır | Hayır | Modulator gain owner. |
| `#### 6.2.3 Cikis filtresi ve yuk` | `07_kontrolcu_ve_kompanzasyon.md` | Evet | Evet | Hayır | Plant handoff; fiziksel L/C sayıları `03`ten alınır. |
| `#### 6.2.4 Bu bolumde korunacak ayrim` | `07_kontrolcu_ve_kompanzasyon.md` + `06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md` | Kısmen | Evet | Hayır | Current-limit'in kontrol owner'ı olmadığını belirtir. |
| `### 6.3 Hedef fc ve faz marji` | `07_kontrolcu_ve_kompanzasyon.md` | Evet | Evet | Evet | Crossover/PM owner. |
| `### 6.4 K-factor mantigi ve Type-III komponent seti` | `07_kontrolcu_ve_kompanzasyon.md` | Evet | Evet | Evet | K-factor ve Type-III primary owner. |
| `#### 6.4.1 Neden bu yontem?` | `07_kontrolcu_ve_kompanzasyon.md` | Evet | Hayır | Hayır | K-factor gerekçesi. |
| `#### 6.4.2 Taslaktaki akisin ozeti` | `07_kontrolcu_ve_kompanzasyon.md` | Evet | Hayır | Hayır | K-factor akış özeti. |
| `#### 6.4.3 Scriptlerde gorulen ilk ipuclari` | `07_kontrolcu_ve_kompanzasyon.md` | Evet | Hayır | Hayır | Script/calculator izleri. |
| `#### 6.4.4 Bu projede K-factor'un gorevi` | `07_kontrolcu_ve_kompanzasyon.md` | Evet | Hayır | Hayır | K-factor rolü ve defter geçişi. |
| `##### Defter taramasi: W.1-W.24` | `07_kontrolcu_ve_kompanzasyon.md` | Evet | Hayır | Hayır | Kontrol defter izi, ilgili owner içinde kalır. |
| `#### 6.4.5 Compensator topolojisi ve temel model` | `07_kontrolcu_ve_kompanzasyon.md` | Evet | Evet | Hayır | Type-III final/eski/cross-check setleri. |
| `### 6.5 Calculator / defter frekans yerlestirme cross-checkleri` | `07_kontrolcu_ve_kompanzasyon.md` | Evet | Evet | Evet | Control cross-check owner. |
| `#### 6.5.1 Ilk ilke` | `07_kontrolcu_ve_kompanzasyon.md` | Evet | Hayır | Hayır | Cross-check okuma ilkesi. |
| `#### 6.5.2 Defterden gelen ilk sayisal adaylar` | `07_kontrolcu_ve_kompanzasyon.md` | Evet | Hayır | Hayır | Eski adaylar ve calculator izleri. |
| `#### 6.5.3 Sonraki sikilastirma hedefleri` | `07_kontrolcu_ve_kompanzasyon.md` + `09_simulasyon_gorseller_ve_acik_sorular.md` | Kısmen | Evet | Hayır | Kontrol açıkları `07`; genel takip `09`. |
| `### 6.6 Faz, kazanc marji ve WEBENCH cross-checkleri` | `07_kontrolcu_ve_kompanzasyon.md` | Evet | Evet | Evet | Loop margin / WEBENCH cross-check. |
| `#### 6.6.1 Taslak hedef bandi` | `07_kontrolcu_ve_kompanzasyon.md` | Evet | Hayır | Hayır | Hedef band. |
| `#### 6.6.2 Neden bu kadar onemli?` | `07_kontrolcu_ve_kompanzasyon.md` | Evet | Hayır | Hayır | Kararlılık gerekçesi. |
| `#### 6.6.3 Kararlilik kriterinin bu projedeki anlami` | `07_kontrolcu_ve_kompanzasyon.md` | Evet | Evet | Hayır | Simülasyonla kapanacak kontrol kriteri. |
| `## 7. EMI, Giris Filtresi ve Yerlesim` | `08_emi_giris_filtresi_ve_yerlesim.md` | Evet | Evet | Evet | EMI/input filter/layout primary file. |
| `### 7.1 Hot-loop ve kritik akim yollari` | `08_emi_giris_filtresi_ve_yerlesim.md` | Evet | Evet | Evet | Hot-loop/layout. |
| `### 7.2 Differential-mode EMI` | `08_emi_giris_filtresi_ve_yerlesim.md` | Evet | Evet | Evet | DM EMI. |
| `### 7.3 Common-mode EMI` | `08_emi_giris_filtresi_ve_yerlesim.md` | Evet | Evet | Evet | CM EMI. |
| `### 7.4 Giris filtresi kararliligi` | `08_emi_giris_filtresi_ve_yerlesim.md` | Evet | Evet | Evet | Input filter stability owner. |
| `### 7.5 Yerlesim kurallari` | `08_emi_giris_filtresi_ve_yerlesim.md` | Evet | Evet | Evet | Layout checklist. |
| `## 8. LTspice Dogrulama Plani` | `09_simulasyon_gorseller_ve_acik_sorular.md` | Evet | Evet | Evet | Simulation primary file. |
| `### 8.1 Baslangic model seti` | `09_simulasyon_gorseller_ve_acik_sorular.md` | Evet | Hayır | Hayır | Model set. |
| `### 8.2 Simulasyon asamalari` | `09_simulasyon_gorseller_ve_acik_sorular.md` | Evet | Hayır | Hayır | Simulation sequence. |
| `### 8.3 Steady-state kontrol listesi` | `09_simulasyon_gorseller_ve_acik_sorular.md` | Evet | Evet | Hayır | Test listesi; teknik owner sayıları tekrar kurulmaz. |
| `### 8.4 Dinamik testler` | `09_simulasyon_gorseller_ve_acik_sorular.md` | Evet | Evet | Hayır | Load-step/startup testleri. |
| `### 8.5 Giris filtresi ve EMI ile baglantili testler` | `09_simulasyon_gorseller_ve_acik_sorular.md` | Evet | Evet | Hayır | EMI/input filter testleri; primary EMI owner `08`. |
| `### 8.6 44 V transient notu` | `09_simulasyon_gorseller_ve_acik_sorular.md` | Evet | Evet | Hayır | Survive-only doğrulama. |
| `### 8.7 Hesapla simulasyonun birlestirilmesi` | `09_simulasyon_gorseller_ve_acik_sorular.md` | Evet | Evet | Evet | Hesap-simülasyon kapanış kuralı. |
| `## 9. Secilmis Gorseller` | `09_simulasyon_gorseller_ve_acik_sorular.md` | Evet | Evet | Evet | Görsel mantığı; görseller teknik owner yanında kalır. |
| `## 10. Acik Sorular` | `09_simulasyon_gorseller_ve_acik_sorular.md` | Evet | Evet | Evet | Genel açık soru listesi. |
| `## 11. Degisiklik Gunlugu` | `00_proje_durumu_ve_okuma_rehberi.md` | Evet | Evet | Evet | Değişiklik izi ve README evrimi. |
| `### 2026-03-20` | `00_proje_durumu_ve_okuma_rehberi.md` | Evet | Hayır | Kısmen | Tarihli değişiklik girdisi. |

## Tekrarlayan Owner Kümeleri ve Split Kararı

| Tekrarlayan owner kümesi | Mevcut parçalı konumlar | Primary split dosyası | Split sonrası kural |
|---|---|---|---|
| shared `fsw` / duty / timing | `3.1`, `5.2`, `5.5.4`, `5.7.1`, `7.2` | `02_startup_pin_programlama_ve_ortak_sabitler.md` | Tam duty/timing anlatımı `02`; diğer dosyalarda yalnız kullanılan duty noktasına kısa referans. |
| startup / pin-programming | `3.2`, `5.1`, `5.9.1`, `8.4` | `02_startup_pin_programlama_ve_ortak_sabitler.md` | EN/UVLO, SS/TRK, RT ve VCC/LDO çalışma koşulu `02`; termal kayıp `06`. |
| inductor / output caps | `5.3`, `5.4`, `6.2.3`, `8.3`, `8.4` | `03_bobin_ve_cikis_kapasitorleri.md` | L/Cout/ESR/Zout primary `03`; plant ve simülasyon yalnız handoff/test. |
| input caps | `5.5`, `7.2`, `7.4`, `8.5` | `04_giris_kapasitorleri_ve_giris_agi.md` | Cin/MLCC/bulk primary `04`; EMI/filter stability `08`; test `09`. |
| MOSFET selection vs losses | `5.6.1`, `5.6.2`, `5.6.3`, `5.9.3`, `8.3` | `05_mosfet_secimi_ve_dayanim_mantigi.md` ve `06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md` | Seçim/dayanım `05`; kayıp/termal kapanış `06`. |
| bootstrap / protection / thermal | `5.7`, `5.8`, `5.9`, `3.1`, `5.6` | `06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md` | Bootstrap, ILIM/Rilim/Cilim, loss ve thermal closure `06`; duty/Qg/VCC owner'larına kısa referans. |
| control / compensation | `5.1.3`, `6.1`-`6.6`, `5.4.4`, `8.3` | `07_kontrolcu_ve_kompanzasyon.md` | RFB/plant/fc/PM/K-factor/Type-III `07`; fiziksel L/Cout owner'ları `03`. |
| EMI / input filter / layout | `5.5.7`, `7.1`-`7.5`, `8.5` | `08_emi_giris_filtresi_ve_yerlesim.md` | EMI ve Middlebrook/input-filter stability `08`; Cin değerleri `04`ten alınır. |
| simulation / open questions | `5.x açık kontroller`, `6.x açık kontroller`, `8`, `10` | `09_simulasyon_gorseller_ve_acik_sorular.md` | Yerel açık kontrol teknik owner'da; genel takip ve test planı `09`. |

## README İçin Gelecek Özet İskeleti

Split uygulandığında README sadece şu seviyede kalmalı:

1. Kısa belge amacı ve okuma kuralı.
2. Hedef split dosyalarına linkli indeks.
3. Güncel tasarım omurgasının 10-15 satırlık özeti.
4. Kritik açık kontrollerin kısa linkli listesi.
5. Değişiklik günlüğüne kısa yönlendirme.

Bu manifest, sonraki turda yapılacak gerçek taşıma için kesim haritasıdır; bu turda kesim yapılmadı.
