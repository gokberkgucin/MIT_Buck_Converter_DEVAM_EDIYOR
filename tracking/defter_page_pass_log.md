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

## Pass 008 - Sayfa 14-15

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p014.jpg](../images/defter_full_pages/defter_p014.jpg)
- [defter_p015.jpg](../images/defter_full_pages/defter_p015.jpg)

Defter işaretleri:

- `W.208`: datasheet `8.3.6.1 Frequency Adjust`, `RRT[kOhm] = 10^4 / fsw[kHz]` denklemi ve `332 kHz` için `30.1 kOhm` RT seçimi.
- `W.203`: datasheet `3. Description`, `Vin = 5.5 V` genel davranış notu, neredeyse `%100` duty, `40 ns tON(min)`, `140 ns tOFF(min)` ve `FPWM` sabit frekans notu.

Primary owner entegrasyonu:

- [02_startup_pin_programlama_ve_ortak_sabitler.md](../02_startup_pin_programlama_ve_ortak_sabitler.md) içinde `RT Pini ve Switching Frequency`.
- [02_startup_pin_programlama_ve_ortak_sabitler.md](../02_startup_pin_programlama_ve_ortak_sabitler.md) içinde `W.203 Zaman Alanı Kaynak İzi`.

Kısa referans / owner dışı bağlantı:

- Global `fsw`, duty ailesi ve zaman alanı owner'ı [01_tasarim_girdileri_ve_kaynaklar.md](../01_tasarim_girdileri_ve_kaynaklar.md) içinde kalır.
- `W.203` içindeki `Vin = 5.5 V` LM5146 genel description notudur; G94 nominal `24-36 V` çalışma zarfını değiştirmez.

Okunan ana sayısal / kavramsal izler:

- `RRT[kOhm] = 10^4 / fsw[kHz]`
- `fsw = 332 kHz`
- `RRT = 10^4 / 332 = 30.12 kOhm`
- pratik RT seçimi: `30.1 kOhm`
- LM5146 genel giriş davranışı: `Vin = 5.5 V'e kadar inebilir`
- düşük giriş bağlamında duty cycle neredeyse `%100` olabilir
- `tON(min) = 40 ns`
- `tOFF(min) = 140 ns`
- `FPWM` modunda sabit switching frequency vardır

Açık notlar:

- `W.208` el yazısı sonuç satırında birim `kHz` gibi görünür; bağlam ve denklem bunun `RRT` için `kOhm` olduğunu gösterir. Bu unit izi README'de `[Açık Kontrol]` olarak bırakıldı.
- `W.203` içindeki “defterde yazdıklarım vardı, bulunca eklensin” notu açık takip izi olarak korunur; bu pass'te yeni ek defter sayfası aranmadı.

## Pass 009 - Sayfa 16-17

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p016.jpg](../images/defter_full_pages/defter_p016.jpg)
- [defter_p017.jpg](../images/defter_full_pages/defter_p017.jpg)

Defter işaretleri:

- `W.54`: `6.8 uH` bobin seçimi, `%42` ripple izi, `%30` ripple hedefinden `9.6 uH` alternatif üst sınırı ve `DCR` aralığı.
- `W.55`: bobin seçimi `L1`, ripple oranı, `I_L,peak`, `I_sat`, `DCR`, `Vin = 36 V` ve `Vin = 24 V` ripple karşılaştırması.

Primary owner entegrasyonu:

- [03_bobin_ve_cikis_kapasitorleri.md](../03_bobin_ve_cikis_kapasitorleri.md) içinde `W.54: 6.8 uH Seçimi ve 9.6 uH Alternatif İzi`.
- [03_bobin_ve_cikis_kapasitorleri.md](../03_bobin_ve_cikis_kapasitorleri.md) içinde `W.55: Ripple, Tepe Akım ve Doyma Marjı`.

Kısa referans / owner dışı bağlantı:

- Bobin `DCR`, RMS akım ve sıcaklık etkileri [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) tarafındaki termal kapanışa bağlıdır.
- `Delta_IL` değerleri çıkış kapasitörü ripple hesabına aynı 03 owner dosyasında downstream girdi olarak geçer.

Okunan ana sayısal / kavramsal izler:

- `L = 6.8 uH` için yaklaşık `%42` ripple
- `%30` ripple hedefi: `Delta_IL,%30 = 9 A * 0.3 = 2.7 A_p-p`
- `L_buyuk = (Vout / Vin) * ((Vin - Vout) / (Delta_IL,%30 * fsw))`
- `Vin = 36 V`, `Vout = 14 V`, `fsw ≈ 330 kHz`, `Delta_IL = 2.7 A_p-p` ile `L_buyuk ≈ 9.6 uH`
- kutulu aralık: `6.8 uH < L < 9.6 uH`
- DCR aralığı tam sayfa p016 okumasıyla: `0.88 mOhm < DCR < 13.3 mOhm`
- `I_L(peak) = Iout + Delta_IL/2`
- `Vin = 36 V`, `L = 6.8 uH` için `Delta_IL ≈ 3.8 A_p-p`
- `I_L,peak ≈ 9 A + 3.8 A/2`
- `3.8 / 9 ≈ 0.42`, yani yaklaşık `%42` ripple
- `Vin = 24 V` için `Delta_IL ≈ 2.6 A_p-p`
- `2.6 / 9 ≈ 0.2888`, yani yaklaşık `%28.88` ripple

Açık notlar:

- Önceki kısa W.54 okumasında DCR alt sınırı `0.38 mOhm` gibi yazılmıştı; p016 tam sayfada bu satır `0.88 mOhm` olarak okunur. 03 dosyasında bu fark `[Açık Kontrol]` ile görünür bırakıldı.
- p017 kaynak görseli DOCX içinde ters yönde geldi; okuma için geçici 180 derece döndürülmüş kopya kullanıldı, repo commit'ine yalnız orijinal tam sayfa `defter_p017.jpg` alındı.

## Pass 010 - Sayfa 18-19

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p018.jpg](../images/defter_full_pages/defter_p018.jpg)
- [defter_p019.jpg](../images/defter_full_pages/defter_p019.jpg)

Defter işaretleri:

- `W.56`: gerçek bobin seçimi, `I_L,peak`, saturation current, rated current, `DCR` ve bakır kaybı.
- `W.42`: bobin akımı / kapasitör gerilimi fiziksel sezgisi, `V_L = L * di_L/dt`, `E = 1/2 * C * V^2`, ripple ve transient ayrımı.

Primary owner entegrasyonu:

- [03_bobin_ve_cikis_kapasitorleri.md](../03_bobin_ve_cikis_kapasitorleri.md) içinde `W.56: Gerçek Bobin, Isat, DCR ve Bakır Kaybı`.
- [03_bobin_ve_cikis_kapasitorleri.md](../03_bobin_ve_cikis_kapasitorleri.md) içinde `W.42: Bobin ve Kapasitörün Fiziksel Rolü`.

Kısa referans / owner dışı bağlantı:

- Bobin `DCR` kaybının termal sonucu [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) tarafında kapanır.
- `W.42` ripple/transient ayrımı, aynı 03 dosyasındaki `Zout(fsw)` ve `Zout(fc)` ayrımını destekler.

Okunan ana sayısal / kavramsal izler:

- bobin tepe akımı: `9 A + 1.9 A ≈ 10.9 A`
- seçilen Würth `L1` bobin saturation current: `36.3 A`
- rated current / RMS akım notu: `≈ 47 A`
- `DCR = 0.88 mOhm`
- `P_bakir = I^2 * R_DCR = 9^2 * 0.88 mOhm ≈ 0.071 W`
- bobin ilişkisi: `V_L = L * di_L/dt`
- kapasitör enerji ilişkisi: `E = 1/2 * C * V^2`
- ripple: sürekli tekrar eden küçük dalgalanma
- transient: ani ve büyük değişim

Açık notlar:

- p018 kaynak görseli DOCX içinde ters yönde geldi; okuma için geçici 180 derece döndürülmüş kopya kullanıldı, repo commit'ine yalnız orijinal tam sayfa `defter_p018.jpg` alındı.
- `Rated Current ≈ 47 A` ve `Saturation Current = 36.3 A` aynı rol değildir; 03 dosyasında bu ayrım tekrar vurgulandı.

## Pass 011 - Sayfa 20-21

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p020.jpg](../images/defter_full_pages/defter_p020.jpg)
- [defter_p021.jpg](../images/defter_full_pages/defter_p021.jpg)

Defter işaretleri:

- `W.46`: kapasitör empedansının frekansa bağlı değişimi, kapasitif/indüktif davranış geçişi ve çıkış kapasitörü seçim kriterleri.
- `W.57`: paralel MLCC, toplam `C`, etkin `ESR`, DC-bias altında etkin sığa, `Delta_IL = 3.8 A` ripple akımı ve yüksek frekansta MLCC davranışı.

Primary owner entegrasyonu:

- [03_bobin_ve_cikis_kapasitorleri.md](../03_bobin_ve_cikis_kapasitorleri.md) içinde `W.46, W.57, W.72: Gerçek Kapasitör Modeli`.

Kısa referans / owner dışı bağlantı:

- MLCC dc-bias / etkin kapasite izi output `Cout` owner'ında tutuldu; giriş MLCC derating owner'ı [04_giris_kapasitorleri_ve_giris_agi.md](../04_giris_kapasitorleri_ve_giris_agi.md) içinde ayrıca yaşar.
- `W.57` içindeki `2 x 22 uF -> etkin 22 uF` satırı eski örnek olarak etiketlendi; güncel `5 x 22 uF` fiziksel çıkış bankı kararını değiştirmez.

Okunan ana sayısal / kavramsal izler:

- kapasitör empedansı frekansa bağlı değişir
- frekans çok artarsa kapasitör parazitik etkilerle indüktör gibi davranabilir
- kapasitör seçim kriterleri: power loss, boyut, devre gürültüsü
- çıkış tarafı etkileri: regulation kalitesi, hız, kararlılık, bandwidth, load transient response
- paralel sığaçlar toplam `C` değerini artırır ve etkin `ESR`'yi düşürür
- farklı `C` değerleri farklı frekanslardaki gürültüyü bastırabilir
- MLCC etkin sığası gerilim altında yaklaşık `%50` seviyesine düşebilir
- eski örnek: `2 x 22 uF` katalogda `44 uF`, etkin kabul yaklaşık `22 uF`
- bobinden gelen `Delta_IL = 3.8 A` ripple akımı çıkış sığacına akar
- yüksek frekans notu: `400 kHz - 1 MHz`
- kapasitif reaktans notu: `Z = 1 / (j*w*C)`

Açık notlar:

- `W.57` sayfasındaki `Vripple` satırı tamamlanmış sayısal denklem değil; ripple hesabının seramik çıkış sığacıyla ilişkileneceğini gösteren tasarım izidir.
- `2 x 22 uF` örneği güncel çıkış bankı değildir; eski MLCC derating sezgisi olarak korunur.

## Pass 012 - Sayfa 22-23

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p022.jpg](../images/defter_full_pages/defter_p022.jpg)
- [defter_p023.jpg](../images/defter_full_pages/defter_p023.jpg)

Defter işaretleri:

- `W.72`: gerçek kapasitör eşdeğer modeli; ideal `C`, `Rleak`, `ESL`, `ESR` ve yaklaşık empedans ifadeleri.
- `W.28`: eski / alternatif çıkış kapasitörü iterasyonu; `Cmin` ripple hesabı, `2 x 22 uF` MLCC örneği, `2 mOhm ESR` ve `ESR <= Delta_Vo / Delta_IL` kontrolü.

Primary owner entegrasyonu:

- [03_bobin_ve_cikis_kapasitorleri.md](../03_bobin_ve_cikis_kapasitorleri.md) içinde `W.46, W.57, W.72: Gerçek Kapasitör Modeli`.
- [03_bobin_ve_cikis_kapasitorleri.md](../03_bobin_ve_cikis_kapasitorleri.md) içinde `W.28: Eski / Alternatif İlk İterasyon`.

Kısa referans / owner dışı bağlantı:

- `W.72` içindeki `ESR/ESL` modeli output-cap owner'ında tutuldu; EMI/layout tarafında yalnız kısa referans kullanılmalı.
- `W.28` içindeki polymer capacitor fikri güncel output bulk kararı değildir; output bulk kararı aynı 03 dosyasındaki bulk bölümünde korunur.

Okunan ana sayısal / kavramsal izler:

- `Z = (Z_C || Z_Rleak) + Z_ESL + Z_ESR`
- `Rleak` genelde çok büyük olduğu için çoğu AC/ripple hesabında ihmal edilebilir
- yaklaşık ifade: `Z ≈ Z_C + Z_ESL + Z_ESR`
- alt not: `Z ≈ 1/(sC) + sL + ESR`
- `R0 = sqrt(L/C)` karakteristik empedans / rezonans sezgisi
- eski örnek: `Cout = 22 uF`, `ESR = 2 mOhm`
- `2` adet paralel MLCC, eşdeğer tek blok gibi düşünülmüş
- `Cmin = (1 - Dmin) / (8 * L * (Delta_Vo / Vo) * fs^2)`
- `Dmin = 0.3888`, `L = 6.8 uH`, `Delta_Vo / Vo = 0.1 / 14`, `fs ≈ 330 kHz`
- yaklaşık sonuç: `Cmin ≈ 14.43 uF` / `14 uF`
- ESR sınırı: `ESR <= Delta_Vo / Delta_IL`
- `ESR <= 0.1 / 3.8 A ≈ 26.3 mOhm`
- eski örnek sonucu: `2 mOhm <= 26.3 mOhm`

Açık notlar:

- p022 kaynak görseli DOCX içinde yan yönde geldi; okuma için geçici döndürülmüş kopya kullanıldı, repo commit'ine yalnız orijinal tam sayfa `defter_p022.jpg` alındı.
- `W.28` içindeki `2 x 22 uF` ve polymer capacitor fikri güncel final çıkış bankı değildir; eski iterasyon olarak etiketlendi.

## Pass 013 - Sayfa 24-25

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p024.jpg](../images/defter_full_pages/defter_p024.jpg)
- [defter_p025.jpg](../images/defter_full_pages/defter_p025.jpg)

Defter işaretleri:

- `W.34`: output capacitor ripple hesabı; `Delta_IL`, `R_ESR`, `fsw`, `Delta_Vout` ve minimum `Cout` ilişkisi.
- `W.37`: output capacitor transient / overshoot hesabı; load-step enerjisiyle minimum `Cout` kontrolü.

Primary owner entegrasyonu:

- [03_bobin_ve_cikis_kapasitorleri.md](../03_bobin_ve_cikis_kapasitorleri.md) içinde `W.34 ve W.58: Ripple Tabanlı Alt Sınır`.
- [03_bobin_ve_cikis_kapasitorleri.md](../03_bobin_ve_cikis_kapasitorleri.md) içinde `W.37 ve W.59: Transient Tabanlı Minimum Cout`.

Kısa referans / owner dışı bağlantı:

- `W.34` bobin ripple'ından gelen `Delta_IL` değerini kullanır; bobin hesabının primary owner'ı aynı dosyadaki bobin bölümüdür.
- `W.37` load-step / overshoot tarafını açar; gerçek transient kapanış yine simülasyon ve `Zout(fc)` kontrolüyle birlikte okunmalıdır.

Okunan ana sayısal / kavramsal izler:

- `W.34` üst notu: `6.8 uH` bobin için ripple yüksek taraftadır.
- `W.34` sezgisi: `Delta_IL` azalırsa gereken `Cout` azalır; `R_ESR` azalırsa gereken `Cout` azalır.
- Ripple hesabında `R_ESR = 5 mOhm` örnek değeri, `Delta_IL = 3.8 A`, `fsw = 332 kHz` ve `Delta_Vout = 0.1 V` kullanılmıştır.
- Ripple tabanlı sonuç: `Cout >> 14.57 uF`.
- `W.37` denklemi: `Cout >> L_F * Delta_Iout^2 / ((Vout + Delta_Vovershoot)^2 - Vout^2)`.
- Overshoot örneğinde `Delta_Vovershoot = 14 * 0.2 = 2.8 V`, `L_F = 6.8 uH`, `Delta_Iout = 5.429 A` ve `Vout = 14 V` izleri vardır.
- Transient tabanlı sonuç: `Cout >> 2.32 uF`.
- Sayfa notu: `Denklem (9) ile hesaplanan yetiyor`; bu, ripple tabanlı minimumun transient minimumdan daha yüksek kalması şeklinde owner dosyasında açıklandı.

Açık notlar:

- `W.34` ve `W.37` güncel çıkış kapasitörü owner'ının parçasıdır; ayrı bir yeni owner açılmadı.
- Bu pass yeni final komponent değeri üretmedi; mevcut `Cout` kararını destekleyen defter izlerini tam sayfa görsellerle görünür yaptı.

## Pass 014 - Sayfa 26-27

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p026.jpg](../images/defter_full_pages/defter_p026.jpg)
- [defter_p027.jpg](../images/defter_full_pages/defter_p027.jpg)

Defter işaretleri:

- `W.58`: çıkış kapasitörü ripple hesabının iki bobin/ripple senaryosu için karşılaştırılması.
- `W.93`: kapasitif ripple bileşeni; `Delta_Vout(C)`, `Ipp`, `fsw`, `Cout` ve `Ipp = Delta_IL(p-p)` notu.

Primary owner entegrasyonu:

- [03_bobin_ve_cikis_kapasitorleri.md](../03_bobin_ve_cikis_kapasitorleri.md) içinde `W.34 ve W.58: Ripple Tabanlı Alt Sınır`.
- [03_bobin_ve_cikis_kapasitorleri.md](../03_bobin_ve_cikis_kapasitorleri.md) içinde `W.93: Kapasitif Ripple Bileşeni`.

Kısa referans / owner dışı bağlantı:

- `W.58` bobin owner'ından gelen `Delta_IL` senaryolarını kullanır; bobin seçimi yine aynı dosyanın bobin bölümünde kalır.
- `W.93` yeni final komponent değeri üretmez; ripple hesabındaki kapasitif bileşeni teyit eden defter izidir.

Okunan ana sayısal / kavramsal izler:

- `W.58` formülü W.34 ile aynı ripple alt sınırı ailesindedir.
- `3.8 A` ripple için not: en yüksek / en kötü durumun seçilmesi daha düzgün görülmüştür.
- `3.8 A` ve `2 mOhm` ile `Cout >> 14 uF`; bu satır yeni `6.8 uH` bobin senaryosuna bağlanır.
- `2.7 A` ripple ve `2 mOhm` ile `Cout >> 10 uF`; bu satır `9.6 uH` alternatif senaryosuna bağlanır.
- `W.93` notu: `Ipp -> Delta_IL(p-p) / inductor ripple current`.
- `W.93` üzerinde `%42 -> 3.8 A` ve alternatif `2.7 A` ripple notları okunur.
- Kapasitif ripple formu: `Delta_Vout(C) = Ipp / (8*fsw*Cout) + ...` şeklindedir; sayfada ek terim tam kapalı final hesap gibi kullanılmadı, tasarım izi olarak korundu.

Açık notlar:

- p027 kaynak görseli DOCX içinde yan yönde geldi; okuma için geçici döndürülmüş kopyalar kullanıldı, repo commit'ine yalnız orijinal tam sayfa `defter_p027.jpg` alınacaktır.
- Bu pass, W.58 ve W.93'ü W.34/W.58/W.93 ripple zincirinde tamamlar; `Cout` için yeni final değer uydurulmadı.

## Pass 015 - Sayfa 28-29

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p028.jpg](../images/defter_full_pages/defter_p028.jpg)
- [defter_p029.jpg](../images/defter_full_pages/defter_p029.jpg)

Defter işaretleri:

- `W.59`: yük azalmasında oluşabilecek çıkış gerilimi overshoot'unu sınırlamak için minimum `Cout` hesabı.
- `W.98`: load transient sırasında regulator cevabı, kontrol loop gecikmesi, bobin `di/dt` sınırı ve çıkış kapasitörlerinin ilk akımı taşıması.

Primary owner entegrasyonu:

- [03_bobin_ve_cikis_kapasitorleri.md](../03_bobin_ve_cikis_kapasitorleri.md) içinde `W.37 ve W.59: Transient Tabanlı Minimum Cout`.
- [03_bobin_ve_cikis_kapasitorleri.md](../03_bobin_ve_cikis_kapasitorleri.md) içinde `W.98: Defterdeki Slew-rate Örneği`.

Kısa referans / owner dışı bağlantı:

- `W.59` transient `Cout` hesabı çıkış kapasitörü owner'ında kaldı; kontrol dosyasına yeni uzun anlatım taşınmadı.
- `W.98` kontrol loop gecikmesine değinse de primary owner'ı `Cout` energy-buffer / bobin slew-rate zinciridir.

Okunan ana sayısal / kavramsal izler:

- `W.59` formülü: `Cout >> L_F * Delta_Iout^2 / ((Vout + Delta_Vovershoot)^2 - Vout^2)`.
- Load-step notu: `9 A -> 3.571 A`, `I_step = 9 A - 3.571 A = 5.429 A`.
- `14 V ±20%` için `Delta_Vovershoot = 2.8 V`; sonuç `Cout >> 2.3 uF`.
- Sayfa notu: transient limitin gevşek bulunduğu ve `±10%` denemenin açıldığı okunur.
- `±10%` denemesinde `Delta_Vovershoot = 1.4 V`; sonuç `Cout >> 4.86 uF`.
- `W.98` ana gerekçesi: ani yük değişiminde regulator hemen cevap veremez; bobin akımının yükselme oranı sınırlıdır.
- `W.98` notu: feedback loop çıkış gerilimindeki değişimi algılar ve duty cycle'ı ayarlamaya başlar, ancak bobin akımı `dI_L/dt = V_L/L` ile sınırlıdır.
- `W.98` örneği: `Vin = 5 V`, `Vout = 2 V`, `L = 1 uH`, `R_ESR = 10 mOhm`, `Delta_I = 6 A`, `t_loop = 2 us`, `(5 - 2) / 1 uH = 3 A/us`.
- `W.98` üzerinde `fsw` ile `fc/crossover` ayrımı not edilir; örnek proje final değeri değildir.

Açık notlar:

- `W.98` içindeki `Vin = 5 V`, `Vout = 2 V`, `L = 1 uH` örneği güncel `24-36 V / 14 V` buck tasarımının final sayısı değildir; fiziksel tasarım izi olarak etiketlendi.
- Bu pass yeni final komponent değeri üretmedi; W.59/W.98 sayfalarını mevcut output-cap / slew-rate owner zincirine bağladı.

## Pass 016 - Sayfa 30-31

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p030.jpg](../images/defter_full_pages/defter_p030.jpg)
- [defter_p031.jpg](../images/defter_full_pages/defter_p031.jpg)

Defter işaretleri:

- `W.116`: output filter parametre özeti; fiziksel çıkış MLCC bankı, `C28`, etkin `Cout`, bobin, `DCR`, `R_damp` ve `f0`.
- `W.60`: çıkış kapasitörünün transient rolü, kontrol loop ile birlikte okuma, `Q_load`, `Q_loss` ve toplam `Q`.

Primary owner entegrasyonu:

- [03_bobin_ve_cikis_kapasitorleri.md](../03_bobin_ve_cikis_kapasitorleri.md) içinde `W.116: Output Filter Parametre Özeti`.
- [03_bobin_ve_cikis_kapasitorleri.md](../03_bobin_ve_cikis_kapasitorleri.md) içinde `W.60-W.66: Q, Gvd(s) ve Zout Tasarım İzleri`.

Kısa referans / owner dışı bağlantı:

- `W.116` içindeki `L`, `Cout`, `R_damp` ve `f0` kontrol dosyasına yeniden owner olarak taşınmadı; kontrol tarafı bu plant değerlerine referans vermelidir.
- `W.60` kontrol loop'a değinse de primary owner'ı output filter / plant düşüncesidir.

Okunan ana sayısal / kavramsal izler:

- `C18-C22` çıkış MLCC grubu için `22 uF` notu okunur.
- `C28 = 0.1 uF`, `0603`, `X7R`, `100 V`, `%10` izleri okunur.
- `14 uF @ 14 Vdc -> 70 uF` etkin kapasite izi okunur.
- Bobin girdisi: `L_F = 6.8 uH`, `DCR = 0.88 mOhm`.
- MOSFET notu: high-side/low-side aynı MOSFET olarak okunur; `R_DS(on)` izi `20.25 mOhm`.
- `Dmaxη = 0.6481` ve `R_DAMP = D*RDS(on)_high + (1-D)*RDS(on)_low + R_DCR` ilişkisi okunur.
- `R_DAMP = 0.02113 Ohm = 21.13 mOhm`.
- `omega_0 ≈ 1/sqrt(L_F*Cout) = 45.83 krad/s`; `f0 ≈ 7.309 kHz`.
- `W.60` notu: çıkış kapasitörü ani yük değişimlerinde devreye destek olur ve gerilimi sabit tutmak için enerji desteği sağlar.
- `W.60` notu: control loop gerilim sapmasını algılar, MOSFET duty oranlarını ayarlar; birlikte çalışırlar, kapasitör ani tepki verir, kontrol daha yavaştır.
- `Q_load = R / sqrt(L/C)`.
- `Q_loss = sqrt(L/C) / (R_ESR + R_L)` şeklinde okunur.
- Örnek: `L = 1 uH`, `C = 200 uF`, `R_ESR = 0.8 mOhm`, `R_L = 30 mOhm`, `Q_loss ≈ 2.3`.
- Örnek yük: `Vout = 1.8 V`, `I = 5 A`, `R = 0.36 Ohm`, `Q_load ≈ 5.09`, toplam `Q ≈ 1.55`.

Açık notlar:

- `W.116` üzerindeki `ESR` / `ESR_Ceq` okuması, 03 dosyasındaki mevcut `[Açık Kontrol - ESR farkı]` altında tutuldu; tek sayıya sessizce indirilmedi.
- p031 kaynak görseli DOCX içinde yan yönde geldi; okuma için geçici döndürülmüş kopya kullanıldı, repo commit'ine yalnız orijinal tam sayfa `defter_p031.jpg` alınacaktır.
- `W.60` içindeki `1 uH / 200 uF / 1.8 V / 5 A` örneği güncel final plant sayısı değildir; Q düşüncesinin eski/öğretici izi olarak korundu.

## Pass 017 - Sayfa 32-33

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p032.jpg](../images/defter_full_pages/defter_p032.jpg)
- [defter_p033.jpg](../images/defter_full_pages/defter_p033.jpg)

Defter işaretleri:

- `W.61`: farklı yük uçlarında `Q_load`, `Q_loss` ve toplam `Q` hesabı.
- `W.62`: `R_damp`, `Gvd(s)`, `omega_0` yaklaşımı ve yük durumuna bağlı `Q` tablosu.

Primary owner entegrasyonu:

- [03_bobin_ve_cikis_kapasitorleri.md](../03_bobin_ve_cikis_kapasitorleri.md) içinde `W.60-W.66: Q, Gvd(s) ve Zout Tasarım İzleri`.

Kısa referans / owner dışı bağlantı:

- `W.61-W.62` kontrol transfer fonksiyonuna değinir; fakat bu pass'te primary owner output filter / plant izi olarak 03 dosyasında kaldı.
- Kontrol / kompanzasyon dosyası bu değerleri yeniden komponent owner'ı gibi anlatmamalı; plant girdisi olarak referans vermelidir.

Okunan ana sayısal / kavramsal izler:

- `Q_load = R / sqrt(L/C)` ilişkisi devam eder.
- Hafif yük örneğinde `I = 0.001 A`, `Vout = 1.8 V`, `R = 1800 Ohm` ve `Q_load ≈ 25465`.
- `Q = Q_loss || Q_load = (Q_loss*Q_load)/(Q_loss+Q_load)` olarak kullanılır.
- `Q_loss = 2.3` ve `Q_load ≈ 25465` için toplam `Q ≈ 2.299`.
- Not: toplam `Q`, paralel bağlama yaklaşımı nedeniyle en küçük bileşenden daha büyük olamaz.
- Orta yük örneği: `Q_load = 5.09`, `Q_loss = 2.3`, `Q_total ≈ 1.584`.
- Ağır yük örneği: `200 A`, `Vout = 1.8 V`, `R = 9 mOhm`, `Q_load ≈ 0.1272`, `Q ≈ 0.1206`.
- `W.62` üzerinde `R_damp = D*RDS(on)_high-side + (1-D)*RDS(on)_low-side + R_DCR` ilişkisi okunur.
- `Gvd(s) = Vg * (1 + s/w_ESR) / (1 + (1/Q)*(s/w0) + (s/w0)^2)` biçimi korunur.
- `omega_0` için ayrıntılı ifade yazılır; fakat sayfada `omega_0 ≈ 1/sqrt(L_F*Cout)` yaklaşımının kullanılacağı belirtilir.
- `W.62` tablosunda `Q_loss = 2.3` için `Q ≈ 2.2999`, `Q ≈ 1.584`, `Q ≈ 0.1206` yük durumları birlikte gösterilir.

Açık notlar:

- p032 ve p033 kaynak görselleri DOCX içinde yan yönde geldi; okuma için geçici döndürülmüş kopyalar kullanıldı, repo commit'ine yalnız orijinal tam sayfa görseller alınacaktır.
- Bu pass yeni final komponent değeri üretmedi; output filter / plant Q zincirindeki mevcut W.61-W.62 izlerini tam sayfa görsellerle tamamladı.

## Pass 018 - Sayfa 34-35

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p034.jpg](../images/defter_full_pages/defter_p034.jpg)
- [defter_p035.jpg](../images/defter_full_pages/defter_p035.jpg)

Defter işaretleri:

- `W.63`: `Q factor` aralığı özeti ve harici / karşılaştırma `Cout-L-f0` notu.
- `W.64`: harici `Point-of-Load Regulator` örneği; `f0`, `f_ESR`, `fs` ve `Q` notları.

Primary owner entegrasyonu:

- [03_bobin_ve_cikis_kapasitorleri.md](../03_bobin_ve_cikis_kapasitorleri.md) içinde `W.60-W.66: Q, Gvd(s) ve Zout Tasarım İzleri`.

Kısa referans / owner dışı bağlantı:

- `W.63-W.64` içindeki harici örnekler güncel kontrol plant değerleri olarak taşınmadı; output-filter tasarım izi olarak 03 dosyasında kaldı.
- Kontrol dosyasında bu sayıların final `6.8 uH / 70 uF` plant'iyle karışmaması gerekir.

Okunan ana sayısal / kavramsal izler:

- `W.63`: `P1'e bak` notu ile buck akımı `0 A` ile `max 5 A` arasında olduğunda `Q factor` yaklaşık `2.2999` ile `1.584` arasında okunur.
- `W.63`: eski / harici Excel/Webench devresi için `f0 = 1/(2*pi*sqrt(C*L))` notu korunur.
- `W.63`: harici karşılaştırma izi olarak `Cout = 180 uF`, `L = 9 uH`, `f0 ≈ 4 kHz` okunur.
- `W.64`: başlık `Another Example: Point-of-Load Regulator`.
- `W.64`: harici örnekte `L = 1 uH`, `C = 200 uF`.
- `W.64`: `f0 = 1/(2*pi*sqrt(L*C)) ≈ 11 kHz`.
- `W.64`: `ESR` sıfırı / zero notu; `f_ESR = 1/(2*pi*C*R_ESR) ≈ 1 MHz`.
- `W.64`: `fs = 1 MHz`, `Q = 2.3`.
- `W.64`: `Vref` girişinin çıkışın `V(s)` değerini ne kadar iyi takip ettiğini gösterir notu vardır.

Açık notlar:

- p035 kaynak görseli DOCX içinde yan yönde geldi; okuma için geçici döndürülmüş kopyalar kullanıldı, repo commit'ine yalnız orijinal tam sayfa `defter_p035.jpg` alınacaktır.
- `W.64` içindeki `1 uH / 200 uF / 11 kHz / 1 MHz` örneği güncel final plant değeri değildir; eski/harici POL tasarım izi olarak etiketlendi.

## Pass 019 - Sayfa 36-37

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p036.jpg](../images/defter_full_pages/defter_p036.jpg)
- [defter_p037.jpg](../images/defter_full_pages/defter_p037.jpg)

Defter işaretleri:

- `W.65`: harici POL örneğinde açık çevrim output impedance / `Zout` eskizi.
- `W.66`: `f_ESR`, `f2`, `Za || Zb`, `f0` yaklaşımı ve rezonans tepe / side-lobe notları.

Primary owner entegrasyonu:

- [03_bobin_ve_cikis_kapasitorleri.md](../03_bobin_ve_cikis_kapasitorleri.md) içinde `W.60-W.66: Q, Gvd(s) ve Zout Tasarım İzleri`.

Kısa referans / owner dışı bağlantı:

- `W.65-W.66` kontrol loop empedansı ve rezonans sezgisine değinir; fakat burada primary owner output filter / `Zout` tasarım izidir.
- Güncel kontrol dosyası bu harici `1 uH / 200 uF` örneğini final plant gibi yeniden kullanmamalı.

Okunan ana sayısal / kavramsal izler:

- `W.65`: output impedance / `Zout` grafiği çizilir.
- Harici örnek değerleri: `L = 1 uH`, `R_L ≈ 30 mOhm`, `C = 200 uF`, `R_ESR ≈ 0.8 mOhm`.
- `W.65`: `1/(omega*C)` kapasitif eğimi, bobin kolu ve ESR yatay bölgesi aynı grafikte sezgisel olarak gösterilir.
- `W.65`: `f2 ≈ 4.7 kHz`, `f0 ≈ 11 kHz`, `f1 ≈ 1 MHz` bölgeleri okunur.
- `W.65`: `Zout` için `Za || Zb` paralel birleşim sezgisi çizilir.
- `W.66`: `f_ESR = 1/(2*pi*R_ESR*C) ≈ 1 MHz`.
- `W.66`: `f2 = R_L/(2*pi*L) ≈ 4.7 kHz`.
- `W.66`: `Zout = Za || Zb` ve paralel empedansın düşük olan kol tarafından baskılanması not edilir.
- `W.66`: `f0 ≈ 1/(2*pi*sqrt(L_F*Cout)) ≈ 11.278 kHz` / `11.25 kHz` izi korunur.
- `W.66`: `side lobe`, `f_peak` ve `Q`/damping ilişkisine işaret eden notlar vardır.

Açık notlar:

- `W.65-W.66` içindeki `1 uH / 200 uF` örneği güncel `6.8 uH / 70 uF` plant'i değildir; eski/harici POL `Zout` tasarım izi olarak etiketlendi.
- Bu pass yeni final komponent değeri üretmedi; W.65-W.66 tam sayfa görselleri mevcut output-filter / plant owner zincirine bağlandı.

## Pass 020 - Sayfa 38-39

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p038.jpg](../images/defter_full_pages/defter_p038.jpg)
- [defter_p039.jpg](../images/defter_full_pages/defter_p039.jpg)

Defter işaretleri:

- `W.68`: düşük output impedance, `Zout(fc)` ile transient sapma ve `Zout(fsw)` ile ripple ayrımı.
- `W.69`: ideal kapasitör empedansı `Z_C(f)` ve frekansa bağlı davranış sezgisi.

Primary owner entegrasyonu:

- [03_bobin_ve_cikis_kapasitorleri.md](../03_bobin_ve_cikis_kapasitorleri.md) içinde `W.68-W.71: İki Zout Penceresinin Defter Özeti`.

Kısa referans / owner dışı bağlantı:

- `W.68` kontrol bandwidth / `fc` konusuna değinir; fakat bu pass'te primary owner output capacitor `Zout` ayrımıdır.
- `fc` artırma fikri kontrol / kompanzasyon kapanışı olmadan final karar gibi okunmayacak.

Okunan ana sayısal / kavramsal izler:

- `W.68`: düşük çıkış empedansı yük değişimlerine hızlı ve küçük gerilim sapmalarıyla cevap verilmesini sağlar.
- `W.68`: sığa büyüdükçe, `ESR` düşük oldukça ve bobinin seri direnci düşük oldukça çıkış empedansı düşük tutulur.
- `W.68`: `Ceramic or electrolytic output capacitors` notu okunur.
- `W.68`: `Vout,over/undershoot ≈ Delta_Iout * Zout(fc)` ilişkisi korunur.
- `W.68`: `V_ripple ≈ I_L(p-p) * Zout(fsw)` ilişkisi korunur.
- `W.68`: `fc` artırılırsa o frekanstaki empedansın düşebileceği ve undershoot/overshoot'un azalabileceği notu vardır; bu, kontrol closure olmadan final kabul değildir.
- `W.68`: ripple için `I_L(p-p)` değerini küçültme veya `Zout(fsw)` değerini düşürme sezgisi okunur.
- `W.69`: `Z_C(f) = 1/(2*pi*f*C)` ideal kapasitör empedansı olarak yazılır.
- `W.69`: düşük frekansta empedans yüksek, enerji depolama rolü önde; yüksek frekansta empedans düşük, süzme rolü artar notu okunur.

Açık notlar:

- `W.69` ideal kapasitör sezgisidir; gerçek `Zout(fsw)` için `ESR`, `ESL`, DC-bias ve layout etkileri W.70-W.72 ile birlikte okunmalıdır.
- Bu pass yeni final komponent değeri üretmedi; W.68-W.69 tam sayfa görselleri mevcut `Zout(fc)` / `Zout(fsw)` owner zincirine bağlandı.

## Pass 021 - Sayfa 40-41

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p040.jpg](../images/defter_full_pages/defter_p040.jpg)
- [defter_p041.jpg](../images/defter_full_pages/defter_p041.jpg)

Defter işaretleri:

- `W.70`: kapasitör empedansı, `ESR/ESL` yüzünden ideal davranışın bozulması ve `Delta_Q = C*Delta_V` üzerinden ripple denklemine geçiş.
- `W.71`: `fc` ve `fsw` pencerelerinde `Zout` kullanımının kısa özeti.

Primary owner entegrasyonu:

- [03_bobin_ve_cikis_kapasitorleri.md](../03_bobin_ve_cikis_kapasitorleri.md) içinde `W.68-W.71: İki Zout Penceresinin Defter Özeti`.

Kısa referans / owner dışı bağlantı:

- `W.71` kontrol crossover bölgesine değinir; ancak bu pass'te primary owner çıkış kapasitörü `Zout(fc)` / `Zout(fsw)` ayrımıdır.
- Gerçek kapasitör davranışı için `ESR/ESL`, derating ve ölçüm notları output capacitor owner'ında kaldı; EMI/layout tarafına uzun tekrar taşınmadı.

Okunan ana sayısal / kavramsal izler:

- `W.70`: kapasitörün frekansa bağlı empedansı yazılır.
- `W.70`: empedans, kapasitörün AC akıma karşı gösterdiği direnç olarak not edilir.
- `W.70`: `Z_C(f) = 1/(2*pi*f*C)` ideal ilişkisidir.
- `W.70`: sığanın `ESR` ve `ESL` nedeniyle idealliğinin bozulacağı vurgulanır.
- `W.70`: `Delta_Q = C*Delta_V`.
- `W.70`: `Delta_V = Delta_IL*T_switch/(8*C)` ve `C = Delta_IL*T_switch/(8*Delta_V)` zinciri korunur.
- `W.71`: `fc` frekansında çıkış empedansının düşük olması istenir.
- `W.71`: `Vout,undershoot ≈ Delta_Iout * Zout(fc)`.
- `W.71`: ripple tarafı `V_ripple = I_L(p-p) * Zout(fsw)` olarak ayrılır.
- `W.71`: derating curve'e bakma ve gerçek değer için LCR metre / devre ölçümü notu okunur.

Açık notlar:

- p041 kaynak görseli DOCX içinde yan yönde geldi; metin doğrudan okunabildiği için geçici döndürülmüş kopya kullanılmadı.
- Bu pass yeni final komponent değeri üretmedi; W.70-W.71 tam sayfa görselleri mevcut `Zout` owner zincirini tamamladı.

## Pass 022 - Sayfa 42-43

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p042.jpg](../images/defter_full_pages/defter_p042.jpg)
- [defter_p043.jpg](../images/defter_full_pages/defter_p043.jpg)

Defter işaretleri:

- `p042`: üst işaret `W.73` gibi okunuyor; Type-III ağ çizimi, `control-to-output` Bode sezgisi, yeşil `ZF` ve mavi `Z1` empedans blokları.
- `p043`: `ZF/Z1` empedans oranının cebirsel açılım devamı; üst işaret net okunmadığı için yeni `W` numarası zorlanmadı.

Primary owner entegrasyonu:

- [07_kontrolcu_ve_kompanzasyon.md](../07_kontrolcu_ve_kompanzasyon.md) içinde `Type-III Kompanzatör Topolojisi`.

Kısa referans / owner dışı bağlantı:

- Bu pass kontrol/kompanzasyon owner'ına aittir; güç katı veya çıkış kapasitörü hesabı gibi yeniden sahiplenilmedi.
- `control-to-output` Bode çizimi plant'e değinir; plant sayıları için primary owner [03_bobin_ve_cikis_kapasitorleri.md](../03_bobin_ve_cikis_kapasitorleri.md) olarak kalır.

Okunan ana sayısal / kavramsal izler:

- `p042`: yeşil `ZF` ağında `C3`, `R2`, `C1` elemanları görünür.
- `p042`: mavi `Z1` ağında `R3`, `C2`, `R1` elemanları görünür.
- `p042`: `A(s) = Vc/V0 = -ZF/Z1` gibi okunan oran yazılır.
- `p042`: `Z1 = R1 || (R3 + 1/(sC2))`.
- `p042`: `ZF = 1/(sC3) || (R2 + 1/(sC1))`.
- `p043`: `1/(sC3)`, `(sR2C1 + 1)/(sC1)` ve `(sR3C2 + 1)/(sC2)` biçimindeki paralel empedans açılımları devam eder.
- `p042`: Bode çiziminde `Gdc`, `Q-factor`, `-40 dB/dec`, `ESR zero` ve `-20 dB/dec` sezgisi görünür.

Açık notlar:

- `p042` üzerinde `C3 = 390 pF` gibi okunuyor; mevcut eski aday okumasındaki `C3 ≈ 290 pF` ile sessizce birleştirilmedi.
- `p042` üzerinde mavi ağdaki `C2` değeri `560 pF` / `5600 pF` ayrımını kesinleştirmeye muhtaçtır; mevcut `W.142-W.143` aday değerleri korunur.
- Bu pass yeni final Type-III komponent seti üretmedi; yalnız topoloji ve empedans türetimi için tam sayfa defter izi eklendi.

## Pass 023 - Sayfa 44-45

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p044.jpg](../images/defter_full_pages/defter_p044.jpg)
- [defter_p045.jpg](../images/defter_full_pages/defter_p045.jpg)

Defter işaretleri:

- `W.47`: giriş gerilimi ripple çizimi, `Delta Vin p-p`, `tON/tOFF` anahtarlama aralıkları ve giriş sığası hesap sezgisi.
- `W.52`: buck devresi üzerinde `IIN`, `IDD`, `I_CIN`, `I_CO`, `CIN`, `CO`, `Q1`, diyot, bobin ve yük akım yolları.

Primary owner entegrasyonu:

- [04_giris_kapasitorleri_ve_giris_agi.md](../04_giris_kapasitorleri_ve_giris_agi.md) içinde `W.47, W.48, W.52: Darbeli Giriş Akımı`.

Kısa referans / owner dışı bağlantı:

- `W.52` üzerinde `I_CO: Output Capacitor Ripple Current` da görünür; çıkış kapasitörü ripple hesabının primary owner'ı [03_bobin_ve_cikis_kapasitorleri.md](../03_bobin_ve_cikis_kapasitorleri.md) olarak kalır.
- `W.47` içindeki `tON/tOFF` çizimi global duty/timing hesabı değildir; [02_startup_pin_programlama_ve_ortak_sabitler.md](../02_startup_pin_programlama_ve_ortak_sabitler.md) dosyasındaki duty/timing owner'ına yalnız referans niteliğindedir.

Okunan ana sayısal / kavramsal izler:

- `W.47`: buck converter girişten sürekli değil, anahtarlamaya bağlı darbeli akım çeker.
- `W.47`: girişte `Delta Vin p-p` ripple çizimi vardır.
- `W.47`: `tON` ve `tOFF` aralıkları giriş akımı darbeleriyle birlikte çizilir.
- `W.47`: "girişe koyacağımız capacitors bu ripple'ı küçülteceği" notu okunur.
- `W.47`: güç kaynağının mükemmel olmadığı ve çıkış empedansının devreye etki ettiği notu okunur.
- `W.47`: giriş sığasının hesaplanmasında kullanılan yönteme geçiş notu vardır.
- `W.47`: `100 mV` örnek hedef gibi görünür; güncel `0.24 Vpp` hedefiyle sessizce değiştirilmedi.
- `p045 / W.52`: `I_CIN: Input Capacitor Ripple Current`.
- `p045 / W.52`: `I_CO: Output Capacitor Ripple Current`.
- `W.52`: `tON iken akan akım` ve `tOFF iken akan akım` yolları işaretlenir.

Açık notlar:

- `100 mV` satırı güncel giriş ripple hedefi yapılmadı; daha sıkı ripple örneği / tasarım izi olarak korundu.
- `I_CO` etiketi output-cap owner'ına referans verir; bu pass'te çıkış kapasitörü hesabı yeniden anlatılmadı.
- Bu pass yeni final `Cin` değeri üretmedi; W.47/W.52 tam sayfa görselleri mevcut darbeli giriş akımı ve `ICIN` ripple owner zincirini tamamladı.

## Pass 024 - Sayfa 46-47

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p046.jpg](../images/defter_full_pages/defter_p046.jpg)
- [defter_p047.jpg](../images/defter_full_pages/defter_p047.jpg)

Defter işaretleri:

- `W.48`: bulk/MLCC test soruları, LISN notu, seramik kapasitörün yüksek frekans gürültüsü ve giriş gerilimi ripple azaltma rolü.
- `W.49`: giriş kapasitörünün ikinci işi; hızlı `t_r/t_f` kenarları, `tON/tOFF` aralıkları ve elektrolitik kapasitörün hızlı değişime cevap verememesi.

Primary owner entegrasyonu:

- [04_giris_kapasitorleri_ve_giris_agi.md](../04_giris_kapasitorleri_ve_giris_agi.md) içinde `W.47, W.48, W.52: Darbeli Giriş Akımı` ve `W.49, W.50, W.94: Kavramsal ve Kaynak İzleri`.

Kısa referans / owner dışı bağlantı:

- `LISN` ve ölçüm/test bağlamı [08_emi_giris_filtresi_ve_yerlesim.md](../08_emi_giris_filtresi_ve_yerlesim.md) tarafındaki EMI/input-filter owner'ına bağlanır.
- `W.49` üzerindeki `fsw ≈ 200 kHz`, `Tsw ≈ 5 us`, `t_r/t_f ≈ 30 ns` notları final `332 kHz` timing girdisi değildir; [02](../02_startup_pin_programlama_ve_ortak_sabitler.md) owner'ındaki güncel `fsw` ile karıştırılmayacak.

Okunan ana sayısal / kavramsal izler:

- `W.48`: test edilecek şeyler listesi görünür.
- `W.48`: bulk kapasitör elektrolitik olarak az olursa ne olur sorusu vardır.
- `W.48`: bulk kapasitör fazla olursa ne olur sorusu vardır.
- `W.48`: MLCC olursa ripple ne kadar azalır sorusu vardır.
- `W.48`: yeterli büyüklükte bulk kapasitör yoksa ani yük değişimlerinde giriş geriliminin nasıl değişeceği test konusu yapılır.
- `W.48`: `LISN = Line Impedance Stabilization Network` notu vardır.
- `W.48`: seramik kapasitör için yüksek frekans gürültüsünü bastırma ve input voltage ripple reduction notları okunur.
- `W.48`: buck converter giriş akımının MOSFET ON iken hızlı çekildiği, OFF iken sıfıra yakın olduğu ve bu yüzden darbeli olduğu belirtilir.
- `W.49`: giriş kapasitörünün ikinci işi hızlı kenarlara cevap vermektir.
- `W.49`: `t_r`, `tON time`, `t_f`, `tOFF time` etiketleri görünür.
- `W.49`: `fsw = 200 kHz`, `Tsw = 5 us` ve `t_rise/t_fall` için `30 ns` örnek notu görünür.
- `W.49`: hızlı `di/dt` yüzünden yalnız elektrolitik kapasitörlerin cevap veremeyeceği notu korunur.

Açık notlar:

- `W.49` sayfasındaki frekans ve süreler ders/kaynak izi olarak tutuldu; güncel proje `fsw = 332 kHz` omurgasıyla sessizce birleştirilmedi.
- Bu pass yeni final bulk veya MLCC değeri üretmedi; test mantığı ve hızlı giriş akımı gerekçesi owner dosyaya eklendi.

## Pass 025 - Sayfa 48-49

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p048.jpg](../images/defter_full_pages/defter_p048.jpg)
- [defter_p049.jpg](../images/defter_full_pages/defter_p049.jpg)

Defter işaretleri:

- `W.50`: input capacitor selection notu; kapasitörün `storage` ve `noise/ripple reduction` işleri, bulk/MLCC görev ayrımı, load transient ve brown-out bağlamı.
- `W.94`: TI `SLTA055 - Input and Output Capacitor Selection` kaynak izi; input ripple voltage, ceramic input capacitor, bulk RMS ripple current ve duty-cycle pulse-current grafiği.

Primary owner entegrasyonu:

- [04_giris_kapasitorleri_ve_giris_agi.md](../04_giris_kapasitorleri_ve_giris_agi.md) içinde `W.49, W.50, W.94: Kavramsal ve Kaynak İzleri`.

Kısa referans / owner dışı bağlantı:

- `W.50` içindeki load transient örneği giriş bulk / enerji tamponu gerekçesidir; çıkış kapasitörü transient hesabının primary owner'ı [03_bobin_ve_cikis_kapasitorleri.md](../03_bobin_ve_cikis_kapasitorleri.md) olarak kalır.
- `W.94` üzerindeki `D = 0.5` duty-cycle RMS sezgisi global duty owner'ı değildir; [02_startup_pin_programlama_ve_ortak_sabitler.md](../02_startup_pin_programlama_ve_ortak_sabitler.md) içindeki duty/timing omurgasına kısa referans olarak bağlanır.
- `SLTA055` kaynak sayfası kaynak izi / çapraz teyittir; final komponent değerleri doğrudan bu sayfadan alınmadı.

Okunan ana sayısal / kavramsal izler:

- `W.50`: kapasitör iki işe yarar: `storage` ve `noise reduction / ripple reduction`.
- `W.50`: ani yük değişiminde giriş kaynağı anlık cevap veremeyebilir.
- `W.50`: bulk kapasitör, load transient / brown-out benzeri durumda enerji tamponu olarak düşünülür.
- `W.50`: MOSFET'in hızlı açma-kapama süreci yüksek frekanslı ripple ve EMI üretir; seramik/MLCC ile azaltılmalıdır.
- `W.50`: `1 A -> 5 A` load-step örneği görünür; proje güncel load-step girdisi yapılmadı.
- `W.94`: TI `SLTA055`, `Input and Output Capacitor Selection`, Jason Arrigo, `February 2006` kaynak izi görünür.
- `W.94`: giriş kapasitörü seçiminde ilk hedef, regülatör girişinde görülen ripple voltage genliğini azaltmak olarak okunur.
- `W.94`: regülatör girişine yakın seramik kapasitörlerin düşük `ESR` ile ripple voltage'u azalttığı notu görünür.
- `W.94`: büyük bulk kapasitörlerin yüksek frekanslı ripple voltage'u tek başına azaltmadığı ve bulk RMS ripple akımı / ısınma riskinin azaltılması gerektiği notu okunur.
- `W.94`: kaynak üzerinde `75 mV` gibi bir rule-of-thumb görünür.
- `W.94`: input ripple voltage yük akımıyla orantılıdır; maksimum çıkış yük akımında büyür.
- `W.94`: tek faz buck için `D = 0.5` çevresinde AC RMS pulse-current büyüklüğü maksimuma yaklaşır.

Açık notlar:

- `75 mV` kaynak notu güncel `0.24 Vpp` proje hedefinin yerine geçirilmedi.
- `1 A -> 5 A` load-step örneği proje load-step girdisi yapılmadı.
- Bu pass yeni final `Cin`, bulk veya EMI filtre değeri üretmedi; kaynak ve görev-ayrımı izleri owner dosyaya eklendi.

## Pass 026 - Sayfa 50-51

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p050.jpg](../images/defter_full_pages/defter_p050.jpg)
- [defter_p051.jpg](../images/defter_full_pages/defter_p051.jpg)

Defter işaretleri:

- `W.27`: input capacitor minimum etkin kapasite hesabı; `Dmax/Dmin`, `D = 0.5`, `28.4 uF`, eski `4 x 22 uF / 50 V / X7R` MLCC aday izi.
- `W.35`: `Delta_VIN` ripple denklemine `R_ESR` terimi eklenmiş hali ve `Cin >= 31 uF` bandı.

Primary owner entegrasyonu:

- [04_giris_kapasitorleri_ve_giris_agi.md](../04_giris_kapasitorleri_ve_giris_agi.md) içinde `MLCC Minimum Cin Hesabı`.

Kısa referans / owner dışı bağlantı:

- `Dmax/Dmin` ve `D = 0.5` burada yalnız `Cin` hesabı girdisidir; shared duty/timing owner'ı [02_startup_pin_programlama_ve_ortak_sabitler.md](../02_startup_pin_programlama_ve_ortak_sabitler.md) olarak kalır.
- `Loadstep = 3.571 A -> 9 A` izi [01_tasarim_girdileri_ve_kaynaklar.md](../01_tasarim_girdileri_ve_kaynaklar.md) içindeki global girdilere bağlanır.
- `4 x 22 uF` MLCC aday izi güncel `5 x 4.7 uF` ana MLCC bankıyla birleştirilmedi.

Okunan ana sayısal / kavramsal izler:

- `W.27`: `Loadstep = 3.571 A -> 9 A -> 5.429 A`.
- `W.27`: `Dmax = 14/(24*0.9) ≈ 0.648`.
- `W.27`: `Dmin = 14/(36*0.9) ≈ 0.432`.
- `W.27`: `G39` kaynağı, input capacitor hesabı için `D = 0.5` worst-case kontrol noktasına işaret eder.
- `W.27`: `Cin >= D*(1-D)*Iout/(Delta_VIN-pp*fsw)`.
- `W.27`: `D = 0.5`, `Iout = 9 A`, `Delta_VIN-pp = 0.24 V`, `fsw = 332 kHz` ile `Cin >= 28.4 uF`.
- `W.27`: `50 VDC` voltage rating düşüncesi görünür; EVM'nin daha yüksek input rating'ine gerek olmadığı not edilir.
- `W.27`: `4 adet x 22 uF / 50 V / X7R MLCC 1210` eski/ara aday izi görünür.
- `W.27`: her bir MLCC için yaklaşık `7.5 uF` efektif kapasite notu okunur.
- `W.27`: `C29/C30/C31/C9` gibi küçük yardımcı kapasitör notları ve `0.01 uF` izi görünür.
- `W.35`: `Delta_VIN = Iout*D*(1-D)/(fsw*Cin) + Iout*R_ESR`.
- `W.35`: `R_ESR = 3 mOhm` varsayımı görünür.
- `W.35`: `Cin >= D*(1-D)*Iout/(fsw*(Delta_VIN - R_ESR,in*Iout))`.
- `W.35`: `D = 0.5`, `Iout = 9 A`, `Delta_VIN = 0.24 V`, `fsw = 332 kHz`, `R_ESR = 3 mOhm` ile `Cin >= 31 uF`.

Açık notlar:

- `4 x 22 uF` MLCC satırı güncel BOM kararı yapılmadı; güncel ana bank ve dc-bias gerçekliği 04 dosyasındaki ana MLCC bankı bölümünde ayrı tutulur.
- `50 VDC yeterli` notu, `44 V / 1 ms` survive-only transient ve gerçek derating ile ayrıca doğrulanmalıdır.
- Bu pass yeni final `Cin` değeri üretmedi; `28.4 uF` ve `31 uF` mevcut minimum etkin kapasite zincirini tam sayfa defter iziyle tamamladı.

## Pass 027 - Sayfa 52-53

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p052.jpg](../images/defter_full_pages/defter_p052.jpg)
- [defter_p053.jpg](../images/defter_full_pages/defter_p053.jpg)

Defter işaretleri:

- `W.30`: `Cin devamı`, kavramsal temizlik; buck giriş akımının pulse şeklinde aktığı, AC bileşenin büyük oranda giriş sığaçları üzerinden kapandığı, `Cin` RMS akımının dikkatle hesaplanması gerektiği.
- `W.30`: `X5R` / `X7R` seramik kapasitör notu; düşük `ESR`, düşük `ESL`, yüksek RMS current rating ve geniş sıcaklık aralığı gerekçeleri.
- `W.30`: layout notu; `Cin`, `Q1` drain ile `Q2` source arasında kısa/doğrudan yollarla, MOSFET'lere yakın bağlanmalı.
- `W.30-W.31`: `10-47 uF` arası MLCC'lerin paralel bağlanabileceği; giriş akımının `DC` ve `AC` bileşen olarak okunabileceği.
- `W.31`: input capacitor görev listesi; giriş ripple gerilimini sınırlamak, yüksek RMS akımını taşımak, parazitleri bastırmak.
- `W.31`: `I_CIN,RMS` koşulu ve `Delta_VIN` ripple denklemi.

Primary owner entegrasyonu:

- [04_giris_kapasitorleri_ve_giris_agi.md](../04_giris_kapasitorleri_ve_giris_agi.md) içinde `MLCC Minimum Cin Hesabı` ve `RMS Akımı ve Termal Bakış`.

Kısa referans / owner dışı bağlantı:

- `W.30` layout notu [08_emi_giris_filtresi_ve_yerlesim.md](../08_emi_giris_filtresi_ve_yerlesim.md) içindeki hot-loop / EMI owner'ına kısa köprü olarak bırakıldı; burada EMI hesabı yeniden açılmadı.
- `D = 0.5` ve `fsw = 332 kHz` satırı [02_startup_pin_programlama_ve_ortak_sabitler.md](../02_startup_pin_programlama_ve_ortak_sabitler.md) içindeki shared duty/timing owner'ına bağlı girdi olarak okundu.
- `I_CIN,RMS <= capacitor datasheetindeki I_RMS` şartı 04 dosyasındaki RMS/termal owner içinde tutuldu; 06 termal closure yalnız toplam sıcaklık kapanışında buna referans verebilir.

Okunan ana sayısal / kavramsal izler:

- Buck converter giriş akımı kesikli / pulse şeklinde akar.
- Pulse akımın `AC` bileşeni büyük oranda giriş kapasitörleri üzerinden akar.
- `Cin` RMS akımı dikkatlice hesaplanmalıdır.
- `X5R` veya `X7R` dielektrikli seramik kapasitörler önerilir; `X7R` daha iyi ama biraz daha pahalı seçenek olarak not edilir.
- `Cin`, high-side / low-side MOSFET hot-loop'una çok yakın yerleştirilmelidir.
- `10-47 uF` arası MLCC'lerin paralel bağlanabileceği not edilir.
- `I_CIN,RMS = sqrt(D*(Iout^2*(1-D) + Delta_IL^2/12))` ailesi görünür.
- `I_CIN,RMS <= capacitor datasheetindeki I_RMS` koşulu görünür.
- `Delta_VIN = Iout*D*(1-D)/(Fsw*Cin) + Iout*R_ESR` formu görünür.
- Tasarım soruları: hangi kapasitör kullanılacak, kaç adet paralel kapasitör gerekecek, seçilen `Cin` ile ripple hedefin altında mı kalacak.

Açık notlar:

- Bu pass yeni final `Cin`, yeni BOM adedi veya yeni EMI filtre değeri üretmedi.
- `10-47 uF` aralığı güncel final MLCC bankı gibi okunmadı; gerçek BOM ve dc-bias ayrımı 04 dosyasındaki ana MLCC/bulk bölümlerinde korunur.
- Layout notu high-confidence kavramsal kuraldır; fiziksel EVM rework uygulanmadığı için ölçümle doğrulanmış sonuç değildir.

## Pass 028 - Sayfa 54-55

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p054.jpg](../images/defter_full_pages/defter_p054.jpg)
- [defter_p055.jpg](../images/defter_full_pages/defter_p055.jpg)

Defter işaretleri:

- `W.32`: ripple sınırına göre minimum `Cin` değeri; `Cin >= D*(1-D)*Iout/(fsw*(Delta_VIN - R_ESR*Iout))` ailesi.
- `W.32`: "belirlediğin maksimum ripple gerilimine göre gereken minimum `Cin`" ve bunun tasarımda başlangıç noktası olarak kullanılması.
- `W.32`: yapılacaklar akışı; `Delta_VIN` ripple hedefini belirle, minimum `Cin` hesapla, uygun kapasitörü seç / paralel bağla, seçilen sığacın `I_RMS` değeri yeterli mi kontrol et, gerçek ripple'ı yeniden hesapla.
- `W.32`: hesaplanan gerçek `Delta_VIN` hedefin üzerinde kalırsa `Cin` artırma veya `R_ESR` düşürme ihtiyacı.
- `W.33`: `allowed input current ripple (p-p): 50 mA`, `25 mA peak` spec notu.
- `W.33`: `Delta_VIN = I_ripple * Z_IN`, `Z_IN ≈ 1/(2*pi*fsw*Cin)` basit ilişkisi.
- `W.33`: `50 mA`, `fsw = 332 kHz`, `Delta_VIN = 0.05 V` ile yaklaşık `Cin ≈ 0.47 uF` saf kapasitif egzersizi.

Primary owner entegrasyonu:

- [04_giris_kapasitorleri_ve_giris_agi.md](../04_giris_kapasitorleri_ve_giris_agi.md) içinde `MLCC Minimum Cin Hesabı`.

Kısa referans / owner dışı bağlantı:

- `50 mA` input-current ripple maddesi [01_tasarim_girdileri_ve_kaynaklar.md](../01_tasarim_girdileri_ve_kaynaklar.md) içindeki global G94/spec snapshot'a bağlıdır.
- `50 mA` hedefi ve `Z_IN` yorumu [08_emi_giris_filtresi_ve_yerlesim.md](../08_emi_giris_filtresi_ve_yerlesim.md) içindeki EMI / input-filter owner'ına kısa referans olarak bırakıldı.
- `D`, `fsw` ve shared timing değerleri [02_startup_pin_programlama_ve_ortak_sabitler.md](../02_startup_pin_programlama_ve_ortak_sabitler.md) owner'ına bağlı girdi olarak okundu.

Okunan ana sayısal / kavramsal izler:

- `W.32`: `Delta_VIN` ripple hedefi önce belirlenir; minimum `Cin` buna göre çıkar.
- `W.32`: seçilen kapasitör ve paralel sayıdan sonra gerçek ripple yeniden hesaplanmalıdır.
- `W.32`: gerçek ripple hedefin altında olmalı; üstünde kalırsa `Cin` artırma veya `R_ESR` düşürme düşünülür.
- `W.33`: yüksek kaliteli tasarımlarda kimi zaman `Delta_VIN ≈ %1 Vin` gibi hedeflerden söz edilir; bu, bu projedeki `50 mA` gibi düşük ripple hedefiyle doğrudan aynı karar değildir.
- `W.33`: saf kapasitif `Z_IN` varsayımıyla `0.47 uF` sonucu bulunur; sayfa üzerinde `ESR` yok sayıldığı not edilir.

Açık notlar:

- `0.47 uF` sonucu final `Cin` ihtiyacı değildir; `28.4-31.1 uF` etkin kapasite bandıyla birleştirilmedi.
- `50 mA` input-current ripple hedefi yalnız MLCC sığasıyla kapanmış kabul edilmedi; EMI/input-filter doğrulaması gerekir.
- Bu pass yeni BOM kararı üretmedi; mevcut minimum `Cin` ve EMI handoff zincirini defter tam sayfa iziyle güçlendirdi.

## Pass 029 - Sayfa 56-57

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p056.jpg](../images/defter_full_pages/defter_p056.jpg)
- [defter_p057.jpg](../images/defter_full_pages/defter_p057.jpg)

Defter işaretleri:

- `W.34`: kapasitörün taşıyabileceği maksimum ripple akımı / ripple-current rating, devreden geçen ripple akımından büyük olmalı.
- `W.34`: `I_CIN,RMS = sqrt((Vout/Vin(min))*(Iout^2*(1 - Vout/Vin(min)) + Delta_IL^2/12))` ailesi.
- `W.34`: kapasitörün nominal / rated gerilimi, girişte karşılaşılabilecek maksimum `Vin` ve ani yükselme / surge darbelerinin üzerinde olmalı.
- `W.34`: `ICIN` ripple akımı agresif/darbeli, `ICO` çıkış ripple akımı daha yumuşak gibi çizilmiş karşılaştırma.
- `W.51`: gerçek parça kontrol kapıları; ripple-current/RMS rating, rated voltage, dc-bias altındaki gerçek kapasite.
- `W.51`: seramik / MLCC kapasitesinin DC bias ile düştüğünü anlatan grafik izi.

Primary owner entegrasyonu:

- [04_giris_kapasitorleri_ve_giris_agi.md](../04_giris_kapasitorleri_ve_giris_agi.md) içinde `RMS Akımı ve Termal Bakış` ve `W.51: Gerçek Parçaya Geçiş Kontrolleri`.

Kısa referans / owner dışı bağlantı:

- `ICO` / çıkış kapasitörü ripple ayrıntısı [03_bobin_ve_cikis_kapasitorleri.md](../03_bobin_ve_cikis_kapasitorleri.md) owner'ına kısa pointer olarak bırakıldı.
- Rated-voltage notu `44 V / 1 ms` survive-only input transient ve global input şartları için [01_tasarim_girdileri_ve_kaynaklar.md](../01_tasarim_girdileri_ve_kaynaklar.md) dosyasına bağlıdır.
- RMS akımın termal sonucu [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde yalnız toplam termal closure referansı olarak kullanılabilir; primary owner 04'te kaldı.

Okunan ana sayısal / kavramsal izler:

- `I_CIN,RMS` formülü `Vin(min)` üzerinden yazılmıştır.
- Giriş kapasitörü ripple-current rating'i hesaplanan/devreden geçen ripple akımından büyük olmalıdır.
- Rated voltage, normal maksimum girişin ve surge benzeri ani yükselmelerin üstünde seçilmelidir.
- MLCC katalog kapasitesi, dc-bias altında düşer; gerçek kapasite datasheet / grafikle okunmalıdır.

Açık notlar:

- Bu pass yeni final MLCC adedi veya yeni `Cin` değeri üretmedi.
- `W.34` formülü mevcut `4.5-4.94 A_RMS` RMS ailesine eklendi; çelişkili yeni sonuç gibi kullanılmadı.
- `ICIN` / `ICO` karşılaştırması owner ayrımı için korundu; çıkış kapasitörü hesabı 03 dosyasına taşınmadı veya burada büyütülmedi.

## Pass 030 - Sayfa 58-59

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p058.jpg](../images/defter_full_pages/defter_p058.jpg)
- [defter_p059.jpg](../images/defter_full_pages/defter_p059.jpg)

Defter işaretleri:

- `W.36`: input capacitor RMS hesabının temiz tekrar sayfası.
- `W.36`: `I_CIN,RMS = sqrt(D*(Iout^2*(1-D) + Delta_IL^2/12))` ailesi; `D = 0.5`, `Iout = 9 A`, bobin ripple terimi ve `I_CIN,RMS ≈ 4.566 Arms`.
- `W.90`: input capacitor RMS hesabının farklı yerleşimli tekrarında `4.544 Arms`.
- `W.90`: `D = 0.5` için `Iin,RMS,max ≈ 0.5*Iload`; `Iload = 9 A` için `4.5 A`.
- `W.90`: düşük `ESL` için çoklu paralel MLCC ve yüksek frekans bastırma için küçük MLCC ekleme notu.

Primary owner entegrasyonu:

- [04_giris_kapasitorleri_ve_giris_agi.md](../04_giris_kapasitorleri_ve_giris_agi.md) içinde `RMS Akımı ve Termal Bakış`.

Kısa referans / owner dışı bağlantı:

- `D = 0.5` burada yalnız RMS worst-case / pratik kontrol noktasıdır; shared duty owner'ı [02_startup_pin_programlama_ve_ortak_sabitler.md](../02_startup_pin_programlama_ve_ortak_sabitler.md) olarak kalır.
- Çoklu paralel MLCC ve küçük MLCC notu aynı 04 dosyası içindeki `ESL ve Küçük Yardımcı MLCC'ler` bölümüne bağlandı; yeni helper BOM kararı üretilmedi.
- Bu pass termal closure'ı yeniden açmadı; RMS akımın sıcaklığa etkisi 04 içinde, toplam termal kapanış referansı [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) dosyasındadır.

Okunan ana sayısal / kavramsal izler:

- `I_CIN,RMS ≈ 4.566 Arms`.
- `Iin,RMS,max ≈ 4.544 Arms`.
- `D = 0.5` için kaba sezgi `Iin,RMS,max ≈ 0.5*Iload`.
- `Iload = 9 A` için kaba sonuç `4.5 A`.
- Düşük `ESL` için paralel MLCC kullanma ve yüksek frekansları bastırmak için küçük MLCC ekleme notu.

Açık notlar:

- `4.544 Arms` ve `4.566 Arms` sessizce tek sayıya yuvarlanmadı; mevcut `4.544-4.566 A_RMS` temiz tekrar bandı olarak bırakıldı.
- Bu pass yeni final kapasitör adedi, yeni `Cin` veya yeni helper MLCC değeri üretmedi.
- `0.5*Iload` ifadesi yalnız `D = 0.5` çevresindeki pratik RMS kontrolüdür; tüm duty aralığının global tanımı değildir.

## Pass 031 - Sayfa 60-61

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p060.jpg](../images/defter_full_pages/defter_p060.jpg)
- [defter_p061.jpg](../images/defter_full_pages/defter_p061.jpg)

Defter işaretleri:

- `W.86`: `X7R` / `X5R` sıcaklık dayanımı notu; `X7R` daha iyi seçenek gibi tutulur.
- `W.86`: MLCC'nin düşük `ESR` avantajı, yüksek frekansta `ESL` nedeniyle sınırlanması ve yüksek frekans spike/ripple bastırma için paralel veya küçük MLCC düşüncesi.
- `W.86`: paralel MLCC için `C_total = C1 + C2`, `ESL_total = ESL1*ESL2/(ESL1+ESL2)` veya eş eleman yaklaşımıyla `ESL/n`, `ESR_total = ESR/n`.
- `W.86`: büyük MLCC / küçük MLCC / paralel küçük+büyük MLCC özet tablosu; `ESR` ve `ESL` tradeoff'u.
- `W.87`: kaynak figür / örnek üzerinden küçük kapasitör ekleme, `22.7 V` spike notu ve yeni overshoot/ringing riski.
- `W.87`: parazitik `L` ve `C` etkilerinin bir `LC` gibi davranıp ringing üretmesi; ringing'in EMI kaynağı olması.
- `W.87`: çözüm notları olarak `Rboot`, snubber `RC`, küçük MLCC ve yerleşim.

Primary owner entegrasyonu:

- [04_giris_kapasitorleri_ve_giris_agi.md](../04_giris_kapasitorleri_ve_giris_agi.md) içinde `ESL ve Küçük Yardımcı MLCC'ler` / `W.86-W.89: Büyük / Küçük MLCC ve Ringing Mantığı`.

Kısa referans / owner dışı bağlantı:

- `Rboot` ve bootstrap/gate-drive elektriksel kapanışı [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) owner'ına bağlıdır; burada final `Rboot` değeri üretilmedi.
- EMI / layout etkisi [08_emi_giris_filtresi_ve_yerlesim.md](../08_emi_giris_filtresi_ve_yerlesim.md) owner'ına pointer olarak bırakıldı.
- `22.7 V` spike notu proje final ölçümü değildir; kaynak/örnek problem izi olarak tutuldu.

Okunan ana sayısal / kavramsal izler:

- `ESR_total ≈ ESR/n`.
- `ESL_total ≈ ESL/n` eş / benzer paralel MLCC ilk yaklaşımı.
- `ESL_total = ESL1*ESL2/(ESL1+ESL2)` iki paralel endüktans yaklaşımı.
- Küçük MLCC daha düşük `ESL` sağlayabilir; büyük MLCC daha düşük `ESR` / daha yüksek kapasite tarafında güçlüdür.
- Büyük + küçük MLCC birlikte ripple azaltma ve spike bastırma dengesini iyileştirebilir.
- Parazitik `LC` ringing EMI kaynağıdır.

Açık notlar:

- Bu pass yeni helper MLCC değeri, snubber `RC` değeri veya `Rboot` değeri üretmedi.
- `X7R daha iyi` notu tek başına parça yeterlilik kanıtı değildir; sıcaklık, dc-bias ve RMS akım grafikleriyle birlikte okunur.
- Küçük MLCC ekleme notu fiziksel yerleşim uygulanmış / ölçülmüş sonuç gibi sunulmadı; EVM rework uygulanmamış durumda kalır.

## Pass 032 - Sayfa 62-63

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p062.jpg](../images/defter_full_pages/defter_p062.jpg)
- [defter_p063.jpg](../images/defter_full_pages/defter_p063.jpg)

Defter işaretleri:

- `W.95`: gerçek kapasitör empedans modeli; `Z_C`, `R_ESR`, `L_ESL`, kaçak direnç ve frekansa bağlı bileşik empedans.
- `W.95`: `Z ≈ Z_C + Z_ESL + ESR`, `Z ≈ R_ESR + j*w*L_ESL - j/(w*C)` ve `|Z| = sqrt(R_ESR^2 + (X_L + X_C)^2)` notları.
- `W.95`: `0.47 uF` ve `47 uF` gibi farklı değerlerin empedans eğrisi; düşük frekansta kapasitif, yüksek frekansta `ESL` baskın davranış.
- `W.96`: "EMI Suppression Filters" bağlamında MLCC ve polymer kapasitör karşılaştırması.
- `W.96`: MLCC örneği `C ≈ 1.4 uF`, `ESR ≈ 1.3 mOhm`, `ESL ≈ 1.6 nH`, `f0 ≈ 3362 kHz`, `R0 ≈ 33.8 mOhm`, `Q ≈ 26`.
- `W.96`: polymer örneği `C ≈ 100 uF`, `R_ESR ≈ 0.36 ohm`, `ESL ≈ 20 nH`, `f0 ≈ 112.5 kHz`, `R0 ≈ 0.0141 ohm`, `Q ≈ 0.04`.
- `W.96`: `Q >> 1` underdamped, `Q << 1` overdamped sezgisi; "düşük ESR her zaman tek başına iyi değildir" mesajı.

Primary owner entegrasyonu:

- [04_giris_kapasitorleri_ve_giris_agi.md](../04_giris_kapasitorleri_ve_giris_agi.md) içinde `ESL ve Küçük Yardımcı MLCC'ler` / `W.95-W.96-W.99: Empedans, Q ve Damping Sezgisi`.

Kısa referans / owner dışı bağlantı:

- EMI filtresi, Middlebrook portu ve `R_D-C_D` damping kapanışı [08_emi_giris_filtresi_ve_yerlesim.md](../08_emi_giris_filtresi_ve_yerlesim.md) owner'ına bağlıdır.
- Bu pass 08 dosyasında yeni filtre hesabı üretmedi; W.96'daki EMI başlığı 04 içinde komponent empedansı ve damping sezgisi olarak kullanıldı.
- `0.47 uF`, `47 uF`, `1.4 uF`, `100 uF` örnekleri yeni BOM kararı değildir; model / karşılaştırma izidir.

Okunan ana sayısal / kavramsal izler:

- Düşük frekansta `1/(wC)` davranışı, yüksek frekansta `wL_ESL` davranışı.
- `ESR` rezonans çevresinde minimum empedans ve damping davranışını belirler.
- MLCC düşük `ESR` ile güçlüdür ama keskin rezonans / underdamped risk taşıyabilir.
- Polymer / elektrolitik daha yüksek `ESR` ile damping katkısı verebilir.
- Aynı `ESL` ailesine sahip farklı `C` değerleri yüksek frekansta benzer eğime yaklaşabilir; bu yüzden sadece katalog `uF` değeriyle karar verilmez.

Açık notlar:

- Bu pass yeni final `Cin`, helper MLCC, polymer veya bulk değeri üretmedi.
- `Q ≈ 26` ve `Q ≈ 0.04` örnekleri aynı devrede ölçülmüş final sonuç gibi sunulmadı; MLCC / polymer davranışını kıyaslayan tasarım izidir.
- EMI suppression başlığına rağmen final conducted EMI veya Middlebrook sonucu burada kapanmadı; ilgili doğrulama 08 ve 09 dosyalarında açık kalır.

## Pass 033 - Sayfa 64-65

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p064.jpg](../images/defter_full_pages/defter_p064.jpg)
- [defter_p065.jpg](../images/defter_full_pages/defter_p065.jpg)

Defter işaretleri:

- `W.99`: `47 uF`, `2.5 nH ESL` ve farklı `ESR` değerleriyle `Q` karşılaştırması.
- `W.99`: `R0 = sqrt(L_ESL/C) = sqrt(2.5 nH / 47 uF) ≈ 7.29 mOhm`.
- `W.99`: `ESR1 = 0.25 ohm = 250 mOhm`, `Q1 = R0/ESR1 ≈ 0.02916`, `Q1 < 1`.
- `W.99`: `ESR2 = 0.001 ohm = 1 mOhm`, `Q2 = R0/ESR2 ≈ 7.29`, `Q2 > 1`.
- `W.88`: ek küçük input ceramic capacitor ile switch-node spike örneği; kaynak sayfada `22.7 V -> 20.5 V`.
- `W.88`: küçük ceramic capacitor phase-node ringing'i azaltabilir; fakat PCB alanı, maliyet, boyut ve performans tradeoff'u vardır.
- `W.88`: bulk input capacitor seçiminde transient overshoot/undershoot gereksinimi ve allowable ripple current gereksinimi birlikte okunur.
- `W.88`: idealize transient akım grafiği: `i_Load`, `i_L`, `i_IN_D`, `i_PS`, `T_R_PS` ve `V_IN,tran < 0.36 V`.
- `W.88`: ilk spike `ESR_B` ile, ikinci spike buck converter input current ile bus-converter output current farkıyla ilişkilendirilir.

Primary owner entegrasyonu:

- [04_giris_kapasitorleri_ve_giris_agi.md](../04_giris_kapasitorleri_ve_giris_agi.md) içinde `ESL ve Küçük Yardımcı MLCC'ler` / `W.86-W.89: Büyük / Küçük MLCC ve Ringing Mantığı`.
- [04_giris_kapasitorleri_ve_giris_agi.md](../04_giris_kapasitorleri_ve_giris_agi.md) içinde `W.95-W.96-W.99: Empedans, Q ve Damping Sezgisi`.
- Aynı dosyada `Bulk Seçimi Mantığı` ve `W.38-W.45: Bulk Kriterleri` bölümlerine kavramsal kaynak izi olarak bağlandı; bulk hesabı ayrıca tekrar büyütülmedi.

Kısa referans / owner dışı bağlantı:

- Switch-node ringing'in EMI/layout etkisi [08_emi_giris_filtresi_ve_yerlesim.md](../08_emi_giris_filtresi_ve_yerlesim.md) owner'ına bağlıdır; bu pass 08 içinde yeni EMI hesabı üretmedi.
- `Rboot` / snubber çözüm ailesi [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) ve [08](../08_emi_giris_filtresi_ve_yerlesim.md) tarafına pointer olarak kalır.
- `22.7 V -> 20.5 V` ve önceki `22.9 V -> 20.5 V` okuması sessizce tekleştirilmedi; aynı kaynak/snapshot ailesinin iki okunma izi olarak görünür bırakıldı.

Okunan ana sayısal / kavramsal izler:

- `47 uF`, `2.5 nH`, `R0 ≈ 7.29 mOhm`.
- `250 mOhm` ESR ile `Q ≈ 0.029`; yüksek damping / düşük Q sezgisi.
- `1 mOhm` ESR ile `Q ≈ 7.29`; düşük damping / ringing riskinin keskinleşmesi.
- Ek küçük input ceramic capacitor kaynak örneğinde spike azalmasını gösterebilir; bu final EVM ölçümü değildir.
- MLCC yüksek frekans ripple için güçlüdür; bulk input capacitor transient enerji ve allowable ripple-current kriterleriyle seçilir.

Açık notlar:

- Bu pass yeni final `Cin`, bulk, helper MLCC, `Rboot` veya snubber değeri üretmedi.
- W.99 içindeki `4 uF` benzeri önceki kısa-kırpım okuması, tam sayfa ve `R0` hesabıyla `47 uF` olarak netleşti; bu high-confidence kaynak okumasıdır.
- EVM üzerinde ek küçük input ceramic veya bulk modifikasyonu uygulanmış / ölçülmüş gibi anlatılmadı; kaynak figürleri tasarım izi olarak korundu.

## Pass 034 - Sayfa 66-67

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p066.jpg](../images/defter_full_pages/defter_p066.jpg)
- [defter_p067.jpg](../images/defter_full_pages/defter_p067.jpg)

Defter işaretleri:

- `W.89`: küçük `D` capacitor eklendiğinde kaynak örnekte spike'ın `22.7 V` seviyesinden `20.5 V` seviyesine düştüğü notu tekrar görünür.
- `W.89`: MLCC'ler ripple akımı taşımada iyi ama iki büyük sıkıntı var: dc-bias altında etkin kapasite düşer ve büyük kapasitans için parça/paket büyür.
- `W.89`: bulk capacitor teknoloji adayları olarak aluminium electrolytic, polymer electrolytic ve hybrid capacitor aileleri işaretlenir.
- `W.89`: bulk capacitor görevleri: transient response desteği ve ripple-current yükünü MLCC bankıyla paylaşma.
- `W.89`: bulk seçiminde iki kritik parametre not edilir: `C_B` ve `ESR_B`.
- `W.89`: `C_B`, yük değişimi sırasında gerilimi tutulabilmek için yeterli olmalı; `ESR_B`, ripple current taşırken çok yüksek olmamalı.
- `W.89`: çok düşük `ESR` ripple gerilimini azaltır; bir miktar `ESR` ise `LC` resonance sönümleme / damping için faydalı olabilir.
- `W.38`: `I_CB,RMS,allowed > I_CB,RMS` kriteri.
- `W.38`: `I_CB,RMS,allowed` bulk capacitor datasheet'inden gelen izin verilen RMS akım olarak, `I_CB,RMS` gerçek devrede `C_B` üzerinden geçecek ripple akım RMS'i olarak ayrılır.
- `W.38`: `Delta_VIN-pp` ripple gerilimi MLCC / toplam etkin giriş kapasitesiyle hesaplanır; bulk tarafında `ESR_B` üzerinden ripple-current RMS kontrolü ayrıca yapılır.
- `W.38`: `ESR_B` küçülürse bulk üzerinden geçen ripple-current artabilir; bu nedenle allowable RMS current kontrolü gerekir.

Primary owner entegrasyonu:

- [04_giris_kapasitorleri_ve_giris_agi.md](../04_giris_kapasitorleri_ve_giris_agi.md) içinde `Bulk Seçimi Mantığı`.
- Aynı dosyada `W.38-W.45: Bulk Kriterleri`.

Kısa referans / owner dışı bağlantı:

- Switch-node spike ve küçük input ceramic notu [04_giris_kapasitorleri_ve_giris_agi.md](../04_giris_kapasitorleri_ve_giris_agi.md) içindeki `W.86-W.89` helper MLCC/ringing bloğuna bağlıdır; EMI/layout etkisi [08_emi_giris_filtresi_ve_yerlesim.md](../08_emi_giris_filtresi_ve_yerlesim.md) owner'ına kısa pointer olarak kalır.
- Bulk teknoloji adayları burada kavramsal izdir; güncel ana aday hattı `2 x 47 uF / 50 V / X7R` bölümünde ayrıca korunur.
- Bu pass [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde termal/kayıp anlatımı açmadı; bulk RMS ve ısınma yalnız 04 owner'ında işaretlendi.

Okunan ana sayısal / kavramsal izler:

- `22.7 V -> 20.5 V` kaynak örneği.
- `I_CB,RMS,allowed > I_CB,RMS`.
- `I_CB,RMS ≈ Delta_VIN_PP / (2*sqrt(3)*ESR_B)` ailesi.
- `Delta_VIN-pp` MLCC / etkin giriş kapasitesiyle kontrol edilir; bulk ripple-current kriteri ayrı kontrol edilir.
- `ESR_B` çok büyükse ripple/gerilim etkisi kötüleşebilir; çok küçükse bulk RMS ripple-current yükü artabilir.

Açık notlar:

- Bu pass yeni final bulk teknolojisi, yeni `C_B`, yeni `ESR_B` veya yeni `I_CB,RMS` sonucu üretmedi.
- `22.7 V -> 20.5 V` notu EVM üzerinde uygulanmış ölçüm gibi sunulmadı; kaynak örneği olarak kaldı.
- Bulk seçiminde `C_B` ve `ESR_B` kriterleri mevcut `W.38-W.45`, `W.80-W.83` ve `W.91` zincirine bağlandı; ayrı yeni owner açılmadı.

## Pass 035 - Sayfa 68-69

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p068.jpg](../images/defter_full_pages/defter_p068.jpg)
- [defter_p069.jpg](../images/defter_full_pages/defter_p069.jpg)

Defter işaretleri:

- `W.39`: bulk capacitor `C_B,min` hesabı.
- `W.39`: `T_R_PS ≈ 1/(f_BW-PS * 4)` kabulü; `f_BW-PS ≈ 6 kHz` gibi okunup `T_R_PS ≈ 41 us` ara değeri kullanılır.
- `W.39`: kaynak / tez notu: `f_BW-PS` için crossover frequency gibi kabul edilen eski/ara okuma vardır.
- `W.39`: `MLCC ceramic ≈ 4.43 uF`; `12 V DC-bias` sonrasında etkin kapasite düşüşüyle `4.43 uF x 1.1 ≈ 4.92 uF` gibi ara iz görünür.
- `W.39`: iki paralel seçme / bias sonrası effective capacitance notu vardır; bu güncel final `2 x 47 uF` bulk kararıyla birleştirilmedi.
- `W.39`: `C_B > 15.27 uF` ve tolerans/marj ile `15.27 uF x 1.2 -> 18.32 uF` izi.
- `W.40`: bulk capacitor `ESR_B` üst sınırı.
- `W.40`: `ESR_B <= V_IN,tran / (I_step * Dmax)`.
- `W.40`: `0.36 V / (3 A * 0.121) ≈ 0.991 ohm`.
- `W.40`: hesabın `Dmax`, `Vin,min` koşullarında yapıldığı notu.
- `W.40`: design requirement olarak `V_IN,tran <= 0.36 V` korunur.
- `W.40`: ters okuma: `V_IN,tran <= ESR_B * I_step * Dmax`.

Primary owner entegrasyonu:

- [04_giris_kapasitorleri_ve_giris_agi.md](../04_giris_kapasitorleri_ve_giris_agi.md) içinde `Bulk Seçimi Mantığı` / `W.38-W.45: Bulk Kriterleri`.

Kısa referans / owner dışı bağlantı:

- `Dmax ≈ 0.121` ve `f_BW-PS ≈ 6 kHz` bu bulk hesabının eski/ara koşullarıdır; shared duty/timing owner'ı [02_startup_pin_programlama_ve_ortak_sabitler.md](../02_startup_pin_programlama_ve_ortak_sabitler.md), kontrol crossover owner'ı [07_kontrolcu_ve_kompanzasyon.md](../07_kontrolcu_ve_kompanzasyon.md) olarak kalır.
- Güncel bulk aday hattı [04_giris_kapasitorleri_ve_giris_agi.md](../04_giris_kapasitorleri_ve_giris_agi.md) içindeki `W.81: 2 x 47 uF / 50 V / X7R Bulk Adayı` bölümündedir.
- `0.991 ohm` erken `ESR_B` sanity check'idir; sonraki `0.1023 ohm` korunmacı kontrolle sessizce birleştirilmedi.

Okunan ana sayısal / kavramsal izler:

- `T_R_PS ≈ 41 us`.
- `C_B > 15.27 uF`.
- `C_bulk >= 18.32 uF` marjlı hedef izi.
- `ESR_B <= 0.991 ohm`.
- `V_IN,tran <= 0.36 V`.

Açık notlar:

- Bu pass yeni final `C_B`, `ESR_B`, `Dmax`, `f_BW-PS` veya bulk parça değeri üretmedi.
- `0.991 ohm` ve `0.1023 ohm` aynı koşulun sessiz harmonizasyonu değildir; farklı aşama / varsayım izleri olarak kalır.
- `4.43 uF -> 4.92 uF` ara MLCC etkin kapasite izi, güncel ana MLCC bankı veya güncel bulk adayı yerine kullanılmadı.

## Pass 036 - Sayfa 70-71

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p070.jpg](../images/defter_full_pages/defter_p070.jpg)
- [defter_p071.jpg](../images/defter_full_pages/defter_p071.jpg)

Defter işaretleri:

- `W.44`: bulk `ESR_B` transient sınırı, `Dmax` içeren biçimiyle tekrar okunur.
- `W.44`: `ESR_B < Delta_VIN,tran / (I_step * Dmax)` ilişkisi korunur.
- `W.44`: ilk spike'ın `ESR_B` kaynaklı olduğu ve `Dmax` çarpanının denklem içinde özellikle tutulduğu görülür.
- `W.41`: `3 Select Bulk Capacitors` geçidi; MLCC'lerin ripple süzmede iyi olduğu ama ani yük değişiminde enerji tamponu açısından tek başına yeterli olmayabileceği not edilir.
- `W.41`: transient yük değişiminde `Vin` üzerinde iki farklı düşüş / spike mekanizması ayrılır.
- `W.41`: ilk spike `V_spike1 = I_step * ESR_B` olarak okunur.
- `W.41`: ikinci spike `C_B` ve kaynak akımı ile converter'ın anlık talebi arasındaki geçici fark / bulk enerjisi üzerinden açıklanır.

Primary owner entegrasyonu:

- [04_giris_kapasitorleri_ve_giris_agi.md](../04_giris_kapasitorleri_ve_giris_agi.md) içinde `Bulk Seçimi Mantığı`.
- Aynı dosyada `W.38-W.45: Bulk Kriterleri`.

Kısa referans / owner dışı bağlantı:

- `Dmax` burada duty owner'ını yeniden açmaz; paylaşılan duty/timing girdileri [02_startup_pin_programlama_ve_ortak_sabitler.md](../02_startup_pin_programlama_ve_ortak_sabitler.md) içinde kalır.
- İki-spike transient sezgisi, aynı 04 owner'ında sonraki `W.67`, `W.74`, `W.75` bloğuna bağlanır.
- Bu pass [03_bobin_ve_cikis_kapasitorleri.md](../03_bobin_ve_cikis_kapasitorleri.md), [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) veya [08_emi_giris_filtresi_ve_yerlesim.md](../08_emi_giris_filtresi_ve_yerlesim.md) içinde yeni tam anlatım açmadı.

Okunan ana sayısal / kavramsal izler:

- `ESR_B < Delta_VIN,tran / (I_step * Dmax)`.
- `V_spike1 = I_step * ESR_B`.
- MLCC: yüksek frekans ripple akımı / ripple gerilimi tarafında güçlü, fakat ani transient enerji açığını tek başına kapatmayabilir.
- Bulk: transient enerji tamponu ve `ESR_B` kaynaklı ilk spike kontrolü için ayrı değerlendirilir.

Açık notlar:

- Bu pass yeni final `C_B`, yeni final `ESR_B` veya yeni duty değeri üretmedi.
- `0.991 ohm` erken kontrolü ve sonraki `0.1023 ohm` korunmacı kontrol yine sessizce birleştirilmedi.
- Sayfalar EVM üzerinde uygulanmış rework / ölçüm sonucu gibi sunulmadı; defter tasarım izi olarak eklendi.

## Pass 037 - Sayfa 72-73

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p072.jpg](../images/defter_full_pages/defter_p072.jpg)
- [defter_p073.jpg](../images/defter_full_pages/defter_p073.jpg)

Defter işaretleri:

- `W.43`: `How to Input capacitor` / `3. Select Bulk capacitors` geçidi.
- `W.43`: MLCC'nin ripple current taşıma tarafında iyi olduğu, fakat etkin capacitance kaybedebileceği not edilir.
- `W.43`: bulk capacitor'ın transient response için gereken enerjiyi sağladığı not edilir.
- `W.43`: bulk seçerken `Vin` overshoot/undershoot limitleri ve ripple-current taşıma kapasitesi / RMS ripple-current uygunluğu kontrol kapıları olarak yazılır.
- `W.43`: `I_IN-D` akımı dc bileşen + ripple bileşeni olarak çizilir; `I_IN-D ≈ I_L x D` sezgisi buck giriş terminalindeki darbeli akım bağlamında tutulur.
- `W.45`: buck girişinde `Cin`, high-side / low-side anahtarlar, `Lout`, `Cout` ve `Iload` aynı çizimde gösterilir.
- `W.45`: `Iload 3 A -> 6 A oldu` notu kavramsal load-step örneğidir; güncel proje load-step değeriyle sessizce birleştirilmedi.
- `W.45`: ani ek akımın ilk anda bulk capacitor tarafından karşılanacağı; `IL` ve kaynak / bus akımının hemen değişemeyeceği not edilir.

Primary owner entegrasyonu:

- [04_giris_kapasitorleri_ve_giris_agi.md](../04_giris_kapasitorleri_ve_giris_agi.md) içinde `Bulk Seçimi Mantığı`.
- Aynı dosyada `W.38-W.45: Bulk Kriterleri`.

Kısa referans / owner dışı bağlantı:

- `D` ve `I_L` burada shared duty/timing veya bobin owner'ını yeniden açmaz; yalnız input bulk akım sezgisini açıklar.
- `Iload 3 A -> 6 A` örneği güncel [01](../01_tasarim_girdileri_ve_kaynaklar.md) load-step girdisinin yerine geçmez.
- `IL` kontrol döngüsüyle değişir notu kontrol owner'ına uzun anlatım taşımadı; transient enerji tamponu gerekçesi 04 owner'ında tutuldu.

Okunan ana sayısal / kavramsal izler:

- MLCC: ripple current / yüksek frekans tarafında güçlü, fakat etkin `C` kaybı yaşayabilir.
- Bulk: transient response için enerji rezervi.
- Bulk seçim kapıları: `Vin` overshoot/undershoot ve RMS ripple-current uygunluğu.
- `I_IN-D ≈ I_L x D` giriş darbeli akım sezgisi.
- Kavramsal örnek: `Iload 3 A -> 6 A`.

Açık notlar:

- Bu pass yeni final `C_B`, `ESR_B`, `Cin`, duty veya load-step değeri üretmedi.
- `Iload 3 A -> 6 A` yalnız defterdeki açıklayıcı örnek olarak kaldı; güncel `3.571 A -> 9 A` load-step omurgası değiştirilmedi.
- Sayfalar EVM üzerinde uygulanmış rework / ölçüm sonucu gibi sunulmadı; giriş bulk seçimi için tasarım izi olarak eklendi.

## Pass 038 - Sayfa 74-75

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p074.jpg](../images/defter_full_pages/defter_p074.jpg)
- [defter_p075.jpg](../images/defter_full_pages/defter_p075.jpg)

Defter işaretleri:

- `W.67`: input transient / ani yük değişimi bağlamında `Vin` üzerinde oluşabilecek sapma iki mekanizmaya ayrılır.
- `W.67`: ilk hızlı spike'ın bulk cap `ESR_B` ile ilişkili olduğu not edilir.
- `W.67`: `ESR_B` yüksek ve düşük iki farklı bulk adayıyla transient duyarlılığı denenebilir notu görülür.
- `W.67`: ikinci spike / daha yavaş sapma `I_IN-D` ile `I_PS` arasındaki farktan kaynaklanır.
- `W.67`: high-side MOSFET drain tarafındaki akım için `I_IN-D = I_PS + I_CINBulk` benzeri akım paylaşımı sezgisi korunur.
- `W.74`: bulk capacitor ideal bypass elemanı değildir; düşük frekanslı ripple ve transient durumlarda akım taşır.
- `W.74`: `I_CB,RMS ≈ (1/(2*sqrt(3))) * Delta_VIN-PP / ESR_B` ilişkisi yazılır.
- `W.74`: tüm giriş ripple akımı yalnız bulk üzerinden geçseydi, üzerinde oluşacak RMS akım `I_CB,RMS` kadar olurdu şeklindeki worst-case / sanity-check mantığı korunur.
- `W.74`: `Delta_VIN-PP` hesabında `CCE_total` yani seramik + elektrolit / bulk etkili kapasite toplamına dikkat edilmesi gerektiği not edilir.
- `W.74`: `0.24 V` tasarım sınırı tekrar görünür.

Primary owner entegrasyonu:

- [04_giris_kapasitorleri_ve_giris_agi.md](../04_giris_kapasitorleri_ve_giris_agi.md) içinde `Bulk Seçimi Mantığı`.
- Aynı dosyada `W.67`, `W.74`, `W.75`: `İki Spike, RMS ve Frekans Rolleri`.

Kısa referans / owner dışı bağlantı:

- `I_IN-D`, high-side MOSFET drain akımı ve `I_L/D` sezgisi burada MOSFET selection veya duty owner'ını yeniden açmaz; giriş bulk transient akımını açıklamak için kullanılır.
- `0.24 V` hedefi [01](../01_tasarim_girdileri_ve_kaynaklar.md) global input snapshot'ından gelir; bu pass yeni requirement üretmedi.
- Bulk RMS / ESR duyarlılığı termal kapanışa yalnız kısa referansla bağlanır; tam giriş bulk owner'ı 04 dosyasında kalır.

Okunan ana sayısal / kavramsal izler:

- İlk spike: bulk `ESR_B`.
- İkinci / daha yavaş sapma: `I_IN-D` ve `I_PS` farkı.
- `I_IN-D = I_PS + I_CINBulk` sezgisi.
- `I_CB,RMS ≈ (1/(2*sqrt(3))) * Delta_VIN-PP / ESR_B`.
- `Delta_VIN-PP` hesabında `CCE_total` dikkat notu.
- Tasarım sınırı: `Delta_VIN-PP <= 0.24 V`.

Açık notlar:

- Bu pass yeni final `C_B`, `ESR_B`, `I_CB,RMS`, `Cin`, duty veya MOSFET akım değeri üretmedi.
- `0.103 ohm -> 0.677 A_RMS` mevcut 04 owner'ındaki korunmacı bulk RMS kontrolüyle aynı bağlamda tutuldu; sonraki `W.81` `2 x 47 uF / 50 V / X7R` aday `ESR` değeriyle sessizce birleştirilmedi.
- Sayfalar EVM üzerinde uygulanmış rework / ölçüm sonucu gibi sunulmadı; giriş bulk ve transient enerji tamponu için tasarım izi olarak eklendi.

## Pass 039 - Sayfa 76-77

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p076.jpg](../images/defter_full_pages/defter_p076.jpg)
- [defter_p077.jpg](../images/defter_full_pages/defter_p077.jpg)

Defter işaretleri:

- `W.75`: bulk cap üzerinden geçen RMS ripple akımının hesaplanması tekrar edilir.
- `W.75`: `I_CB,RMS = (1/(2*sqrt(3))) * Delta_VIN-PP / ESR_B` ilişkisi korunur.
- `W.75`: bulk üzerinden geçen ripple akımının yaklaşık olarak `Delta_VIN-PP` ile doğru orantılı olduğu not edilir.
- `W.75`: bulk capacitor empedansının yüksek frekans ripple akımı için MLCC'lere göre daha yüksek kalabileceği yazılır.
- `W.75`: yüksek frekans ripple bypass için MLCC'nin daha iyi olduğu; bunun düşük `ESL` ve düşük `ESR` ile ilişkili olduğu not edilir.
- `W.75`: bulk ve MLCC'nin frekans bölgelerini ayıran kavramsal empedans çizimi vardır.
- `W.76`: `C29 küçük Cin` için `10 nF`, `100 V`, `X7R`, `0603` sınıfı yardımcı aday izi görülür.
- `W.76`: `C10, C11, C12, C13, C14` benzeri ana giriş MLCC konumları ve `4.7 uF` notu okunur.
- `W.76`: `fc = 35 kHz`, `2.1 ohm`, `ESR = 0.5 ohm` ve `4 adet` ile bölme egzersizi silik ara iz olarak korunur; final `ESR_eq` yapılmadı.

Primary owner entegrasyonu:

- [04_giris_kapasitorleri_ve_giris_agi.md](../04_giris_kapasitorleri_ve_giris_agi.md) içinde `W.67`, `W.74`, `W.75`: `İki Spike, RMS ve Frekans Rolleri`.
- Aynı dosyada `Ana Giriş MLCC Bankı` / `W.76: Gerçek MLCC Adayları ve EVM İzi`.

Kısa referans / owner dışı bağlantı:

- `W.75` bulk / MLCC frekans rolünü açıklar; EMI input filter owner'ını burada yeniden açmaz. EMI / Middlebrook kapanışı [08](../08_emi_giris_filtresi_ve_yerlesim.md) dosyasında kalır.
- `W.76` küçük helper MLCC izidir; ana `5 x 4.7 uF` bankın temiz final hattı `W.78-W.79` ile aynı 04 owner'ında kapanır.
- Silik `4 adet` egzersizi, güncel `5 adet` ana MLCC bankıyla sessizce birleştirilmedi.

Okunan ana sayısal / kavramsal izler:

- `I_CB,RMS = (1/(2*sqrt(3))) * Delta_VIN-PP / ESR_B`.
- Bulk ripple akımı yaklaşık `Delta_VIN-PP` ile doğru orantılıdır.
- MLCC yüksek frekans bypass tarafında güçlüdür; bulk yüksek frekans ripple'a karşı daha yüksek empedans gösterebilir.
- `C29` helper: `10 nF`, `100 V`, `X7R`, `0603`.
- Ana MLCC konumları: `C10-C14` ailesi ve `4.7 uF` notu.
- Silik ara izler: `fc = 35 kHz`, `2.1 ohm`, `ESR = 0.5 ohm`, `4 adet`.

Açık notlar:

- Bu pass yeni final `Cin`, `C_B`, `ESR_B`, `I_CB,RMS`, helper MLCC sayısı veya ana MLCC sayısı üretmedi.
- `C29` helper izi enerji deposu gibi okunmadı; yüksek frekans bypass / düşük `ESL` rolünde tutuldu.
- `4 adet` egzersizi ve `5 adet` ana MLCC hattı aynı owner altında etiketli kaldı; sessiz harmonizasyon yapılmadı.

## Pass 040 - Sayfa 78-79

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p078.jpg](../images/defter_full_pages/defter_p078.jpg)
- [defter_p079.jpg](../images/defter_full_pages/defter_p079.jpg)

Defter işaretleri:

- `W.77`: `0.01 uF` yardımcı kapasitörden `4 tane` notu okunur.
- `W.77`: `4.7 uF x 5 tane` ana MLCC hattı aynı sayfada görünür.
- `W.77`: `I_RMS = 4.54 Arms / 4 adet ≈ 1.135 Arms` dört parçalı ara paylaşım egzersizi olarak korunur.
- `W.77`: `ESL max ≈ 0.0008 uH` ve `ESL_0.01uF,toplam ≈ 0.0002 uH` helper aday için düşük-ESL izi gibi okunur.
- `W.77`: `36 V` civarında dc-bias etkisiyle kapasite azalması ve `I_RMS` kaynaklı küçük sıcaklık artışı notları görünür.
- `W.77`: `8392 pF` ve `33.568 nF` yardımcı-kapasite ara değerleri okunur.
- `W.78`: `4.7 uF 5 tane` ana giriş MLCC bankı daha temiz sayısal hatta geçer.
- `W.78`: `I_RMS = 4.54 Arms / 5 adet = 0.908 Arms`.
- `W.78`: `ESL_max = 0.0007 uH` ve `ESL_4.7uF,toplam ≈ 0.14 nH` ideal paralel izi.
- `W.78`: dc-bias etkisiyle kapasite `%63.9` azalır notu.
- `W.78`: tek parça etkin kapasite `1.639 uF`, toplam `5 adet` etkin kapasite `8.195 uF`.

Primary owner entegrasyonu:

- [04_giris_kapasitorleri_ve_giris_agi.md](../04_giris_kapasitorleri_ve_giris_agi.md) içinde `Ana Giriş MLCC Bankı`.
- Aynı dosyada `W.77-W.78: RMS Paylaşımı, ESL ve Dc-bias`.

Kısa referans / owner dışı bağlantı:

- `W.77` helper `0.01 uF` / `10 nF` aday izini büyütür; helper MLCC ana owner'ı yine aynı 04 dosyasındaki `ESL ve Küçük Yardımcı MLCC'ler` bölümüne bağlıdır.
- `W.78` ana `5 x 4.7 uF` bankı destekler; `4 adet` ara paylaşım egzersizi final parça sayısı yapılmadı.
- Sıcaklık notu [06](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) toplam termal kapanışa yalnız kısa referansla gider; giriş MLCC sıcaklık owner'ı 04 dosyasında kalır.

Okunan ana sayısal / kavramsal izler:

- Helper ara izi: `0.01 uF`, `4 adet`, `ESL max ≈ 0.0008 uH`, `ESL_toplam ≈ 0.0002 uH`.
- Helper bias ara izi: `8392 pF`, `33.568 nF`.
- Eski/ara RMS paylaşımı: `4.54 Arms / 4 ≈ 1.135 Arms`.
- Güncel ana MLCC paylaşımı: `4.54 Arms / 5 = 0.908 Arms`.
- Ana MLCC ideal paralel ESL: `0.0007 uH / 5 ≈ 0.14 nH`.
- Ana MLCC etkin kapasite: `1.639 uF` tek parça, `8.195 uF` toplam.

Açık notlar:

- Bu pass yeni final ana MLCC parça sayısı üretmedi; `5 x 4.7 uF` hattını teyit etti.
- `4 adet` ve `5 adet` izleri aynı sayfa ailesinde ama farklı aşama / varsayım olarak etiketlendi; sessiz harmonizasyon yapılmadı.
- `0.14 nH` ideal paralel `ESL` değeridir; gerçek PCB parazitleriyle ayrıca doğrulanmalıdır.

## Pass 041 - Sayfa 80-81

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p080.jpg](../images/defter_full_pages/defter_p080.jpg)
- [defter_p081.jpg](../images/defter_full_pages/defter_p081.jpg)

Defter işaretleri:

- `W.79`: `fsw = 332 kHz` noktasında ana `5 x 4.7 uF` MLCC bankı için `ESR` kontrolü yapılır.
- `W.79`: tek MLCC `ESR ≈ 4 mOhm`, `5 adet` paralel için `ESR_eq ≈ 0.8 mOhm`.
- `W.79`: `fc = 35 kHz` noktasında tek MLCC `ESR ≈ 0.01 ohm`, `5 adet` paralel için `ESR_eq ≈ 2 mOhm`.
- `W.79`: altta `4 tane 0.01 uF + 5 x 4.7 uF` helper + ana MLCC toplamı notu kısmen görünür; bu satır yeni final toplam gibi büyütülmedi.
- `W.79`: `I_RMS = 4.54 Arms / 5 adet = 0.908 Arms` paylaşımı tekrar okunur.
- `W.79`: tek `4.7 uF` MLCC için `ESL_max ≈ 0.0007 uH`; ideal paralelde `ESL_4.7uF,toplam ≈ 0.00014 uH ≈ 0.14 nH`.
- `W.79`: akımın sebep olduğu sıcaklık artışının ihmal edilebilir düzeyde olduğu notu korunur.
- `W.79`: dc-bias etkisiyle kapasitenin `%63.9` azaldığı, tek parça etkin kapasitenin `1.639 uF`, `5 adet` toplam etkin kapasitenin `8.195 uF` olduğu tekrar teyit edilir.

Primary owner entegrasyonu:

- [04_giris_kapasitorleri_ve_giris_agi.md](../04_giris_kapasitorleri_ve_giris_agi.md) içinde `Ana Giriş MLCC Bankı`.
- Aynı dosyada `W.79: ESR ve Toplam Derated Kapasite Özeti`.

Kısa referans / owner dışı bağlantı:

- Bu pass EMI input-filter owner'ını yeniden açmadı; frekans-noktası `ESR` değerleri 04 dosyasındaki giriş MLCC bankı kararı için tutuldu.
- `0.8 mOhm` ve `2 mOhm` aynı final `ESR` sayısı gibi birleştirilmedi; sırasıyla `fsw` ve `fc` civarı için ayrı çapraz teyit olarak kaldı.
- `0.14 nH` ideal paralel `ESL` hesabıdır; PCB pad/via/yerleşim parazitleriyle ölçülmüş değer değildir.
- Giriş MLCC sıcaklık notu 04 dosyasında owner olarak kaldı; toplam sistem termal kapanışı [06](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) dosyasına yalnız kısa bağlanır.

Okunan ana sayısal / kavramsal izler:

- `fsw = 332 kHz`, `ESR ≈ 4 mOhm`, `ESR_eq(5 paralel) ≈ 0.8 mOhm`.
- `fc = 35 kHz`, `ESR ≈ 0.01 ohm`, `ESR_eq(5 paralel) ≈ 2 mOhm`.
- `I_RMS = 4.54 Arms / 5 = 0.908 Arms`.
- `ESL_max = 0.0007 uH`, `ESL_parallel ≈ 0.00014 uH ≈ 0.14 nH`.
- Dc-bias azalması `%63.9`; tek parça etkin kapasite `1.639 uF`; toplam etkin kapasite `8.195 uF`.

Açık notlar:

- Bu pass yeni final `Cin`, yeni ana MLCC parça sayısı, yeni helper MLCC sayısı veya yeni EMI/input-filter kararı üretmedi.
- `8.195 uF` ile aynı W.79 çevresinde görülen `8.228 uF` özeti sessizce harmonize edilmedi; küçük helper kapasitörlerin dahil olup olmamasına bağlı iz farkı olarak owner içinde görünür kaldı.
- Tam sayfa görseller, seçili kırpımların yerine geçmedi; kırpımlar hızlı okuma kanıtı, tam sayfalar kaynak izi olarak birlikte tutuldu.

## Pass 042 - Sayfa 82-83

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p082.jpg](../images/defter_full_pages/defter_p082.jpg)
- [defter_p083.jpg](../images/defter_full_pages/defter_p083.jpg)

Defter işaretleri:

- `W.81`: `KCM55-MH13` gibi okunan bulk aday izi; `50 V`, `47 uF`, `±20%`, `X7R`.
- `W.81`: `ESR_B = 0.004 ohm = 4 mOhm`.
- `W.81`: `2 tane kullanacağım paralel` notu ve `ESR_B/2 = 4 mOhm / 2 = 2 mOhm`.
- `W.81`: `ESR_B < 0.1023` koşulunun sağlandığı notu.
- `W.81`: `DC Bias = 36 V` koşulunda yeni etkin kapasite `17 uF x 2 = 34 uF` gibi okunur.
- `W.81`: `C_B > 27.93 uF` koşulu ve `34 uF > 27.93 uF` kapanışı.
- `W.82`: `Delta_VIN-PP,hesaplanan` formülü `D*(1-D)*Iout,max / (C_CE,total * fsw * (1 - TOL))` ailesinde yazılır.
- `W.82`: `D = 0.5`, `Iout,max = 9 A`, `C_CE,total = 8.228 uF + 34 uF`, `fsw = 332 kHz`, `TOL = 0.20`.
- `W.82`: `Delta_VIN-PP,hesaplanan ≈ 0.2006 V`.
- `W.82`: `Delta_VIN-PP,hesaplanan <= Delta_VIN-allowed` koşulu `0.2006 V < 0.24 V` ile sağlandı notu.
- `W.82`: sayfa üstündeki `100 uF polymer` / damping izi alternatif bulk karşılaştırması gibi korunur.

Primary owner entegrasyonu:

- [04_giris_kapasitorleri_ve_giris_agi.md](../04_giris_kapasitorleri_ve_giris_agi.md) içinde `Bulk Seçimi Mantığı`.
- Aynı dosyada `W.81: 2 x 47 uF / 50 V / X7R Bulk Adayı`.
- Aynı dosyada `W.82: Toplam Giriş Ağı Kontrolü`.

Kısa referans / owner dışı bağlantı:

- Bu pass yeni EMI/input-filter hesabı açmadı; `100 uF polymer` / damping notu 04 içinde alternatif bulk izi olarak kaldı ve [08](../08_emi_giris_filtresi_ve_yerlesim.md) tarafına yalnız açık kontrol köprüsü taşır.
- `2 mOhm` bulk aday `ESR_eq` değeri, daha önceki `0.1023 ohm` transient sınırı veya `0.103 ohm -> 0.677 A_RMS` sanity check'iyle sessizce birleştirilmedi.
- `0.2006 V < 0.24 V` steady-state / switching ripple kapanışıdır; `0.36 V` transient ve layout/ESL/ringing konularını otomatik kapatmaz.

Okunan ana sayısal / kavramsal izler:

- Bulk aday: `2 x 47 uF / 50 V / X7R`.
- Tek bulk `ESR_B ≈ 4 mOhm`; iki paralel `ESR_eq ≈ 2 mOhm`.
- Dc-bias altında tek parça `~17 uF`, iki parça `~34 uF`.
- Transient kapasite koşulu: `C_B > 27.93 uF`; kapanış: `34 uF > 27.93 uF`.
- Toplam etkin giriş ağı: `8.228 uF + 34 uF`.
- Ripple kontrol sonucu: `Delta_VIN-PP,hesaplanan ≈ 0.2006 V < 0.24 V`.

Açık notlar:

- Bu pass yeni final bulk teknolojisi veya yeni parça sayısı üretmedi; mevcut `2 x 47 uF` seramik bulk adayını tam sayfa kaynak iziyle güçlendirdi.
- `100 uF polymer` ana aday yapılmadı; daha sönümlü alternatif / damping sezgisi olarak korundu.
- Sayfalar EVM üzerinde uygulanmış rework veya ölçüm sonucu gibi sunulmadı; seçilmiş ve planlanmış giriş bulk ağı tasarım izi olarak eklendi.

## Pass 043 - Sayfa 84-85

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p084.jpg](../images/defter_full_pages/defter_p084.jpg)
- [defter_p085.jpg](../images/defter_full_pages/defter_p085.jpg)

Defter işaretleri:

- `W.83`: `undershoot` yük aniden artarsa giriş geriliminin kısa süreli düşmesi olarak not edilir.
- `W.83`: `overshoot` yük aniden azalırsa enerjinin kısa süreli boşaltılamaması / gerilimin kısa süreli artması olarak not edilir.
- `W.83`: bulk capacitor transient response requirement koşulunda `ESR_B` ve `C_B` birlikte işaretlenir.
- `W.83`: `ESR_B < Delta_VIN,tran / (Istep * Dmax)` koşulunun daha önce hesaplandığı not edilir.
- `W.83`: `T_RIPS ≈ 1/(f_BW*4)`, `fc ≈ fsw/10`, `1/(33.2 kHz*4) ≈ 7.53 us`.
- `W.91`: `ESR_B <= V_IN-Tran / (Istep * Dmax,verimle)` temiz tekrar.
- `W.91`: `0.36 V / (5.429 * 0.6481) <= 0.1023 ohm`.
- `W.91`: `denklem (4)` kullanımı not edilir.
- `W.91`: `T_RIPS ≈ 1/(f_BW*4)`, `fc ≈ fsw/10`, `fc ≈ 35 kHz`, `T_RIPS ≈ 7.14 us` mertebesi.

Primary owner entegrasyonu:

- [04_giris_kapasitorleri_ve_giris_agi.md](../04_giris_kapasitorleri_ve_giris_agi.md) içinde `Bulk Seçimi Mantığı`.
- Aynı dosyada `W.83, W.91, W.97, W.92: Transient Enerji Penceresi`.

Kısa referans / owner dışı bağlantı:

- Bu pass yeni control-loop owner'ı açmadı; `fc ≈ fsw/10`, `33.2 kHz` ve `35 kHz` yalnız bulk transient zaman penceresini kurmak için kısa referans olarak kullanıldı.
- `0.1023 ohm` transient `ESR_B` sınırı, `2 x 47 uF` adayının `~2 mOhm` paralel ESR değeriyle sessizce birleştirilmedi.
- Undershoot / overshoot notları giriş bulk transient owner'ında tutuldu; çıkış kapasitörü transient owner'ına taşınmadı çünkü sayfa girişi ve bulk capacitor şartını anlatıyor.

Okunan ana sayısal / kavramsal izler:

- `ESR_B < Delta_VIN,tran / (Istep * Dmax)`.
- `ESR_B <= 0.36 / (5.429 * 0.6481) ≈ 0.1023 ohm`.
- `T_RIPS ≈ 1/(33.2 kHz*4) ≈ 7.53 us`.
- `T_RIPS ≈ 1/(35 kHz*4) ≈ 7.14 us`.
- Bulk transient gereksinimi `ESR_B` hızlı sapma ve `C_B` enerji penceresi olarak iki parçalı okunur.

Açık notlar:

- Bu pass yeni final `C_B`, `ESR_B`, `fc`, duty veya load-step değeri üretmedi.
- `7.53 us` ve `7.14 us` aynı zaman penceresinin iki yakın okuması olarak kaldı; biri `33.2 kHz`, diğeri `35 kHz` hattından gelir.
- Sayfalar EVM üzerinde uygulanmış rework veya ölçüm sonucu gibi sunulmadı; giriş bulk transient kapanışı için defter kaynak izi olarak eklendi.

## Pass 044 - Sayfa 86-87

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p086.jpg](../images/defter_full_pages/defter_p086.jpg)
- [defter_p087.jpg](../images/defter_full_pages/defter_p087.jpg)

Defter işaretleri:

- `W.97`: sayfa çok soluk; güvenli okuma `fc = 33.2 kHz -> loop gecikmesi / zaman sabiti` hattıdır.
- `W.97`: `tau ≈ 1/(2*pi*fc) ≈ 1/(2*pi*33.2 kHz) ≈ 4.8 us`.
- `W.97`: sağ altta görülen `L`, `R_ESR`, `Istep` benzeri notlar bu pass'te yeni final değer yapılmadı.
- `W.92`: kaynak figürde steady-state output ripple gösterilir.
- `W.92`: `Delta_VOUT(dc) = Ipp/(8*fsw*COUT) + Ipp*ESR`.
- `W.92`: şekil `Ipp` ripple akımını ve `Delta VOUT(dc)` / `Delta VOUT(ac)` ayrımını gösterir.
- `W.92`: eldeki sayfada `VOUT(nom) = 14 V` notu görünür; bu pass yeni output voltage spec üretmez.

Primary owner entegrasyonu:

- `W.97` için [04_giris_kapasitorleri_ve_giris_agi.md](../04_giris_kapasitorleri_ve_giris_agi.md) içinde `Bulk Seçimi Mantığı` / `Transient Enerji Penceresi`.
- `W.92` için [03_bobin_ve_cikis_kapasitorleri.md](../03_bobin_ve_cikis_kapasitorleri.md) içinde `Steady-state Ripple ve Minimum Cout`.

Kısa referans / owner dışı bağlantı:

- `W.97` içindeki `4.8 us`, `7.53 us` ve `7.14 us` zaman pencerelerini iptal etmez; aynı transient duyarlılık ailesinin daha kısa zaman-sabiti okuması olarak tutuldu.
- `W.92` sembol olarak `VOUT/COUT` kullandığı için tam anlatımı output capacitor owner'ında tutuldu; 04 dosyasında yalnız kapasitif terim + `ESR` terimi ayrımı için kısa referans bırakıldı.
- Bu pass yeni `Cout`, `Cin`, `C_B`, `ESR_B`, `fc`, `Istep` veya `Vout` değeri üretmedi.

Okunan ana sayısal / kavramsal izler:

- `fc = 33.2 kHz`.
- `tau ≈ 1/(2*pi*33.2 kHz) ≈ 4.8 us`.
- `Delta_VOUT(dc) = Ipp/(8*fsw*COUT) + Ipp*ESR`.
- Output ripple hesabında kapasitif bileşen ve `ESR` bileşeni ayrı tutulmalıdır.

Açık notlar:

- `p086` soluk olduğu için yalnız güvenle okunan zaman ölçeği owner dosyaya eklendi; soluk metinlerden yeni teknik karar çıkarılmadı.
- `p087` output ripple figürüdür; giriş bulk owner'ında uzun tekrar olarak büyütülmedi.
- Sayfalar EVM üzerinde uygulanmış rework veya ölçüm sonucu gibi sunulmadı; defter/kaynak izi olarak eklendi.

## Pass 045 - Sayfa 88-89

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p088.jpg](../images/defter_full_pages/defter_p088.jpg)
- [defter_p089.jpg](../images/defter_full_pages/defter_p089.jpg)

Defter işaretleri:

- `W.120`: TI `Understanding MOSFET Data Sheets, Part 1 - UIS/avalanche Ratings` kaynak sayfası.
- `W.120`: üst notta "UIS testi nasıl yapılır?" ve "akım arta arta MOSFET bozulma noktasına gider" okuması vardır.
- `W.120`: kaynak figürde `UIS Test Circuit`, gate controller, DUT MOSFET, endüktör `L` ve supply bağlantısı görünür.
- `W.120`: `UIS` testi MOSFET datasheetindeki avalanche dayanımını anlamak için kaynak izidir.
- `W.121`: `Pre-leakage` notu ve drain voltage / gate voltage / drain current dalga şekilleri çizilir.
- `W.121`: MOSFET gate kapatıldığında normalde `OFF` olur; fakat endüktif akım yol arar.
- `W.121`: drain gerilimi `VBK` bölgesine yükselir, avalanche current loop ve `Eav` / avalanche energy sezgisi çizilir.

Primary owner entegrasyonu:

- [05_mosfet_secimi_ve_dayanim_mantigi.md](../05_mosfet_secimi_ve_dayanim_mantigi.md) içinde `Avalanche ve UIS`.
- Aynı dosyada `W.120-W.121: Avalanche / UIS Farkındalığı`.

Kısa referans / owner dışı bağlantı:

- Bu pass [06](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) dosyasındaki kayıp / termal hesaplarını açmadı; MOSFET dayanım seçimi 05 owner'ında kaldı.
- `UIS` ve avalanche notları normal çalışma hedefi gibi yazılmadı; `VDS` spike, layout, `Rboot`, snubber ve simülasyon açık kontrollerine bağlandı.
- Bu pass yeni `EAS`, `L`, test akımı, `VDS` limiti, SOA sınırı veya MOSFET kayıp değeri üretmedi.

Okunan ana sayısal / kavramsal izler:

- `UIS`: unclamped inductive switching dayanım testi.
- Gate kapalıyken endüktif akımın devam etmek istemesi `VDS` yükselmesine yol açabilir.
- Avalanche bölgesi, enerji sönümleme / arıza dayanımı bağlamında okunur.
- Test sonrası leakage / hasar kontrolü fikri korunur.

Açık notlar:

- Kaynak sayfasındaki makale proje ölçümü değildir; datasheet okuma ve seçim kontrolü için kaynak izidir.
- `p088` ve `p089`, seçilen MOSFET'in avalanche açısından final doğrulandığını göstermez.
- Final kabul için `VDS` spike / ringing simülasyonu, snubber veya gate direnci kararı, SOA ve termal kapanış aynı koşul setinde ayrıca kontrol edilmelidir.

## Pass 046 - Sayfa 90-91

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p090.jpg](../images/defter_full_pages/defter_p090.jpg)
- [defter_p091.jpg](../images/defter_full_pages/defter_p091.jpg)

Defter işaretleri:

- `W.122`: TI `Understanding MOSFET Data Sheets, Part 2 - Safe Operating Area (SOA) Graph` kaynak sayfası.
- `W.122`: SOA grafiğinde `RDS(on) Limitation`, `Current Limitation`, `Max Power Limitation`, `Thermal Instability Limitation` ve `BVdss Limitation` bölgeleri görünür.
- `W.122`: üst notta "MOSFET'in zarar görmeden çalışabileceği gerilim ve akım sınırlarını gösteren grafik" okuması vardır.
- `W.122`: farklı pulse süreleri (`DC`, `10 ms`, `1 ms`, `100 us`) SOA eğrisinde ayrı sınırlar olarak görünür.
- `W.123`: `ID-VDS` karakteristiği çizilir; `VGS = 6 V` ve `VGS = 3 V` gibi örnek gate gerilimleri görünür.
- `W.123`: lineer bölgede akımın `VDS` ile ilişkili olduğu ve yaklaşık `ID ≈ VDS/RDS(on)` gibi okunabileceği not edilir.
- `W.123`: saturasyon bölgesinde `VDS` artsa bile akımın `VGS` tarafından sınırlanacağı not edilir.

Primary owner entegrasyonu:

- [05_mosfet_secimi_ve_dayanim_mantigi.md](../05_mosfet_secimi_ve_dayanim_mantigi.md) içinde `SOA Okuması`.

Kısa referans / owner dışı bağlantı:

- Bu pass [06](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) dosyasındaki termal/kayıp kapanışını açmadı; SOA seçim/dayanım owner'ı 05 dosyasında kaldı.
- `Thermal Instability Limitation` SOA grafiğinde görünse de ayrıntılı MOSFET junction/board termal kapanışı [06](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) owner'ına aittir.
- Bu pass yeni proje-özel SOA çalışma noktası, akım limiti, pulse süresi veya MOSFET kayıp değeri üretmedi.

Okunan ana sayısal / kavramsal izler:

- SOA grafiği `VDS`, `ID` ve pulse süresini birlikte okutur.
- SOA limit bölgeleri: `RDS(on)`, current, max power, thermal instability ve `BVdss`.
- Lineer bölgede yaklaşık `ID ≈ VDS/RDS(on)` sezgisi.
- Saturasyon bölgesinde akım `VGS` ile sınırlanır.

Açık notlar:

- `p090` ve `p091`, seçilen MOSFET'in final SOA doğrulamasını yapmaz; SOA grafiğini nasıl okumak gerektiğini kaynak/defter izi olarak gösterir.
- Final kabulte normal çalışma, switching geçişi, startup, current-limit ve fault pulse süreleri ayrı ayrı SOA üzerinde işaretlenmelidir.
- EVM üzerinde uygulanmış rework veya ölçüm sonucu gibi sunulmadı.

## Pass 047 - Sayfa 92-93

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p092.jpg](../images/defter_full_pages/defter_p092.jpg)
- [defter_p093.jpg](../images/defter_full_pages/defter_p093.jpg)

Defter işaretleri:

- `W.178`: `dV/dt Limit` başlığı ve drain-source gerilimi çok hızlı arttığında MOSFET'in kendiliğinden açılabileceği notu.
- `W.178`: "biz kendi isteğimizle / kontrolümüzle `VGS` uygulamayarak" ifadesi, gate komutu yokken oluşan parasitik `VGS` riskini anlatır.
- `W.178`: çizimde gate direnci, `Cgd`, `Cgs`, `Cds`, MOSFET ve `dV/dt` oku görünür.
- `W.178`: "toplamda 3 adet senaryo halinde incelenecek" notu vardır.
- `W.179`: ilk senaryo sade kapasitif bölücüdür; MOSFET off iken gerilim arttığında gate-source arasında gerilim oluşabilir.
- `W.179`: `VGS = VDS * CGD / (CGS + CGD)` ilişkisi yazılır.
- `W.179`: `VDSmax * CGD/(CGS+CGD) < VTH` koşulu not edilir.
- `W.179`: gate sürücüsü ve direnç ne olursa olsun `dV/dt` etkisiyle gate'e gerilim oluşabileceği uyarısı görünür.

Primary owner entegrasyonu:

- [05_mosfet_secimi_ve_dayanim_mantigi.md](../05_mosfet_secimi_ve_dayanim_mantigi.md) içinde `dV/dt, Miller ve Yanlış Turn-on`.
- Aynı dosyada `W.178-W.184: Proje İçindeki Miller Kontrolleri`.

Kısa referans / owner dışı bağlantı:

- Bu pass [06](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içindeki gate-drive kayıp veya bootstrap hesaplarını açmadı; Miller yanlış turn-on seçimi / dayanım riski olarak 05 owner'ında kaldı.
- `W.179` kapasitif bölücü formülü, sonraki `W.180-W.184` farklı kapasitans setleriyle sessizce birleştirilmedi.
- Bu pass yeni `Cgd`, `Cgs`, `VTH`, `VDS,max`, `dV/dt` limiti veya gate direnci değeri üretmedi.

Okunan ana sayısal / kavramsal izler:

- Hızlı `dV/dt`, `Cgd` üzerinden gate'e parasitik gerilim taşıyabilir.
- Kapasitif bölücü sezgisi: `VGS ≈ VDS * Cgd/(Cgs + Cgd)`.
- Yanlış turn-on olmaması için `VDS,max * Cgd/(Cgs + Cgd) < VTH`.
- Problem üç senaryo halinde incelenecek şekilde kurulmuştur.

Açık notlar:

- Bu sayfalar gerçek switch-node ölçümü değildir; Miller yanlış turn-on riskini kuran defter/kaynak izidir.
- Final kabulte gerçek `Cgd(VDS)`, gate pull-down yolu, common-source inductance, layout ve switch-node dalga şekli birlikte kontrol edilmelidir.
- EVM üzerinde uygulanmış rework veya ölçüm sonucu gibi sunulmadı.

## Pass 048 - Sayfa 94-95

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p094.jpg](../images/defter_full_pages/defter_p094.jpg)
- [defter_p095.jpg](../images/defter_full_pages/defter_p095.jpg)

Defter işaretleri:

- `W.180`: ilk senaryo, küçük / iyimser kapasitans setiyle Miller yanlış turn-on kontrolüdür.
- `W.180`: `VDS = 22 V` bağlamı görülür.
- `W.180`: `Crss = 6 pF`, `Coss = 200 pF`, `Ciss = 1100 pF`.
- `W.180`: `Cgs = Ciss - Cgd = 1100 - 6 = 1094 pF`.
- `W.180`: `VDS,max ≈ VTH*(Cgs+Cgd)/Cgd` ilişkisiyle `398 V` mertebesi okunur.
- `W.180`: sayfada "MOS kendiliğinden ON olmaz" sonucu bu küçük `Cgd` senaryosu için not edilir.
- `W.181`: ikinci senaryo `dV/dt_N-limit = VTH/(RGi*CGD)` hattıdır.
- `W.181`: `2.171 V / (0.7 ohm * 6e-12 F)` hesabından `517 x 10^9 V/s`, yani yaklaşık `517 V/ns` mertebesi okunur.
- `W.181`: "normalde bunun çok yüksek olduğu, pratikte daha düşük olabileceği" uyarısı görünür.

Primary owner entegrasyonu:

- [05_mosfet_secimi_ve_dayanim_mantigi.md](../05_mosfet_secimi_ve_dayanim_mantigi.md) içinde `dV/dt, Miller ve Yanlış Turn-on`.
- Aynı dosyada `W.178-W.184: Proje İçindeki Miller Kontrolleri`.

Kısa referans / owner dışı bağlantı:

- Bu pass [06](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içindeki gate-drive kayıp veya bootstrap hesabını açmadı.
- `398 V`, `517 V/ns` ve önceki `190.6 V/ns` gibi izler sessizce tek cevap yapılmadı; farklı senaryo / kapasitans / gate-yolu varsayımları olarak kaldı.
- Bu pass yeni final `Cgd`, `Cgs`, `VTH`, `VDS,max`, `dV/dt` limiti veya gate direnci kararı üretmedi.

Okunan ana sayısal / kavramsal izler:

- `Cgd/Crss = 6 pF`.
- `Coss = 200 pF`.
- `Ciss = 1100 pF`.
- `Cgs = 1094 pF`.
- İlk senaryoda `VDS,max ≈ 398 V` mertebesi.
- İkinci senaryoda `(dV/dt)_N-limit ≈ 517 V/ns` mertebesi.

Açık notlar:

- Bu sayfalar gerçek switch-node ölçümü değildir; Miller yanlış turn-on riskine dair teorik / defter kontrolüdür.
- Küçük `Cgd = 6 pF` varsayımı sonraki korumacı kapasitans senaryolarıyla aynı final değer gibi birleştirilmedi.
- Final kabulte gerçek `Cgd(VDS)`, gate pull-down yolu, common-source inductance, layout ve switch-node dalga şekli birlikte kontrol edilmelidir.

## Pass 049 - Sayfa 96-97

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p096.jpg](../images/defter_full_pages/defter_p096.jpg)
- [defter_p097.jpg](../images/defter_full_pages/defter_p097.jpg)

Defter işaretleri:

- `W.182`: üçüncü senaryo, yalnız MOSFET iç yapısı değil harici gate direnci ve driver içindeki `RLO` yolu ile birlikte okunur.
- `W.182`: `I_CGD = C_GD * dVDS/dt` ilişkisi yazılır.
- `W.182`: `VGS = I * (RGi + Rgate + RLO)` ilişkisi görünür.
- `W.182`: `VGS > VTH` olursa MOSFET yanlışlıkla açılır notu korunur.
- `W.183`: `VTH = 2.171 V`.
- `W.183`: `Rgate = 0.5-1 ohm`; en kötü senaryo için `1 ohm` alınır.
- `W.183`: `RLO-down / low-state resistance ≈ 0.9 ohm`.
- `W.183`: `CGD = 6 pF`.
- `W.183`: `(dV/dt)_limit ≈ 2.171 V / ((1 ohm + 1 ohm + 0.9 ohm)*6 pF) ≈ 190.6 V/ns`.
- `W.183`: "MOSFET'in kendiliğinden açılması gibi bir risk çıkmaz" sonucu bu küçük `CGD` ve gate-yolu senaryosu için not edilir.

Primary owner entegrasyonu:

- [05_mosfet_secimi_ve_dayanim_mantigi.md](../05_mosfet_secimi_ve_dayanim_mantigi.md) içinde `dV/dt, Miller ve Yanlış Turn-on`.
- Aynı dosyada `W.178-W.184: Proje İçindeki Miller Kontrolleri`.

Kısa referans / owner dışı bağlantı:

- Bu pass [06](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içindeki gate-drive kayıp, bootstrap veya termal hesabını açmadı.
- `190.6 V/ns`, `517 V/ns`, `398 V`, `26.12 V` ve `52.35 V` izleri sessizce tek final cevap yapılmadı; farklı model / kapasitans / gate-yolu varsayımları olarak kaldı.
- Bu pass yeni final `CGD`, `Rgate`, `RLO`, `VTH`, `VDS,max` veya gerçek switch-node `dV/dt` ölçümü üretmedi.

Okunan ana sayısal / kavramsal izler:

- `I_CGD = C_GD * dVDS/dt`.
- `VGS = I * (RGi + Rgate + RLO)`.
- `VTH = 2.171 V`.
- `Rgate = 1 ohm` en kötü senaryo.
- `RLO ≈ 0.9 ohm`.
- `CGD = 6 pF`.
- `(dV/dt)_limit ≈ 190.6 V/ns`.

Açık notlar:

- Bu sayfalar gerçek switch-node ölçümü değildir; Miller yanlış turn-on için teorik/defter kontrolüdür.
- Küçük `CGD = 6 pF` varsayımı korunmacı kapasitans senaryolarıyla aynı final değer gibi birleştirilmedi.
- Final kabulte gerçek `Cgd(VDS)`, gate pull-down yolu, common-source inductance, layout ve switch-node dalga şekli birlikte kontrol edilmelidir.

## Pass 050 - Sayfa 98-99

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p098.jpg](../images/defter_full_pages/defter_p098.jpg)
- [defter_p099.jpg](../images/defter_full_pages/defter_p099.jpg)

Defter işaretleri:

- `W.184`: korumacı / nominal kapasitans setiyle kapasitif bölücü senaryosu tekrar edilir.
- `W.184`: sayfada kapasitans nominal değerlerinin kullanıldığı ve sıcaklık / eşik tarafı için `+0.35 V` ek notu görünüyor.
- `W.184`: `Ciss ≈ 2600 pF`, `Cgd ≈ 340 pF`.
- `W.184`: p098 tam sayfa aritmetiği `(3.157 V + 0.35 V)*2600 pF/340 pF ≈ 26.82 V` verir.
- `W.184`: önceki küçük kırpım / özet okumasında `26.12 V` izi vardı; bu iki iz sessizce tek değer yapılmadı.
- `W.125`: G88 kaynak yöntemi `VTH`, `CGD`, gate yolu dirençleri ve pull-down yolunu birlikte kullanır.
- `W.125`: p098 alt kısmında IRFP120 doğal `dV/dt` limiti için `VTH + ΔV ≈ 3.157 V + 0.35 V`, `RGI ≈ 1.6 ohm`, `CGD ≈ 340 pF` ve `≈ 6.4 kV/us` izi okunur.
- `W.125`: üçüncü senaryo için `RGI + Rgate + RLO ≈ 1.6 + 5 + 5 ohm` ve `≈ 889 V/us` izi okunur.
- `W.125`: p099 üzerinde `3.49 V`, gate yolu dirençleri ve `10.64` sonucu görünür; birim / anlam defterde net final gibi durmadığı için açık iz olarak bırakıldı.

Primary owner entegrasyonu:

- [05_mosfet_secimi_ve_dayanim_mantigi.md](../05_mosfet_secimi_ve_dayanim_mantigi.md) içinde `dV/dt, Miller ve Yanlış Turn-on`.
- Aynı dosyada `W.178-W.184: Proje İçindeki Miller Kontrolleri` ve `W.125-W.127: G88 Kaynak / Ara Notları`.

Kısa referans / owner dışı bağlantı:

- Bu pass [06](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içindeki bootstrap, kayıp veya termal hesabını açmadı.
- `26.12 V`, `26.82 V`, `52.35 V`, `10.64 V/ns`, `889 V/us`, `6.4 kV/us`, `190.6 V/ns` ve `517 V/ns` izleri tek final cevap gibi birleştirilmedi.
- Bu pass yeni final `Cgd`, `Ciss`, `VTH`, `VDS,max`, gate direnci veya gerçek switch-node `dV/dt` ölçümü üretmedi.

Okunan ana sayısal / kavramsal izler:

- `Ciss ≈ 2600 pF`.
- `Cgd ≈ 340 pF`.
- `VTH + ΔV ≈ 3.157 V + 0.35 V`.
- `VDS,max ≈ 26.82 V` p098 tam sayfa aritmetiği.
- `RGI ≈ 1.6 ohm`.
- `Rgate ≈ 5 ohm`.
- `RLO ≈ 5 ohm`.
- IRFP120 / G88 kaynak örneğinde `≈ 6.4 kV/us` ve `≈ 889 V/us` izleri.
- p099 kaynak notunda `10.64` sonucu; birim / uygulanabilirlik açık kontrol olarak kaldı.

Açık notlar:

- Bu sayfalar gerçek switch-node ölçümü değildir; kaynak yöntemleri ve kapasitans varsayımlarının duyarlılığını gösterir.
- `26.12 V` ile `26.82 V` aynı owner altında görünür bırakıldı.
- `10.64` sonucu birim ve bağlam açısından net olmadığı için final limit yapılmadı.

## Pass 051 - Sayfa 100-101

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p100.jpg](../images/defter_full_pages/defter_p100.jpg)
- [defter_p101.jpg](../images/defter_full_pages/defter_p101.jpg)

Defter işaretleri:

- `W.126`: doğal / kaba `dV/dt` üst sınır kontrolünü sürdürür.
- `W.126`: `(dV/dt)_N-limit ≈ VTH / (RGI * CGD)` ilişkisi p100 tam sayfada görünür.
- `W.126`: `VTH = 3.49 V`, `RGI = 1 ohm`, `CGD = 80 pF`.
- `W.126`: `3.49 V / (1 ohm * 80 pF) = 4.36e10 V/s ≈ 43.6 V/ns`.
- `W.126`: defter notu bu değeri "epey yüksek bir doğal sınır" olarak yorumlar; bu senaryoda MOSFET'in istemsizce açılma riski düşük görülür.
- `W.127`: kapasitif bölücü yaklaşımını tekrar kurar: `VGS = VDS * CGD/(CGS + CGD)`.
- `W.127`: ters kontrol olarak `VDS,max ≈ VTH*(CGS+CGD)/CGD` kullanılır.
- `W.127`: `VDS = 36 V - 14 V = 22 V` bağlamı görünür.
- `W.127`: `Crss/CGD = 80 pF`, `Coss = 700 pF`, `Ciss = 1200 pF` grafikten yaklaşık okunur.
- `W.127`: `CDS = Coss - CGD = 700 pF - 80 pF = 620 pF`.
- `W.127`: `CGS = Ciss - CGD = 1200 pF - 80 pF = 1120 pF`.
- `W.127`: `VDS,max ≈ 3.49 V*(1120 pF + 80 pF)/80 pF ≈ 52.35 V`.
- `W.127`: sonuç MOSFET kapalıyken / gate komutu yokken kendi kendine açılmama kontrolü olarak yazılır.

Primary owner entegrasyonu:

- [05_mosfet_secimi_ve_dayanim_mantigi.md](../05_mosfet_secimi_ve_dayanim_mantigi.md) içinde `dV/dt, Miller ve Yanlış Turn-on`.
- Aynı dosyada `W.125-W.127: G88 Kaynak / Ara Notları`.

Kısa referans / owner dışı bağlantı:

- Bu pass [06](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içindeki gate-drive kaybı, bootstrap veya termal hesabını açmadı.
- `43.6 V/ns`, `52.35 V`, `26.12 V`, `26.82 V`, `190.6 V/ns` ve `517 V/ns` izleri tek final cevap gibi birleştirilmedi.
- Bu pass yeni final `CGD`, `Ciss`, `Coss`, `VTH`, `VDS,max` veya gerçek switch-node `dV/dt` ölçümü üretmedi.

Okunan ana sayısal / kavramsal izler:

- `VTH = 3.49 V`.
- `RGI = 1 ohm`.
- `CGD/Crss = 80 pF`.
- `(dV/dt)_N-limit ≈ 43.6 V/ns`.
- `VDS = 36 V - 14 V = 22 V`.
- `Coss = 700 pF`.
- `Ciss = 1200 pF`.
- `CDS = 620 pF`.
- `CGS = 1120 pF`.
- `VDS,max ≈ 52.35 V`.

Açık notlar:

- Önceki kısa özet satırında W.126 için `Ciss` notasyonu vardı; p100 tam sayfa hesabı `CGD/Crss = 80 pF` kullandığı için owner dosyasında bu fark görünürleştirildi.
- Bu sayfalar gerçek ölçüm değil, kapasitans grafiğinden yaklaşık değerlerle yapılan Miller yanlış turn-on kontrolleridir.

## Pass 052 - Sayfa 102-103

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p102.jpg](../images/defter_full_pages/defter_p102.jpg)
- [defter_p103.jpg](../images/defter_full_pages/defter_p103.jpg)

Defter işaretleri:

- `W.131`: `Cgs` için "sabit kabul edilir" ve `VDS` / `VGS` ile çok az bağlı olduğu notu okunur.
- `W.131`: gate, MOSFET'in kontrol edilen tarafı olarak anlatılır; gate işareti önce kapasitansları şarj eder.
- `W.131`: girişte görülen toplam kapasitans için `Ciss = Cgs + Cgd` ilişkisi korunur.
- `W.131`: `Cgs` büyükse gate tepki süresi daha yavaş olur ve daha fazla gate charge `Qg` gerekir.
- `W.131`: `Cgs` küçükse açma/kapama daha hızlı olur, fakat kontrol daha hassas hale gelir.
- `W.132`: `Cgd` Miller kapasitansı olarak etiketlenir.
- `W.132`: gate'e uygulanan gerilim değiştiğinde drain üzerindeki gerilimin etkilendiği ve anahtarlama sırasında `VGS`in plateau / sabit bölge gibi davranabileceği not edilir.
- `W.133`: `Cgs`, `Cgd`, `Cds` parazitik kapasitansları MOSFET açılma süresini etkiler.
- `W.133`: bu sığalar küçüldükçe MOSFET daha hızlı anahtarlama yapabilir; daha hızlı anahtarlama daha az switching loss ile ilişkilendirilir.
- `W.133`: yüksek frekansta çalışan uygulamalarda parazitik kapasitans etkisi kritik not edilir.
- `W.133`: `Qg` arttıkça MOSFET'i açıp kapatmak için daha fazla enerji ve zaman gerektiği yazılır.
- `W.133`: `RDS(on) * Qg` figure-of-merit / başarım göstergesi olarak tutulur; düşük `RDS(on)` ile düşük `Qg` arasında denge aranır.

Primary owner entegrasyonu:

- [05_mosfet_secimi_ve_dayanim_mantigi.md](../05_mosfet_secimi_ve_dayanim_mantigi.md) içinde `Gate-drive, Qg/Qgd ve Miller Bağlamı`.
- Aynı dosyada `W.130-W.133, W.163: Parazitik Kapasitanslar ve FOM İzleri`.

Kısa referans / owner dışı bağlantı:

- Bu pass [06](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içindeki ayrıntılı switching-loss, gate-drive loss veya bootstrap charge hesabını açmadı.
- `RDS(on) * Qg` burada seçim göstergesi olarak kaldı; sayısal final FOM değeri üretilmedi.
- Bu pass yeni final `Cgs`, `Cgd`, `Cds`, `Ciss`, `Qg`, `RDS(on)` veya switching-time değeri üretmedi.

Okunan ana sayısal / kavramsal izler:

- `Ciss = Cgs + Cgd`.
- `Cgd = Miller kapasitansı`.
- `Cgs` büyükse daha yavaş gate tepki süresi ve daha fazla `Qg`.
- Parazitik kapasitanslar küçüldükçe daha hızlı anahtarlama.
- Hızlı anahtarlama ile daha az switching loss bağlantısı.
- `RDS(on) * Qg` figure-of-merit.

Açık notlar:

- Bu iki sayfa sayısal final hesap değil, MOSFET seçim mantığını açıklayan kavramsal defter izidir.
- Switching loss ayrıntısı ve toplam kayıp kapanışı 06 dosyasında kalır; burada yalnız seçim/dayanım bağlamı korunur.

## Pass 053 - Sayfa 104-105

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p104.jpg](../images/defter_full_pages/defter_p104.jpg)
- [defter_p105.jpg](../images/defter_full_pages/defter_p105.jpg)

Defter işaretleri:

- `W.144`: "Power MOSFET" genel seçim notu olarak açılır.
- `W.144`: `RDS(on)`, MOSFET iletimdeyken drain-source arasındaki direnç olarak tanımlanır.
- `W.144`: daha düşük `RDS(on)` conduction loss'u ve ısı üretimini azaltır; verimlilik tarafına olumlu etki eder.
- `W.144`: MOSFET iç yapısında istenmeyen parazitik kapasitanslar `Cgs`, `Cgd`, `Cds` vardır.
- `W.144`: bu kapasitansların şarj/deşarj olması zaman alır; MOSFET'in açılıp kapanmasını yavaşlatır ve switching loss'a bağlanır.
- `W.144`: üretici `RDS(on)` düşürmek için daha büyük MOSFET / daha fazla silikon kullandığında `Qg` ve `Qoss` artabilir.
- `W.144`: sonuç notu, düşük `RDS(on)` ile düşük `Qg/Qoss` arasında seçim dengesi kurulması gerektiğini gösterir.
- `W.145`: `RDS(on)` okumasında sıcaklık koşulu görünür; defterde `TC = 125 C` için dikkat notu var.
- `W.145`: LM5146 gate sürücüsü yaklaşık `7.5 V` verdiği için `RDS(on)` bu gate gerilimi koşulunda okunmalı.
- `W.145`: `BVDSS`, drain-source breakdown voltage olarak tanımlanır.
- `W.145`: pratik seçim kuralı olarak `BVDSS > 1.25 * Vin,max` yazılır.
- `W.145`: tipik `BVDSS` sınıfları için `60 V`, `80 V`, `100 V` örnekleri görünür.
- `W.145`: `Qg` gate charge parametresi yine `VGS = 7.5 V` koşuluyla ilişkilendirilir.

Primary owner entegrasyonu:

- [05_mosfet_secimi_ve_dayanim_mantigi.md](../05_mosfet_secimi_ve_dayanim_mantigi.md) içinde `Seçim Mantığı`.
- Aynı dosyada `RDS(on) Okuması` ve `W.145: Datasheet Hangi Koşulda Okunacak?`.

Kısa referans / owner dışı bağlantı:

- Bu pass [06](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içindeki ayrıntılı conduction-loss, switching-loss, gate-drive loss veya termal toplamayı açmadı.
- `RDS(on)`, `Qg`, `Qoss`, `BVDSS` burada seçim/dayanım okuma koşulları olarak kaldı.
- Bu pass yeni final MOSFET parçası, final `RDS(on)`, final `Qg`, final `Qoss` veya final `BVDSS` üretmedi.

Okunan ana sayısal / kavramsal izler:

- `RDS(on)` = iletimde drain-source arası direnç.
- `Cgs`, `Cgd`, `Cds` parazitik kapasitansları.
- Daha büyük MOSFET / daha fazla silikon -> daha düşük `RDS(on)` ama daha yüksek `Qg/Qoss` riski.
- `TC = 125 C` sıcaklık okuma koşulu notu.
- LM5146 gate sürüşü: `VGS ≈ 7.5 V`.
- `BVDSS > 1.25 * Vin,max`.
- Tipik `BVDSS` sınıfları: `60 V`, `80 V`, `100 V`.
- `Qg @ VGS = 7.5 V`.

Açık notlar:

- `TC = 125 C` notu ile önceki `75 C` termal iterasyonu aynı final koşul gibi birleştirilmedi; biri datasheet okuma uyarısı, diğeri eski çalışma varsayımıdır.
- `BVDSS > 1.25 * Vin,max` kuralı final spike/ringing doğrulamasının yerine geçmez; 05 içinde dayanım seçim izi olarak kalır.

## Pass 054 - Sayfa 106-107

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p106.jpg](../images/defter_full_pages/defter_p106.jpg)
- [defter_p107.jpg](../images/defter_full_pages/defter_p107.jpg)

Defter işaretleri:

- `W.151`: `BVDSS`, MOSFET'in drain-source arasında dayanabileceği en yüksek gerilim olarak anlatılır.
- `W.151`: giriş gerilimi bu sınırı aşarsa MOSFET'in bozulacağı not edilir.
- `W.151`: `Vinmax = 36 V` bağlamında en az `60 V` BVDSS sınıfına sahip MOSFET kullanma notu görülür.
- `W.151`: seçilen MOSFET için `BVDSS = 100 V` izi korunur.
- `W.146`: MOSFET seçim parametrelerinde LM5146 ile uyumlu verimli çalışma için `RDS(on) @ VGS = 7.5 V` okuması tekrar edilir.
- `W.146`: `RDS(on)`, MOSFET açıkken drain-source arasındaki dirençtir; bu direnç küçüldükçe iletim kaybı ve ısınma azalır.
- `W.146`: defterde önce Fig.3 / `VGS = 7.5 V` grafiğinden `RDS(on) ≈ 15 mOhm` okunduğu yazılır.
- `W.146`: bu `15 mOhm` değerinin `Tj = 25 C` için geçerli olduğu not edilir.
- `W.146`: çalışma tarafında MOSFET sıcaklığının yaklaşık `75 C` olacağı varsayımıyla sıcaklık katsayısı `1.35` alınır.
- `W.146`: `RDS(on)(75 C) = 15 mOhm * 1.35 = 20.25 mOhm` hesabı kutulanmıştır.

Primary owner entegrasyonu:

- [05_mosfet_secimi_ve_dayanim_mantigi.md](../05_mosfet_secimi_ve_dayanim_mantigi.md) içinde `RDS(on) Okuması`.
- Aynı dosyada `BVDSS, VDS Marjı ve 44 V Bağlamı`.

Kısa referans / owner dışı bağlantı:

- Bu pass [06](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içindeki MOSFET conduction-loss ve termal toplamayı açmadı; yalnız 05'ten 06'ya gidecek sıcak `RDS(on)` izini güçlendirdi.
- `45 V` alt sınır, `60 V` pratik sınıf notu ve `100 V` seçilen MOSFET izi tek sayı gibi birleştirilmedi.
- Bu pass yeni final `RDS(on)`, final `Tj`, final `BVDSS` veya final switch-node spike marjı üretmedi.

Okunan ana sayısal / kavramsal izler:

- `Vinmax = 36 V`.
- Pratik BVDSS sınıf notu: `>= 60 V`.
- Seçilen MOSFET: `BVDSS = 100 V`.
- `VGS = 7.5 V`.
- `RDS(on) ≈ 15 mOhm @ Tj = 25 C`.
- Sıcaklık katsayısı: `1.35`.
- `RDS(on)(75 C) ≈ 20.25 mOhm`.

Açık notlar:

- `>=60 V` sınıf notu, önceki `BVDSS > 1.25 * Vin,max` kuralını iptal etmez; biri pratik sınıf seçimi, diğeri alt sınır kuralıdır.
- `75 C` burada kayıp hesabına giden eski/ara çalışma varsayımıdır; final termal kapanış değildir.

## Pass 055 - Sayfa 108-109

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p108.jpg](../images/defter_full_pages/defter_p108.jpg)
- [defter_p109.jpg](../images/defter_full_pages/defter_p109.jpg)

Defter işaretleri:

- `W.107`: TI / Brett Barr `Understanding MOSFET Data Sheets, Part 6 - Thermal Impedance` kaynak sayfası deftere alınmıştır.
- `W.107`: kaynak sayfa MOSFET datasheet thermal information / thermal impedance parametrelerinin karıştırılmaması için kullanılır.
- `W.107`: `RthetaJA` junction-to-ambient termal empedans olarak okunur; tek mutlak paket sabiti gibi kullanılmaz.
- `W.107`: defterde temel ilişki `T_J = T_A + P_D * RthetaJA` olarak korunur.
- `W.107`: MOSFET tarafının belirlediği sabit iç parametrelerle paket/PCB/yerleşim tarafından belirlenen parametrelerin ayrılması gerektiği not edilir.
- `W.109`: `RthetaJA` paralel termal ağ olarak çizilir: `(RthetaJB + RthetaBA) || (RthetaJTop + RthetaTA)`.
- `W.109`: alt/PCB yolu `RthetaJB + RthetaBA` olarak, paket üstü/ortam yolu `RthetaJTop + RthetaTA` olarak ayrılır.
- `W.109`: PCB/alt pad yolu daha etkin olduğunda `RthetaJA` üzerinde baskın rolü board koşullarının oynadığı not edilir.
- `W.109`: heatsink bağlanırsa paket üstü yolun paralel termal direnç olarak modele eklenebileceği yazılır.
- `W.109`: tabloda `P_D`, `T_J`, `T_A`, `T_B`, `T_T`, `RthetaJB`, `RthetaBA`, `RthetaJTop`, `RthetaTA`, `RthetaJA` tanımları görünür.

Primary owner entegrasyonu:

- [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde `MOSFET Termal Yolu ve Datasheet Thermal Metrics`.
- Aynı dosyada `W.107`, `W.109`, `W.110`, `W.117` termal metrik okuma zinciri.

Kısa referans / owner dışı bağlantı:

- Bu pass [05](../05_mosfet_secimi_ve_dayanim_mantigi.md) dosyasındaki MOSFET seçim gerekçesini yeniden açmadı.
- Bu pass yeni MOSFET kayıp toplamı, yeni `T_J`, yeni `RthetaJA` veya final board sıcaklığı üretmedi.
- `RthetaJA` metriği, ölçüm/kart koşulundan kopuk final sıcaklık hesabı gibi kullanılmayacak.

Okunan ana sayısal / kavramsal izler:

- `T_J = T_A + P_D * RthetaJA`.
- `RthetaJA ≈ (RthetaJB + RthetaBA) || (RthetaJTop + RthetaTA)`.
- PCB / bottom thermal path: `RthetaJB + RthetaBA`.
- Paket üstü / top thermal path: `RthetaJTop + RthetaTA`.
- Board koşulları: PCB alanı, bakır, pad, airflow ve ölçüm düzeni.
- Heatsink varsa paket üstü yol paralel termal direnç olarak modele eklenebilir.

Açık notlar:

- Bu sayfalar kaynak/defter izi ve termal metrik okuma kuralıdır; final MOSFET junction sıcaklığı değildir.
- Son termal kapanışta `Rtheta`, `Psi`, board sıcaklığı ve ölçüm noktası aynı koşul setinde seçilecek.

## Pass 056 - Sayfa 110-111

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p110.jpg](../images/defter_full_pages/defter_p110.jpg)
- [defter_p111.jpg](../images/defter_full_pages/defter_p111.jpg)

Defter işaretleri:

- `W.110`: aynı MOSFET ve aynı exposed metal pad ile PCB bakır/pad alanı değişince `RthetaJA` ölçümünün değiştiği not edilir.
- `W.110`: `1 inch^2` 2-oz Cu koşulundaki `50 C/W` ve minimum pad alanındaki `115 C/W` karşılaştırması korunur.
- `W.110`: bu değerler final MOSFET sıcaklığı değil, datasheet termal metriğinin test/kart koşuluna bağlı okuma kuralıdır.
- `W.117`: `RthetaJA = 36.8 C/W`, `RthetaJC(top) = 28 C/W`, `RthetaJC(bot) = 2.1 C/W`, `RthetaJB = 11.8 C/W`, `PsiJT = 0.4 C/W`, `PsiJB = 11.7 C/W` listesi korunur.
- `W.117`: `PsiJT` ve `PsiJB`, thermocouple ile ölçüm yapılacaksa kullanılacak karakterizasyon parametreleri olarak işaretlenir.

Primary owner entegrasyonu:

- [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde `MOSFET Termal Yolu ve Datasheet Thermal Metrics`.
- Tam sayfa `p110`, mevcut `W.110` kırpımının yanına eklendi.
- Tam sayfa `p111`, mevcut `W.117` thermal metric listesinin yanına eklendi.

Kısa referans / owner dışı bağlantı:

- Bu pass [05](../05_mosfet_secimi_ve_dayanim_mantigi.md) dosyasındaki MOSFET seçim kriterlerini yeniden sahiplenmedi.
- Bu pass [04](../04_giris_kapasitorleri_ve_giris_agi.md) dosyasındaki giriş MLCC sıcaklık hesabını yeniden açmadı.
- Ölçüm/termal kapanış zinciri için asıl owner [06](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) olarak korunur.

Okunan ana sayısal / kavramsal izler:

- `RthetaJA = 50 C/W` @ `1 inch^2` 2-oz Cu.
- `RthetaJA = 115 C/W` @ minimum pad area, 2-oz Cu.
- `RthetaJA = 36.8 C/W`.
- `RthetaJC(top) = 28 C/W`.
- `RthetaJC(bot) = 2.1 C/W`.
- `RthetaJB = 11.8 C/W`.
- `PsiJT = 0.4 C/W`.
- `PsiJB = 11.7 C/W`.

Açık notlar:

- `50 C/W`, `115 C/W` ve `36.8 C/W` aynı koşul gibi birleştirilmedi; ilk iki değer ölçüm/PCB alanı karşılaştırması, `36.8 C/W` ise seçili MOSFET thermal metric listesi bağlamında tutuldu.
- Thermocouple ölçümü yapılırsa `PsiJT` / `PsiJB` kullanım noktası ayrıca netleştirilecek.

## Pass 057 - Sayfa 112-113

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p112.jpg](../images/defter_full_pages/defter_p112.jpg)
- [defter_p113.jpg](../images/defter_full_pages/defter_p113.jpg)

Defter işaretleri:

- `W.155`: TI `SLVAEQ9 - July 2020` application report kapak sayfası korunur.
- `W.155`: kaynak adı `An Accurate Approach for Calculating the Efficiency of a Synchronous Buck Converter Using the MOSFET Plateau Voltage`.
- `W.155`: kaynak; switching loss, inductor loss, input/output capacitor ESR loss ve other loss kalemlerini verim hesabına bağlamak için kullanılır.
- `W.155`: aynı kaynak MOSFET plateau voltage (`Vpl`) değerini farklı drain-source akımları için tahmin etme yöntemini içerir.
- `W.156`: toplam kayıp bütçesi sınıfları renkli işaretlenmiş olarak korunur: `P_switches`, `P_inductor`, `P_capacitors`, `P_other`.
- `W.156`: verim formülü `eta = Vo*Io / (Vo*Io + P_total_loss) * 100%` olarak korunur.

Primary owner entegrasyonu:

- [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde `Kayıp Bütçesinin Kapsamı`.
- Tam sayfa `p112`, mevcut `W.155` kaynak kapağı kırpımının yanına eklendi.
- Tam sayfa `p113`, mevcut `W.156` toplam kayıp/verim formülü kırpımının yanına eklendi.

Kısa referans / owner dışı bağlantı:

- MOSFET seçim trade-off'u [05](../05_mosfet_secimi_ve_dayanim_mantigi.md) dosyasında kalır; bu pass oradaki handoff'u büyütmedi.
- İndüktör kaybı owner bağlantısı [03](../03_bobin_ve_cikis_kapasitorleri.md) dosyasına gider.
- Kapasitör ESR/ripple kayıpları [03](../03_bobin_ve_cikis_kapasitorleri.md) ve [04](../04_giris_kapasitorleri_ve_giris_agi.md) dosyalarındaki owner sonuçlarıyla kapanır.
- Controller/driver/diğer kayıplar [06](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) dosyasında tutulur.

Okunan ana sayısal / kavramsal izler:

- Kaynak rapor: `SLVAEQ9 - July 2020`.
- `P_total_loss = P_switches + P_inductor + P_capacitors + P_other`.
- `eta = Vo*Io / (Vo*Io + P_total_loss) * 100%`.
- Kayıp sınıfları: switches, inductor, capacitors, other.
- Verim hesabının MOSFET plateau voltage (`Vpl`) doğruluğuyla ilişkisi.

Açık notlar:

- Bu pass yeni final efficiency, yeni MOSFET kaybı veya yeni termal kapanış sayısı üretmedi.
- `P_capacitors`, giriş ve çıkış kapasitörü ESR/ripple kayıplarını owner dosyalardan alacak; tek bir kapasitör kararı gibi birleştirilmeyecek.
- `P_other` içine controller, driver, PCB izi ve yardımcı kayıplar girerken çift sayım kontrolü yapılacak.

## Pass 058 - Sayfa 114-115

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p114.jpg](../images/defter_full_pages/defter_p114.jpg)
- [defter_p115.jpg](../images/defter_full_pages/defter_p115.jpg)

Defter işaretleri:

- `W.210`: synchronous buck kayıp bölgeleri görsel olarak ayrılır: MOSFET/switch bloğu, sense/diğer kayıp, indüktör ve giriş/çıkış kapasitörü ESR kayıpları.
- `W.210`: MOSFET kayıpları beş sınıfa ayrılır: switching loss, conduction loss, gate-drive loss, output-capacitance loss ve LS MOSFET body-diode loss.
- `W.210`: `MOSFET Switch Transition` şekli `VGS`, `VDS`, `IDS`, `VTH`, `VPL`, `QTH`, `QGS2`, `QGD` bölgeleriyle korunur.
- `W.210`: `P_switching` denklemi, aşağıdaki `W.153-W.154` pratik switching-loss hesaplarının kaynak denklemi olarak korunur.
- `W.162`: `G81 Fig.3` elle okunur; `t0-t4` gate-charge aralıkları, Miller plateau ve `QGD` şarj bölgesi açıklanır.
- `W.162`: `t3` bölgesinde `VDS` düşerken switching loss'un kritik olduğu not edilir.

Primary owner entegrasyonu:

- [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde `MOSFET Kayıp Mekanizmaları / Switching Loss Girdilerinin Toplanması`.
- Tam sayfa `p114`, switching-loss kaynak denklem ve kayıp sınıfları girişine eklendi.
- Tam sayfa `p115`, gate-charge zaman aralığı okuması olarak aynı bölümde korundu.

Kısa referans / owner dışı bağlantı:

- MOSFET seçim dosyası [05](../05_mosfet_secimi_ve_dayanim_mantigi.md), `VPL` / gate-charge davranışını seçim gerekçesi olarak kısa tutar; ayrıntılı switching-loss kapanışı [06](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) dosyasında kalır.
- Bobin ripple değeri [03](../03_bobin_ve_cikis_kapasitorleri.md) dosyasından switching-loss hesabına handoff olarak gelir.
- Kapasitör ESR/ripple kayıpları [03](../03_bobin_ve_cikis_kapasitorleri.md) ve [04](../04_giris_kapasitorleri_ve_giris_agi.md) owner sonuçlarıyla kapanır.

Okunan ana sayısal / kavramsal izler:

- MOSFET kayıp sınıfları: switching, conduction, gate-drive, output-capacitance, LS body-diode.
- Gate-charge bölgeleri: `QTH`, `QGS2`, `QGD`.
- Zaman bölgeleri: `t0`, `t1`, `t2`, `t3`, `t4`.
- Gerilim bölgeleri: `VTH`, `VPL`, `VGS`, `VDS`.
- Switching-loss denklemi `tr`, `toff`, `f_sw`, `Io` ve `Delta iLpp` ile ilişkilidir.

Açık notlar:

- Bu pass yeni `P_switching` sayısı üretmedi.
- `W.162` gate-charge okuması, `W.190` erken `tr/toff` kestirimi ve `W.153-W.154` pratik switching-loss hesaplarıyla aynı koşul setine çekilmeden birleştirilmeyecek.
- `QTH + QGS2` ve `QGD` ayrımı korunacak; Miller plateau bölgesi sıradan gate-charge toplamı gibi eritilmeyecek.

## Pass 059 - Sayfa 116-117

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p116.jpg](../images/defter_full_pages/defter_p116.jpg)
- [defter_p117.jpg](../images/defter_full_pages/defter_p117.jpg)

Defter işaretleri:

- `W.147`: MOSFET gate-driver turn-on procedure notu korunur.
- `W.147`: gate `0 V`tan `VTH` seviyesine yükselirken `Cgs` yükünün dolduğu, `Cgd` tarafına az akım aktığı ve bu aralığın turn-on delay olduğu yazılıdır.
- `W.147`: bu ilk aralıkta drain akımı / drain gerilimi belirgin değişmeden gate gerilimi threshold'a yaklaşır.
- `W.148`: `VGS` dalga şekli `t0-t4` aralıklarıyla çizilir; `QGS` ve `QGD` bölgeleri ayrılır.
- `W.148`: `VGS` threshold'u aştığında `ID` akımının akmaya başladığı, `VDS` düşüşünün `Cgd` dolmaya devam ettiği Miller bölgesinde belirginleştiği not edilir.

Primary owner entegrasyonu:

- [05_mosfet_secimi_ve_dayanim_mantigi.md](../05_mosfet_secimi_ve_dayanim_mantigi.md) içinde `Gate Sürme ve Switching Interval Bağlamı / W.147-W.149`.
- Tam sayfa `p116`, mevcut `W.147` küçük kırpımının yanına eklendi.
- Tam sayfa `p117`, mevcut `W.148` küçük kırpımının yanına eklendi.

Kısa referans / owner dışı bağlantı:

- Ayrıntılı switching-loss sayıları [06](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) dosyasında kalır.
- Bu pass [06](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içindeki `W.153-W.154` kayıp hesaplarını tekrar açmadı.
- Gate-charge davranışı burada seçim/datasheet okuma bağlamında; kayıp kapanışı ise 06 owner'ında tutulur.

Okunan ana sayısal / kavramsal izler:

- `VTH` / threshold geçişi.
- `Cgs` şarjı ve kısmi `Cgd` akımı.
- `QGS` ve `QGD` bölgeleri.
- `t0`, `t1`, `t2`, `t3`, `t4` turn-on zaman aralıkları.
- `ID` akımının threshold sonrasında başlaması.
- `VDS` düşüşünün Miller / `QGD` bölgesinde belirginleşmesi.

Açık notlar:

- Bu pass yeni `tr`, `tf`, `P_switching`, `Qgd`, `Qgs` veya gate direnci sayısı üretmedi.
- `W.147-W.148` dalga şekli açıklaması, `W.190` ve `W.153-W.154` sayısal hesaplarıyla aynı koşul setine çekilmeden final hesap gibi kullanılmayacak.

## Pass 060 - Sayfa 118-119

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p118.jpg](../images/defter_full_pages/defter_p118.jpg)
- [defter_p119.jpg](../images/defter_full_pages/defter_p119.jpg)

Defter işaretleri:

- `W.149`: `VPL` ve `VGS(th)` tahmini için TI `SLVAEQ9` kaynak sayfası korunur.
- `W.149`: doğru `tr` ve `toff` tahmininin `QGS2`, `QGD`, `VGS(th)` ve `VPL` doğruluğuna bağlı olduğu not edilir.
- `W.149`: `t0-t4` turn-on aralıkları tekrar kaynak metinle bağlanır; `t2-t3` aralığı Miller `Cgd` şarj / `VDS` düşüş bölgesidir.
- `W.149`: output-characteristic saturation zone koşulu `VGS > VGS(th)` ve `VDS > VGS - VGS(th)` olarak görünür.
- `W.150`: conduction loss formu `P_CON = RDS(on) * I_QSW(RMS)^2` olarak korunur.
- `W.150`: high-side conduction formu `RDS(on) * (VOUT/VIN) * (I_OUT^2 + I_RIPPLE^2/12)` olarak görünür.
- `W.150`: switching-loss enerji ilişkileri `Et1`, `Et2`, `P_SW`, `t1 = QGS2/IG`, `t2 = QGD/IG`, `IG = C*dv/dt`, `Q = C*V` olarak korunur.

Primary owner entegrasyonu:

- [05_mosfet_secimi_ve_dayanim_mantigi.md](../05_mosfet_secimi_ve_dayanim_mantigi.md) içinde `Gate Sürme ve Switching Interval Bağlamı / W.147-W.149`: tam sayfa `p118`.
- [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde `Kayıp Bütçesinin Kapsamı`: tam sayfa `p119`.

Kısa referans / owner dışı bağlantı:

- `VPL` / `VGS(th)` datasheet-okuma ve seçim bağlamı 05 dosyasında kalır.
- Conduction/switching loss denklemleri ve final kayıp kapanışı 06 dosyasında kalır.
- Bobin ripple terimi [03](../03_bobin_ve_cikis_kapasitorleri.md) owner sonucundan gelir.
- Global `VIN`, `VOUT`, `f_sw` ve duty bağlamı [01](../01_tasarim_girdileri_ve_kaynaklar.md) dosyasına bağlıdır.

Okunan ana sayısal / kavramsal izler:

- `VPL`, `VGS(th)`, `QGS2`, `QGD`.
- `t0-t1`, `t1-t2`, `t2-t3`, `t3-t4`.
- `iD = Kn * (VGS - VGS(th))^2` saturation-region ilişkisi kaynak sayfada görünür.
- `P_CON = RDS(on) * I_QSW(RMS)^2`.
- `P_SW = 2 * (Et1 + Et2) * f_SW`.
- `VGS(actual) ≈ 7.5 V` defter notu, LM5146 gate-drive bağlamı.

Açık notlar:

- Bu pass yeni final `VPL`, `VGS(th)`, `P_CON`, `P_SW`, `tr`, `toff`, `QGS2`, `QGD` veya efficiency sayısı üretmedi.
- `W.149` kaynak teorisi ile `W.190`, `W.153-W.154` ve `W.191-W.192` sayısal defter hesapları aynı koşul setinde tekrar eşleştirilecek.

## Pass 061 - Sayfa 120-121

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p120.jpg](../images/defter_full_pages/defter_p120.jpg)
- [defter_p121.jpg](../images/defter_full_pages/defter_p121.jpg)

Defter işaretleri:

- `W.124`: `2.2 Inductor Losses Calculation` ve `2.3 capacitor losses` bölümlerinin eksik kaldığı not edilir.
- `W.124`: ESR belirlenmediği için denklemlerin yazıldığı ve anlatıldığı, fakat ayrıntılı hesap yapılmadığı korunur.
- `W.124`: kayıp hesabında denklemler için `G81`, zaman/şekil sezgisi için `G90` kullanılacağı not edilir.
- `W.124`: özellikle G81'in `[5]`, `[6]`, `[3]` denklemlerindeki zamanlar için `G81 Fig.3` yerine `G90 Fig.4` ve `Fig.2` tarafına bakılacağı yazılıdır.
- `W.118`: `Et1 = (VDS * ID / 2) * t1` enerji ilişkisi birim kontrolüyle korunur.
- `W.118`: `Volt * Coulomb/saniye * saniye` ifadesinin enerjiye gittiği, `Joule = Watt * saniye` okuması not edilir.

Primary owner entegrasyonu:

- [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde `Kayıp Bütçesinin Kapsamı / Enerji, Güç ve Kayıp Sınıfları`.
- Tam sayfa `p121`, mevcut `W.118` enerji-birim kırpımının yanına eklendi.
- Tam sayfa `p120`, mevcut `W.124` metod kırpımının yanına eklendi.

Kısa referans / owner dışı bağlantı:

- Bobin kaybı final hesabı [03](../03_bobin_ve_cikis_kapasitorleri.md) owner sonucuna bağlı kalır.
- Kapasitör ESR/ripple kayıpları [03](../03_bobin_ve_cikis_kapasitorleri.md) ve [04](../04_giris_kapasitorleri_ve_giris_agi.md) owner sonuçlarıyla kapanır.
- MOSFET switching-loss hesapları [06](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde kalır; bu pass yalnız metod ve birim izini güçlendirdi.

Okunan ana sayısal / kavramsal izler:

- `2.2 Inductor Losses Calculation`.
- `2.3 capacitor losses`.
- `ESR` belirlenmediği için hesapların eksik kalması.
- `G81` denklemleri ve `G90` şekilleri ayrımı.
- `Et1 = (VDS * ID / 2) * t1`.
- `Joule = Watt * saniye`.

Açık notlar:

- Bu pass yeni bobin kaybı, kapasitör ESR kaybı, MOSFET switching loss veya verim sayısı üretmedi.
- `P_inductor` ve `P_capacitors` kalemleri final verim tablosuna eklenmeden önce owner dosyalardaki gerçek ESR/DCR/ripple koşullarıyla tamamlanacak.

## Pass 062 - Sayfa 122-123

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p122.jpg](../images/defter_full_pages/defter_p122.jpg)
- [defter_p123.jpg](../images/defter_full_pages/defter_p123.jpg)

Defter işaretleri:

- `W.119`: TI Analog Applications Journal içindeki MOSFET kayıp makalesinin ilk sayfası korunur.
- `W.119`: lineer regülatör, ideal switching regülatör ve buck içindeki kayıp katkıları aynı kaynak sayfada görünür.
- `W.128`: `Gate Threshold and Miller Plateau Voltages` başlığıyla `G81` hesap yönteminin kullanılacağı not edilir.
- `W.128`: `ID = Kn * (VGS - VGS(th))^2` ilişkisiyle `VGS(th) ≈ 3.906 V`, `Kn ≈ 10.034` ve `VPL ≈ 4.95 V` ara hesabı korunur.
- `W.128`: saturation koşulları `VGS >= VGS(th)` ve `VDS > VGS - VGS(th)` olarak yazılır.
- `W.128`: `TJ ≈ 73.9 C`, `VGS(th)/TJ = -8.5 mV/C` ve `-0.41565 V` threshold sıcaklık kayması izi korunur.

Primary owner entegrasyonu:

- [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde `Kayip Butcesinin Kapsami / Enerji, Guc ve Kayip Siniflari`: tam sayfa `p122`.
- [05_mosfet_secimi_ve_dayanim_mantigi.md](../05_mosfet_secimi_ve_dayanim_mantigi.md) içinde `Gate Surme ve Switching Interval Baglami / W.128`: tam sayfa `p123`.

Kısa referans / owner dışı bağlantı:

- `W.119` kaynak makalesi MOSFET kayıp mekanizmaları için 06 dosyasında kalır; MOSFET parça seçimi 05 dosyasına taşınmaz.
- `W.128` içindeki gate threshold / Miller plateau ara hesabı 05 dosyasında kalır; sıcaklık kayması yalnız termal owner olan 06 dosyasına kısa referansla bağlanır.
- Bu sayfalardaki değerler final verim, final switching-time veya final junction sıcaklığı olarak yeniden kullanılmadı.

Okunan ana sayısal / kavramsal izler:

- MOSFET loss contributor sınıfları: conduction, switching, gate-drive, bobin, PCB trace, control/feedback static loss.
- `VGS(th) ≈ 3.906 V`.
- `Kn ≈ 10.034`.
- `VPL ≈ 4.95 V`.
- `TJ ≈ 73.9 C`.
- `VGS(th)/TJ = -8.5 mV/C`.
- `Delta VGS(th) ≈ -0.41565 V`.

Açık notlar:

- `W.128` ara hesabı mevcut `W.149`, `W.153-W.154`, `W.162` ve `W.190` switching-loss zinciriyle aynı koşul setine çekilmeden final hesap gibi kullanılmayacak.
- `TJ ≈ 73.9 C` erken izi, 06 dosyasındaki `~76 C` termal izleriyle sessizce birleştirilmeyecek.

## Pass 063 - Sayfa 124-125

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p124.jpg](../images/defter_full_pages/defter_p124.jpg)
- [defter_p125.jpg](../images/defter_full_pages/defter_p125.jpg)

Defter işaretleri:

- `W.173`: `G88` gate threshold ve Miller plateau gerilimi devam notudur.
- `W.173`: `VGS(threshold)` ve `VGS(plateau)` gerilimlerinin MOSFET anahtarlama karakteristiğini etkilediği yazılır.
- `W.173`: datasheet'te değer doğrudan yoksa `G81 Fig.3` / transfer-characteristic üzerinden hesap yöntemi denenir.
- `W.173`: `gfs = dID/dVGS` ilişkisi not edilir; gate gerilimindeki küçük değişikliğin drain akımını nasıl artırdığını anlatır.
- `W.173`: `gfs` küçük-sinyal parametresi olduğu için büyük `Delta I` hesabında doğrudan final sayı gibi kullanılmaması gerektiği uyarısı korunur.
- `W.174`: `ID1 = K*(VGS1 - VTH)^2`, `ID2 = K*(VGS2 - VTH)^2` ve `VGS,miller = VTH + sqrt(Iload/K)` ilişkileri korunur.
- `W.174`: ara okuma `ID1 = 3 A`, `ID2 = 20 A`, `VGS1 ≈ 4.13 V`, `VGS2 ≈ 5.67 V`, `VTH ≈ 3.157 V`, `K ≈ 3.169`, `VGS,miller ≈ 4.413 V`.
- `W.174`: sıcaklık düzeltmesi için `-7 mV/C`, `150 C -> 100 C`, `+0.35 V`, `VGS,miller,düzeltilmiş ≈ 4.76 V`, `VTH,düzeltilmiş ≈ 3.51 V` izi korunur.

Primary owner entegrasyonu:

- [05_mosfet_secimi_ve_dayanim_mantigi.md](../05_mosfet_secimi_ve_dayanim_mantigi.md) içinde `Gate Surme ve Switching Interval Baglami / W.173-W.174`: tam sayfa `p124` ve `p125`.

Kısa referans / owner dışı bağlantı:

- [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde termal owner'a yalnız sıcaklık düzeltmesi notu bağlandı.
- `W.173-W.174` hesapları, `W.128` ara hesabını silmez; farklı koşul/okuma seti olarak birlikte görünür kalır.
- Switching-loss sayısal kapanışı yine 06 dosyasındaki `W.153-W.154`, `W.190` ve gate-charge zincirine bağlıdır.

Okunan ana sayısal / kavramsal izler:

- `gfs = dID/dVGS`.
- `ID1 = 3 A`, `ID2 = 20 A`.
- `VGS1 ≈ 4.13 V`, `VGS2 ≈ 5.67 V`.
- `VTH ≈ 3.157 V`.
- `K ≈ 3.169`.
- `VGS,miller ≈ 4.413 V`.
- `Delta Vadj ≈ +0.35 V`.
- `VGS,miller,düzeltilmiş ≈ 4.76 V`.
- `VTH,düzeltilmiş ≈ 3.51 V`.

Açık notlar:

- Bu pass yeni final `VTH`, `VMiller`, `K`, `gfs`, switching time veya kayıp sayısı üretmedi.
- `W.128`, `W.173-W.174`, `W.149`, `W.162`, `W.190` ve `W.153-W.154` aynı koşul setine çekilmeden birbirine sayısal final gibi bağlanmayacak.

## Pass 064 - Sayfa 126-127

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p126.jpg](../images/defter_full_pages/defter_p126.jpg)
- [defter_p127.jpg](../images/defter_full_pages/defter_p127.jpg)

Defter işaretleri:

- `W.175`: bizim MOSFET transfer eğrisinden iki nokta seçilerek `VTH`, `K` ve `VGS,miller` ara hesabı yapılır.
- `W.175`: noktaların saturasyon bölgesine girmeden önceki daha doğrusal bölgede seçildiği not edilir.
- `W.175`: `ID1 = 10 A`, `VGS1 ≈ 3.35 V`, `ID2 = 20 A`, `VGS2 ≈ 3.65 V`.
- `W.175`: `VTH ≈ 2.625 V`, `K ≈ 19.036`, `VGS,miller ≈ 3.3125 V`.
- `W.175`: `Tc ≈ 76.35 C`, grafik okuması `25 C`, sıcaklık katsayısı `-0.003 V/C`.
- `W.175`: `Delta Vadj ≈ -0.154 V`, `VTH,adj ≈ 2.471 V`, `VGS,miller,adj ≈ 3.1585 V`.
- `W.157`: TI `SLVAEQ9` içindeki `Vpl Calculator` örneği kaynak / çapraz teyit olarak korunur.
- `W.157`: kaynak örnekte `Kn = 13.51`, `VGS(th) = 3.72 V`, `Vplateau = 4.58 V`.
- `W.157`: kaynak örnekte ölçüm-hesap karşılaştırması `5.22 V / 4.58 V` ve `5.30 V / 4.94 V` olarak görünür.

Primary owner entegrasyonu:

- [05_mosfet_secimi_ve_dayanim_mantigi.md](../05_mosfet_secimi_ve_dayanim_mantigi.md) içinde `Gate Surme ve Switching Interval Baglami / W.175 ve W.157`: tam sayfa `p126` ve `p127`.

Kısa referans / owner dışı bağlantı:

- [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde termal owner'a yalnız `76.35 C`, `-0.003 V/C`, `-0.154 V` ve düzeltilmiş gerilim izleri bağlandı.
- `W.157` proje MOSFET final datasheet sonucu değildir; TI kaynak yönteminin örneğidir.
- `W.175` sonucu, `W.128` ve `W.174` ara sonuçlarını silmez; farklı okuma noktası / sıcaklık düzeltmesi olarak tutulur.

Okunan ana sayısal / kavramsal izler:

- `VTH ≈ 2.625 V`.
- `K ≈ 19.036`.
- `VGS,miller ≈ 3.3125 V`.
- `VTH,adj ≈ 2.471 V`.
- `VGS,miller,adj ≈ 3.1585 V`.
- TI kaynak örneği: `Kn = 13.51`, `VGS(th) = 3.72 V`, `Vplateau = 4.58 V`.

Açık notlar:

- Bu pass yeni final `VTH`, `VMiller`, `K`, switching time veya kayıp sayısı üretmedi.
- Defterdeki "deneyde doğrulama yap" notu gereği bu ara değerler gerçek gate dalga şekli ve devredeki çalışma koşullarıyla doğrulanmadan final kabul edilmeyecek.

## Pass 065 - Sayfa 128-129

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p128.jpg](../images/defter_full_pages/defter_p128.jpg)
- [defter_p129.jpg](../images/defter_full_pages/defter_p129.jpg)

Defter işaretleri:

- `W.158`: `Fig.7` / `ID-VDS` output-characteristic grafiği üzerinden `VGS(th)` ve `VGS,miller` tahmin yöntemi sürdürülür.
- `W.158`: defter üst notu bu grafiğin `G88` belgesinden farklı grafik olduğunu belirtir.
- `W.158`: seçilen noktalar `ID1 ≈ 123 A`, `VGS1 = 6 V`, `VDS = 3 V`; `ID2 ≈ 59 A`, `VGS2 = 4.5 V`, `VDS = 3 V`.
- `W.158`: `VGS(th) ≈ 1.12 V`, `Kn ≈ 5.1649`, `VPL ≈ 2.44 V` ara hesabı korunur.
- `W.159`: gate sürücü / MOSFET eşdeğer çizimi korunur.
- `W.159`: çizimde `RHI`, `RLO`, harici `Rgate`, iç `RGI`, `Cgd`, `Cgs`, `VDS(off)` ve `ID` yolları görünür.

Primary owner entegrasyonu:

- [05_mosfet_secimi_ve_dayanim_mantigi.md](../05_mosfet_secimi_ve_dayanim_mantigi.md) içinde `Gate-drive, Qg/Qgd ve Miller Baglami / W.159`: tam sayfa `p129`.
- [05_mosfet_secimi_ve_dayanim_mantigi.md](../05_mosfet_secimi_ve_dayanim_mantigi.md) içinde `Gate Surme ve Switching Interval Baglami / W.158`: tam sayfa `p128`.

Kısa referans / owner dışı bağlantı:

- Gate-drive kayıp ve bootstrap sayısal kapanışı [06](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) dosyasında kalır.
- `W.159` bu sayısal kapanışın devre yolu / model izi olarak 05'te tutulur.
- `W.158`, `W.128`, `W.174` ve `W.175` ara sonuçları tek final `VTH/VPL` değeri gibi birleştirilmedi.

Okunan ana sayısal / kavramsal izler:

- `ID1 ≈ 123 A`, `VGS1 = 6 V`, `VDS = 3 V`.
- `ID2 ≈ 59 A`, `VGS2 = 4.5 V`, `VDS = 3 V`.
- `VGS(th) ≈ 1.12 V`.
- `Kn ≈ 5.1649`.
- `VPL ≈ 2.44 V`.
- Gate-drive eşdeğer yolu: `RHI/RLO`, `Rgate`, `RGI`, `Cgd`, `Cgs`, `VDS(off)`, `ID`.

Açık notlar:

- Bu pass yeni final `VTH`, `VPL`, `Kn`, switching time, gate direnci veya kayıp sayısı üretmedi.
- `W.158`teki nokta seçimi yüksek akım ve farklı grafik koşulu içerdiğinden önceki `VTH/VPL` aileleriyle aynı koşula çekilmeden kullanılmayacak.

## Pass 066 - Sayfa 130-131

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p130.jpg](../images/defter_full_pages/defter_p130.jpg)
- [defter_p131.jpg](../images/defter_full_pages/defter_p131.jpg)

Defter işaretleri:

- `W.129`: datasheet koşulu olarak `Qg(total) = 20 nC @ VGS = 10 V`, `VDS = 50 V`, `IDS = 20 A` not edilir.
- `W.129`: `QGS ≈ 6.4 nC`, `QGD ≈ 6.5 nC` izleri korunur.
- `W.129`: bizim gate sürüşümüzün `VGS = 10 V` değil yaklaşık `7.5 V` olduğu yazılır.
- `W.129`: bu nedenle `Qg` değerinin `Fig.6` gate-charge grafiğinden okunması gerektiği not edilir.
- `W.129`: `Qg(total) ≈ 16 nC` ara/çalışma hattı korunur.
- `W.129`: Miller charge için `QGD = CGD * VDS = 54 pF * 22 V ≈ 1.2 nC` hesabı korunur.
- `W.164`: gate charge'ın MOSFET'i açıp kapatmak için gate'e aktarılması gereken yük olduğu yazılır.
- `W.164`: bu yükün gate-source ve gate-drain sığalarını doldurmak için gerektiği not edilir.
- `W.164`: `Q = C * V` ilişkisi yazılır; ancak MOSFET kapasitanslarının çoğunlukla sabit olmadığı uyarısı korunur.
- `W.164`: `Fig.6` grafiğinde dikey eksenin `VGS`, yatay eksenin `Qg(nC)` olduğu ve farklı gate-drive gerilimleri için toplam `Qg` tahmini yaptığı not edilir.

Primary owner entegrasyonu:

- [05_mosfet_secimi_ve_dayanim_mantigi.md](../05_mosfet_secimi_ve_dayanim_mantigi.md) içinde `Gate-drive, Qg/Qgd ve Miller Baglami / W.129 ve W.164`: tam sayfa `p130` ve `p131`.

Kısa referans / owner dışı bağlantı:

- [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde gate-drive kaybı / bootstrap hesabına yalnız `Qg ≈ 16 nC` handoff referansı eklendi.
- `20 nC @ 10 V`, `12.2 nC`, `16 nC` ve `1.2 nC QGD` aynı büyüklük gibi karıştırılmadı; her biri koşuluyla tutuldu.

Okunan ana sayısal / kavramsal izler:

- `Qg(total) = 20 nC @ VGS = 10 V`.
- `QGS ≈ 6.4 nC`.
- `QGD ≈ 6.5 nC`.
- Bizim gate-drive seviyesi: yaklaşık `7.5 V`.
- `Qg(total) ≈ 16 nC` çalışma hattı.
- `QGD ≈ 54 pF * 22 V ≈ 1.2 nC`.
- `Q = C * V`.

Açık notlar:

- Bu pass yeni final `Qg`, `QGD`, gate-drive gücü, switching süresi veya bootstrap değeri üretmedi.
- Defterdeki "MOS kaç ns içinde anahtarlanabilecek?" ve "ne kadar gate-drive gücü tüketilecek?" soruları 06 dosyasındaki gate-drive loss / switching-time kapanışına bağlı kalır.

## Pass 067 - Sayfa 132-133

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p132.jpg](../images/defter_full_pages/defter_p132.jpg)
- [defter_p133.jpg](../images/defter_full_pages/defter_p133.jpg)

Defter işaretleri:

- `W.130`: `Ciss`, `Coss`, `Crss` datasheet kapasitansları ve ölçüm koşulları korunur.
- `W.130`: `Ciss,spec ≈ 1300 pF`, `Coss,spec ≈ 260 pF`, `Crss,spec ≈ 18 pF`.
- `W.130`: koşul `VGS = 0 V`, `f = 1 MHz`, `VDS = 50 V`.
- `W.130`: `Crss,ave ≈ 2 * 18 pF * sqrt(50 V / 22 V) ≈ 54 pF`.
- `W.130`: `Coss,ave ≈ 2 * 260 pF * sqrt(50 V / 22 V) ≈ 783 pF`.
- `W.130`: `Cgd = Crss,ave ≈ 54 pF`.
- `W.130`: `Cgs ≈ 1300 pF - 18 pF ≈ 1282 pF`.
- `W.130`: `Cds ≈ 783 pF - 54 pF ≈ 729 pF`.
- `p133 / W.155?`: yüksek `VDS,off ≈ 380 V` bağlamında ayrı bir kapasitans ölçekleme örneği korunur.
- `p133`: `ID ≈ 5 A`, `Tj ≈ 100 C`, `Rgate ≈ 5 ohm`, `RLO = RHI ≈ 5 ohm`.
- `p133`: `ID,max ≈ 9 A + 3.8 A / 2 ≈ 10.9 A ≈ 11 A` notu korunur.
- `p133`: `Ciss ≈ 2600 pF`, `Coss ≈ 720 pF`, `Crss ≈ 340 pF`, koşul `VGS = 0 V`, `VDS = 25 V`, `f = 1 MHz`.
- `p133`: `Crss,ave ≈ 2 * 340 pF * sqrt(25 V / 380 V) ≈ 174 pF`.
- `p133`: `Coss,ave ≈ 2 * 720 pF * sqrt(25 V / 380 V) ≈ 369 pF`.
- `p133`: `Cgs ≈ 2600 pF - 340 pF ≈ 2260 pF`; sayfa özellikle ortalama değer kullanılmadığını not eder.

Primary owner entegrasyonu:

- [05_mosfet_secimi_ve_dayanim_mantigi.md](../05_mosfet_secimi_ve_dayanim_mantigi.md) içinde `Parazitik Kapasitanslar ve FOM İzleri`: tam sayfa `p132` ve `p133`.

Kısa referans / owner dışı bağlantı:

- [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde switching-loss / `Coss` hesabına yalnız kısa handoff notu eklendi.
- `p133`teki `380 V` hattı mevcut `22 V` buck çalışma noktasıyla tek final kapasitans seti gibi birleştirilmedi.

Okunan ana sayısal / kavramsal izler:

- `Ciss,spec ≈ 1300 pF`, `Coss,spec ≈ 260 pF`, `Crss,spec ≈ 18 pF`.
- `Crss,ave ≈ 54 pF`.
- `Coss,ave ≈ 783 pF`.
- `Cgd ≈ 54 pF`.
- `Cgs ≈ 1282 pF`.
- `Cds ≈ 729 pF`.
- Yüksek `VDS,off` örnek hattı: `380 V`, `174 pF`, `369 pF`, `2260 pF`.

Açık notlar:

- Bu pass yeni final `Ciss/Coss/Crss`, `Cgd`, `Cgs`, `Cds`, `Qgd`, `Coss` kaybı veya switching-time değeri üretmedi.
- `VDS≈22 V`, `VDS,off≈380 V` ve `W.163` küçük kapasitans hattı aynı koşulun cevapları değildir; final kapanışta hangi kapasitans ailesi kullanılacaksa `VDS`, `Tj`, gate-drive ve datasheet grafiği aynı setten seçilecek.

## Pass 068 - Sayfa 134-135

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p134.jpg](../images/defter_full_pages/defter_p134.jpg)
- [defter_p135.jpg](../images/defter_full_pages/defter_p135.jpg)

Defter işaretleri:

- `W.132`: `Tj = Tcase + Ploss * RthetaJC` ilişkisi korunur.
- `W.132`: `Tcase ≈ 73.9 C`, `Ploss ≈ 1.29 W`, `RthetaJC ≈ 1.6 C/W`.
- `W.132`: `Tj ≈ 75.964 C ≈ 76 C`.
- `W.132`: `ID ≈ 9 A + 3.8 A / 2 ≈ 11 A`.
- `W.132`: `VDS ≈ 36 V - 14 V ≈ 22 V`.
- `W.132`: `Vdrive = VCC ≈ 7.5 V`.
- `W.132`: `Rgate = R3 = 2.2 ohm = RBST` gibi görünen not, "yanlış olabilir" uyarısıyla korunur.
- `W.132`: G88/G32 isimlendirme eşlemesi: `RHI ≈ RHO-up / RLO-up ≈ 1.5 ohm`; gate'i `Vdrive/VCC` tarafına çeken pull-up / sürme yolu.
- `W.132`: `RLO ≈ RHO-down / RLO-down ≈ 0.9 ohm`; gate'i `GND` tarafına çeken pull-down / söndürme yolu.
- `W.177`: `Rtotal = Rdriver + RG,external + RG,internal`.
- `W.177`: `RG,external ≈ 0 ohm`.
- `W.177`: `RG,internal ≈ 0.5-1 ohm` aralığı; hesapta yaklaşık `0.7 ohm` alınır.
- `W.177`: tutucu driver direnci `Rdriver ≈ 1.5 ohm`.
- `W.177`: `Rtotal ≈ 1.5 ohm + 0 ohm + 0.7 ohm ≈ 2.2 ohm`.

Primary owner entegrasyonu:

- [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde `W.163` alternatif parametre setinin hemen yanında tam sayfa `p134` ve `p135`.

Kısa referans / owner dışı bağlantı:

- MOSFET seçim dosyası [05](../05_mosfet_secimi_ve_dayanim_mantigi.md) büyütülmedi; gate-yolu direnci ve termal/kayıp kapanışı primary olarak [06](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde kaldı.
- `Rgate/RBST/Rboot` isim karışıklığı bootstrap bölümündeki `Rboot = 2.2 ohm` açık kontrolüne bağlandı.

Okunan ana sayısal / kavramsal izler:

- `Tj ≈ 75.964 C ≈ 76 C`.
- `RthetaJC ≈ 1.6 C/W` bu sayfadaki iz; önceki `1.9 C/W` iziyle sessizce birleştirilmedi.
- `ID ≈ 11 A`.
- `VDS ≈ 22 V`.
- `Vdrive ≈ 7.5 V`.
- `RHI ≈ 1.5 ohm`, `RLO ≈ 0.9 ohm`.
- `RG,external ≈ 0 ohm`, `RG,internal ≈ 0.7 ohm`.
- `Rtotal ≈ 2.2 ohm`.

Açık notlar:

- Bu pass yeni final gate direnci, final switching time, final bootstrap direnci veya final `Tj` üretmedi.
- `2.2 ohm` hem gate-yolu toplam direnci hem de bootstrap/RBST notu olarak göründüğü için reference designator ve fiziksel eleman bazında ayrıca kapanacak.
- `RthetaJC ≈ 1.6 C/W` ve `RthetaJC ≈ 1.9 C/W` aynı final termal modelde koşulları netleşmeden birleştirilmeyecek.

## Pass 069 - Sayfa 136-137

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p136.jpg](../images/defter_full_pages/defter_p136.jpg)
- [defter_p137.jpg](../images/defter_full_pages/defter_p137.jpg)

Defter işaretleri:

- `W.152`: bobin ripple formülü switching-loss girdisi olarak tekrar kullanılır.
- `W.152`: `Delta_ILpp,max ≈ (36 V - 14 V) / 6.8 uH * 14 V / 36 V * 1 / 332 kHz ≈ 3.8 A`.
- `W.152`: `Delta_ILpp,min ≈ (24 V - 14 V) / 6.8 uH * 14 V / 24 V * 1 / 332 kHz ≈ 2.6 A`.
- `W.152`: MOSFET switching-loss giriş seti tekrar listelenir: `Crss,ave ≈ 54 pF = CGD`, `Coss,ave ≈ 783 pF`, `CGS ≈ 1282 pF`, `CDS ≈ 729 pF`.
- `W.152`: `Qg(total) ≈ 16 nC`, `Vdrive ≈ 7.5 V`.
- `W.152`: `Rgate,internal ≈ 1 ohm`, `Rpull-down ≈ 0.9 ohm`, `Rgate ≈ 2.2 ohm`.
- `W.152`: `QGD(Miller) ≈ CGD * VDS ≈ 54 pF * 22 V ≈ 1.2 nC`.
- `W.152`: `VGS(thres) ≈ 3.49 V`, `VGSmiller ≈ 4.535 V`.
- `W.152`: `Qgs2 ≈ Cgs * (Vmiller - VGS(th)) ≈ 1282 pF * (4.535 - 3.49 V) ≈ 1.34 nC`.
- `W.161`: `Miller charge = Qgd = Crss,ave * DeltaVDS` ilişkisi tekrar yazılır.
- `W.161`: `Qgd ≈ 11.21 pF * 22 V ≈ 246.62 pC ≈ 0.24662 nC`.
- `W.161`: defter bu değeri G81 Fig.3 ile karşılaştırınca çok küçük bulur; bunun switching-loss penceresi / Miller plateau yorumu için açık kontrol olduğu yazılır.

Primary owner entegrasyonu:

- [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde `W.152` switching-loss giriş parametreleri ve `W.161` `Qgd` sanity-check altına tam sayfa `p136` ve `p137`.

Kısa referans / owner dışı bağlantı:

- Bobin ripple denkleminin primary sahibi [03](../03_bobin_ve_cikis_kapasitorleri.md) olarak kaldı; [06](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde yalnız switching-loss girdisi olarak kullanıldı.
- Kapasitans dönüşümünün primary izi [05](../05_mosfet_secimi_ve_dayanim_mantigi.md) / `W.130` altında kaldı; burada gate/switching hesabına giren değerler kullanıldı.

Okunan ana sayısal / kavramsal izler:

- `Delta_ILpp,max ≈ 3.8 A`, `Delta_ILpp,min ≈ 2.6 A`.
- `Crss,ave ≈ 54 pF`, `Coss,ave ≈ 783 pF`, `CGS ≈ 1282 pF`, `CDS ≈ 729 pF`.
- `Qg(total) ≈ 16 nC`.
- `Vdrive ≈ 7.5 V`.
- `Rgate,internal ≈ 1 ohm`, `Rpull-down ≈ 0.9 ohm`, `Rgate ≈ 2.2 ohm`.
- `QGD ≈ 1.2 nC` ana çalışma hattı.
- `Qgs2 ≈ 1.34 nC`.
- Alternatif / çok küçük `Qgd ≈ 0.24662 nC`.

Açık notlar:

- Bu pass yeni final `Qgd`, `Qgs2`, switching-time, gate direnci veya switching-loss değeri üretmedi.
- `Qgd ≈ 1.2 nC` ve `Qgd ≈ 0.24662 nC` aynı final cevap gibi birleştirilmeyecek.
- `Rgate ≈ 2.2 ohm` burada gate-yolu shorthand'i olarak kaldı; bootstrap `Rboot/RBST` ile fiziksel olarak karışmayacak.

## Pass 070 - Sayfa 138-139

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p138.jpg](../images/defter_full_pages/defter_p138.jpg)
- [defter_p139.jpg](../images/defter_full_pages/defter_p139.jpg)

Defter işaretleri:

- `p138 / W.163`: `ID,max ≈ 9 A + 3.8 A / 2 ≈ 11 A` notu tekrar görünür.
- `p138 / W.163`: `Vdrive = VCC ≈ 7.5 V`.
- `p138 / W.163`: `RLO-down ≈ 0.9 ohm`, `RHI / pull-up ≈ 1.5 ohm`.
- `p138 / W.163`: `VDS ≈ 36 V - 14 V ≈ 22 V`.
- `p138 / W.163`: MOSFET `Tj` hesabı için `Tj = Tcase + Ploss * RthetaJC`.
- `p138 / W.163`: EVM ölçüm bağlamı olarak `Iout ≈ 8 A`, `Vin ≈ 48 V`; bizim bağlam olarak `Iout,max ≈ 9 A`, `Vin,max ≈ 36 V` not edilir.
- `p138 / W.163`: `Tcase ≈ 73.9 C`, `Ploss,mos,total ≈ 1.29 W`, `RthetaJC ≈ 1.9 C/W`.
- `p138 / W.163`: `Tj ≈ 73.9 C + 1.29 W * 1.9 C/W ≈ 76.35 C`.
- `p138 / W.163`: tam sayfa kapasitans okuması `Ciss ≈ 885 pF`, `Coss ≈ 168 pF`, `Crss ≈ 4.8 pF`.
- `p138 / W.163`: `Crss,ave ≈ 2 * 4.8 pF * sqrt(30 V / 22 V) ≈ 11.21 pF`.
- `p138 / W.163`: `Coss,ave ≈ 2 * 168 pF * sqrt(30 V / 22 V) ≈ 392 pF`.
- `p138 / W.163`: `Cgs ≈ 885 pF - 4.8 pF ≈ 880.2 pF`.
- `p139 / W.190`: `tr = t1 + t2` ve `toff = t3 + t4` erken charge-parçalı zaman hesabı açılır.
- `p139 / W.190`: `Rdrive = Rgate,internal + Rpull-down ≈ 1 + 0.9 ≈ 1.9 ohm`.
- `p139 / W.190`: `Rg = harici gate direnci ≈ 2.2 ohm`.
- `p139 / W.190`: `Qgs2 ≈ 1.34 nC`, `Qgd ≈ 1.2 nC`, `Vdrive ≈ 7.5 V`, `Vmiller ≈ 4.535 V`, `VGS(th) ≈ 3.49 V`.
- `p139 / W.190`: `tr ≈ 3.23 ns`, `toff ≈ 2.66 ns`.

Primary owner entegrasyonu:

- [05_mosfet_secimi_ve_dayanim_mantigi.md](../05_mosfet_secimi_ve_dayanim_mantigi.md) içinde `W.163` parazitik kapasitans izine tam sayfa `p138` eklendi.
- [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde `W.163` alternatif parametre seti ve `W.190` erken `tr/toff` hesabı altına tam sayfa `p138` ve `p139` eklendi.

Kısa referans / owner dışı bağlantı:

- Kapasitans okumasının seçim / datasheet tarafı [05](../05_mosfet_secimi_ve_dayanim_mantigi.md) içinde tutuldu; switching-time ve termal/kayıp sonucu [06](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde kaldı.
- `p138`teki EVM ölçüm bağlamı, final termal ölçüm gibi yazılmadı; `Tcase` girdisinin nereden geldiğini gösteren tasarım izi olarak kaldı.

Okunan ana sayısal / kavramsal izler:

- `Tcase ≈ 73.9 C`, `Ploss ≈ 1.29 W`, `RthetaJC ≈ 1.9 C/W`, `Tj ≈ 76.35 C`.
- `Ciss ≈ 885 pF`, `Coss ≈ 168 pF`, `Crss ≈ 4.8 pF`.
- `Crss,ave ≈ 11.21 pF`, `Coss,ave ≈ 392 pF`, `Cgs ≈ 880.2 pF`.
- `Rdrive ≈ 1.9 ohm`, `Rg ≈ 2.2 ohm`.
- `tr ≈ 3.23 ns`, `toff ≈ 2.66 ns`.

Açık notlar:

- `Ciss ≈ 835 pF / Coss ≈ 16.8 pF / Coss,ave ≈ 39.2 pF / Cgs ≈ 830.2 pF` önceki kısa kırpım okuması ile `p138` tam sayfa okuması çelişir; sessizce birleştirilmedi.
- `RthetaJC ≈ 1.6 C/W` ve `1.9 C/W` izleri koşulları netleşmeden tek final değer yapılmadı.
- `tr ≈ 3.23 ns / toff ≈ 2.66 ns`, pratik switching-loss hesabındaki `tr ≈ 32.5 ns / tf ≈ 20.63 ns` setini iptal etmez; eski/erken iterasyon olarak kalır.

## Pass 071 - Sayfa 140-141

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p140.jpg](../images/defter_full_pages/defter_p140.jpg)
- [defter_p141.jpg](../images/defter_full_pages/defter_p141.jpg)

Defter işaretleri:

- `p140 / W.153`: `Vin = 24 V`, `Delta_ILpp = 2.6 A`.
- `p140 / W.153`: high-side switching overlap formülü yazılır:
  `P_switching = Vin/2 * (I0 - Delta_ILpp/2) * fsw * tr + Vin/2 * (I0 + Delta_ILpp/2) * fsw * toff`.
- `p140 / W.153`: yerine koyma satırında `I0 = 9 A`, `fsw = 332 kHz`, `tr ≈ 3.23 ns`, `toff ≈ 2.66 ns` izi görünür.
- `p140 / W.153`: sonuç defterde `P_switching = 208.2 mW` olarak yazılır.
- `p141 / W.154`: `Vin = 36 V`, `Delta_ILpp = 3.8 A`.
- `p141 / W.154`: aynı formül `P_switching = 310.3 mW` sonucuyla taşınır.
- `p141 / W.154`: off-on / on-off transition sırasında MOSFET switching kaybının oluştuğu açıklanır.
- `p141 / W.154`: bazı kaynakların iki transition kaybını eşit kabul edebildiği; bu defter denkleminde açılma tarafında `I0 - Delta_ILpp/2`, kapanma tarafında `I0 + Delta_ILpp/2` akım uçlarının kullanıldığı not edilir.
- `p141 / W.154`: `tr` ve `toff` sürelerinin doğru belirlenmesinin `Qgs2`, `Qgd`, `VGS(th)`, `VPL` ve gate-yolu parametrelerine bağlı olduğu yazılır.

Primary owner entegrasyonu:

- [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde `Switching Overlap Loss` owner'ına tam sayfa `p140` ve `p141` eklendi.

Kısa referans / owner dışı bağlantı:

- Bobin ripple / `Delta_ILpp` değerlerinin primary sahibi [03](../03_bobin_ve_cikis_kapasitorleri.md) olarak kaldı; [06](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde yalnız switching-loss girdisi olarak kullanıldı.
- Gate-charge ve MOSFET seçim parametrelerinin primary okuması [05](../05_mosfet_secimi_ve_dayanim_mantigi.md) ile bağlantılı kaldı; [06](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde kayıp hesabına etkisi korunur.

Okunan ana sayısal / kavramsal izler:

- `Vin = 24 V`, `Delta_ILpp = 2.6 A`, `P_switching = 208.2 mW`.
- `Vin = 36 V`, `Delta_ILpp = 3.8 A`, `P_switching = 310.3 mW`.
- `tr ≈ 3.23 ns`, `toff ≈ 2.66 ns` izi p140/p141 içinde görünür.
- Off-on ve on-off geçişleri için akım uçları aynı kabul edilmez; `I0 - Delta_ILpp/2` ve `I0 + Delta_ILpp/2` ayrımı korunur.

Açık notlar:

- `p140` içindeki `3.23 ns / 2.66 ns` yerine koyma izi, aynı `208.2 mW` sonucunu veren önceki `tr ≈ 32.5 ns / tf ≈ 20.63 ns` pratik setiyle sessizce birleştirilmedi.
- Bu pass, `208.2 mW` veya `310.3 mW` değerlerini final toplam MOSFET kaybı yapmaz; bunlar yalnız high-side switching overlap parçasıdır.
- `tr/toff` doğrulaması, `Qgs2`, `Qgd`, `VGS(th)`, `VPL`, gate yolu ve driver akımı aynı koşul setine çekilmeden kapatılmayacak.

## Pass 072 - Sayfa 142-143

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p142.jpg](../images/defter_full_pages/defter_p142.jpg)
- [defter_p143.jpg](../images/defter_full_pages/defter_p143.jpg)

Defter işaretleri:

- `p142 / W.191`: `Conduction Loss Calculation` başlığı altında MOSFET iletim kaybının `on-resistance` ve MOSFET üzerinden geçen akımın RMS değeriyle belirlendiği yazılır.
- `p142 / W.191`: `RDS(on)` sıcaklık bağı `delta` ile temsil edilir; MOSFET ısındıkça `RDS(on)` artar.
- `p142 / W.191`: bu hesabın power MOSFET conduction-loss bağlamında yapıldığı not edilir.
- `p142 / W.191`: sıcak değer izi korunur: `RDS(on)(TJ = 75 C) = RDS(on)(TJ = 25 C) x 1.35`.
- `p142 / W.191`: `20.25 mOhm = 15 mOhm x 1.35`.
- `p142 / W.191`: high-side conduction formülü duty payı `D` ile kurulur.
- `p142 / W.191`: `Vin = 36 V`, `Delta_ILpp = 3.8 A`, `D = 14 V / 36 V` koşulunda `P_HS,conduction = 646.4 mW`.
- `p142 / W.191`: `Vin = 24 V`, `Delta_ILpp = 2.6 A`, `D = 14 V / 24 V` koşulunda `P_HS,conduction = 963.5 mW`.
- `p143 / W.192`: `Conduction loss devam` ve `Lowside MOSFET'in iletim kaybı` başlığıyla low-side hesabı açılır.
- `p143 / W.192`: low-side formülünde high-side'dan farklı olarak duty payı `(1-D)` kullanılır.
- `p143 / W.192`: `Vin = 36 V`, `Delta_ILpp = 3.8 A` koşulunda `P_LS,conduction = 1.017 W`.
- `p143 / W.192`: `Vin = 24 V`, `Delta_ILpp = 2.6 A` koşulunda `P_LS,conduction = 0.688 W`.

Primary owner entegrasyonu:

- [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde `High-side ve Low-side Conduction Loss` altına tam sayfa `p142` ve `p143` eklendi.

Kısa referans / owner dışı bağlantı:

- Duty ailesinin primary sahibi [02](../02_startup_pin_programlama_ve_ortak_sabitler.md) olarak kaldı; [06](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde yalnız kayıp hesabındaki duty payı olarak kullanıldı.
- MOSFET seçimi / datasheet `RDS(on)` okuması [05](../05_mosfet_secimi_ve_dayanim_mantigi.md) ile bağlantılı kalır; burada termal/kayıp sonucu kapatılır.

Okunan ana sayısal / kavramsal izler:

- `RDS(on)(75 C) ≈ 20.25 mOhm = 15 mOhm x 1.35`.
- `P_HS,conduction @ Vin = 36 V ≈ 646.4 mW`.
- `P_HS,conduction @ Vin = 24 V ≈ 963.5 mW`.
- `P_LS,conduction @ Vin = 36 V ≈ 1.017 W`.
- `P_LS,conduction @ Vin = 24 V ≈ 0.688 W`.

Açık notlar:

- Bu pass yeni MOSFET toplam kayıp tablosu üretmedi; yalnız conduction-loss tam sayfa izlerini mevcut owner'a bağladı.
- `36 V` ve `24 V` koşulları duty payları farklı olduğu için ayrı kalır; high-side ve low-side sonuçları tek koşul gibi birleştirilmeyecek.
- `RDS(on)` sıcaklık çarpanı, final termal kapanışta gerçek `TJ`, gate-drive gerilimi ve datasheet koşuluyla tekrar eşleştirilecek.

## Pass 073 - Sayfa 144-145

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p144.jpg](../images/defter_full_pages/defter_p144.jpg)
- [defter_p145.jpg](../images/defter_full_pages/defter_p145.jpg)

Defter işaretleri:

- `p144 / W.193`: `Gate drive loss = P_gate-drive = (Qg * Vdrive) * fsw` formülü yazılır.
- `p144 / W.193`: birim izi korunur: enerji `Joule`, `Joule * 1/saniye = Watt`.
- `p144 / W.193`: `Qg = 16 nC`, `Vdrive = 7.5 V`, `fsw = 332 kHz`.
- `p144 / W.193`: tek MOSFET için `P_gate-drive1 = 39.84 mW`.
- `p144 / W.193`: bu kaybın MOSFET gate'ini charge/decharge etmek için harcanan enerjiden kaynaklandığı yazılır.
- `p144 / W.193`: yüksek frekans ve büyük MOSFETlerde gate-drive kaybının belirgin hale gelebileceği not edilir.
- `p144 / W.193`: düşük `RDS(on)` için daha büyük MOSFET kullanmanın `Qg` tarafını büyütebileceği ve seçimin buna göre dengelenmesi gerektiği not edilir.
- `p144 / W.193`: aynı gate-drive loss'un low-side FET için de geçerli olduğu yazılır.
- `p144 / W.193`: iki FET toplamı `P_gate-drive-loss = 2 * 39.84 mW = 79.68 mW`.
- `p145 / W.194`: gate sürücüsünün harcadığı enerjinin MOSFET gate capacitance'ını şarj etmek için akan akımla oluştuğu yazılır.
- `p145 / W.194`: akımın dirençler üzerinden geçerken ısı kaybı ürettiği; dirençler olmasaydı bu paylaşımın farklı olacağı not edilir.
- `p145 / W.194`: gate-drive sırasında harcanan toplam enerjinin üç direnç üzerinde paylaşıldığı, yani kaybın apportioned olduğu yazılır.
- `p145 / W.194`: `Rgate` / iç gate direnci yaklaşık `1 ohm` gibi okunur.
- `p145 / W.194`: driver tarafı için pull-up / pull-down dirençlerin ortalaması gibi bir not korunur: `Rdriver ≈ (1.5 ohm + 0.9 ohm) / 2 ≈ 1.2 ohm`.
- `p145 / W.194`: harici gate direnci `Rgate,external = 2.2 ohm`; bunun bizim koyduğumuz, kontrol edilebilir direnç olduğu yazılır.
- `p145 / W.194`: direnç büyük olan yolun daha fazla ısıl pay taşıyacağı ve PCB üzerindeki harici `Rgate`in termal olarak ayrıca okunması gerektiği not edilir.

Primary owner entegrasyonu:

- [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde `Gate-drive Loss` altına tam sayfa `p144` ve `p145` eklendi.

Kısa referans / owner dışı bağlantı:

- `Qg ≈ 16 nC` seçimi [05](../05_mosfet_secimi_ve_dayanim_mantigi.md) içindeki gate-charge / MOSFET seçim izine bağlı kalır.
- `Vdrive ≈ 7.5 V` ve harici VCC/DVCC bağlamı [02](../02_startup_pin_programlama_ve_ortak_sabitler.md) ve termal kapanış için [06](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde birlikte okunur.

Okunan ana sayısal / kavramsal izler:

- `P_gate-drive = Qg * Vdrive * fsw`.
- `Qg = 16 nC`, `Vdrive = 7.5 V`, `fsw = 332 kHz`.
- `P_gate-drive1 ≈ 39.84 mW / MOSFET`.
- `P_gate-drive,total ≈ 79.68 mW / iki MOSFET`.
- `Rdriver ≈ 1.2 ohm`.
- `Rgate,external ≈ 2.2 ohm`.

Açık notlar:

- `P_gate-drive,total ≈ 79.68 mW`, MOSFET conduction veya switching overlap kaybıyla aynı mekanizma değildir.
- Gate-drive kaybının driver IC, MOSFET iç gate direnci ve PCB üzerindeki harici direnç arasında nasıl ısıya dönüştüğü final termal kapanışta ayrılacak.
- `1.2 ohm` driver notu, `2.2 ohm` harici/yerel gate direnci notu ve `W.177` toplam gate-yolu direnci aynı hesapta üst üste eklenmeyecek.

## Pass 074 - Sayfa 146-147

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p146.jpg](../images/defter_full_pages/defter_p146.jpg)
- [defter_p147.jpg](../images/defter_full_pages/defter_p147.jpg)

Defter işaretleri:

- `p146 / W.195`: başlık `Other losses / Output capacitance losses`; burada kastedilen güç katı `Cout` değil MOSFET output capacitance (`Coss`) kaybıdır.
- `p146 / W.195`: high-side için `P_HS-Coss = 1/2 * Qoss1 * Vin * fsw` formülü yazılır.
- `p146 / W.195`: low-side için `P_LS-Coss = 1/2 * Qoss2 * Vin * fsw` formülü yazılır.
- `p146 / W.195`: MOSFET drain-source arasındaki giriş/output capacitance değerinin gerilime bağlı ve doğrusal olmayan şekilde değiştiği not edilir.
- `p146 / W.195`: gerilim arttıkça `Coss` azalır notu korunur.
- `p146 / W.195`: ortalama kapasite için `Coss,ave = 2 * Coss,spec * sqrt(VDS,spec / VDS,off)` formülü yazılır.
- `p146 / W.195`: `Coss,HS,ave = 783 pF` daha önce bulunmuş değer olarak korunur.
- `p146 / W.195`: low-side için `VDS,LS,OFF = 14 V`; `22 V` değil diye özellikle işaretlenir.
- `p146 / W.195`: `Coss,LS,ave = 2 * 260 pF * sqrt(50 V / 14 V) ≈ 982.8 pF` sonucu kutulanır.
- `p146 / W.195`: alt notlarda datasheet/Fig.7 benzeri pratik okuma ile yaklaşık `Coss,HS ≈ 700 pF`, `Coss,LS ≈ 800 pF` mertebelerinin ortalama yöntemle benzer çıktığı not edilir.
- `p147 / W.196`: `Qoss = Coss,ave * VDS,off`.
- `p147 / W.196`: `Qoss,HS = 783 pF * 22 V = 17.23 nC`.
- `p147 / W.196`: `Qoss,LS = 983 pF * 14 V = 13.76 nC`.
- `p147 / W.196`: `P_HS-Coss = 1/2 * Qoss,HS * Vin * fsw`.
- `p147 / W.196`: yerine koyma `1/2 * 17.23 nC * 36 V * 332 kHz`; sonuç `P_HS-Coss = 102.86 mW`.
- `p147 / W.196`: `P_LS-Coss = 1/2 * Qoss,LS * Vin * fsw`.
- `p147 / W.196`: yerine koyma `1/2 * 13.76 nC * 36 V * 332 kHz`; sonuç `P_LS-Coss = 82.15 mW`.

Primary owner entegrasyonu:

- [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde `Coss / Qoss Loss` altına tam sayfa `p146` ve `p147` eklendi.

Kısa referans / owner dışı bağlantı:

- `Cout` / gerçek çıkış kapasitör bankı owner'ı [03](../03_bobin_ve_cikis_kapasitorleri.md) olarak kalır; bu pass MOSFET `Coss` kaybıdır.
- MOSFET seçim/datasheet kapasite okuması [05](../05_mosfet_secimi_ve_dayanim_mantigi.md) ile bağlantılıdır; 06 içinde yalnız kayıp kapanışı yapılır.

Okunan ana sayısal / kavramsal izler:

- `Coss,HS,ave ≈ 783 pF`.
- `VDS,LS,OFF = 14 V`.
- `Coss,LS,ave ≈ 982.8 pF`.
- `Qoss,HS ≈ 17.23 nC`.
- `Qoss,LS ≈ 13.76 nC`.
- `P_HS,Coss ≈ 102.86 mW`.
- `P_LS,Coss ≈ 82.15 mW`.
- Pratik grafik okuma mertebesi: `Coss,HS ≈ 700 pF`, `Coss,LS ≈ 800 pF` civarı.

Açık notlar:

- `p146` üzerindeki pratik grafik okuma mertebeleri, `783 pF / 982.8 pF` hesap hattının yerine geçirilmedi; yalnız çapraz teyit izi olarak korundu.
- Önceki küçük kırpım/metin hattında `Coss,spec = 265 pF` izi varken tam sayfa `p146` `260 pF` ile `982.8 pF` sonucunu verir; bu fark sessizce birleştirilmeyecek.
- `Coss` kaybı, switching overlap kaybıyla aynı enerji mekanizmasını kapsayabilir; final toplam kayıp tablosunda çift sayım kontrolü yapılacak.
- `VDS,LS,OFF = 14 V` notu özellikle korunacak; low-side için `22 V` kullanılmayacak.

## Pass 075 - Sayfa 148-149

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p148.jpg](../images/defter_full_pages/defter_p148.jpg)
- [defter_p149.jpg](../images/defter_full_pages/defter_p149.jpg)

Defter işaretleri:

- `p148 / W.197`: önceki sayfadaki sonuçlar tekrar bağlanır: `(10) P_HS-Coss = 102.9 mW`, `(11) P_LS-Coss = 82.2 mW`.
- `p148 / W.197`: high-side için `P_HS-Coss = 1/2 * Qoss1 * Vin * fsw` formülü yeniden işaretlenir.
- `p148 / W.197`: LM MOSFET output-charge denklem hattı yazılır: `P_Coss = fsw * (Vin * Qoss2 + Eoss1 - Eoss2)`.
- `p148 / W.197`: enerji yaklaşımı korunur: `Eoss ≈ 1/2 * Qoss * Vin`.
- `p148 / W.197`: `Qoss1 = 17.23 nC`, `Qoss2 = 13.76 nC`.
- `p148 / W.197`: `Eoss1 ≈ 1/2 * 17.23 nC * 36 V = 0.310 uJ`.
- `p148 / W.197`: `Eoss2 ≈ 1/2 * 13.76 nC * 36 V ≈ 0.248 uJ`.
- `p148 / W.197`: yerine koyma `332 kHz * (36 V * 13.76 nC + 0.310 uJ - 0.248 uJ)`.
- `p148 / W.197`: sonuç `P_Coss ≈ 185 mW`.
- `p149 / W.198`: `LM'deki denklemle P_Coss = 185 mW` notu yazılır.
- `p149 / W.198`: `6.81 denklem (10)+(11) toplamı` satırı `P_HS-Coss + P_LS-Coss = 102.9 mW + 82.2 mW = 185.1 mW` sonucunu verir.
- `p149 / W.198`: defter notu, aynı sonucun iki hesap yoluyla alındığını yazar.
- `p149 / W.198`: high-side MOSFET kapanırken bobin akımının `Coss1`i şarj ettiği ve bu şarj akımının kayıpsız kabul edildiği açıklanır.
- `p149 / W.198`: bobinden çıkış sığasına enerji geçişinin ideal durumda direnç kaybı üretmediği not edilir.
- `p149 / W.198`: high-side tekrar açıldığında `Coss1` içinde depolanan `Eoss1` enerjisinin turn-on anında ısıya dönüştüğü yazılır.
- `p149 / W.198`: low-side kapanmasında önceden depolanmış `Eoss2` enerjisinin bu sistemde geri kazanılan enerji gibi düşünülebileceği ve high-side kaybını kısmen dengelediği not edilir.

Primary owner entegrasyonu:

- [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde `Coss / Qoss Loss` altına tam sayfa `p148` ve `p149` eklendi.

Kısa referans / owner dışı bağlantı:

- `Cout` / gerçek çıkış kapasitör bankı owner'ı [03](../03_bobin_ve_cikis_kapasitorleri.md) olarak kalır; bu pass MOSFET `Coss` kaybının fiziksel enerji yorumudur.
- Switching overlap hesabı [06](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde ayrı kalem olarak durur; `Coss` ile çift sayım riski açık kontrol olarak korunur.

Okunan ana sayısal / kavramsal izler:

- `P_HS,Coss ≈ 102.9 mW`.
- `P_LS,Coss ≈ 82.2 mW`.
- `(10)+(11) ≈ 185.1 mW`.
- `P_Coss ≈ 185 mW`.
- `Qoss1 ≈ 17.23 nC`, `Qoss2 ≈ 13.76 nC`.
- `Eoss1 ≈ 0.310 uJ`, `Eoss2 ≈ 0.248 uJ`.
- LM denklem hattı: `P_Coss = f_sw(V_in Q_oss2 + E_oss1 - E_oss2)`.

Açık notlar:

- `102.9 mW + 82.2 mW = 185.1 mW` ile `P_Coss ≈ 185 mW` farkı yuvarlama izi olarak korunur; yeni bir ayrı final değer üretilmedi.
- `Eoss2` geri kazanım yorumu, üretici modeli ve gerçek switching dalga şekilleriyle final tabloda tekrar kontrol edilecek.
- `P_Coss ≈ 185 mW`, switching overlap kalemiyle çift sayılmayacak.

## Pass 076 - Sayfa 150-151

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p150.jpg](../images/defter_full_pages/defter_p150.jpg)
- [defter_p151.jpg](../images/defter_full_pages/defter_p151.jpg)

Defter işaretleri:

- `p150 / W.199`: üst notta "buradaki hesaplar tam doğru olmayabilir" uyarısı korunur.
- `p150 / W.199`: başlık `Body diode reverse recovery`.
- `p150 / W.199`: `P_RR = Vin * fsw * Qrr` formülü yazılır.
- `p150 / W.199`: `Qrr = 50 nC` ve `Tj = 25 C` koşulu not edilir; sıcaklık için `1.3` katı alındığı yazılır.
- `p150 / W.199`: yerine koyma `Prr = 36 V * 332 kHz * 50 nC * 1.3`.
- `p150 / W.199`: sonuç `Prr = 776.88 mW`.
- `p150 / W.199`: `Qrr` değerini etkileyen parametreler ve sıcaklık bağlamı olduğu not edilir.
- `p150 / W.199`: başlık `Bodydiode Dead-Time Loss`.
- `p150 / W.199`: dead-time kaybı denklemi yazılır: `Pdead = VF * (I0 - Delta ILpp/2) * tdr * fsw + VF * (I0 + Delta ILpp/2) * tdf * fsw`.
- `p150 / W.199`: denklem, ölü zaman sırasında body diode üzerinden akan akımın diyot gerilimiyle çarpımından doğan güç kaybı olarak açıklanır.
- `p150 / W.199`: `VF = VSD forward diode voltage = 0.83 V` kabul edilir.
- `p150 / W.199`: `tdr = rising-edge dead-time = 6.8 ns` ve `tdf = falling-edge dead-time = 39 ns` not edilir.
- `p150 / W.199`: yerine koyma `0.83 V`, `9 A`, `3.8 A`, `6.8 ns`, `39 ns`, `332 kHz` ile yapılır.
- `p150 / W.199`: sonuç `Pdead = 130 mW`.
- `p151 / W.200`: başlık `Other losses`.
- `p151 / W.200`: `(19) P_IC = Vin * Iq` / `P_IC = Vin * IQ-RUN` hattı yazılır.
- `p151 / W.200`: LM5146'nın kendi çektiği akımın datasheet tablosundan alındığı not edilir.
- `p151 / W.200`: `IQ-RUN: operating input current, no switching = 1.8 mA`.
- `p151 / W.200`: yerine koyma `P_IC = 36 V * 1.8 mA`.
- `p151 / W.200`: sonuç `P_IC = 64.8 mW`.
- `p151 / W.200`: `P_sense = Rsense * Iout^2 * D * (1 + 1/12 * Delta ILpp^2)` şeklinde hızlı bir sense-loss notu yazılır.
- `p151 / W.200`: `P_sense` hesabının "SONRA" yapılacağı, `Rilim`, `Rsense` gibi LM5146 hesapları tamamlandıktan sonra dönüleceği not edilir.
- `p151 / W.200`: sonraki başlık geçişi olarak `Inductor Losses Calculation` ve `Input and Output Capacitor losses` yazılır.

Primary owner entegrasyonu:

- [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde `Body-diode Reverse Recovery ve Dead-time Loss` altına tam sayfa `p150` eklendi.
- [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde `PIC ve Diğer Yardımcı Kayıp Açıkları` altına tam sayfa `p151` eklendi.

Kısa referans / owner dışı bağlantı:

- `P_sense`, current-limit / sensing zincirine bağlıdır; final kapanış aşağıdaki protection/current-limit/sensing owner'ında yapılacak.
- Bobin kayıpları [03](../03_bobin_ve_cikis_kapasitorleri.md) owner'ına, giriş/çıkış kapasitör ESR/ripple kayıpları [03](../03_bobin_ve_cikis_kapasitorleri.md) ve [04](../04_giris_kapasitorleri_ve_giris_agi.md) owner'larına bağlıdır; `p151` bu başlıklara geçiş izi bırakır.
- `P_IC`, MOSFET junction kaybı değildir; LM5146 kontrolcünün kendi tüketimi ve VCC/DVCC termal kapanışı ile birlikte okunur.

Okunan ana sayısal / kavramsal izler:

- `Qrr = 50 nC` ve sıcaklık çarpanı `1.3`.
- `P_RR ≈ 776.88 mW` tam sayfa izi.
- Önceki küçük kırpım/okuma izi: `Qrr ≈ 5 nC`, `P_RR ≈ 77.688 mW`.
- `VF = 0.83 V` tam sayfa izi.
- Önceki küçük kırpım/okuma izi: `VF ≈ 0.87 V`.
- `tdr ≈ 6.8 ns`, `tdf ≈ 39 ns`.
- `Pdead ≈ 130 mW`.
- `IQ-RUN = 1.8 mA`.
- `P_IC = 36 V * 1.8 mA = 64.8 mW`.

Açık notlar:

- `Qrr / P_RR` hattında 10x fark vardır: `5 nC -> 77.688 mW` ve `50 nC -> 776.88 mW`. Bu çelişki sessizce birleştirilmedi.
- `VF` için `0.87 V` ve `0.83 V` izleri birlikte korunur; final dead-time hesabında MOSFET datasheet koşulu ve sıcaklık tekrar okunacak.
- `P_IC`, `P_gate-drive` ve `VCC/driver` kaybıyla çift sayılmayacak.
- `P_sense` satırı final denklem değildir; `Rilim/Rsense` zinciri netleşince yeniden kurulacak.

## Pass 077 - Sayfa 152-153

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p152.jpg](../images/defter_full_pages/defter_p152.jpg)
- [defter_p153.jpg](../images/defter_full_pages/defter_p153.jpg)

Defter işaretleri:

- `p152 / W.160`: başlık bootstrap ağı ve kullanılan elemanlar bağlamındadır.
- `p152 / W.160`: `CBOOT` / `CBST` için `C16 = 0.1 uF` notu görünür.
- `p152 / W.160`: `CBOOT` için `HB ile HS arasında` notu yazılır.
- `p152 / W.160`: `DBOOT / Bootstrap diode` satırı, bootstrap diyodunun LM5146 içinde olduğunu belirtir.
- `p152 / W.160`: `DBOOT` için `VCC ile BST arasında` notu görünür.
- `p152 / W.160`: `RBOOT` için `Rboot = R3 = 2.2 ohm` notu korunur.
- `p152 / W.160`: `RBOOT`un `CBST` ile seri olduğu not edilir.
- `p152 / W.160`: `CVDD / bypass capacitor` satırı `CVCC = C25 = 2.2 uF` notuyla tutulur.
- `p153 / W.205`: kavramsal çizimde LM5146 high-side bootstrap pinleri `HB = 8`, `HO = 7`, `HS = 6` olarak işaretlenir.
- `p153 / W.205`: `Cboot`, `HB` ile `HS/SW` arasında gösterilir.
- `p153 / W.205`: `HO`, high-side MOSFET gate sürüş yoluna bağlanır.
- `p153 / W.205`: `HS/SW` düğümü anahtarlama düğümü olarak çizilir.
- `p153 / W.205`: `HB` düğümünün switch-node seviyesinin üstüne bootstrap gerilimi kadar bindiği `36 V + 7.5 V` benzeri notla gösterilir.
- `p153 / W.205`: alt notta `CBOOT`un doğrudan Q1'in gate-source arasına bağlı olmadığı; dolaylı olarak Q1'in driver'ını beslediği yazılır.

Primary owner entegrasyonu:

- [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde `Bootstrap Envanteri ve Bağlantı İzleri` altına tam sayfa `p152` ve `p153` eklendi.

Kısa referans / owner dışı bağlantı:

- Duty/timing sayıları [02](../02_startup_pin_programlama_ve_ortak_sabitler.md) owner'ından gelir; bu pass bootstrap bağlantısı ve eleman envanteridir.
- MOSFET seçimi [05](../05_mosfet_secimi_ve_dayanim_mantigi.md) owner'ında kalır; bu pass high-side driver besleme yolunu açıklar.
- `CVCC` bypass ve VCC/DVCC termal bağlamı [02](../02_startup_pin_programlama_ve_ortak_sabitler.md) ve [06](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde birlikte okunur.

Okunan ana sayısal / kavramsal izler:

- `C16 = 0.1 uF` / `CBST`.
- `C25 = 2.2 uF` / `CVCC`.
- `Rboot = R3 = 2.2 ohm`.
- `DBOOT` LM5146 içinde, `VCC` ile `BST/HB` arasında.
- `CBOOT`, `HB/BST` ile `HS/SW` arasında.
- `HB = 8`, `HO = 7`, `HS = 6` pin izi.
- `CBOOT` doğrudan Q1 gate-source arasına bağlı değildir; high-side driver beslemesidir.

Açık notlar:

- `Rboot = R3 = 2.2 ohm`, gate-yolu tarafındaki `2.2 ohm` notuyla aynı fiziksel eleman gibi okunmayacak.
- `36 V + 7.5 V` çizimi kavramsal bootstrap düğüm gösterimidir; final mutlak gerilim/stress kontrolü için `BST-SW`, `HB-HS`, transient ve datasheet absolute maximum sınırları ayrı doğrulanacak.
- `CBST`, `CVCC`, dahili bootstrap diyodu ve `Rboot` reference designator'ları actual EVM şeması/BOM ile tekrar eşleştirilecek.

## Pass 078 - Sayfa 154-155

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p154.jpg](../images/defter_full_pages/defter_p154.jpg)
- [defter_p155.jpg](../images/defter_full_pages/defter_p155.jpg)

Defter işaretleri:

- `p154 / W.166`: başlık `6.34 Bootstrap direnci`.
- `p154 / W.166`: `Rboot = R3 = 2.2 ohm` izi tekrar görünür.
- `p154 / W.166`: sayfada "Word'e ekledim" süreç notu vardır.
- `p154 / W.166`: sayfa büyük ölçüde boştur; yeni bootstrap hesabı üretmez.
- `p155 / W.167`: başlık `6.34 CVCC cap bypass` bağlamındadır.
- `p155 / W.167`: `CVCC` kondansatörünün `CBST`nin ihtiyaç duyduğu charge'ı çok daha hızlı/kısa sürede verecek kadar büyük olması gerektiği yazılır.
- `p155 / W.167`: hızlı kural `CVCC >> 10 x CBST`.
- `p155 / W.167`: `CVCC = 2.2 uF`.
- `p155 / W.167`: `CBST = 0.1 uF`.
- `p155 / W.167`: `2.2 uF > 10 x 0.1 uF` ve koşulun sağlandığı not edilir.

Primary owner entegrasyonu:

- [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde `Bootstrap Envanteri ve Bağlantı İzleri` altına tam sayfa `p154` eklendi.
- [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde `CVCC ve CBST İlişkisi` altına tam sayfa `p155` eklendi.

Kısa referans / owner dışı bağlantı:

- `Rboot = R3 = 2.2 ohm` bootstrap seri direnci olarak kalır; gate-yolu `2.2 ohm` notlarıyla karıştırılmayacak.
- `CVCC` / VCC bypass ve harici VCC/DVCC bağlamı [02](../02_startup_pin_programlama_ve_ortak_sabitler.md) ile ilişkili olsa da bu pass bootstrap enerji rezervuarı açısından [06](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde tutulur.

Okunan ana sayısal / kavramsal izler:

- `Rboot = R3 = 2.2 ohm`.
- `CVCC = 2.2 uF`.
- `CBST = 0.1 uF`.
- `CVCC >> 10 x CBST`.
- `2.2 uF > 10 x 0.1 uF`.

Açık notlar:

- `p154`, yeni hesap değil süreç/dokümantasyon izidir; teknik değer olarak yalnız mevcut `Rboot = R3 = 2.2 ohm` tekrarını taşır.
- `CVCC >> 10 x CBST` kontrolü hızlı rezervuar sanity check'idir; minimum `Cboot`, `Qtotal`, `DeltaVHB`, UVLO ve gerçek etkin kapasite kontrollerinin yerine geçmez.

## Pass 079 - Sayfa 156-157

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p156.jpg](../images/defter_full_pages/defter_p156.jpg)
- [defter_p157.jpg](../images/defter_full_pages/defter_p157.jpg)

Defter işaretleri:

- `p156 / W.171`: başlık `6.34 Bootstrap`.
- `p156 / W.171`: `Qg` yalnız MOSFET kapı yüküdür; gate'i açmak için gereken yük olarak yazılır.
- `p156 / W.171`: `Qg ≈ 16 nC` izi görünür.
- `p156 / W.171`: `Qtotal`, bootstrap kapasitörünün her anahtarlama çevriminde sağlamak zorunda olduğu toplam yük miktarıdır.
- `p156 / W.171`: `Qtotal`, `Qg`ye ek olarak iki yük bileşeni daha içerir.
- `p156 / W.171`: `IHBS * Dmax / fsw`, `HB` pininden `VSS`e akan kaçak/sızıntı akımının oluşturduğu yük olarak açıklanır.
- `p156 / W.171`: `IHBS` akımı datasheet'ten bulunur; entegre devre olduğu için oldukça küçük kabul edilir ve `5 uA` alınır.
- `p156 / W.171`: `IHB * 1 / fsw`, high-side gate-driver'ın high-side kısmının sabit / quiescent akımının oluşturduğu yük olarak açıklanır.
- `p156 / W.171`: `IHB` için `80 uA` not edilir.
- `p156 / W.171`: formül `Qtotal = Qg + IHBS * Dmax / fsw + IHB * 1 / fsw`.
- `p156 / W.171`: yerine koyma `16 nC + 5 uA * 0.95 / 332 kHz + 80 uA * 1 / 332 kHz`.
- `p156 / W.171`: ara katkılar `0.01431 nC` ve `0.241 nC`.
- `p156 / W.171`: sonuç `Qtotal = 16.255 nC`.
- `p157 / W.188`: başlık bozuk/yarım yazılmış gibi görünse de bağlam bootstrap parametre taramasıdır.
- `p157 / W.188`: bootstrap kapasitörünün high-side gate sürücü devresine enerji sağlayan kritik eleman olduğu yazılır.
- `p157 / W.188`: `VINmax = 65 V`, maximum steady-state input voltage.
- `p157 / W.188`: `VDRV = 12 V`, high-side driver / gate sürme genliği bağlamında not edilir.
- `p157 / W.188`: `Delta VBST = 0.5 V`, steady-state ripple ve `CBOOT` bağlamında kullanılır.
- `p157 / W.188`: `Delta Vboost,max = 3 V`; bu kadar gerilim düşümünde UVLO olabileceği yazılır.
- `p157 / W.188`: `tBST,rr = 400 us` gibi okunur; süre değeri mevcut metindeki küçük kırpımda `400 ns` olarak geçtiği için çelişki açık tutulur.
- `p157 / W.188`: `tON,TL = 20 us` transient-on bağlamında not edilir.
- `p157 / W.188`: `Qg`, MOSFET'in toplam gate yükü olarak açıklanır; `12 V` uygulandığında ve `VDS = 65 V` iken gate'i tamamen sürmek için gereken toplam yük bağlamı yazılır.
- `p157 / W.188`: `RGS`, gate-source arasındaki pull-down dirençtir; MOSFET kapandığında gate'te gerilim kalmaması için kullanılır ve bootstrap'tan bir miktar akım çekebilir.
- `p157 / W.188`: bootstrap diode forward gerilim düşümü `VFDBST = 0.6 V` olarak alınır; `100 mA` ve `Tj = 80 C` koşulu not edilir.
- `p157 / W.188`: level-shifter leakage akımı `0.13 mA` olarak okunur; `Vinmax` ve `Tj = 100 C` koşulu not edilir.
- `p157 / W.188`: floating driver quiescent current için `IQBS = 1 mA` not edilir.

Primary owner entegrasyonu:

- [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde `Qtotal, Minimum Cboot ve UVLO` altına tam sayfa `p156` ve `p157` eklendi.

Kısa referans / owner dışı bağlantı:

- Duty/timing ailesinin primary sahibi [02](../02_startup_pin_programlama_ve_ortak_sabitler.md) olarak kalır; burada `Dmax = 0.95` yalnız bootstrap high-side bias / datasheet hesabı bağlamında kullanılır.
- MOSFET gate charge seçimi [05](../05_mosfet_secimi_ve_dayanim_mantigi.md) ile ilişkilidir; burada `Qg` bootstrap yük hesabı girdisidir.
- UVLO ve startup bağlamı [02](../02_startup_pin_programlama_ve_ortak_sabitler.md) ile komşudur; bu pass bootstrap `BST-SW/HB-HS` yeterliliğini taşır.

Okunan ana sayısal / kavramsal izler:

- `Qg ≈ 16 nC`.
- `IHBS ≈ 5 uA`.
- `IHB ≈ 80 uA`.
- `Dmax ≈ 0.95`.
- `fsw ≈ 332 kHz`.
- `Qtotal ≈ 16.255 nC`.
- `VINmax = 65 V`.
- `VDRV = 12 V`.
- `Delta VBST ≈ 0.5 V`.
- `Delta Vboost,max ≈ 3 V`.
- `VFDBST ≈ 0.6 V @ 100 mA, Tj = 80 C`.
- `level-shifter leakage ≈ 0.13 mA`.
- `IQBS ≈ 1 mA`.

Açık notlar:

- `Dmax = 0.95`, proje duty zarfındaki `0.648` ile aynı rol değildir; bootstrap özel worst-case / datasheet hesabı olarak kalır.
- `IHB = 80 uA`, `0.13 mA` ve `IQBS = 1 mA` değerleri aynı akımın farklı yazımları gibi birleştirilmeyecek; hangi datasheet satırı ve hangi koşuldan geldiği son kontrolde ayrılacak.
- `tBST,rr` değeri tam sayfada `400 us` gibi okunurken önceki küçük kırpım/README hattında `400 ns` olarak duruyor; bu süre sessizce düzeltilmedi.
- `Delta Vboost,max = 3 V` notu UVLO margin kontrolünün yerine geçmez; `BST-SW/HB-HS` absolute maximum ve UVLO eşiği birlikte doğrulanacak.

## Pass 080 - Sayfa 158-159

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p158.jpg](../images/defter_full_pages/defter_p158.jpg)
- [defter_p159.jpg](../images/defter_full_pages/defter_p159.jpg)

Defter işaretleri:

- `p158 / W.189`: başlık `6.88 Bootstrap`.
- `p158 / W.189`: `CBST`yi hesaplayan denklemin tek durum için kullanılmayacağı not edilir.
- `p158 / W.189`: dikkat notu olarak üç farklı açıdan hesap yapılacağı yazılır.
- `p158 / W.189`: üç durum `transient-off`, `transient-on` ve `steady-state` olarak ayrılır.
- `p158 / W.189`: bu durumlar `CBST2`, `CBST3` ve `CBST1` gibi etiketlenir.
- `p158 / W.189`: bunlardan hangisi en büyükse onun seçileceği yazılır.
- `p158 / W.189`: `CVCC / CBST = 2.2 uF / 0.1 uF` oranının yaklaşık `20 kat` olduğu not edilir.
- `p158 / W.189`: `G88` bağlamında `CVCC >> CBST` seçilmesi gerektiği, uygulamada yaklaşık `10 kat` mertebesinden söz edildiği yazılır.
- `p159 / W.189`: `CVCC / CBST ≈ 2.2 uF / 0.1 uF` oranı tekrar görünür.
- `p159 / W.189`: `CVCC >> CBST` seçilmesi gerektiği tekrar edilir.
- `p159 / W.189`: "CBST neden?" sorusu yazılır.
- `p159 / W.189`: high-side MOSFET'in gate kapısını açmak için gereken enerjinin `CBST` tarafından sağlandığı not edilir.
- `p159 / W.189`: bu enerjinin nihai olarak `VCC` hattındaki bypass kapasitöründen geldiği yazılır.
- `p159 / W.189`: `CBST` her şarj olduğunda `VCC` hattındaki gerilim düşüşünün sınırlı kalması gerektiği not edilir.
- `p159 / W.189`: gate geriliminin yeterince yüksek kalması ve sürücünün yüksek hızlı geçişlerde kararlı çalışabilmesi gerektiği yazılır.

Primary owner entegrasyonu:

- [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde `Qtotal, Minimum Cboot ve UVLO` altındaki `W.189` çoklu-senaryo metoduna tam sayfa `p158` ve `p159` eklendi.

Kısa referans / owner dışı bağlantı:

- `CVCC/CBST` oranı [06](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde bootstrap enerji zinciri olarak kalır; VCC/DVCC genel startup bağlamı [02](../02_startup_pin_programlama_ve_ortak_sabitler.md) ile ilişkilidir.
- `CBST1/2/3` etiketleri yeni ayrı owner değildir; transient-off, transient-on ve steady-state durumlarını aynı bootstrap seçimi altında ayırır.

Okunan ana sayısal / kavramsal izler:

- `transient-off`, `transient-on`, `steady-state`.
- `CBST2`, `CBST3`, `CBST1`.
- `CVCC = 2.2 uF`, `CBST = 0.1 uF`.
- `CVCC / CBST ≈ 20`.
- `CVCC >> CBST`, uygulamada yaklaşık `10 kat` notu.
- `CBST`, high-side gate sürücünün yerel enerji deposudur.
- `CBST` enerjisi nihai olarak `VCC` bypass kapasitesinden gelir.

Açık notlar:

- Bu pass yeni final `CBST` değeri üretmedi; `0.1 uF` seçiminin tek denklemle değil üç senaryo ve `CVCC` rezervuar ilişkisiyle okunması gerektiğini güçlendirdi.
- `CVCC/CBST ≈ 20` ile `10 kat` notu çelişki değildir; mevcut `2.2 uF / 0.1 uF` seçiminin yaklaşık `10x` minimum sezgiyi geçtiğini gösterir.
- `CBST1/CBST2/CBST3` için ayrı sayısal sonuçlar bu sayfalarda yoktur; sonraki veya önceki hesaplarla bağlanmadan yeni değer uydurulmadı.

## Pass 081 - Sayfa 160-161

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p160.jpg](../images/defter_full_pages/defter_p160.jpg)
- [defter_p161.jpg](../images/defter_full_pages/defter_p161.jpg)

Defter işaretleri:

- `p160 / W.168`: başlık çevresinde `VCC`, `VBST-fwd` ve `VBST-uv: BST-to-SW undervoltage detection` notları var.
- `p160 / W.168`: `Delta VHB = VDD - VDH - VHBL` biçiminde okunan bootstrap gerilim düşümü denklemi yazılmıştır.
- `p160 / W.168`: sayısal yerleştirme `Delta VHB = 8.4 V - 0.9 V - 3.4 V` ve sonuç `4.1 V` olarak yazılır.
- `p160 / W.168`: `Vbst = 7.5 V` izi, `VCC - VBST-fwd = Vbst` açıklamasıyla birlikte korunur.
- `p160 / W.168`: `Cboot > Qtotal / Delta VHB` ve `Cboot > 16.255 nC / 4.1 V = 3.96 nF` alt sınırı görünür.
- `p160 / W.168`: `Cboot` büyüdükçe gerilim düşümünün azalacağı, fakat `Ipeak = Cbst * dVsw/dt` nedeniyle bootstrap diyodu ve PCB üzerindeki tepe stresin artabileceği not edilir.
- `p161 / W.169`: `VCC` ile `AGND` arasında `1-5 uF` seramik `CVCC` bypass konması yazılır.
- `p161 / W.169`: `CVCC`nin `VCC` ve `AGND` pinlerine çok yakın yerleşmesi gerektiği ve `X7R` / düşük `ESR` tercihinin yazıldığı görülür.
- `p161 / W.169`: `CVCC = C25` hattı, VCC decoupling capacitor amacıyla ilişkilendirilir.
- `p161 / W.169`: `CVCC`, `VCC` hattındaki ani akım çekişlerini dengelemek, yüksek frekans parazitlerini bastırmak ve PWM kontrolcü / gate sürücülerine temiz `VCC` sağlamak için kullanılır.
- `p161 / W.169`: harici kaynak kullanılsa da kullanılmasa da `CVCC` gerektiği özellikle yazılır.
- `p161 / W.169`: internal `VCC` regulator için `40 mA` akım limiti not edilir.
- `p161 / W.169`: power-up sırasında `CVCC`nin LDO çıkışıyla şarj edildiği, çok büyük `CVCC` değerlerinin, örnek olarak `10 uF`, startup beslemesini veya soft-start başlangıcını geciktirebileceği yazılır.

Primary owner entegrasyonu:

- [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde `Qtotal, Minimum Cboot ve UVLO` altındaki `W.168` bloğuna tam sayfa `p160` eklendi.
- [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde `CVCC ve CBST İlişkisi` altındaki `W.169` bloğuna tam sayfa `p161` eklendi.

Kısa referans / owner dışı bağlantı:

- `CVCC`nin startup davranışına etkisi [02](../02_startup_pin_programlama_ve_ortak_sabitler.md) dosyasındaki startup/pin-programming akışıyla komşudur; burada asıl owner VCC bypass ve bootstrap enerji zinciri olarak [06](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde tutuldu.
- `Cboot` alt sınırı, `Qtotal`, `Delta VHB` ve `BST-SW` UVLO margin aynı bootstrap owner'ında tutulur; MOSFET gate-charge seçimi [05](../05_mosfet_secimi_ve_dayanim_mantigi.md) dosyasına yalnız girdi ilişkisiyle bağlanır.

Okunan ana sayısal / kavramsal izler:

- `VCC = 8.4 V`.
- `VBST-fwd = 0.9 V`.
- `Vbst = 7.5 V`.
- `BST-SW` UVLO eşiği olarak `3.4 V`.
- `Delta VHB = 4.1 V`.
- `Qtotal = 16.255 nC`.
- `Cboot > 3.96 nF`.
- `Ipeak = Cbst * dVsw/dt`.
- `CVCC = C25`.
- `CVCC` için tam sayfada `1-5 uF` gibi okunan aralık.
- Önceki kırpım/metin hattında `1-6 uF` olarak duran aralık.
- Internal `VCC` regulator akım limiti `40 mA`.
- Aşırı büyük `CVCC` örneği olarak `10 uF`.

Açık notlar:

- `1-5 uF` ve `1-6 uF` aralıkları sessizce birleştirilmedi; final datasheet/EVM kontrolünde aynı `CVCC` owner'ı altında kapanacak.
- `VDH`, `VBST-fwd` ve `VHBL` sembol okuması defterden geldiği gibi korunur; datasheet sembolleriyle son notasyon hizalama ayrı kontrol ister.
- `Ipeak = Cbst * dVsw/dt` bu pass için tepe stres sezgisidir; sayfada yeni sayısal tepe akım sonucu yoktur.

## Pass 082 - Sayfa 162-163

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p162.jpg](../images/defter_full_pages/defter_p162.jpg)
- [defter_p163.jpg](../images/defter_full_pages/defter_p163.jpg)

Defter işaretleri:

- `p162 / W.185`: başlık `6.88` ve `Calculating Driver Bypass Cap Value` olarak okunur.
- `p162 / W.185`: "Bu sayfadan itibaren önce LM'yi yap" notu, bootstrap / driver supply zincirinin bu kısımdan devam ettiğini gösterir.
- `p162 / W.185`: "Neden bypass cap?" sorusu yazılır.
- `p162 / W.185`: MOSFET sürücülerinin hızlı switching yapmak için düşük empedanslı ve anlık yüksek akım verebilen bir besleme kaynağına ihtiyaç duyduğu yazılır.
- `p162 / W.185`: güç kaynağından gelen hatların uzun yollar ve parazitik endüktans nedeniyle bu hızlı akımı sağlayamayacağı, ani akım taleplerinin gerilim dalgalanmasına yol açabileceği not edilir.
- `p162 / W.185`: çözüm olarak sürücünün besleme ucuna bypass kapasitörü eklenmesi yazılır.
- `p162 / W.185`: buck converter girişindeki MLCC kapasitörleriyle sürücü bypass kapasitesinin aynı owner olmadığı özellikle işaretlenir.
- `p162 / W.185`: alttaki çizimde `VCC`, `VBST`, `Vdrive`, `bypass`, gate sürücü yolu ve `Rgate` ilişkisi şematik olarak gösterilir.
- `p163 / W.186`: başlık `Driver Bypass Cap değerini` biçiminde okunur.
- `p163 / W.186`: sürücünün MOSFET gate'ine hızlı akım verirken, kendi güç pinine bağlı `Cbypass` kapasitöründen beslendiği yazılır.
- `p163 / W.186`: bypass kapasitörünün sürücünün ihtiyaç duyduğu akımı kararlı sağlayarak hızlı ve güvenilir sürme işlemini mümkün kıldığı not edilir.
- `p163 / W.186`: denklem `Cbypass = (IQ,HI * Dmax / fdrive + Qg) / DeltaV` olarak okunur.
- `p163 / W.186`: sayısal yerleştirme `2.5 mA`, `0.7`, `100 kHz`, `115 nC` ve `0.6 V` izlerini içerir.
- `p163 / W.186`: sonuç yaklaşık `221 nF` gibi okunur.
- `p163 / W.186`: `Qg`, MOSFET'in toplam gate yükü olarak açıklanır; `Qg(max) 150 nC` datasheet notuna rağmen yerel hesapta `Qg tahmined = 115 nC kabul` izi vardır.
- `p163 / W.186`: `IQ-RUN (2.1 mA)` ve harici bias varsa `IVCC = 2.3 mA` gibi okunan bağlamlar yazılır.
- `p163 / W.186`: gate sürücüsüne paralel bağlanan bypass kapasitesinin değerinin frekansa bağlı depolama/destek davranışına göre değiştiği not edilir.

Primary owner entegrasyonu:

- [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde `CVCC ve CBST İlişkisi` altındaki `W.185` driver bypass gerekçesine tam sayfa `p162` eklendi.
- [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde `CVCC ve CBST İlişkisi` altındaki `W.186` driver bypass hesabına tam sayfa `p163` eklendi.
- Aynı blokta önceki `27.1 nF` aktarımıyla tam sayfa `221 nF` okuması arasındaki fark açık kontrol olarak görünür hale getirildi.

Kısa referans / owner dışı bağlantı:

- Buck converter girişindeki MLCC `Cin` bankasının ana hesabı [04](../04_giris_kapasitorleri_ve_giris_agi.md) dosyasında kalır; `p162` burada yalnız sürücü besleme bypass kapasitesiyle `Cin` arasındaki owner ayrımını netleştirir.
- MOSFET gate charge seçimi [05](../05_mosfet_secimi_ve_dayanim_mantigi.md) dosyasıyla ilişkilidir; burada `Qg`, driver bypass hesabının yük bileşeni olarak kullanılır.

Okunan ana sayısal / kavramsal izler:

- `Cbypass = (IQ,HI * Dmax / fdrive + Qg) / DeltaV`.
- `IQ,HI` / sürücü yüksek seviye boşta akımı bağlamı.
- `2.5 mA`.
- `Dmax = 0.7`.
- `fdrive = 100 kHz`.
- `Qg = 115 nC` kabul izi.
- `Qg(max) = 150 nC` datasheet notu.
- `DeltaV = 0.6 V`.
- `Cbypass ≈ 221 nF`.
- `IQ-RUN = 2.1 mA`.
- Harici bias varsa `IVCC = 2.3 mA` gibi okunan not.

Açık notlar:

- Önceki Markdown/OCR hattındaki `27.1 nF` aktarımı ile tam sayfa `p163` üzerinde okunan `221 nF` sonucu uyuşmuyor. Bu fark sessizce düzeltilmedi; `06` dosyasında açık kontrol olarak bırakıldı.
- `Qg(max) = 150 nC` ve `Qg tahmined = 115 nC kabul` aynı sayfada farklı rollerle durur; final driver bypass hesabında hangi gate-charge koşulunun kullanılacağı netleştirilecek.
- `Dmax = 0.7` ve `fdrive = 100 kHz`, global duty/fsw owner'ındaki ana proje değerleriyle aynı rol değildir; bu pass içinde driver bypass kaba hesabının yerel girdisi olarak korunur.

## Pass 083 - Sayfa 164-165

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p164.jpg](../images/defter_full_pages/defter_p164.jpg)
- [defter_p165.jpg](../images/defter_full_pages/defter_p165.jpg)

Defter işaretleri:

- `p164 / W.187`: kısa sayfa, `Cbypass = CVCC = (IQ,HI * Dmax/fdrive + Qg) / DeltaV` denklem tekrarını gösterir.
- `p164 / W.187`: yeni sayısal sonuç üretmez; önceki `W.186` driver bypass hesabındaki yük bileşenlerinin ve `Cbypass = CVCC` okumasının kaybolmaması için kullanıldı.
- `p165 / W.25`: başlık `6.95 Phase Margin'i bulma` olarak okunur.
- `p165 / W.25`: phase margin için önce transfer fonksiyonunun kazancının `1` veya `0 dB` olduğu frekansın bulunacağı yazılır; bu frekans `wpm` olarak etiketlenir.
- `p165 / W.25`: `|T(jwpm)| = 1` veya `0 dB` notu görünür.
- `p165 / W.25`: transfer fonksiyonunun bu `wpm` frekansındaki phase'inin okunacağı, bunun genelde negatif derece olduğu not edilir.
- `p165 / W.25`: phase margin bağıntısı `PM = 180° + phi` olarak yazılır.
- `p165 / W.25`: kararlılık için transfer fonksiyonunun phase'i `-180°`e gelmeden kazancın çoktan `0 dB` altına inmiş olması gerektiği not edilir.
- `p165 / W.25`: gain margin için Bode'de transfer fonksiyonunun phase'inin `-180°` olduğu frekansın bulunacağı yazılır; bu frekans `wgm` olarak etiketlenir.
- `p165 / W.25`: `T(jwgm) = -180°` notu görünür.
- `p165 / W.25`: `wgm` frekansındaki kazancın `Gpc = 20log10 |T(jwgm)|` olarak okunacağı yazılır.
- `p165 / W.25`: normal ölçekte `GM = 1 / |T(jwgm)|` ilişkisi not edilir.

Primary owner entegrasyonu:

- [06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde `CVCC ve CBST İlişkisi` altındaki `W.187` denklem tekrarına tam sayfa `p164` eklendi.
- [07_kontrolcu_ve_kompanzasyon.md](../07_kontrolcu_ve_kompanzasyon.md) içinde `W.25: PM / GM Tanım Notu` altına tam sayfa `p165` eklendi.

Kısa referans / owner dışı bağlantı:

- `p164`, driver bypass / `CVCC` zincirinin owner'ı olan [06](../06_kayiplar_bootstrap_koruma_ve_termal_kapanis.md) içinde kaldı.
- `p165`, kontrol döngüsü Bode okuması olduğu için [07](../07_kontrolcu_ve_kompanzasyon.md) içine alındı; güç katı, bootstrap veya EMI owner'ı değildir.

Okunan ana sayısal / kavramsal izler:

- `Cbypass = CVCC`.
- `IQ,HI * Dmax / fdrive + Qg`.
- `DeltaV`.
- `|T(jwpm)| = 1`.
- `0 dB`.
- `PM = 180° + phi`.
- `T(jwgm) = -180°`.
- `Gpc = 20log10 |T(jwgm)|`.
- `GM = 1 / |T(jwgm)|`.

Açık notlar:

- `p164` yeni final `Cbypass` değeri üretmedi; önceki `W.186` hesabının denklem izidir.
- `p165` yeni final phase margin veya gain margin değeri üretmedi; Bode okuma kuralını sabitler.
- `T(jwgm) = -180°` yazımı sayfada transfer fonksiyonunun phase koşulu olarak okunur; final dokümantasyonda gerekirse `angle T(jwgm) = -180°` biçiminde notasyon temizliği yapılabilir.

## Pass 084 - Sayfa 166-167

Durum: `used`

Çıkarılan / kullanılan tam sayfa görseller:

- [defter_p166.jpg](../images/defter_full_pages/defter_p166.jpg)
- [defter_p167.jpg](../images/defter_full_pages/defter_p167.jpg)

Defter işaretleri:

- `p166 / W.1`: loop büyüklüğü için `|L(jwt)| = |M(jwt)| * |F(jwt)| * |G3(jwt)| = 1 olmalı` notu görülür.
- `p166 / W.1`: `ft = 35 kHz'de 1 olmalı` yazılır.
- `p166 / W.1`: modülatör kazancı `M = Vs / Vramp = 15` olarak not edilir.
- `p166 / W.1`: plant büyüklüğü `|F(jwt)| = 0.045356` olarak okunur.
- `p166 / W.1`: gerekli kompanzatör büyüklüğü `|G3(jwt)| = 1 / (|M(jwt)| * |F(jwt)|)` şeklinde yazılır.
- `p166 / W.1`: sayısal sonuç `|G3(jwt)| = 1.46985 = 3.3454 dB` olarak görünür.
- `p167 / W.2`: plant transfer fonksiyonu `F(jwt) = (A + jB) / (C + jD)` olarak açılır.
- `p167 / W.2`: ara kompleks terimler `1 + j0.0004002` ve `-22.0102 + j1.2824` gibi okunur.
- `p167 / W.2`: `∠F(jwt) = 0.2293 - 176.665 = -176.43°` hesabı görünür.
- `p167 / W.2`: `PM = 180° + ∠L(jfc) = 55°` ilişkisi kullanılır.
- `p167 / W.2`: buradan `∠L(jfc) = -125°` gibi okunan hedef loop fazı çıkar.
- `p167 / W.2`: `∠L(jfc) = ∠M(jw) + ∠F(jw) + ∠G3(jw)` ayrımı yazılır.
- `p167 / W.2`: `∠M(jw)` yaklaşık `0°`, `∠F(jw)` yaklaşık `-176.43°` okunur.
- `p167 / W.2`: kompanzatör faz katkısı `∠G3(jw) = 176.43 - 125 = 51.43°` olarak hesaplanır.
- `p167 / W.2`: aynı sayfada büyük yazıyla `231.43°` gibi bir toplam/alternatif faz yazımı da görünür.

Primary owner entegrasyonu:

- [07_kontrolcu_ve_kompanzasyon.md](../07_kontrolcu_ve_kompanzasyon.md) içinde `W.1: Gerekli Kompanzatör Kazancı` altına tam sayfa `p166` eklendi.
- [07_kontrolcu_ve_kompanzasyon.md](../07_kontrolcu_ve_kompanzasyon.md) içinde `W.2-W.12: Faz Bütçesi, Modülatör ve İlk Kırılımlar` altına tam sayfa `p167` eklendi.

Kısa referans / owner dışı bağlantı:

- `M = Vs/Vramp = 15` modülatör kazancı olarak [07](../07_kontrolcu_ve_kompanzasyon.md) içinde kalır; global duty/fsw veya güç katı owner'ı değildir.
- `F(jwt)` plant büyüklüğü/fazı fiziksel olarak [03](../03_bobin_ve_cikis_kapasitorleri.md) değerlerine dayanır; burada kontrol hesabına giren transfer fonksiyonu izi olarak tutuldu.

Okunan ana sayısal / kavramsal izler:

- `ft = 35 kHz`.
- `M = Vs / Vramp = 15`.
- `|F(jwt)| = 0.045356`.
- `|G3(jwt)| = 1.46985`.
- `20log10(|G3|) = 3.3454 dB`.
- `F(jwt) = (A + jB) / (C + jD)`.
- `1 + j0.0004002`.
- `-22.0102 + j1.2824`.
- `∠F(jwt) ≈ -176.43°`.
- `PM = 180° + ∠L(jfc) = 55°`.
- `∠L(jfc) ≈ -125°`.
- `∠G3(jw) ≈ 51.43°`.
- `231.43°` olarak görünen alternatif/toplam faz yazımı.

Açık notlar:

- `p166-p167` yeni final Type-III komponent seti üretmedi; `W.1-W.2` K-factor / faz bütçesi hesabının tam sayfa kaynak izidir.
- `231.43°` ve `51.43°` faz yazımları sessizce tekleştirilmedi; muhtemel faz sarımı / `+180°` gösterim farkı olarak açık bırakıldı.
- `F(jwt)` uzun plant hesabı burada yeniden plant owner'ı olmuyor; kontrol tarafında kullanılan büyüklük/faz ara sonucu olarak duruyor.
