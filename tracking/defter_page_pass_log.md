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
