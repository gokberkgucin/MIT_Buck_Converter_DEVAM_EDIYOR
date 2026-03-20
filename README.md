# MIT_Buck_Converter
MIT Güç Elektroniği Dersinin Proje Ödevi
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
| Giris gerilimi | TODO | |
| Cikis gerilimi | TODO | |
| Maksimum cikis akimi | TODO | |
| Anahtarlama frekansi | TODO | |
| Izin verilen `Vout` ripple | TODO | |
| Izin verilen `Vout` transient | TODO | |
| Izin verilen `Vin` ripple | TODO | |
| Izin verilen `Vin` transient | TODO | |
| Verim hedefi | TODO | |
| Termal hedef | TODO | |
| EMI hedefi | TODO | |

## 4. Kullanilan Ana Kaynaklar

Gercek kaynak listesi icin `references/used_sources.md` dosyasini guncelle.

Su an icin cekirdek adaylar:
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

`yeni.odt` taslaginda `Vout = 14 V` icin `RFB1 = 16.5 kOhm` ve `RFB2 = 1.00 kOhm` notu bulunuyor. Bu kisim bir sonraki aktarim adiminda datasheet denklemi, tolerans gerekcesi ve secim mantigi ile birlikte temizlenecektir.
### 5.2 Duty cycle, `tON(min)`, `tOFF(min)` ve sinir durumlari

TODO

### 5.3 Bobin secimi

TODO

### 5.4 Cikis kapasiteleri

TODO

### 5.5 Giris kapasiteleri

TODO

### 5.6 MOSFET secimi ve kayiplar

TODO

### 5.7 Bootstrap agi

TODO

## 6. Kontrolcu ve Kompanzasyon

### 6.1 Modulator ve power stage modeli

TODO

### 6.2 K-factor yaklasimi

Aktarim notu:
- `yeni.odt` icerigine gore bu iterasyonda kontrolcu tasariminda K-factor yontemi kullanilacaktir.
- Bu bolume daha sonra kaynakli ve denklemleri duzenlenmis bir anlatim tasinacaktir.

TODO

### 6.3 Hedef frekans yerlestirmesi

TODO

### 6.4 Beklenen faz ve kazanc marjlari

TODO

## 7. EMI, Giris Filtresi ve Yerlesim

### 7.1 Hot-loop ve kritik akim yollari

TODO

### 7.2 Differential-mode EMI

TODO

### 7.3 Common-mode EMI

TODO

### 7.4 Giris filtresi kararliligi

TODO

### 7.5 Yerlesim kurallari

TODO

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


