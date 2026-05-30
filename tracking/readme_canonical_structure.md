# README Kanonik Tek-Owner Hedef Yapısı

Okuma tarihi: 2026-05-28  
Kapsam: `README.md` dosyasının tamamı.  
Not: Bu dosya hedef mimari önerisidir; bu aşamada `README.md` üzerinde düzenleme yapılmadı.

## Temel İlke

Bu hedef yapı "tek owner + iz koruma" kuralına göre kurulmuştur. Her teknik kavramın tam anlatımı tek bir primary owner altında yaşar. Diğer bölümlerde aynı konu gerekiyorsa yalnız kısa referans, handoff veya checklist maddesi kalır.

Tarihsel defter izi, WEBENCH/calculator çıktıları, ekran görüntüleri ve eski iterasyonlar sona yığılmaz. İlgili teknik owner içinde şu etiketlerden biriyle kontrollü tutulur:

- `[Güncel Omurga]`: güncel tasarım kararının ana hesabı veya ana parametre seti.
- `[Tasarım İzi]`: kararın nasıl geliştiğini gösteren defter/screen/ara hesap izi.
- `[Eski İterasyon]`: artık final olmayan ama silinmeyecek eski değer veya yöntem.
- `[Çapraz Teyit]`: datasheet, EVM, WEBENCH, calculator veya defter ile doğrulama.
- `[Açık Kontrol]`: henüz simülasyon, ölçüm veya parça doğrulaması bekleyen madde.

## Nihai Top-Level Omurga

```text
# LM5146-Q1 Tabanlı Buck Converter Tasarımı

## 0. Belge Felsefesi, Etiketler ve Okuma Kuralları
## 1. Çalışma Planı, Arka Plan ve Durum Özeti
## 2. Güncel Tasarım Omurgası ve Paylaşılan Girdiler
## 3. Kaynaklar, Güven Seviyesi ve Cross-check Haritası
## 4. Güç Katı Owner'ları
## 5. Kontrol ve Kompanzasyon Owner'ı
## 6. EMI, Giriş Filtresi ve Yerleşim
## 7. LTspice / PSpice Doğrulama Planı
## 8. Görsel, Defter Kırpımı ve Kaynak İzi Yönetimi
## 9. Açık Kontroller ve Kapanış Listesi
## 10. Değişiklik Günlüğü
```

Bu sıra bilerek dependency monotonicity mantığına göre kuruludur: önce okuma kuralları, sonra global tasarım girdileri, sonra komponent owner'ları, sonra kontrol, sonra EMI/layout, en sonda doğrulama ve kapanış.

## Ayrıntılı Hedef Yapı

### 0. Belge Felsefesi, Etiketler ve Okuma Kuralları

Amaç: README'nin nasıl okunacağını, niçin sterilize edilmediğini, etiketlerin ne anlama geldiğini ve owner kuralını anlatmak.

Alt yapı:

- `0.1 Belgenin amacı`
- `0.2 Tek-owner okuma kuralı`
- `0.3 Etiket sözlüğü`
- `0.4 Defter, görsel ve kaynak izi koruma kuralı`
- `0.5 Okuma rotası`

Primary owner olduğu kavramlar:

- Belge felsefesi.
- Owner kuralı.
- Etiket sistemi.
- Görselin teknik paragraftan kopmaması ilkesi.

Owner dışı yerlerde izin verilen referans:

- "Etiket anlamları için `0.3`e bak." gibi kısa yönlendirme.

### 1. Çalışma Planı, Arka Plan ve Durum Özeti

Amaç: Projenin nereden geldiğini, eski tasarımdan güncel LM5146-Q1 buck tasarımına geçişi ve çalışma planını anlatmak.

Alt yapı:

- `1.1 Çalışma planı`
- `1.2 Arka plan`
- `1.3 İlk tasarım [Eski İterasyon]`
- `1.4 Yeni tasarım yönü [Güncel Omurga]`
- `1.5 Tasarım yaklaşımındaki değişim [Tasarım İzi]`

Primary owner olduğu kavramlar:

- Tarihçe ve proje bağlamı.
- İlk tasarımın neden terk edildiği.
- Yeni tasarımın yüksek seviye yönü.
- Çalışma planı ve README'nin yaşayan belge niteliği.

Owner dışı yerlerde izin verilen referans:

- Teknik owner'larda eski linear-regulator defter izi gerekiyorsa yalnız kısa "tarihçe için `1.5`" notu.

### 2. Güncel Tasarım Omurgası ve Paylaşılan Girdiler

Amaç: Tüm teknik owner'ların ortak kullandığı sayıların ve işletim varsayımlarının ilk tam tanımını yapmak.

Alt yapı:

- `2.1 Global elektriksel hedefler [Güncel Omurga]`
- `2.2 Vin, Vout, Pout, Iout ve load-step zarfı`
- `2.3 Minimum efficiency ve worst-case çalışma varsayımları`
- `2.4 Paylaşılan fsw, duty ve zaman alanı owner'ı`
- `2.5 44 V / 1 ms survive-only notu`
- `2.6 EMI ve termal hedeflerin global bağlamı`
- `2.7 Startup / pin-programming kısa handoff'u`

Primary owner olduğu kavramlar:

- `Vin`, `Vout`, `Pout`, `Iout`, load-step.
- `fsw`.
- Minimum efficiency varsayımı.
- İdeal duty ailesi.
- Verim dahil korunmacı duty ailesi.
- `D=0.5` pratik kontrol noktası.
- `tON` / `tOFF` ve donanımsal zaman sınırlarının ilk tam tanımı.
- 44 V survive-only hedefinin sistem düzeyi anlamı.
- Board worst-case sıcaklık hedefinin ortak girdi olarak tanımı.

Owner dışı yerlerde izin verilen referans:

- Komponent hesabı içinde "duty ailesi `2.4`te tanımlıdır; bu hesapta şu uç kullanıldı" notu.
- Termal veya EMI bölümünde global hedefin uzun tekrar edilmeyen kısa hatırlatması.

### 3. Kaynaklar, Güven Seviyesi ve Cross-check Haritası

Amaç: Kullanılan kaynakların rolünü, güven seviyesini ve hangi çıktının hangi owner altında okunacağını tanımlamak.

Alt yapı:

- `3.1 Ana kaynakların rolü`
- `3.2 Güven seviyesi ve kullanım sınırı`
- `3.3 Cross-check çıktılarının owner haritası`
- `3.4 WEBENCH / calculator / EVM çıktısı okuma kuralı`
- `3.5 Defter kırpımlarının teknik owner'a bağlanma kuralı`

Primary owner olduğu kavramlar:

- Datasheet, quickstart, EVM, WEBENCH, calculator ve defterlerin belge içindeki rolü.
- "Kaynak neyi teyit eder, neyi etmez?" sorusu.
- Araç çıktısının final tasarım gibi okunmaması kuralı.

Owner dışı yerlerde izin verilen referans:

- Her teknik owner içinde kısa `[Çapraz Teyit]` kutusu.
- Uzun kaynak güven tartışması teknik owner'a taşınmaz.

### 4. Güç Katı Owner'ları

Amaç: Controller/startup, indüktör, çıkış/giriş kapasitörleri, MOSFET, bootstrap, protection ve termal kapanışın tekil teknik owner'larını dependency sırasıyla toplamak.

#### 4.1 Controller Pin Programming ve Startup

Alt yapı:

- `4.1.1 VCC/LDO çalışma koşulu`
- `4.1.2 Düşük Vin bölgesi ve VCCX kullanılmaması`
- `4.1.3 EN/UVLO`
- `4.1.4 SS/TRK`
- `4.1.5 RT pini ve fsw programlama`
- `4.1.6 Startup defter izleri ve cross-checkler`
- `4.1.7 Kısa referanslar: FB divider, bootstrap ve termal`

Primary owner olduğu kavramlar:

- Internal VCC/LDO kullanım koşulu.
- EN/UVLO.
- SS/TRK.
- RT programlama.
- Startup pin hesapları.

Owner dışı yerlerde izin verilen referans:

- `2.7`de kısa handoff.
- `4.8`de VCC/LDO termal kayıp hesabı.
- `5.1`de FB divider'ın startup içinde yaşamadığını belirten kısa not.

#### 4.2 İndüktör Owner'ı

Alt yapı:

- `4.2.1 Güncel indüktör kararı`
- `4.2.2 Ripple, peak current, saturation ve DCR`
- `4.2.3 Slew-rate ilişkisi`
- `4.2.4 EVM / WEBENCH / defter cross-checkleri`
- `4.2.5 Açık kontroller`

Primary owner olduğu kavramlar:

- `L`, DCR, saturation, RMS/peak akım yorumları.
- İndüktör ripple hesabı.
- İndüktörün load-step slew-rate üzerindeki rolü.

Owner dışı yerlerde izin verilen referans:

- Plant bölümünde yalnız "L değeri `4.2`den alınır" handoff'u.
- Simülasyon bölümünde checklist maddesi.

#### 4.3 Çıkış Kapasiteleri Owner'ı

Alt yapı:

- `4.3.1 Güncel Cout kararı`
- `4.3.2 Static Vout window`
- `4.3.3 Transient Vout window`
- `4.3.4 Cout alt sınırı mantıkları`
- `4.3.5 Undershoot / overshoot`
- `4.3.6 Zout(fc)`
- `4.3.7 Zout(fsw), Vripple ve yüksek frekans davranışı`
- `4.3.8 ESR / ESL`
- `4.3.9 Çıkış bulk mantığı ve getirdiği sıfırlar`
- `4.3.10 Energy buffer ve slew-rate ilişkisi`
- `4.3.11 Plant handoff: L/C/ESR sayıları`
- `4.3.12 Eski iterasyonlar, dış örnekler ve cross-checkler`
- `4.3.13 Açık kontroller`

Primary owner olduğu kavramlar:

- Cout miktarı ve efektif Cout.
- Static/transient Vout zarfı.
- Overshoot/undershoot.
- `Zout(fc)` ve `Zout(fsw)`.
- Çıkış ESR/ESL.
- Çıkış bulk ve energy-buffer mantığı.
- Plant için kullanılacak çıkış filtresi sayılarının teknik kaynağı.

Owner dışı yerlerde izin verilen referans:

- Kontrol plant bölümünde L/C/ESR sadece handoff olarak kullanılır.
- Simülasyonda Cout transient ve ripple sadece test maddesi olarak kalır.
- Giriş bulk ile çıkış bulk aynı karar gibi anlatılmaz.

#### 4.4 Giriş Kapasiteleri Owner'ı

Alt yapı:

- `4.4.1 Giriş kapasitörlerinin görevi`
- `4.4.2 Güncel Cin stratejisi`
- `4.4.3 MLCC Cin hesabı`
- `4.4.4 DC-bias, voltage derating ve tolerance`
- `4.4.5 RMS akımı`
- `4.4.6 ESR`
- `4.4.7 ESL ve helper MLCC'ler`
- `4.4.8 RMS kaynaklı sıcaklık artışı için termal handoff`
- `4.4.9 Giriş bulk seçimi`
- `4.4.10 Transient enerji tamponu`
- `4.4.11 Damping sezgisi`
- `4.4.12 EMI / input filter handoff`
- `4.4.13 Eski iterasyonlar, cross-checkler ve açık kontroller`

Primary owner olduğu kavramlar:

- Neden Cin gerektiği.
- MLCC Cin hesabı.
- DC-bias, voltage derating, tolerance.
- RMS akımı.
- Giriş ESR/ESL.
- Helper MLCC'ler.
- Giriş bulk seçimi.
- Giriş transient energy buffer.
- Bulk/damping sezgisi.

Owner dışı yerlerde izin verilen referans:

- EMI bölümünde Cin sayıları tekrar hesaplanmaz; yalnız owner'dan alınır.
- Termal bölümde MLCC sıcaklık kapanışı kısa termal yorum olarak bağlanır.
- Simülasyonda Cin/bulk/filter etkisi test matrisi olarak kalır.

#### 4.5 MOSFET Seçimi ve Kayıplar

Alt yapı:

- `4.5.1 Mevcut aday parça`
- `4.5.2 VDS, SOA, avalanche ve güvenlik payı`
- `4.5.3 RDS(on), current rating ve conduction ön okuması`
- `4.5.4 Qg, Qgd, Qoss, Ciss/Coss/Crss ve gate-charge parametreleri`
- `4.5.5 dv/dt, Miller ve gate-drive riskleri`
- `4.5.6 Conduction loss`
- `4.5.7 Switching loss`
- `4.5.8 Gate-drive, Coss, reverse-recovery ve dead-time loss`
- `4.5.9 MOSFET kayıp bütçesi handoff'u`
- `4.5.10 Eski iterasyon / defter / datasheet cross-checkleri`
- `4.5.11 Açık kontroller`

Primary owner olduğu kavramlar:

- MOSFET parça seçimi.
- MOSFET elektriksel parametreleri.
- Gate-charge ve capacitance parametre setleri.
- MOSFET kayıp denklemleri.
- dv/dt ve Miller seçime etki eden yerel riskler.

Owner dışı yerlerde izin verilen referans:

- Bootstrap bölümünde Qg yalnız alınan veri olarak geçer.
- Common-mode EMI bölümünde dv/dt uzun hesap tekrar edilmez.
- Termal bölümde kayıp bütçesi sıcaklığa çevrilir, kayıp denklemleri yeniden kurulmaz.

#### 4.6 Bootstrap ve Gate-drive Yerel Besleme

Alt yapı:

- `4.6.1 Bootstrap ağının görevi`
- `4.6.2 Rboot seçimi`
- `4.6.3 Cboot ve CVCC ilişkisi`
- `4.6.4 Charge time, leakage ve duty handoff`
- `4.6.5 Gate-charge handoff`
- `4.6.6 Defter ve datasheet cross-checkleri`
- `4.6.7 Açık kontroller`

Primary owner olduğu kavramlar:

- Rboot.
- Cboot.
- CVCC'nin bootstrap açısından rolü.
- Bootstrap charge/discharge zamanları.
- Bootstrap leakage ve minimum off-time değerlendirmesi.

Owner dışı yerlerde izin verilen referans:

- Duty'nin tam anlatımı `2.4`te.
- Qg parametreleri `4.5`te.
- VCC/LDO çalışma koşulu `4.1`de, termal etkisi `4.8`de.

#### 4.7 Protection, Current-limit ve Sensing

Alt yapı:

- `4.7.1 Protection zinciri`
- `4.7.2 Current-limit mantığı`
- `4.7.3 ILIM / Rilim / Cilim`
- `4.7.4 Sensing ve layout notları`
- `4.7.5 Defter / EVM cross-checkleri`
- `4.7.6 Açık kontroller`

Primary owner olduğu kavramlar:

- ILIM.
- Rilim.
- Cilim.
- Current-limit hesap ve kaynak izleri.
- Protection/sensing pinlerinin yerel tasarım mantığı.

Owner dışı yerlerde izin verilen referans:

- Kontrol/kompanzasyon bölümünde current-limit anlatımı yaşamaz.
- Layout bölümünde sadece yerleşim etkisi hatırlatılır.

#### 4.8 Termal ve Kayıp Kapanışı

Alt yapı:

- `4.8.1 Termal hedefler ve board worst-case`
- `4.8.2 Controller VCC/LDO güç kaybı`
- `4.8.3 Thermal shutdown, exposed pad ve board temperature bağlamı`
- `4.8.4 Giriş MLCC RMS kaynaklı sıcaklık artışı`
- `4.8.5 MOSFET thermal path, Rth/Psi ve Tj`
- `4.8.6 Datasheet current yorumunun termal anlamı`
- `4.8.7 Ölçüm parametresi ve hesap parametresi ayrımı`
- `4.8.8 Kayıp kapanış sırası`
- `4.8.9 Açık kontroller`

Primary owner olduğu kavramlar:

- Controller VCC/LDO termal kaybı.
- Thermal shutdown/exposed pad.
- MLCC RMS kaynaklı sıcaklık artışının termal yorumu.
- MOSFET Rth/Psi/Tj.
- Board worst-case sıcaklık hedefi ile bütün kayıp bütçesinin kapanışı.

Owner dışı yerlerde izin verilen referans:

- MOSFET owner'ında kayıp denklemleri; termal owner'da sıcaklık sonucu.
- Cin owner'ında RMS kaynak; termal owner'da sıcaklık kapanışı.
- Simülasyonda yalnız doğrulama maddesi.

### 5. Kontrol ve Kompanzasyon Owner'ı

Amaç: Feedback divider, plant, hedef crossover, faz marjı, K-factor ve Type-III komponent setini tek akışta okutmak.

Alt yapı:

- `5.1 Feedback divider`
- `5.2 Plant modeli ve modülatör referansı`
- `5.3 Hedef crossover ve faz marjı`
- `5.4 K-factor mantığı`
- `5.5 Type-III komponent seti`
- `5.6 Calculator / WEBENCH / defter cross-checkleri`
- `5.7 Kararlılık kriterleri ve açık kontroller`

Primary owner olduğu kavramlar:

- RFB1/RFB2.
- Plant modeli ve modülatör bloğu.
- Crossover hedefi.
- Faz marjı.
- K-factor mantığı.
- Type-III RC/CC komponent ailesi.
- Kontrol calculator/WEBENCH/defter cross-checkleri.

Owner dışı yerlerde izin verilen referans:

- L/C/ESR sayılarının fiziksel owner'ı `4.2` ve `4.3`; burada plant handoff olarak okunur.
- Current-limit / Rilim / Cilim bu bölümde yaşamaz.
- WEBENCH sonucu final sayı değil `[Çapraz Teyit]` olarak kalır.

### 6. EMI, Giriş Filtresi ve Yerleşim

Amaç: EMI hedefleri, input filter stability ve layout kararlarını komponent hesaplarını tekrar owner yapmadan toplamak.

Alt yapı:

- `6.1 Hot-loop ve kritik akım yolları`
- `6.2 Differential-mode EMI`
- `6.3 Common-mode EMI`
- `6.4 Giriş filtresi kararlılığı`
- `6.5 Yerleşim kuralları`
- `6.6 EMI / layout açık kontrolleri`

Primary owner olduğu kavramlar:

- Hot-loop.
- Differential-mode EMI.
- Common-mode EMI.
- Giriş filtresi rezonansı.
- Negatif giriş empedansı.
- Damping.
- Layout kuralları.

Owner dışı yerlerde izin verilen referans:

- Cin fiziksel seçimi `4.4`te; burada sadece EMI/filter açısından kullanılır.
- MOSFET dv/dt teknik parametreleri `4.5`te; burada CM EMI etkisi anlatılır.
- Simülasyon planında test maddesi olarak kalır.

### 7. LTspice / PSpice Doğrulama Planı

Amaç: Hesap owner'larını yeniden anlatmadan, doğrulama sırası ve kabul gözlemleri oluşturmak.

Alt yapı:

- `7.1 Başlangıç model seti`
- `7.2 Simülasyon aşamaları`
- `7.3 Steady-state kontrol listesi`
- `7.4 Dinamik testler`
- `7.5 Giriş filtresi ve EMI testleri`
- `7.6 44 V transient testi`
- `7.7 Hesap ve simülasyonun birleştirilmesi`

Primary owner olduğu kavramlar:

- Simülasyon model seti.
- Simülasyon aşamaları.
- Test matrisi.
- Hesap-simülasyon karşılaştırma kuralı.

Owner dışı yerlerde izin verilen referans:

- Teknik hesap yeniden kurulmaz; "beklenen değer için ilgili owner'a bak" notu kullanılır.

### 8. Görsel, Defter Kırpımı ve Kaynak İzi Yönetimi

Amaç: Görsellerin ve defter kırpımlarının nasıl seçildiğini anlatmak. Bu bölüm görsel galerisi veya teknik owner değildir.

Alt yapı:

- `8.1 Görsel seçme kriteri`
- `8.2 Defter kırpımı yerleştirme kuralı`
- `8.3 Ekran görüntüsü / calculator çıktısı etiketleme kuralı`
- `8.4 Kopmuş görsel yasağı`

Primary owner olduğu kavramlar:

- Görsel yönetim felsefesi.
- Defter kırpımı yerleştirme kuralı.
- Kaynak izi görselinin teknik paragraf yanında kalması.

Owner dışı yerlerde izin verilen referans:

- Teknik owner'lar görseli kendi paragrafının yanında tutar; bu bölüm yalnız kuralı anlatır.

### 9. Açık Kontroller ve Kapanış Listesi

Amaç: Yerel owner açık kontrollerini tek yerde takip edilebilir kısa listeye bağlamak.

Alt yapı:

- `9.1 Güç katı açık kontrolleri`
- `9.2 Kontrol / kompanzasyon açık kontrolleri`
- `9.3 EMI / layout açık kontrolleri`
- `9.4 Simülasyon ve ölçüm açık kontrolleri`
- `9.5 Bilerek korunan çelişkiler`

Primary owner olduğu kavramlar:

- Genel açık kontrol takip listesi.
- Çelişkili sayıların nerede çözüleceğine dair takip notu.

Owner dışı yerlerde izin verilen referans:

- Yerel owner'da teknik açık madde tam bağlamıyla kalır; burada sadece kısa takip özeti.

### 10. Değişiklik Günlüğü

Amaç: README'nin düzenleme tarihçesini ve owner-temelli yeniden sıralama kararlarını izlemek.

Alt yapı:

- `10.1 Tarihli değişiklikler`
- `10.2 Owner düzeni değişiklikleri`
- `10.3 Taşınan veya kısaltılan tekrarların özeti`

Primary owner olduğu kavramlar:

- Belge değişiklik izi.
- Düzenleme tarihi ve kapsamı.

Owner dışı yerlerde izin verilen referans:

- Teknik owner'larda changelog metni yaşamaz.

## Teknik Kavram -> Primary Owner Sözlüğü

| Teknik kavram | Primary owner | Owner dışı izin verilen kullanım |
|---|---|---|
| Belge felsefesi, sterilize etmeme, etiketler | `0` | Kısa "etiket anlamı için `0`" notu |
| Çalışma planı ve proje tarihçesi | `1` | Teknik owner'da kısa tarihsel referans |
| Global Vin/Vout/Pout/Iout/load-step | `2.1`-`2.2` | Hesap içinde kullanılan değer adı |
| Minimum efficiency varsayımı | `2.3` | Duty veya loss hesabında kısa referans |
| `fsw` | `2.4` | RT pininde programlama detayı; diğer yerlerde kısa kullanım |
| İdeal duty ailesi | `2.4` | Alt hesapta kullanılan uç değeri |
| Verim dahil duty ailesi | `2.4` | Cin, bootstrap, EMI hesaplarında kısa referans |
| `D=0.5` pratik kontrol noktası | `2.4` | Alt hesapta neden kullanıldığına dair tek cümle |
| `tON/tOFF` zaman alanı | `2.4` | Bootstrap ve timing kontrollerinde kısa referans |
| Kaynak güven seviyesi | `3` | Teknik owner'da kısa `[Çapraz Teyit]` kutusu |
| WEBENCH/calculator okuma kuralı | `3.4` | Owner içinde "cross-check" etiketi |
| Internal VCC/LDO çalışma koşulu | `4.1` | Termalde kayıp hesabına giriş |
| EN/UVLO | `4.1` | Simülasyonda startup test maddesi |
| SS/TRK | `4.1` | Dinamik testte soft-start kontrol maddesi |
| RT | `4.1` | `fsw` global owner'ına kısa bağ |
| İndüktör L/DCR/Isat/ripple | `4.2` | Plant ve simülasyonda handoff |
| Slew-rate'in indüktör yönü | `4.2` | Cout energy-buffer bölümünde çapraz referans |
| Cout static/transient window | `4.3` | Simülasyonda test maddesi |
| Cout overshoot/undershoot | `4.3` | Kontrolde faz marjı etkisine kısa bağ |
| `Zout(fc)` / `Zout(fsw)` | `4.3` | Plant/kompanzasyonda yalnız handoff |
| Çıkış ESR/ESL/bulk | `4.3` | Plantte kullanılan değer referansı |
| Çıkış energy buffer | `4.3` | Dinamik test listesinde kısa kontrol |
| MLCC Cin hesabı | `4.4` | EMI/filter/simülasyon bölümlerinde kullanılan değer |
| Cin dc-bias/tolerance/derating | `4.4` | Kaynak veya simülasyonda kısa kontrol |
| Cin RMS akımı | `4.4` | Termalde sıcaklık kapanışına handoff |
| Cin ESR/ESL/helper MLCC | `4.4` | Layout/EMI'de kısa etkisi |
| Giriş bulk/transient energy/damping sezgisi | `4.4` | Input filter stability owner'ına handoff |
| MOSFET seçim kriterleri | `4.5` | Termal ve EMI'de kısa referans |
| MOSFET Qg/Qoss/Ciss/Coss/Crss/Vpl | `4.5` | Bootstrap ve switching loss hesaplarında kullanılan veri |
| MOSFET conduction/switching/gate/Coss/RR/dead-time loss | `4.5` | Termalde toplam kayıp girdisi |
| Bootstrap Rboot/Cboot/CVCC | `4.6` | Startup veya layout'ta kısa not |
| ILIM/Rilim/Cilim | `4.7` | Kontrol bölümünde yalnız "bu owner'da değil" notu |
| Controller/MOSFET/MLCC termal kapanış | `4.8` | Teknik owner'larda kısa termal pointer |
| Feedback divider RFB1/RFB2 | `5.1` | Startup'ta kısa referans |
| Plant modeli ve modülatör kazancı | `5.2` | Simülasyonda loop kontrol maddesi |
| Crossover `fc` ve faz marjı | `5.3` | Cout/loop cross-reference |
| K-factor ve Type-III RC/CC seti | `5.4`-`5.5` | Calculator/WEBENCH cross-checklerinde etiketli tekrar |
| Differential-mode EMI | `6.2` | Simülasyon listesinde test maddesi |
| Common-mode EMI | `6.3` | Layout ve MOSFET dvdt referansı |
| Input filter stability | `6.4` | Cin/bulk owner'ından değer alır |
| Layout kuralları | `6.5` | Teknik owner'da kısa layout uyarısı |
| LTspice/PSpice doğrulama | `7` | Teknik owner'da "simülasyonla doğrulanacak" notu |
| Görsel / defter kırpımı yönetimi | `8` | Görseller teknik paragraf yanında kalır |
| Açık kontroller | `9` | Yerel owner'da tam bağlam, burada kısa takip |
| Changelog | `10` | Teknik owner'a taşınmaz |

## Owner Dışı Referans Kuralları

- Bir denklem veya sayısal hikaye başka owner'da ikinci kez tam uzunlukta kurulmaz.
- Handoff notu 1-3 cümleyi geçmemeli.
- Kaynak izi teknik owner'ın yanında kalır, fakat kaynak güven tartışması `3`te kalır.
- Görsel, desteklediği teknik paragrafın yakınında kalır; `8` yalnız görsel mantığını anlatır.
- Çelişkili iki sayı aynı primary owner altında etiketlenir; sessizce tek değere indirilmez.
- Eski iterasyonlar ilgili teknik owner içinde korunur; genel arşiv gibi sona taşınmaz.
