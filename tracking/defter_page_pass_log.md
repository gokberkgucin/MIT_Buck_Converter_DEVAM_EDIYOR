# Defter Page Pass Log

Kaynak belge: `tracking/defter_sira_ana_fotolu.docx` (lokal kaynak DOCX; boyutu nedeniyle normal GitHub commit'ine alınmadı).

Bu dosya, fiziksel defterin ikişer sayfalık kontrollü entegrasyon turlarını izler. Amaç ham defteri olduğu gibi ana belgelere yığmak değil; her pass'ta sayfaların hangi teknik owner'ı desteklediğini, hangi görselin çıkarıldığını ve hangi dosyada kullanıldığını görünür bırakmaktır.

## Pass 001 - Sayfa 1-2

Durum: `used`

Çıkarılan tam sayfa görseller:

- [defter_p001.jpg](../images/defter_full_pages/defter_p001.jpg)
- [defter_p002.jpg](../images/defter_full_pages/defter_p002.jpg)

Defter işaretleri:

- `W.26`: power-stage için gereken temel parametreler, `Vin`, `Vout`, `Iout`, load-step, duty zarfı ve giriş akımı ilk notları.
- `W.53`: output ripple, input ripple current, input peak-to-peak ripple, input transient ve giriş akımı sınırları.

Primary owner entegrasyonu:

- [01_tasarim_girdileri_ve_kaynaklar.md](../01_tasarim_girdileri_ve_kaynaklar.md) içinde `Defter Tam Sayfa Pass 1: W.26-W.53`.

Kısa referans / owner dışı bağlantı:

- [04_giris_kapasitorleri_ve_giris_agi.md](../04_giris_kapasitorleri_ve_giris_agi.md) içindeki `W.53` bölümüne tam sayfa bağlamı için kısa pointer eklendi.
- [README.md](../README.md) ve [09_simulasyon_gorseller_ve_acik_sorular.md](../09_simulasyon_gorseller_ve_acik_sorular.md) içinde `images/defter_full_pages/` klasörünün rolü görünür yapıldı.

Okunan ana sayısal izler:

- `Vin(min) = 24 V`, `Vin(max) = 36 V`
- `Vout = 14 V`
- `Iout,max = 125 W / 14 V = 8.92 A ≈ 9 A`
- `Iout,min = 50 W / 14 V = 3.571 A`
- load-step `9 A - 3.571 A = 5.429 A`
- ideal duty aralığı `14/36 <= D <= 14/24`, yaklaşık `0.3888-0.5833`
- `eta = 0.9` ile giriş akımı: `5.79 A` ve `3.86 A`
- output ripple `100 mVpp`
- ideal source input ripple current `50 mA`
- `Delta_VIN_PP < 0.24 V`
- `Delta_VIN_Tran < 0.36 V`
- `control BW = fsw/10 = 33.2 kHz` erken kontrol notu

Açık notlar:

- `control BW = fsw/10` satırı final kompanzasyon hedefi değildir; [07](../07_kontrolcu_ve_kompanzasyon.md) içindeki kontrol owner'ına erken tasarım izi olarak bağlanır.
- `50 mA` input ripple current hedefi yalnız MLCC `Cin` hesabıyla kapanmaz; [08](../08_emi_giris_filtresi_ve_yerlesim.md) içindeki EMI/input-filter owner'ına da bağlıdır.

## Pass 002 - Sayfa 2-3

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p002.jpg](../images/defter_full_pages/defter_p002.jpg) - önceki pass'te çıkarılmış 2. sayfa.
- [defter_p003.jpg](../images/defter_full_pages/defter_p003.jpg) - bu pass'te çıkarılan 3. sayfa.

Defter işaretleri:

- `W.53`: output ripple, input ripple current, input peak-to-peak ripple, input transient ve giriş akımı sınırları.
- `W.140` olarak okunan sayfa: global inputların ideal duty, verim dahil duty ve `D = 0.5` pratik kontrol noktasına bağlanması.

Primary owner entegrasyonu:

- [01_tasarim_girdileri_ve_kaynaklar.md](../01_tasarim_girdileri_ve_kaynaklar.md) içinde `Defter Tam Sayfa Pass 2: W.53-W.140`.

Kısa referans / owner dışı bağlantı:

- [02_startup_pin_programlama_ve_ortak_sabitler.md](../02_startup_pin_programlama_ve_ortak_sabitler.md) içindeki `Shared Duty / Timing Referans Geçidi` bölümüne, `tON(min)` bağlamında yalnız kısa kaynak izi eklendi.

Okunan ana sayısal izler:

- `Vin(min) = 24 V`, `Vin(max) = 36 V`
- `Vout = 14 V`
- `Iout,max = 125 W / 14 V = 8.92 A ≈ 9 A`
- `Iout,min = 50 W / 14 V = 3.571 A`
- load-step `9 A - 3.571 A = 5.429 A`
- ideal duty aralığı `14/36 <= D <= 14/24`, `Dmin = 0.3888`, `Dmax = 0.5833`
- `eta = 0.9` ile duty aralığı `14/(36*0.9) <= Dh <= 14/(24*0.9)`, `Dmin,h = 0.432`, `Dmax,h = 0.6481`
- pratik kontrol noktası: `D = 0.5`

Açık notlar:

- `W.53`, bu pass'te yeniden okunmuştur ama tam anlatımı tekrar çoğaltılmadı; Pass 001 içindeki global/giriş şartları bağlamına referans verir.
- `W.140` duty değerleri, [01](../01_tasarim_girdileri_ve_kaynaklar.md) içindeki shared duty owner'ı destekler; [02](../02_startup_pin_programlama_ve_ortak_sabitler.md) bu değerleri yalnız timing/tON kullanımı için alır.

## Pass 003 - Sayfa 4-5

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p004.jpg](../images/defter_full_pages/defter_p004.jpg)
- [defter_p005.jpg](../images/defter_full_pages/defter_p005.jpg)

Defter işaretleri:

- `W.134`: lineer regülatör fikri, seri geçiş elemanı, MOS/BJT ile değişken direnç benzetimi, `Vref` ile çıkış kontrolü.
- `W.135`: lineer regülatör verim sınırı, `eta = Pout / Pin = Vo / Vin` sadeleştirmesi ve `5 V / 15 V = 1/3` örneği.

Primary owner entegrasyonu:

- [00_proje_durumu_ve_okuma_rehberi.md](../00_proje_durumu_ve_okuma_rehberi.md) içinde `Defter Tam Sayfa Pass 3: W.134-W.135`.

Kısa referans / owner dışı bağlantı:

- [01_tasarim_girdileri_ve_kaynaklar.md](../01_tasarim_girdileri_ve_kaynaklar.md) içindeki minimum verim varsayımıyla kavramsal bağ kuruldu.
- [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) kayıp/termal kapanış owner'ı olarak işaret edildi; bu pass içinde yeni kayıp hesabı üretilmedi.

Okunan ana sayısal / kavramsal izler:

- örnek lineer regülatör girişi: `Vin = 9 V - 16 V`
- örnek regüle çıkış: `Vo = 5 V`
- feedback fikri: `Vref` ile çıkış gerilimini ölçüp geçiş elemanını kontrol etmek
- sadeleştirilmiş verim: `eta = Vo / Vin`
- örnek: `5 V / 15 V = 1/3`, yaklaşık `%33`

Açık notlar:

- Bu sayfalar final LM5146-Q1 buck komponent değerleri değildir; yüksek güçlü buck topolojisine geçiş motivasyonunu belgeleyen arka plan izidir.
- `9 V - 16 V`, `5 V` ve `%33` değerleri proje G94 çalışma noktası olarak okunmamalıdır.

## Pass 004 - Sayfa 6-7

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p006.jpg](../images/defter_full_pages/defter_p006.jpg)
- [defter_p007.jpg](../images/defter_full_pages/defter_p007.jpg)

Defter işaretleri:

- `W.108`: controller junction sıcaklığı, device temperature grade, thermal shutdown, exposed pad ve storage temperature notları.
- `W.111`: dahili `VCC` regulator kaybı, `P_loss,internal VCC = (Vin - 7.5 V) * I_VCC`, yüksek `Vin` ile LDO ısınması ve harici `8 V - 13 V` VCC/DVCC seçeneği.

Primary owner entegrasyonu:

- [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde `Defter Tam Sayfa Pass 4: W.108-W.111`.

Kısa referans / owner dışı bağlantı:

- [02_startup_pin_programlama_ve_ortak_sabitler.md](../02_startup_pin_programlama_ve_ortak_sabitler.md) dahili `VCC/LDO` ve harici `VCC/DVCC` seçeneğinin startup/pin-programming owner'ı olarak bırakıldı; bu pass'te oraya uzun tekrar eklenmedi.

Okunan ana sayısal / kavramsal izler:

- ambient/device temperature grade bağlamı: `-40 C` ile `+125 C`
- operating junction temperature: `-40 C` ile `+150 C`
- `150 C` tasarım hedefi değil, limit sıcaklığı uyarısı
- `T_J = T_A + P_diss*R_thetaJA`
- `T_J = T_case + P_diss*R_thetaJC`
- thermal shutdown threshold: `175 C`
- thermal shutdown hysteresis: `20 C`
- storage temperature: `-55 C` ile `150 C`
- dahili `VCC` kaybı: `(Vin - 7.5 V) * I_VCC`
- harici yardımcı `VCC` seçeneği: `8 V - 13 V`

Açık notlar:

- `I_VCC` için hangi datasheet satırının kullanılacağı açık kontrol olarak kalır; defterde bu nokta soru işaretiyle bırakılmıştır.
- Bu pass controller/IC termal kapanışını destekler; MOSFET `T_J` ve board-level termal kapanış hâlâ aynı owner içindeki ayrı bloklarla birlikte okunmalıdır.

## Pass 005 - Sayfa 8-9

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p008.jpg](../images/defter_full_pages/defter_p008.jpg)
- [defter_p009.jpg](../images/defter_full_pages/defter_p009.jpg)

Defter işaretleri:

- `W.170`: `8.3.1 Input Range Vin`; dahili `7.5 V` `VCC/LDO`, dropout ve `Vin,min = 8.22 V` kontrolü.
- `W.202`: `8.3.2 Output Voltage Setpoint and Accuracy FB`; `FB` bölücü, `VREF = 0.8 V`, `RFB1/RFB2 = 16.5` ilk oranı ve `VREF` toleransı.

Primary owner entegrasyonu:

- [02_startup_pin_programlama_ve_ortak_sabitler.md](../02_startup_pin_programlama_ve_ortak_sabitler.md) içinde `Defter İzi: W.170 Dahili VCC Niyeti`.
- [07_kontrolcu_ve_kompanzasyon.md](../07_kontrolcu_ve_kompanzasyon.md) içinde `W.202: Setpoint Denklemi ve VREF Toleransı`.

Kısa referans / owner dışı bağlantı:

- `W.170` termal sonuç üretmez; dahili `VCC/LDO` kaybı ve sıcaklık kapanışı [06](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) tarafında kapanır.
- `W.202` güncel feedback setini iptal etmez; eski `16.5 kOhm / 1.00 kOhm` oranının nasıl kurulduğunu gösterir. Güncel/satın alınmış çizgi [07](../07_kontrolcu_ve_kompanzasyon.md) içinde `26.4 kOhm / 1.6 kOhm` olarak ayrı tutulur.

Okunan ana sayısal / kavramsal izler:

- dahili `VCC = 7.5 V`
- dropout: `0.25 V typ`, `0.72 V max`
- `Vin,min = 7.5 V + 0.72 V = 8.22 V`
- harici `VCC` değil, dahili `VCC/LDO` kullanma niyeti
- `VREF = 0.8 V`
- `Vout = VREF * (1 + RFB1/RFB2)`
- `RFB1/RFB2 = 16.5`
- `VREF = 792 mV ... 808 mV`
- yaklaşık `%1` referans toleransı etkisi

Açık notlar:

- `8.22 V`, proje giriş aralığını `24 V - 36 V` altına çekmez; yalnız dahili LDO/dropout sanity sınırıdır.
- `W.202` içindeki `16.5` oranı eski feedback iterasyonudur; güncel feedback divider ile sessizce birleştirilmeyecek.

## Pass 006 - Sayfa 10-11

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p010.jpg](../images/defter_full_pages/defter_p010.jpg)
- [defter_p011.jpg](../images/defter_full_pages/defter_p011.jpg)

Defter işaretleri:

- `W.204`: `EN/UVLO`, `ISS`, `CSS`, `SS/TRK` rampası, error amp referans geçişi ve soft-start davranışı.
- `W.204` devamı: soft-start bitişinde `SS/TRK = FB + 0.115 V`, fault/standby durumunda `CSS` boşaltma ve tracking modu için dış referans notları.
- `W.206`: configurable soft-start, `CSS = C26 = 0.047 uF = 47 nF`, `tSS = CSS * VREF / ISS`, `47 nF * 0.8 V / 10 uA` hesabı ve pin bağlantı çizimi.

Primary owner entegrasyonu:

- [02_startup_pin_programlama_ve_ortak_sabitler.md](../02_startup_pin_programlama_ve_ortak_sabitler.md) içinde `SS/TRK ve Soft-start`.
- [02_startup_pin_programlama_ve_ortak_sabitler.md](../02_startup_pin_programlama_ve_ortak_sabitler.md) içinde `C_SS ve t_SS Hesabı`.

Kısa referans / owner dışı bağlantı:

- Soft-start rampasının LTspice/PSpice karşılığı [09_simulasyon_gorseller_ve_acik_sorular.md](../09_simulasyon_gorseller_ve_acik_sorular.md) tarafında simülasyon planına bağlanabilir; bu pass'te simülasyon sonucu üretilmedi.
- `PWL (0 V, 1 us, 1.8 V)` notu eski referans-rampası sezgisi olarak bırakıldı; LM5146 final soft-start dalgası gibi kullanılmayacak.

Okunan ana sayısal / kavramsal izler:

- `EN/UVLO = 1.2 V` ile IC active geçişi
- `ISS = 10 uA`
- `SS/TRK` rampası: `0 V` ile `0.8 V` arası
- `SS/TRK < 0.8 V` iken error amp referansı `SS/TRK` rampasını izler
- `SS/TRK > 0.8 V` iken error amp referansı sabit `VREF = 0.8 V`
- soft-start sonrası yaklaşık ilişki: `SS/TRK = FB + 0.115 V`
- fault/standby durumunda `CSS` boşaltılır
- tracking modu için `SS/TRK` pinine dışarıdan düşük empedanslı referans verilir
- `CSS = C26 = 0.047 uF = 47 nF`
- `tSS = CSS * VREF / ISS`
- `tSS = 47 nF * 0.8 V / 10 uA`
- `RRT = 30.1 kOhm` notu aynı pin-programlama çiziminde görünür

Açık notlar:

- `p010 / W.204` davranış açıklaması, `p011 / W.206` ise `CSS/tSS` hesabıdır; ikisi aynı 02 dosyasında ardışık owner alt başlıklarında tutuldu.
- `PWL 1 us / 1.8 V` notu tarihsel simülasyon/tez izi olarak korunur, LM5146 `SS/TRK` final parametresi değildir.

## Pass 007 - Sayfa 12-13

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p012.jpg](../images/defter_full_pages/defter_p012.jpg)
- [defter_p013.jpg](../images/defter_full_pages/defter_p013.jpg)

Defter işaretleri:

- `W.207`: datasheet `8.3.4 Precision Enable`, `RUV1/RUV2` bölücüsü, `EN/UVLO` state table, `VCC-UV`, `VCC-UVHYS` ve `CVCC` şarj sırası.
- `W.209`: precision-enable sayısal uygulama örneği, `RUV1 = 100 kOhm`, `RUV2 = 5.263 kOhm` hesabı ve pratik `5.23 kOhm` notu.

Primary owner entegrasyonu:

- [02_startup_pin_programlama_ve_ortak_sabitler.md](../02_startup_pin_programlama_ve_ortak_sabitler.md) içinde `Precision Enable Direnç Bölücü İzleri`.

Kısa referans / owner dışı bağlantı:

- `EN/UVLO` aktif olsa bile `VCC` UVLO koşulu sağlanmadan anahtarlama başlamaz; bu davranış startup owner'ında tutuldu.
- UVLO direnç seçiminin final BOM kapanışı olmadığı not edildi; farklı calculator örneği aynı owner altında çapraz teyit olarak kalır.

Okunan ana sayısal / kavramsal izler:

- `RUV1 = (VIN(ON) - VIN(OFF)) / IHYS`
- `RUV2 = RUV1 * VEN / (VIN(ON) - VEN)`
- `EN/UVLO < 0.42 V`: shutdown
- `0.42 V < EN/UVLO < 1.2 V`: standby
- `EN/UVLO > 1.2 V`: active / soft-start
- `VCC-UV = 4.93 V typ`
- `VCC-UVHYS = 0.26 V`
- `CVCC` kapasitörü güç verildiğinde `40 mA` akımla doldurulur
- `4.67 V = 4.93 V - 0.26 V`
- `IHYS = 10 uA`
- `RUV1 = (24 V - 23 V) / 10 uA = 100 kOhm`
- `RUV2 = 100 kOhm * 1.2 V / (24 V - 1.2 V) = 5.263 kOhm`
- pratik not: `RUV2 ≈ 5.23 kOhm`

Açık notlar:

- `W.209` üst satırında `VIN(ON) = 23 V`, `VIN(OFF) = 22 V` yazarken hesap satırı `24 V / 23 V` ile yapılmış görünüyor; sessizce harmonize edilmedi.
- `0.42 V / 0.40 V` notu shutdown-standby eşiğiyle ilişkilidir; `RUV2` hesabındaki `1.2 V` active/operating eşiğiyle karıştırılmayacak.
