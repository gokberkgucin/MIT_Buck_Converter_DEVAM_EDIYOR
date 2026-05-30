# README Red-Team / Acımasız Editör Raporu

Okuma tarihi: 2026-05-28  
Girdi: güncel `README.md`  
Amaç: Metni yazar gibi değil, teknik editör gibi okuyup owner saflığı, tekrar yoğunluğu, görsel/kaynak hijyeni ve sessiz çelişki risklerini yakalamak.

## Kısa Hüküm

README artık ham defter aktarımı olmaktan çıkmış; owner mantığı görünür ve birçok eski tekrar kısa referansa indirilmiş. Ancak belge hâlâ bazı mega-owner cepleri taşıyor. En sert risk, teknik bilgi eksikliği değil; bazı yoğun defter kümelerinin final karar, tasarım izi ve eski iterasyon ayrımını okuyucuya fazla yükleyerek okutması.

Bu turda yalnız high-confidence düzeltmeler README'ye uygulanacak. Daha büyük taşıma işleri low-confidence/yapısal kaldığı için burada raporlandı, sessizce harmonize edilmedi.

## High-confidence Düzeltme Adayları

| Bulgu | Konum | Sorun | Uygulanacak düzeltme |
|---|---|---|---|
| Eski okuma rotası başlığı | Üst okuma rotası, yaklaşık satır 36 | `3. Tasarim Hedefleri` artık mevcut heading değil; güncel başlık `3. Güncel Tasarım Omurgası ve Paylaşılan Tasarım Girdileri`. | Okuma rotası güncel heading adıyla düzeltilecek. |
| Cross-check owner map'te stale kontrol başlığı | `4.1` tablo | `6.1 Feedback divider owner` diye geçen hedef, gerçek başlıkta `owner` suffix'i taşımıyor. | `6.1 Feedback divider` olarak düzeltilecek. |
| Startup içi stale FB yönlendirmesi | `5.1.3` | Kısa yönlendirme de aynı eski `6.1 Feedback divider owner` adını taşıyor. | `6.1 Feedback divider` olarak düzeltilecek. |
| Cross-check owner map'te stale `fc` başlığı | `4.1` tablo | `6.3 Hedef fc ve faz marji owner ozeti` gerçek başlık değil; hem `owner özeti` yanlış hem de iki satırda tekrarlanıyor. | `6.3 Hedef fc ve faz marji` / `6.6 Faz, kazanc marji...` olarak sadeleştirilecek. |
| EMI / input-filter owner map eksikliği | `4.1` tablo ve `4.2` açık kontrol | EMI satırı `7.2` ve simülasyon `8.5`e gidiyor, ama input-filter kararlılığı için primary owner `7.4` açıkça görünmüyor. | `7.4 Giris filtresi kararliligi` owner haritasına eklenecek; `8.5` doğrulama/test rolü olarak kalacak. |
| Kaynak dosya yolu açık kontrolü | `4.1` kaynak listesi | `./WBDesign21.pdf` ve `./BOM/amCharts.json` current workspace içinde bulunamadı. Bu, kaynak izinin yanlış olduğu anlamına gelmeyebilir ama link hijyeni açısından açık kontrol. | README'ye kısa `[Açık Kontrol - dosya yolu]` notu eklenecek; kaynak izi silinmeyecek. |
| Güç katı girişinde duty owner belirsizliği | `5. Güç Katının Tasarımı` giriş paragrafı | Paragraf, duty sınırları güç katında yeniden kuruluyormuş gibi okunabilir; oysa primary owner `3.1`. | Cümle, `3.1`de sabitlenen duty/timing referans alınarak güç katına geçildiğini söyleyecek. |

## Low-confidence / Yapısal Bulgular

| # | Bulgu | Konum | Neden hemen düzeltilmedi |
|---|---|---|---|
| 1 | MOSFET seçimi hâlâ dev bir cep. | `5.6.2 Secim mantigi` yaklaşık 1646 satır / 48 görsel | Alt-ownerlara bölmek doğru olur ama görsel-adjacency ve defter sırası bozulmadan yapılması ayrı taşıma turu ister. |
| 2 | MOSFET kayıp notları termal kapanışa komşu owner gibi taşabiliyor. | `5.6.3`, `5.9.3` | Kayıp denklemleri ile sıcaklık yorumu ayrılmış, ama tekrar okumada hâlâ ağır. Sessiz kısaltma teknik iz kaybı riski taşır. |
| 3 | Cout ripple / Zout bloğu plant ve Type-III'e uzun köprüler içeriyor. | `5.4.4`, ayrıca `6.2`, `6.4`, `6.5` | Fiziksel owner doğru ama bölüm şişkin. Kesmek yerine alt başlıklandırma gerekir. |
| 4 | Cin bulk bloğu input-filter stability tarafına fazla yaklaşmış. | `5.5.7`, `7.4` | Giriş bulk seçimi ile filtre damping sezgisi gerçekten bağlı. Kısaltma yapmadan önce `7.4`e hangi paragrafların taşınacağı net seçilmeli. |
| 5 | Bootstrap bölümü duty, Qg ve VCC konularını tekrar hatırlatıyor. | `5.7.1` | Bu hatırlatmaların çoğu fiziksel bootstrap hesabı için gerekli; yalnız daha iyi alt başlık akışıyla hafifletilebilir. |
| 6 | Type-III eski/yeni komponent setleri okuyucuyu yoruyor. | `6.4.5`, `6.5.2` | Eski iterasyonlar değerli ve çelişkiler zaten görünür. Daha sert sadeleştirme, defter izini zayıflatabilir. |
| 7 | "Benim buradaki okuma" kalıbı çok sık. | Özellikle `5.4`, `5.5`, `5.6`, `6.4` | Kalıp her yerde gereksiz değil; bazı defter görsellerinin anlamını taşıyor. Toplu sadeleştirme ayrı readability turu ister. |
| 8 | Açık kontroller hem yerel owner'larda hem `10. Acik Sorular`da bulunuyor. | `5.x`, `6.x`, `7.x`, `10` | Bu bilinçli bir takip modeli. Risk, `10`un teknik gerekçeyi tekrar etmeye başlaması; şimdilik kısa harita rolünde. |
| 9 | Kaynak linklerinde URL-encoded path false-positive üretiyor. | `4` kaynak listesi | PowerShell `Test-Path` URL decode etmediği için bazı linkler yanlış pozitif kırık göründü; yalnız gerçekten bulunmayan iki kaynak açık kontrol yapıldı. |
| 10 | Belge hâlâ yer yer "karıştırılmış sayfalar" hissi veriyor. | Mega defter kümeleri | Sorun teknik doğruluk değil, ritim ve alt-owner kırılımı. Bu yapısal bir edit turu ister. |

## Owner Saflığı Bulguları

- `3.1` duty/timing owner olarak güçlü. Buna rağmen `5.7.1` ve `7.2` içinde duty tekrarlarının bootstrap/EMI hesabını gölgeleme riski var.
- `5.4` Cout owner olarak doğru yer, fakat `5.4.4` içinde plant/Type-III köprüleri okuyucuyu kontrol owner'ına erken çekiyor.
- `5.5` Cin owner olarak doğru yer, fakat `5.5.7` bulk/damping anlatısı `7.4` input-filter owner'ına çok yaklaşıyor.
- `5.6` MOSFET owner doğru fakat kendi içinde seçme kriteri, gate-charge, dv/dt, loss ve eski defter izleri alt-owner olarak yeterince ayrışmamış.
- `5.9` termal kapanış tek owner olarak yerinde; yerel termal pointerlar çoğunlukla kısa kalmış.
- `6` kontrol/kompanzasyon zinciri artık doğru owner'da; current-limit/Rilim/Cilim burada yaşamıyor.
- `7.4` input-filter stability owner'ı iyi fakat `4.1` kaynak haritasında yeterince görünür değildi.

## Görsel ve Kaynak Hijyeni

- Markdown görsel linkleri için hızlı varlık kontrolünde eksik görsel bulunmadı.
- Görseller çoğunlukla destekledikleri teknik paragrafın yanında duruyor.
- Görsel anlamı genelde sadece dosya adına bırakılmamış; hemen öncesinde/sonrasında yorum var.
- Kaynak listesinde iki path current workspace içinde bulunamadı: `./WBDesign21.pdf`, `./BOM/amCharts.json`. Bunlar silinmedi; README içinde açık kontrol olarak görünür yapılacak.

## Açık Kontrol Hijyeni

- Yerel açık kontrollerin çoğu bir owner'a bağlı.
- `10. Acik Sorular` genel takip listesi olarak yerinde, fakat teknik gerekçeyi büyütmemeli.
- En kritik açık çelişki aileleri hâlâ doğru şekilde görünür: Cout ESR ailesi, Cin/WEBENCH ripple farkı, MOSFET kapasitans/Qg varyantları, Type-III eski/yeni komponent setleri, input-filter frekans/damping adayları.

## High-confidence README Değişiklikleri

Bu rapordan sonra README'ye uygulanacak küçük düzeltmeler:

1. Eski `3. Tasarim Hedefleri` okuma rotası güncel `3. Güncel Tasarım Omurgası ve Paylaşılan Tasarım Girdileri` başlığına çevrilecek.
2. `4.1` cross-check owner map'te ve `5.1.3` startup yönlendirmesinde stale owner hedefleri temizlenecek.
3. EMI / input-filter satırında `7.4 Giris filtresi kararliligi` primary owner olarak görünür yapılacak.
4. `WBDesign21.pdf` ve `BOM/amCharts.json` dosya yolu için açık kontrol notu eklenecek.
5. `5. Güç Katı` girişinde duty/timing'in `3.1`den alındığı netleşecek.

## Low-confidence Olarak Bırakılanlar

- Mega MOSFET bölümlerini alt-ownerlara bölmek.
- `5.4.4` Cout/plant/Type-III köprülerini daha küçük bloklara ayırmak.
- `5.5.7` bulk/damping/filter stability ayrımını yeniden kesmek.
- `5.7.1` bootstrap içindeki duty/Qg/VCC hatırlatmalarını yeniden yazmak.
- Çok sayıda "Benim buradaki okuma" kalıbını toplu sadeleştirmek.

Bu noktalar bir sonraki turda yapılacaksa sebep teknik değer eksikliği değil, yapısal okunabilirlik ve alt-owner ayrımıdır.
