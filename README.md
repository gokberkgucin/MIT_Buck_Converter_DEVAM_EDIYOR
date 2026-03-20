# LM5146-Q1 Tabanli Buck Converter Tasarimi

Bu dosya tez formati icin degil, GitHub uzerinden surdurulen yasayan tasarim dokumani icin tutulur.

Ana yol haritasi: `tracking/master_plan.md`

Kurallar:
- Yalnizca secilen ve gercekten kullanilan kaynaklari buraya tasiyin.
- Ham notlari buraya oldugu gibi yigmayin; dogrulanmis ve okunabilir hale getirin.
- Kullanilacak gorselleri mumkunse `images/` klasorune kopyalayip temiz isimlerle cagirin.

## 0. Calisma Plani

Bu belge icin kabul edilen ana sira soyledir:
1. `yeni.odt` icerigini bolum bolum `yeni.md` dosyasina aktarmak
2. Defter notlarini ve hesaplamalari foto ile dijitale almak
3. Defter icerigini secerek ve temizleyerek ana belgeye tasimak
4. Tum belgeyi butuncul sekilde gozden gecirip sadeleştirmek, duzeltmek ve kaynaklari toparlamak
5. En son asamada MATLAB, LTspice ve gerekiyorsa OrCAD/PSpice ile teknik dogrulama yapmak
6. Sorun bulunursa hesaplari ve tasarimi revize edip belgeyi guncellemek

Ayrintili surum: `tracking/master_plan.md`

## 1. Arka Plan

Ilk donemdeki tasarim, onceki tez calismasinda tamamlanan ve simulasyonla hedef spesifikasyonlari sagladigi gosterilen buck converter tasarimidir. Yeni calisma ise bu ilk tasarimin uzerine kurulan, daha ayrintili hesaplar, ek teknik gereksinimler ve daha bilincli komponent secimleri iceren ikinci tasarim iterasyonudur.

Bu ikinci iterasyonda sadece mevcut devreyi tekrar etmek yerine, tasarim kararlarini daha guclu kaynaklarla ve daha sistematik hesaplarla desteklemek hedeflenmektedir. Ozellikle kontrolcu tasarimi, kapasitör secimi, giris filtresi, EMI, MOSFET kayiplari ve bootstrap davranisi daha derin ele alinacaktir.

## 2. Durum Ozeti

### 2.1 Ilk tasarim

Ilk tasarim tamamlanmis bir referans noktasi olarak kabul edilir:
- simulasyonlari alinmistir
- temel spesifikasyonlari sagladigi gosterilmistir
- ilk donem raporunda anlatilmistir

Bu nedenle ilk tasarim, yeni calisma icin hem karsilastirma tabani hem de dogrulanmis baslangic noktasi olarak degerlendirilir.

### 2.2 Yeni tasarim

Yeni tasarim daha ileri bir noktayi hedeflemektedir:
- ek spesifikasyonlar tanimlanmistir
- ayrintili hesaplamalar yapilmistir
- notlarin bir kismi dijital dosyalarda, bir kismi fiziksel defterde kalmistir
- simulasyon dogrulamasi henuz tamamlanmamistir

Bu nedenle mevcut durum, "tasarim dusuncesi olgun, belge ve dogrulama yarim" seklinde ozetlenebilir.

### 2.3 Tasarim yaklasimindaki degisim

`yeni.odt` taslagina gore ilk donemde kontrolcu tasarimi daha once ogrenilen yaklasimla kurulmustu. Yeni iterasyonda ise Can Hoca'dan ogrenilen K-factor yonteminin uygulanmasi hedeflenmistir. Bu degisim, yalnizca kompanzasyon devresini degil, tum tasarim mantigini daha sistematik hale getirme niyetini gostermektedir.

Ayni zamanda bu iterasyonda su basliklara daha fazla agirlik verilmistir:
- LM5146-Q1 ve EVM referanslarinin ayrintili incelenmesi
- dusuk EMI tasarim yaklasimi
- giris ve cikis kapasitelerinin daha bilincli secimi
- pratik komponent ve yerlesim kararlarinin gerekcelendirilmesi

## 3. Tasarim Hedefleri

Bu bolumu tek bir dogruluk kaynagi olarak kullan.

| Parametre | Hedef / Sinir | Not |
| --- | --- | --- |
| Giris gerilimi | `24 V - 36 V` | ana calisma araligi |
| Giris gerilimi transient dayanim | `44 V`, `1 ms` | hayatta kalma siniri, bu aralikta regule calisma zorunlu degil |
| Cikis gerilimi, statik | `14 V +- 3%` | ana setpoint |
| Cikis gerilimi, transient | `14 V +- 20%` | minimum ve maksimum yuk adimlari sirasinda |
| Cikis gucu | `50 W - 125 W` | rezistif yuk |
| Cikis akimi, turetilmis | `3.571 A - 8.929 A` | `Iout = Pout / Vout` |
| Yuk adimi | `3.571 A -> 9 A` | taslakta `5.429 A` load-step olarak not edilmis |
| Anahtarlama frekansi | `332 kHz` | mevcut tasarim secimi, orijinal zorunlu spec degil |
| Izin verilen `Vout` ripple | `100 mVpp` | herhangi bir `Rload` icin |
| Izin verilen `Vin` ripple | `0.24 Vpp` | giris gerilimi peak-to-peak |
| Izin verilen `Vin` transient | `0.36 V` | undershoot veya overshoot limiti |
| Izin verilen giris akimi ripple | `50 mApp` | ideal kaynak varsayimi |
| Minimum verim | `90%` | gerilim ve yuk boyunca |
| Sicaklik hedefi | `76 degC` board worst-case | taslak spec notu |
| EMI hedefi | `CISPR 25 Class 5` | `pi-stage` giris EMI filtresi ve elektrolitik parallel damping hedefi |
| Harici bias/VCC | kullanilmayacak | harici bias secenegi bulunuyor ama bu iterasyonda kullanilmiyor |

## 4. Kullanilan Ana Kaynaklar

Gercek kaynak listesi icin `references/used_sources.md` dosyasini guncelle.

Su an icin cekirdek adaylar:
- `G94_SPEC.txt`
- `G31_Robert_Erikson_fundamentals-of-power-electronics-3n_2020.txt`
- `G32_lm5146-q1.pdf`
- `G35_Basic Calculation of a Buck Converter's Power Stage (Rev. B).pdf`
- `G46_LM5146-Q1EVM User's Guide.pdf`
- `G101_The K Factor.pdf`
- `G112_Simple Success with Conducted EMI and Radiated EMI_snva755.pdf`
- `G113_An Engineer's Guide to Low EMI in DC_DC Regulators_slyy208.pdf`

## 5. Guc Katinin Tasarimi

### 5.1 Topoloji ve temel varsayimlar

#### 5.1.1 LM5146-Q1 dahili LDO siniri

Aktarim durumu:
- Bu alt bolum `yeni.odt` taslagindan temizlenerek tasinmistir.
- Son hali verilmeden once `G32_lm5146-q1.pdf` ile tekrar satir satir dogrulanacaktir.

LM5146-Q1 icinde gate suruculerini ve kontrol devrelerini besleyen nominal `7.5 V` seviyesinde bir dahili LDO bulundugu varsayimi ile ilerlenmektedir. Harici `VCC` kullanilmayacaksa, giris geriliminin bu LDO'yu dropout disinda tutacak kadar yuksek olmasi gerekir.

Taslak notlarda `VCC-LDO VIN to VCC dropout voltage` icin `0.25 V typ` ve `0.72 V max` degerleri alinmistir. Worst-case yaklasimla dahili `7.5 V` VCC uretiminin korunmasi icin asgari giris gerilimi su sekilde yazilmistir:

`Vin_min_for_full_VCC = 7.5 V + 0.72 V = 8.22 V`

Bu sinirin uzerinde `VCC` dugumunun yaklasik `7.5 V` civarinda regule kaldigi kabul edilir. Bu sinirin altinda ise kontrolcu artk tam `7.5 V` uretemez ve `VCC`, `Vin` gerilimini dropout kadar geriden takip etmeye baslar.

#### 5.1.2 Dusuk `Vin` bolgesinin etkisi

Taslakta `Vin = 6 V` icin yaklasik `VCC ~= 5.75 V` ornegi verilmistir. Bu bolge, tasarim acisindan su riskleri getirir:
- gate surucu gerilimi azalir
- MOSFET tam iletime giremeyebilir ve `RDS(on)` artabilir
- iletim kayiplari artabilir
- gate sarj/desarj sureleri uzayarak switching kayiplari buyuyebilir
- koruma ve akim algilama marjlari etkilenebilir

Bu nedenle su karar daha sonra netlestirilmelidir:
- sistem yalnizca `Vin >= 8.22 V` araliginda mi optimize edilecek?
- yoksa harici `VCC` rayi kullanilarak daha dusuk `Vin` bolgesi de etkin calisma alani icine mi alinacak?

#### 5.1.3 Cikis gerilimi setpoint direncleri

Aktarim durumu:
- Degerler `yeni.odt` taslagindan alinmistir.
- Kullanilan divider iliskisi standart `FB` setpoint yaklasimina gore yazilmistir.
- Son turda `G32_lm5146-q1.pdf` ile tekrar kontrol edilecektir.

Taslak notlarda cikis gerilimi hedefi `14 V` olarak secilmistir. Buna karsilik geri besleme bolucu icin su degerler yazilmistir:
- `RFB1 = 16.5 kOhm`
- `RFB2 = 1.00 kOhm`
- package hedefi: `0402`
- tolerans hedefi: `%0.1`

Taslakta kullanilan iliski su sekildedir:

`Vout = VFB x (1 + RFB1 / RFB2)`

Burada `VFB = 0.8 V` alininca:

`Vout = 0.8 x (1 + 16.5 / 1.0) = 0.8 x 17.5 = 14.0 V`

Bu nedenle mevcut direnç secimi, hedeflenen `14 V` cikis gerilimi ile tutarlidir.

Bu bolumde iki tasarim niyeti goruluyor:
- alt direnç `1 kOhm` secilerek bolucu akimi gereksiz yere cok dusurulmemis
- `%0.1` toleransli direncler secilerek cikis gerilimi dogrulugu korunmak istenmis

Sonraki revizyonda su maddeler eklenecek:
- datasheet'teki tam setpoint denklemi
- `VFB` toleransi ve toplam cikis dogruluguna etkisi
- direnç toleransi ve sicaklik katsayisinin hata butcesine katkisi

### 5.2 Duty cycle, `tON(min)`, `tOFF(min)` ve sinir durumlari

#### 5.2.1 Birinci yaklasim ideal duty hesabi

Nominal ilk yaklasimda senkron buck donusturucu icin duty orani su sekilde alinabilir:

`D ~= Vout / Vin`

Buna gore mevcut spesifikasyonlarla:
- `Dmax,ideal = 14 / 24 = 0.583`
- `Dmin,ideal = 14 / 36 = 0.389`

Bu degerler, nominal `24 V - 36 V` giris araliginda high-side anahtarin iletim orani icin ilk taslak sinirlari verir.

#### 5.2.2 `332 kHz` icin zaman alanina ceviri

Mevcut tasarim seciminde:

`fsw = 332 kHz`

Buna gore periyot:

`Tsw = 1 / fsw ~= 3.01 us`

Ideal duty degerleri zaman alanina cevrilirse:
- `tON,max,ideal = 0.583 x 3.01 us ~= 1.76 us`
- `tON,min,ideal = 0.389 x 3.01 us ~= 1.17 us`
- `tOFF,min,ideal = (1 - 0.583) x 3.01 us ~= 1.25 us`
- `tOFF,max,ideal = (1 - 0.389) x 3.01 us ~= 1.84 us`

#### 5.2.3 Minimum on/off sureleri ile ilk karsilastirma

`yeni.odt` taslaginda LM5146-Q1 icin su donanimsal sinirlar not edilmis:
- `tON(min) = 40 ns` high `VIN / VOUT` orani icin
- `tOFF(min) = 140 ns` low-dropout kosullari icin

Yukaridaki ilk ideal hesaplarla karsilastirildiginda gereken `tON` ve `tOFF` sureleri mikro saniye mertebesindedir ve minimum zaman sinirlarinin oldukca uzerindedir. Bu nedenle ilk bakista, nominal `24 V - 36 V` calisma araliginda `tON(min)` ve `tOFF(min)` sinirlari tasarimi zorlayan ana kisit gibi gorunmemektedir.

#### 5.2.4 Taslaktaki duty notlari ile fark

Bootstrap hesabinin icinde ayrica su duty notlari bulunuyor:
- `Dutyhigh,max = 0.648`
- `Dutyhigh,min = 0.432`
- buradan `Dlow,min = 1 - 0.648 = 0.352`

Bu degerler ideal `Vout / Vin` yaklasimindan daha yuksek gorunmektedir. Bu fark su olasiliklardan birinden geliyor olabilir:
- kayiplar ve gercek duty ihtiyaci dahil edilmistir
- farkli bir worst-case senaryo alinmistir
- ara notlarda muhafazakar bir bootstrap varsayimi kullanilmistir
- notlarda tekrar kontrol gerektiren bir tutarsizlik vardir

Su an icin en dogru tavir, bu iki duty kumesini yan yana tutmak ve daha sonra datasheet, secilen komponentler ve gerekirse simulasyon ile tek bir nihai duty zarfina indirmektir.

Bu nedenle acik kontrol maddesi olarak su soru korunacaktir:
- Bootstrap hesabinda kullanilan `0.648 / 0.432` duty degerleri hangi varsayimdan turetildi?

### 5.3 Bobin secimi

#### 5.3.1 Bobinin tasarimdaki rolu

Taslak notlara gore cikis bobini, bu tasarimda hem ripple seviyesini hem de load transient sirasindaki akim yukselme hizini belirleyen ana elemanlardan biridir.

Bobin degeri buyudukce:
- tepeden tepeye bobin akimi dalgalanmasi azalir
- `Vout` ripple'ini kontrol etmek kolaylasir
- cikis kapasitelerinin yuksek frekanstaki yukunu bir miktar azaltmak mumkun olur

Ancak bobin degeri gerektiginden fazla buyutulurse:
- akim degisim hizi yavaslar
- load transient cevabi kotulesebilir
- fiziksel boyut ve maliyet artar

Bu nedenle taslakta bobin secimi, yalnizca ripple azaltma problemi olarak degil, ayni zamanda transient performans ile yapilan bir denge secimi olarak gorulmektedir.

#### 5.3.2 Slew-rate mantigi

Taslakta `Slew Rate Hesabi` basligi altinda vurgulanan ana fikir dogrudur:
- regulator, yuk aniden arttiginda bobin akimini sonsuz hizla artiramaz
- ilk anda gereken ek akim cikis kapasitelerinden gelir
- bobin akiminin yukselme hizi birinci yaklasimda `diL/dt ~= VL/L` ile sinirlanir

Bu nedenle bobin secimi dogrudan su iki buyuklugu etkiler:
- cikis ripple akimi
- yuk adiminda gereken toparlanma suresi

Taslak notlarda ayrica gercek devrede MOSFET `RDS(on)`, bobin `DCR` ve yerlesim kaynakli kayiplarin ideal slew-rate hesabini azaltacagi da fark edilmis. Bu gozlem yerindedir ve nihai hesapta korunmalidir.

#### 5.3.3 Mevcut durum

`yeni.odt` taslaginda bobin seciminin sayisal son hali temiz bicimde yer almiyor. Buna ragmen proje klasorundeki BOM, somut bir cikis bobini adayinin daha once secildigini gosteriyor:
- `BOM/L1_Wurth_Elektronik_7443640680B_7443640680B.pdf`

Bu, bobin seciminin tamamen sifirdan acikta olmadigini; ancak sayisal gerekcesinin henuz `yeni.md` icine duzgun tasinmadigini gosteriyor.

#### 5.3.4 Bu bolume daha sonra eklenecekler

Bu bolum tamamlanirken su maddeler netlestirilecek:
- secilen `L` degeri
- secilen bobinin `DCR` degeri
- saturation akimi ve RMS akim uygunlugu
- ripple akimi hesabi
- yuk adimi altinda gereken minimum akim slew-rate ile uyumu
- secilen BOM parcasi ile hesaplarin birebir eslestirilmesi

### 5.4 Cikis kapasiteleri

#### 5.4.1 Cikis kapasitelerinin temel gorevi

`yeni.odt` taslagina gore cikis kapasiteleri iki ana gorev ustlenir:
- yuk gecislerinde enerji saglamak
- cikis empedansini dusurerek gerilim sapmalarini sinirlamak

Bu iki gorev, cikis ripple'inin ve load transient sirasindaki overshoot / undershoot davranisinin birlikte dusunulmesini gerektirir.

#### 5.4.2 Bu iterasyondaki tasarim karari

Taslakta mevcut yaklasim su sekilde olgunlasmis gorunuyor:
- cikista ana agirlik MLCC'ler uzerinden kurulacak
- mevcut iterasyonda cikisa bulk kapasitör eklemekten kacinilacak
- bunun temel gerekcesi, bulk kapasitörlerin cikis empedansini ve dolayisiyla kompanzasyon davranisini etkilemesidir

Bu karar, `bulk kesinlikle kullanilmaz` anlamina gelmiyor. Su anki anlami daha dar ve daha muhendislik odakli:
- eger MLCC tabanli cikis agi ripple ve transient kriterlerini sagliyorsa, cikisa ek bulk koymayip kontrol tasarimini daha sade tutmak tercih edilir
- eger daha sonra transient hedefleri sikilasirsa, cikis bulk kapasitörü yeniden degerlendirilir

#### 5.4.3 Ripple ve transient acisindan dusunce yapisi

Taslak notlardan cikan ana mantik su sekilde toparlanabilir:
- `Vout` ripple'ini azaltmak icin bobin akimi dalgalanmasi azaltilabilir
- bunun bir yolu bobin enduktansini artirmaktir, ancak bu boyut, maliyet ve transient cevabi acisindan bedelsiz degildir
- daha etkili ikinci yol, anahtarlama frekansi civarinda cikis empedansini dusurmektir
- bunun icin daha yuksek etkin kapasitans ve daha dusuk ESR avantaj saglar

Load transient tarafinda ise taslak su fikri izliyor:
- bobin akimi ani olarak degisemez
- ilk anda gereken fazla akimi cikis kapasiteleri saglar
- bu nedenle cikis kapasiteleri yalnizca ripple elemani degil, ayni zamanda enerji tamponudur

#### 5.4.4 Acik teknik dogrulamalar

Bu bolumde daha sonra eklenecekler:
- cikis kapasitörleri icin etkin kapasitans hesabi
- ESR ve ESL etkisi
- acik-cevrim cikis empedansi ile transient siniri arasindaki bag
- MLCC sayisi ve de-rating hesabi
- cikista bulk kapasitör gerekip gerekmedigine dair nihai karar

### 5.5 Giris kapasiteleri

#### 5.5.1 Gecis yaklasimi

Taslakta cikis ve giris kapasiteleri bilerek farkli felsefelerle ele alinmis:
- cikista bulk kapasitörden kacinmak, kontrol tasarimini sade tutmak icin tercih edilmis
- giriste ise kontrol dongusu dogrudan etkilenmedigi icin bulk kapasitör kullanimi daha acik degerlendirilmis

Bu ayrim dogru bir muhendislik refleksi gosteriyor. Giris tarafinda karar yalnizca ripple ile degil, ayni zamanda EMI, RMS akim dayanimı ve giris transient dayanimi ile de ilgilidir.

#### 5.5.2 Yeni eklenen giris gereksinimleri

Taslakta bu iterasyonda eklenen yeni gereksinimler acikca yazilmis:
- `DeltaVIN_PP <= 0.24 V`
- `DeltaVIN_Tran <= 0.36 V`

Bu iki gereksinim, giris kapasitelerini onceki tasarima gore daha kritik hale getirmektedir.

#### 5.5.3 Secilen genel strateji

Taslak notlarin ozeti su stratejiye isaret ediyor:
- yuksek frekansli ripple bastirma icin MLCC kullan
- etkin kapasitans dususu nedeniyle dc-bias etkisini mutlaka hesaba kat
- RMS akim dayanimini yalnizca kapasitansla karistirma; termal dayanimi da kontrol et
- enerji depolama ve transient dayanimi icin bulk elektrolitik / polimer kapasitörleri degerlendir
- EMI ve yerlesim acisindan giris kapasitörlerini high-side drain ile low-side source arasindaki sicak donguye cok yakin yerlestir

#### 5.5.4 Ilk sayisal notlar

Taslakta su ilk notlar bulunuyor:
- full-load durumda cikis akimi yaklasik `9 A`
- kaba yaklasimla `Iin_rms ~= 0.5 x Iload` varsayimi kullanilmis
- buna gore ilk tahmin `Iin_rms ~= 4.5 Arms`

Bu deger simdilik taslak RMS boyutlandirma notu olarak tutuluyor. Sonraki turda tam duty oranina bagli RMS denkleminden yeniden hesaplanacak.

#### 5.5.5 Acik teknik dogrulamalar

Bu bolume daha sonra su hesaplar eklenecek:
- minimum etkin `Cin` hesabi
- dc-bias ve toleransla duzeltilmis gercek kapasitans
- MLCC basina RMS akim dagilimi
- sicaklik artisi ve component derating kontrolu
- bulk kapasitör secimi ve damping gerekcesi
- EMI filtresi ile birlikte giris aginin son hali

### 5.6 MOSFET secimi ve kayiplar

#### 5.6.1 Mevcut aday parca

Proje klasorunde secilmis MOSFET adayi olarak su parca gorunuyor:
- `BOM/M2_Texas_Instruments_CSD18543Q3A_csd18543q3a.pdf`

Ek not dosyalarinda bu parcaya ait ilk parametre ozeti de bulunuyor:
- `RDS(on) ~= 8.2 mOhm`
- `Qg,total ~= 16 nC`
- `Cgd ~= 54 pF`
- `Qgd ~= 1.2 nC` yaklasimi
- `Vdrive ~= 7.5 V`
- `Rgate = 2.2 ohm` notu

Bu, MOSFET seciminin tamamen acikta olmadigini; fakat son gerekceli anlatimin henuz Markdown belgeye tasinmadigini gosteriyor.

#### 5.6.2 Secim mantigi

Bu tasarimda MOSFET secimi yalnizca dusuk `RDS(on)` aramak degildir. Mevcut notlarin isaret ettigi temel denge su sekildedir:
- dusuk `RDS(on)` ile iletim kayiplari azaltilmak istenir
- dusuk gate charge ile switching kayiplari ve surucu yuku sinirli tutulmak istenir
- `332 kHz` gibi orta-yuksek bir frekansta, yalnizca iletim kaybina bakmak yetersizdir
- termal limitler, paket yetenegi ve gercek PCB kosullari birlikte degerlendirilmelidir

Bu nedenle MOSFET secimi en az su basliklarla savunulmalidir:
- `VDS` gerilim marji
- `RDS(on)`
- `Qg`, ozellikle `Qgd`
- termal metrikler ve paket
- guvenli calisma alani ve akim/avalanche sinirlari

#### 5.6.3 Ilk kayip notlari

`Verimlilik.txt` icinde bu aday MOSFET ve secilen frekans civari icin su ilk tahminler yer aliyor:
- toplam MOSFET switching kaybi `~540 mW`
- toplam MOSFET conduction kaybi `~1.65 W`

Bu sayilar henuz son dogrulanmis sonuc olarak alinmamalidir; ancak taslak dusunceyi gosterir:
- bu tasarimda iletim kaybi, switching kaybindan daha baskin gorunmektedir
- buna ragmen `332 kHz` frekansinda switching kaybi ihmal edilecek kadar kucuk degildir

Bu da secilen frekansin ve secilen MOSFET'in birlikte degerlendirilmesi gerektigini gosterir.

#### 5.6.4 Thermal ve datasheet yorumu acisindan dikkatler

Yerel kaynaklar icinde MOSFET current rating yorumuna dair onemli bir not da bulunuyor: datasheet'teki akim sinirlari genellikle olculen degil, belirli termal varsayimlarla hesaplanan degerlerdir.

Bu nedenle son raporda su ilke korunmalidir:
- MOSFET'in datasheet continuous current degeri dogrudan yeterlilik kaniti olarak kullanilmayacak
- bunun yerine gercek kayip hesabi ve termal varsayim zinciri kurulacak
- `RthetaJA`, `RthetaJC`, kart sicakligi ve tahmini junction sicakligi birlikte yorumlanacak

#### 5.6.5 Bu bolume daha sonra eklenecekler

Bu bolum tamamlanirken su maddeler netlestirilecek:
- secilen MOSFET'in tam datasheet ozeti
- `VDS` marji ve maksimum gerilim gercekleri
- `RDS(on)`'un surme gerilimi ve sicaklikla degisimi
- iletim kaybi hesabi
- switching kaybi hesabi
- gate surucu kaybi ve dead-time etkileri
- gerekiyorsa common-source inductance ve parasitik etkiler
- tahmini junction sicakligi ve termal marj

### 5.7 Bootstrap agi

#### 5.7.1 Taslaktaki secim mantigi

`yeni.odt` taslaginda bootstrap agi icin oldukca ayrintili bir ilk boyutlandirma notu bulunuyor. Temel mantik su sekilde kurulmus:
- bootstrap kondansatoru low-side iletim araliginda sarj olur
- bu nedenle en kritik durum, high-side iletim suresinin en uzun oldugu ve low-side sarj penceresinin en kisa kaldigi durumdur
- `Rboot` cok buyurse sarj yavaslar
- `Rboot` cok kuculurse pik akim ve ringing artar

Bu cerceve dogru bir muhendislik baslangicidir.

#### 5.7.2 Taslaktan alinan sayisal degerler

Taslakta kullanilan degerler su sekildedir:
- `Dutyhigh,max = 0.648`
- `Dutyhigh,min = 0.432`
- `Dlow,min = 1 - 0.648 = 0.352`
- `fsw = 332 kHz`
- `Tsw ~= 3.01 us`
- `tcharge,min = 0.352 x 3.01 us ~= 1.06 us`
- `Rboot = 2.2 ohm`
- `Cboot = 0.1 uF`
- `VDD = 8.4 V`
- `VBootDiode ~= 0.5 V`
- ilk yaklasimla `VCboot ~= 7.9 V`

Ayni taslakta tepe bootstrap sarj akimi de su sekilde hesaplanmis:

`Ipk ~= (8.4 - 0.5) / 2.2 ~= 3.6 A`

Bu deger, bootstrap diyodu ve kisa sarj dongusu uzerindeki PCB izleri icin anlamli bir ilk boyutlandirma kontroludur.

#### 5.7.3 Ilk fiziksel sanity check

Taslaktaki degerlerle standart RC zaman sabiti kullanilirsa:

`tau_std = Rboot x Cboot = 2.2 x 0.1 uF = 0.22 us`

Worst-case sarj penceresi ise:

`tcharge,min ~= 1.06 us`

Buna gore:

`tcharge,min / tau_std ~= 1.06 / 0.22 ~= 4.8`

Bu ilk kontrol, bootstrap kondansatorunun worst-case low-side iletim araliginda anlamli olcude sarj olabildigini gosterir. Dolayisiyla `Rboot = 2.2 ohm` ve `Cboot = 0.1 uF` secimi ilk bakista UVLO riski acisindan makul gorunmektedir.

#### 5.7.4 Yeniden turetilmesi gereken kisimlar

Taslak notlardaki bazi esitsizlikler ve formuller son hal olarak kabul edilmemelidir:
- taslakta yazilan `tau = Rboot x Cboot / Dlow,min` ifadesi standart RC zaman sabiti tanimi degildir
- `Eres ~= 3 x Cboot x Rboot` ifadesi boyutsal olarak suphelidir ve nihai enerji hesabi olarak kullanilmamalidir
- buna bagli direnç watt yorumu tekrar kurulmalidir

Bu nedenle bootstrap bolumunde su ayirim korunmalidir:
- sarj penceresi, pik akim ve ilk RC kontrolu faydali bir taslak hesap olarak saklanabilir
- enerji ve direnç guc derecelendirmesi ise fiziksel olarak tutarli bir modelle yeniden hesaplanmalidir

#### 5.7.5 Sonraki dogrulamalar

Bu bolume daha sonra su kontroller eklenecek:
- `Dutyhigh,max` degerinin nereden geldiginin acikca gosterilmesi
- `VDD` seviyesinin ve diyot dusumunun datasheet ile teyidi
- bootstrap diyotunun peak akim ve ters gerilim uygunlugu
- `Rboot` seciminin ringing ve sarj hizi acisindan simulasyonla gozlenmesi
- gerekiyorsa PSPICE / LTspice ile bootstrap dugumu dalga seklinin kontrolu

## 6. Kontrolcu ve Kompanzasyon

### 6.1 Modulator ve power stage modeli

#### 6.1.1 Genel kontrol yapisi

Taslakta kontrol dongusu su bloklar uzerinden dusunuluyor:
- modulator
- power stage, yani cikis filtresi ve yuk
- hata yukselteci / kompanzator
- geri besleme bolucusu

Bu cerceve, voltage-mode control dusunce yapisi ile uyumludur. Kompanzatorun gorevi, power stage'in kutup ve sifirlarini hesaba katarak istenen crossover frekansi ve faz marjini saglamaktir.

#### 6.1.2 Modulator blogunun rolu

`yeni.odt` taslaginda modulator blogu icin su temel gozlem yapiliyor:
- modulator duty cycle'i belirler
- kompanzator cikisi arttikca high-side iletim suresi artar
- bu da duty cycle'in artmasi ve enerji transferinin buyumesi anlamina gelir

Yerel script notlarinda LM5146-Q1 icin modulator kazanci, ramp genligi uzerinden tanimlanmis:

`M = Vin / Vramp`

Ayni scriptte `Vramp = Vin / 15` alinmis ve boylece modulator kazanci fiilen sabit `15` olarak kullanilmistir. Bu, taslaktaki `input voltage feedforward` yorumuyla uyumludur: giris gerilimi degisirken ramp genligi de uygun sekilde degisiyorsa modulator kazanci yaklasik sabit tutulabilir.

Bu nokta cok onemlidir, cunku kontrol tasarimini sadeleştirir:
- `Vin` degisse bile modulator kazanci buyuk olcude sabit kalir
- bu da plant kazancindaki degisimi kismen telafi eder

#### 6.1.3 Power stage modeli

Yerel scriptte power stage, cikis filtresi ve yukun ikinci dereceden bir transfer fonksiyonu olarak ele alindigi goruluyor. Bu modelde:
- bobin `L`
- bobin seri direnci `r_L`
- cikis kapasiteleri ve etkin ESR etkisi
- yuk direnci `R`

beraber dusunuluyor.

Bu, taslaktaki anlatimla da uyumludur: cikis filtresi ve yuk birlikte kontrol dongusunun frekans cevabini belirler ve kompanzator secimi bu modele bakilarak yapilir.

#### 6.1.4 Bu bolumde korunacak ayrim

Su an icin iki ayri katman oldugu acik yazilmalidir:
- genel yontem ve blok diyagram mantigi
- gercek tasarima ait sayisal transfer fonksiyonu

`G103_comp.txt` icindeki sayilar faydali bir ornek / calisma dosyasidir; ancak bunlarin tamami dogrudan bu proje icin son deger olarak alinmamalidir. Nihai transfer fonksiyonu, bu projede secilen gercek `L`, `C`, `ESR`, `DCR`, yuk ve modulator parametrelerinden yeniden kurulacaktir.

### 6.2 K-factor yaklasimi

#### 6.2.1 Neden bu yontem?

`yeni.odt` taslagina gore ilk donemde kontrolcu tasarimi farkli bir yaklasimla yapilmisti. Bu iterasyonda ise K-factor yonteminin kullanilmasi hedefleniyor.

Bu degisim onemli cunku K-factor yaklasimi:
- hedef crossover frekansi icin gereken kompanzator kazancini sistematik kurar
- gerekli faz katkisini acikca hesaplamaya zorlar
- Type-III kompanzator komponentlerini daha izlenebilir bir akisla cikarir

#### 6.2.2 Taslaktaki akisin ozeti

Yerel notlar ve `G95_04_K_FACTOR_CAN_HOCA.txt` icindeki ornek akis su mantigi izliyor:
1. hedef crossover frekansi secilir
2. hedef faz marji secilir
3. plant ve modulatorun crossover frekansindaki fazi bulunur
4. kompanzatorun saglamasi gereken ek faz bulunur
5. kompanzatorun crossover frekansindaki gereken kazanci bulunur
6. buradan `K` faktoru hesaplanir
7. Type-III agin `R` ve `C` degerleri turetilir

Bu akis, tasarimi deneme-yanilma yerine daha kontrollu hale getirir.

#### 6.2.3 Scriptlerde gorulen ilk ipuclari

Yerel scriptte su genel iliskiler kullaniliyor:
- crossover frekansi kabaca `f_t = 0.1 x f_s`
- gerekli kompanzator kazanci, modulator ve plant buyukluklerinden turetiliyor
- `K = tan^2((phi_comp + 90 deg)/4)` tipinde standart K-factor iliskisi kullaniliyor

Bu iliskiler, taslaktaki yontemin teorik omurgasini veriyor. Ancak burada yine ayni dikkat korunmali:
- scriptteki ornek `60 V -> 15 V`, `100 kHz` ve belirli `L/C/R` degerleri dogrudan bu projenin son degerleri degil
- bu nedenle sadece yontem aynen alinacak; sayisal sonuc bu proje icin yeniden hesaplanacak

#### 6.2.4 Bu projede K-factor'un gorevi

Bu tasarim ozelinde K-factor yontemi ile sonunda su ciktilar uretilmek isteniyor:
- secilen `332 kHz` anahtarlama frekansi icin uygun bir crossover frekansi
- hedef faz marji
- Type-III kompanzator komponentleri
- acik ve kapali cevrim bode yorumu

Bu bolum, ileride MATLAB ve LTspice ile yapilacak loop dogrulamasinin teorik baslangic noktasi olacak.

### 6.3 Hedef frekans yerlestirmesi

#### 6.3.1 Ilk ilke

Yerel scriptlerde ve notlarda ilk yaklasim olarak crossover frekansinin anahtarlama frekansinin yaklasik onda biri civarinda secilmesi fikri kullaniliyor.

Bu tasarimda secilen:
- `fsw = 332 kHz`

olduguna gore ilk muhendislik tahmini su olur:

`fc,ilk ~= fsw / 10 ~= 33.2 kHz`

Bu sadece ilk yerlestirme tahminidir; son deger plant kutuplari, ESR sifiri, transient hedefleri ve faz marji ile birlikte belirlenecektir.

#### 6.3.2 Sonradan eklenecekler

Bu bolume daha sonra su maddeler eklenecek:
- gercek hedef `fc` secimi
- `fo`, ESR sifiri ve kompanzator sifir/kutup konumlari
- secilen frekans yerlestirmesinin transient ve EMI ile iliskisi

### 6.4 Beklenen faz ve kazanc marjlari

#### 6.4.1 Taslak hedef bandi

Bu bolumde henuz nihai sayisal bode sonucu yoktur. Ancak yerel K-factor notlari ve voltage-mode buck kompanzasyon mantigina dayanarak ilk taslak hedef su sekilde yazilabilir:
- faz marji pozitif ve rahat bir bolgede olmali
- ilk hedef olarak `50 deg - 60 deg` bandi makul gorunuyor
- yerel ornek akislarda `55 deg` civari hedef kullaniliyor
- kazanc marji da pozitif kalmali; nihai deger bode sonucu ile raporlanmali

Buradaki sayilar su an "tasarim niyeti" seviyesindedir. Gercek `L`, `C`, `ESR`, `DCR`, modulator kazanci ve yuk araligiyla olusan plant uzerinden tekrar kontrol edilmeden final kabul edilmeyecektir.

#### 6.4.2 Neden bu kadar onemli?

Faz marji ve kazanc marji yalnizca akademik bir bode ciktisi degil, bu tasarimin davranisini dogrudan etkileyen karar olcutleridir:
- faz marji dusuk kalirsa load transient sonrasi ringing ve asiri tasma artabilir
- faz marji gereksiz fazla secilirse sistem gereksiz yavaslayabilir
- giris filtresi, parasitikler ve gercek ESR/DCR degerleri bu marjlari kagittaki ilk tahminden uzaklastirabilir

Bu nedenle nihai tasarimda hedef, yalnizca teorik olarak stabil bir dongu degil; transient, EMI ve uygulama toleranslari altinda da guvenli kalan bir dongu olmaktir.

## 7. EMI, Giris Filtresi ve Yerlesim

### 7.1 Hot-loop ve kritik akim yollari

Senkron buck yapisinda en kritik yuksek `di/dt` dongusu, giris kapasitörleri ile yarim kopru arasindaki sicak dongudur. Pratik olarak bu dongu su elemanlar uzerinden kapanir:
- giris MLCC / bulk kapasitörleri
- high-side MOSFET
- low-side MOSFET
- tekrar giris kapasitörlerinin donus yolu

Bu alan buyudukce parasitik enduktans artar, anahtarlama anindaki gerilim sivrilmeleri ve yayilan EMI agirlasir. Bu nedenle:
- giris seramik kapasitörleri yarim kopruye fiziksel olarak cok yakin konulmalidir
- high-side drain ile low-side source arasindaki akim yolu kisa ve kompakt tutulmalidir
- switch-node bakir alani gereksiz buyutulmamali, sadece zorunlu akim tasima ve termal ihtiyac kadar birakilmalidir

Ikinci onemli akim yolu, bobin ve cikis kapasitörleri etrafindaki cikis akis yoludur. Bu yol hot-loop kadar sert `dv/dt` uretmese de ripple, transient ve olcum kalitesi uzerinde belirgindir.

### 7.2 Differential-mode EMI

Differential-mode EMI'nin ana kaynagi, buck donusturucunun kaynaktan cektigi darbeli giris akimidir. Bu tasarimda ilgili spesifikasyon dogrudan zorlayicidir:
- `CISPR 25 Class 5` hedefi var
- `pi-stage` giris EMI filtresi ve elektrolitik parallel damping hedefi zaten specification notlarina girmis durumda

Bu nedenle differential-mode EMI yalnizca "sonradan filtre eklenir" mantigiyla ele alinmamalidir. Asagidaki basliklar guc kati tasariminin bir parcasi kabul edilmelidir:
- giris kapasitörlerinin ESL/ESR ve dc-bias altindaki gercek davranisi
- filtre once/sonra kapasitör dagilimi
- EMI bobini ve kapasitörlerle olusan rezonanslar
- damping ihtiyaci
- layout kaynakli ek parasitikler

Bu bolumde ileride sayisal olarak eklenecek ana maddeler:
- filtre topolojisi
- diferansiyel-mod zayiflatma hedefi
- filtre kesim / rezonans frekanslari
- damping elemanlarinin gerekcesi

### 7.3 Common-mode EMI

Common-mode EMI, yalnizca giris akim dalgalanmasindan degil, hizli `dv/dt` ureten switch-node'un parasitik kapasiteler uzerinden cevreye enerji baglamasindan da kaynaklanir. Bu nedenle ortak-mod acisindan en hassas bolgeler:
- switch-node bakiri
- yarim kopruye yakin sicak alanlar
- kabloya, saseye veya olcum duzenine kapasitif bag yapabilecek yuzeyler

Bu tasarimda common-mode davranisini iyilestirmek icin ilk yerlesim refleksleri sunlar olmalidir:
- switch-node bakirini gereksiz buyutmeme
- feedback, COMP ve benzeri kucuk isaret hatlarini switch-node altindan veya yakinindan gecirmeme
- kirli guc alani ile sakin analog alani fiziksel olarak ayirma
- gerekiyorsa shield / ekranlama seceneklerini en sonda degerlendirme

Common-mode EMI bu asamada henuz hesaplanmis degildir; ama layout kararlarini bastan yonlendiren bir sinir olarak yazilmalidir.

### 7.4 Giris filtresi kararliligi

Giris EMI filtresi eklendiginde mesele yalnizca bastirma elde etmek degil, donusturucunun bu filtre ile birlikte kararliligini korumaktir. Yerel notlarda ve acik sorular listesinde dogru olarak isaretlendigi gibi burada Middlebrook tarzi bir uyum kontrolu gerekecektir.

Bu bolumde korunacak ana fikir su olmali:
- EMI filtresinin cikis empedansi ile donusturucunun giris tarafi dinamik davranisi tehlikeli bir etkilesime girmemelidir
- filtre rezonansi kontrol dongusu ve guc kati ile problemli bir cift kutup / negatif empedans etkisi olusturmamalidir
- gerekli ise elektrolitik parallel damping veya ayri damping agi kullanilmalidir

Bu kisimda henuz final esitlik ve sayisal kontrol yoktur. Final turda su adimlar eklenecek:
1. secilen `L_f` ve `C_in,filter` ile rezonans frekansi hesaplanacak
2. damping yaklasimi secilecek
3. LTspice veya PSpice ile filtreli ve filtresiz giris davranisi karsilastirilacak
4. Middlebrook uyumu rapora acik bir kontrol maddesi olarak yazilacak

### 7.5 Yerlesim kurallari

Bu bolum, ileride eklenecek PCB layout incelemesinin kontrol listesi gibi kullanilmalidir. Bu turda korunacak ilk kurallar:
- giris MLCC'lerini high-side / low-side guc yoluna olabildigince yakin koy
- bootstrap yolu, gate-drive dongusu ve yarim kopru alanini kisa tut
- switch-node alanini minimumda tut; analog hatlari bu bolgeden uzaklastir
- feedback gerilimini gurultulu switch-node'dan degil, sakin cikis dugumunden Kelvin benzeri mantikla al
- analog toprak ile guc topragi iliskisini kontrolcu datasheet'indeki mantiga gore kur; kirli geri donus akislarini analog referans uzerinden gecirme
- giris EMI filtresinin "kirli taraf" ve "temiz taraf" yerlestirmesini fiziksel olarak ayir
- olcum ve dogrulama icin kritik dugumlere test noktasi birak

Sonraki turda bu genel kurallar, gercek PCB veya EVM layout gorselleri uzerinden maddelendirilerek daha somut hale getirilecektir.

## 8. LTspice Dogrulama Plani

Kontrol listesi:
- [ ] steady-state
- [ ] load transient
- [ ] line transient
- [ ] startup
- [ ] min/max `Vin`
- [ ] min/max yuk
- [ ] kompanzasyon dogrulama
- [ ] ringing / snubber ihtiyaci
- [ ] giris filtresi etkisi

Simulasyon dosyalari notlari:
- Kullanilacak ana semalari burada ozetle.
- Gerekirse ilgili `asc` dosyalarini bu bolumde bagla.

## 9. Secilmis Gorseller

GitHub icin tercih edilen kullanim:

```md
![Cikis ripple olcumu](images/fig_01_vout_ripple.png)
```

Not:
- `foto/` klasorundeki tum gorselleri bu belgeye eklemeyin.
- Yalnizca kullanacaginiz gorselleri `images/` klasorune daha duzenli isimlerle kopyalayin.

## 10. Acik Sorular

Ayrintili takip icin `tracking/open_questions.md` dosyasini kullan.

Kisa liste:
- [ ] Spesifikasyon tablosu donduruldu mu?
- [ ] Tum hesaplar kaynak ve birim kontrolu ile tekrar yazildi mi?
- [ ] Bootstrap hesaplari tekrar dogrulandi mi?
- [ ] Cikis kapasiteleri transient hedefini sagliyor mu?
- [ ] Giris kapasiteleri ripple ve RMS akisina gore dogrulandi mi?
- [ ] EMI icin ilk yerlesim kurallari yazildi mi?

## 11. Degisiklik Gunlugu

### 2026-03-20

- GitHub uyumlu ilk Markdown iskeleti olusturuldu.
- Bu belge, tez formati yerine yasayan muhendislik dokumani mantigina cevirdi.
- Ana calisma plani belgeye eklendi.
- `yeni.odt` icindeki giris ve genel yaklasim bolumu temizlenerek Markdown yapisina aktarilmaya baslandi.
- Specification tablosu G94 notlarina gore dolduruldu.
- `FB` divider ve duty / min on-off bolumu ilk turda yazildi.
- Bobin ve bootstrap bolumleri ilk teknik cerceveyle dolduruldu.
- MOSFET secimi ve kayiplar bolumu ilk teknik cerceveyle dolduruldu.
- Kontrolcu bolumunun modulator, K-factor ve ilk frekans yerlestirmesi iskeleti yazildi.
- Faz/kazanc marji icin ilk taslak hedef bandi eklendi.
- EMI, giris filtresi kararliligi ve layout bolumune ilk teknik omurga eklendi.









