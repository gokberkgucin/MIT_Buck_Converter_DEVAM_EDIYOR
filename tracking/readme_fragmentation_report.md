# README Dağınıklık ve Owner Saflığı Raporu

Okuma tarihi: 2026-05-28  
Kapsam: `README.md` dosyasının tamamı.  
Not: Bu rapor yalnızca haritalamadır; bu aşamada `README.md` değiştirilmedi.

## En problemli 15 dağınık konu kümesi

| # | Dağınık konu kümesi | Nerelerde duruyor | Sorun tipi | Önerilen primary owner / işlem |
|---|---|---|---|---|
| 1 | MOSFET gate-charge, capacitance, plateau ve `dv/dt` parametre ailesi | `5.6.2`, `5.6.3`, `5.7.1`, `7.3`, `8.3` | Aynı parametre ailesi seçim, kayıp, bootstrap ve EMI bağlamında uzun anlatılıyor; Qg/Ciss/Coss/Crss/Vpl varyantları final gibi karışabiliyor. | `5.6 MOSFET seçimi ve kayıplar`; bootstrap ve EMI bölümlerinde kısa referans. Çelişen/alternatif parametre setleri `[Eski İterasyon]` veya `[Çapraz Teyit]` etiketiyle ayrılmalı. |
| 2 | MOSFET kayıpları ve termal kapanış | `5.6.3`, `5.6.4`, `5.9.3`, `8.3`, `10` | Kayıp denklemleri MOSFET owner'ında, sıcaklık kapanışı termal owner'da; bazı cümleler termal owner olmaya yaklaşıyor. | Kayıp denklemleri `5.6.3`; çok adımlı sıcaklık/Tj kapanışı `5.9`. Diğer yerlerde checklist/pointer. |
| 3 | Giriş kapasitörü, bulk, EMI attenuation ve giriş filtresi ilişkisi | `5.5.4`, `5.5.6`, `5.5.7`, `7.2`, `7.4`, `8.5` | Cin seçimi, bulk enerji tamponu, DM EMI ve filter stability aynı sayıları farklı amaçlarla yeniden açıyor. | Cin ve bulk seçimi `5.5`; EMI hedef/attenuation `7.2`; filter stability/damping `7.4`; simülasyon `8.5`. |
| 4 | Çıkış kapasitörü, `Zout`, plant ve Type-III köprüsü | `5.4.3`, `5.4.4`, `5.4.5`, `6.2.3`, `6.4`, `6.5`, `8.4` | Cout/ESR sayıları hem çıkış owner'ında hem plant/kompanzasyon içinde uzun bağlamla tekrar görülebiliyor. | Cout/Zout/bulk/energy buffer `5.4`; plant `6.2` sadece handoff; Type-III `6.4` sadece kontrol hesabı. |
| 5 | Type-III komponent setleri ve eski/yeni calculator sonuçları | `4.1`, `6.1`, `6.4.5`, `6.5`, `6.6` | RFB/RC/CC/fc/fp2 ailesi artık tek owner altında ama eski calculator sayıları final set gibi okunma riski taşıyor. | Ana anlatım `6.4.5`; `6.5/6.6` yalnız `[Çapraz Teyit]`; eski setler `[Eski İterasyon]`. |
| 6 | ESR/Cout/fESR çelişki ailesi | `5.4.4`, `5.4.5`, `6.2.3`, `6.5.2` | `ESR_Ceq`, `f_ESR`, bulk ESR ve plant ESR değerleri farklı varsayımlarla çıkıyor; bazıları dış örnek, bazıları güncel plant. | `5.4` içinde varsayım bazında etiketle; `6.2` sadece kullanılan plant setini referanslasın. Sessiz birleştirme yapılmamalı. |
| 7 | Duty ailesi ve zaman alanı | `3.1`, `5.2`, `5.5.4`, `5.5.7`, `5.7.1`, `7.2` | Duty teknik olarak ortak girdi; alt owner'lar kendi hesabını açıklarken duty anlatımını yeniden büyütebiliyor. | Tek tam owner `3.1`; alt bölümlerde 1-3 cümlelik referans ve kullanılan duty noktasının adı. |
| 8 | Bootstrap, VCC/LDO ve gate-drive charge zinciri | `5.1`, `5.6.2`, `5.7.1`, `5.9.1`, `7.1` | VCC enerjisi, Cboot/CVCC, Qg ve charge süreleri birbirine bağlı; owner sınırları bazen bulanıklaşıyor. | Pin/VCC koşulları `5.1`; bootstrap sizing `5.7`; Qg ana parametreleri `5.6`; termal etkiler `5.9`. |
| 9 | LDO/VCC güç kaybı ve controller sıcaklığı | `5.1.1`, `5.1.2`, `5.7.1`, `5.9.1`, `8.3` | Startup pin owner'ı ve thermal owner aynı VCC/LDO bilgisini farklı derinliklerde kullanıyor. | İlk çalışma koşulu `5.1`; güç kaybı ve sıcaklık kapanışı `5.9.1`; simülasyon listesinde kısa kontrol. |
| 10 | Giriş filtresi rezonansı, damping ve negatif giriş empedansı | `5.5.7`, `7.2`, `7.4`, `8.5`, `10` | Bulk/damping sezgisi Cin owner'ında gerekli ama filter stability hesabı `7.4`te daha doğru owner. | `7.4` primary owner; `5.5.7` bulk seçiminin damping sezgisiyle sınırlı kalsın. |
| 11 | Termal board hedefi, MLCC sıcaklığı, MOSFET `T_J` ve datasheet current yorumu | `3`, `5.5.5`, `5.6.4`, `5.9`, `8.3`, `10` | Termal hedef ortak girdi; çeşitli komponent bölümleri sıcaklık yorumu yapıyor. | Çok adımlı termal kapanış `5.9`; komponent owner'larında kısa yerel gerekçe. |
| 12 | Kaynak/cross-check çıktılarının teknik owner gibi görünmesi | `4.1`, `4.2`, `6.5`, `6.6`, `8.7` | Kaynaklar bölümü doğru sadeleşmiş, ancak bazı heading adları eski owner adlarıyla kalmış; cross-check çıktıları final sayı gibi okunabilir. | `4` sadece rol/güven/cross-check haritası; teknik owner'larda etiketli kısa kutular. |
| 13 | Açık kontrollerin yerel owner ve genel açık sorular arasında yinelenmesi | `5.3.4`, `5.4.7`, `5.5.8`, `5.6.5`, `5.9.4`, `6.5.3`, `8`, `10` | Bilerek tekrar edilen açık maddeler var; uzun teknik açıklamaya dönerse duplicate density artar. | Yerel owner'da teknik ayrıntı; `10`da sadece takip özeti. |
| 14 | Görsel yoğun defter izlerinin final tasarım ile eski iterasyon ayrımı | `5.1.4`, `5.4.4`, `5.5.6`, `5.5.7`, `5.6.2`, `5.6.3`, `5.7.1`, `6.4.4`, `6.5.2` | Görseller iyi korunmuş, fakat eski defter ekranı yoğunluğu bazı bloklarda güncel karar akışını gölgeleyebiliyor. | Görseller yerinde kalsın; her görsel kümesi açık `[Eski İterasyon]`, `[Tasarım İzi]` veya `[Çapraz Teyit]` etiketi taşısın. |
| 15 | Belge felsefesi, durum özeti, açık sorular ve değişiklik günlüğü anlatısı | Üst giriş, `0`, `1`, `2`, `10`, `11` | Teknik olmayan bağlam birkaç yerde tekrar ediyor; bu bilinçli ama okuma rotası eski başlık adlarına kayarsa yön kaybı yaratır. | Giriş felsefesi ve çalışma planı kısa kalmalı; detaylı teknik owner'lara geçiş net linklenmeli. |

## Diğer dağınık veya dikkat isteyen konu kümeleri

| Konu kümesi | Nerelerde duruyor | Not / öneri |
|---|---|---|
| İndüktör ripple ve plant L kullanımı | `5.3.1`, `6.2.3`, `8.3` | Temiz ayrılmış; `6.2.3` L sayısını sadece plant handoff olarak kullanmalı. |
| Slew-rate ve load-step enerji zinciri | `5.3.2`, `5.4.6`, `8.4` | İndüktör ve Cout rolleri ayrılmış; simülasyonda test maddesi olarak kalmalı. |
| 44 V / 1 ms survive-only koşulu | `3`, `5.1`, `5.6`, `8.6`, `10` | Ortak girdi `3`; diğerleri korunma/doğrulama bağlamı. Regülasyon hedefi gibi anlatılmamalı. |
| Feedback divider ve RT/startup ayrımı | `5.1.3`, `5.1.5`, `6.1` | FB divider artık doğru owner'da; `5.1.3` kısa referans olarak kalmalı. |
| Protection/current-limit ve kompanzasyon ayrımı | `5.8`, `6.2.4`, `10` | Temiz ayrılmış; `6.2.4` sadece korunan sınırı anlatıyor. |
| WEBENCH operating values | `4.2`, `6.6`, `8.3`, `8.7` | WEBENCH final tasarım değil cross-check olarak okunmalı; araç rolü `4.2`de kalıyor. |
| Layout ve common-mode EMI | `7.1`, `7.3`, `7.5`, `8.5` | İyi ayrılmış; `7.3` MOSFET dv/dt hesabını devralmamalı. |
| EMI attenuation ve `C_in` sayıları | `5.5.4`, `7.2`, `7.4` | `7.2`de EMI hesapları, `5.5`te fiziksel kapasite seçimi; iki görev açık etiketlenmeli. |
| Giriş bulk ile çıkış bulk | `5.4.5`, `5.5.7`, `7.4` | Aynı karar gibi gösterilmemiş; bu ayrım korunmalı. |
| Simülasyon planı ve teknik hesaplar | `8.3`-`8.7`, tüm teknik owner'lar | `8` hesap owner'ı değil; sadece test matrisi ve kabul gözlemi tutmalı. |

## En şişkin 10 owner / alt-owner

| # | Blok | Yaklaşık kapsam | Şişme nedeni | Düşük riskli işlem |
|---|---|---:|---|---|
| 1 | `5.6.2 Secim mantigi` | ~1646 satır | MOSFET seçim kriteri, güvenlik, gate-charge, dv/dt ve eski defter ekranları tek alt başlıkta. | Alt-ownerlara böl: seçim kriterleri, güvenlik/SOA, gate-charge/dvdt, eski iterasyon izleri. |
| 2 | `5.6.3 Ilk kayip notlari` | ~1082 satır | Conduction, switching, gate, Coss, reverse-recovery, dead-time ve termal pointer aynı uzun akışta. | Kayıp türlerine göre alt başlıklandır; termali `5.9`a pointer yap. |
| 3 | `5.5.7 Bulk kapasitör secimi mantigi` | ~794 satır | Giriş bulk, transient enerji, damping, EMI ve filter stability köprüleri birlikte. | Bulk kararını koru; filter stability ayrıntılarını `7.4` referansına indir. |
| 4 | `5.4.4 Vripple ve fsw civarindaki Zout` | ~831 satır | Ripple, Zout, ESR/ESL, dış kaynak örnekleri, plant ve Type-III bağlantıları çok yoğun. | Cout owner kalır; plant/Type-III pasajları kısa cross-check etiketine çekilir. |
| 5 | `5.7.1 Bootstrap direncini hesaplama ve secim mantigi` | ~658 satır | Rboot/Cboot/CVCC sizing, duty, VCC, Qg ve gate-drive birlikte. | Bootstrap sizing ana kalır; duty ve Qg açıklamaları ilgili owner'a referans olur. |
| 6 | `5.5.6 ESL ve yardimci MLCC'ler` | ~389 satır | ESL/helper MLCC, EMI ve layout yüksek frekans etkileri iç içe. | Cin HF bypass ana kalır; EMI/layout yorumları kısa referans. |
| 7 | `6.4.5 Compensator topolojisi ve temel model` | ~365 satır | Final Type-III seti ile eski calculator/defter varyantları beraber. | Final set ve eski/cross-check setleri açık etiketle ayrılmalı. |
| 8 | `7.4 Giris filtresi kararliligi` | ~337 satır | Rezonans, damping, negatif giriş empedansı ve defter kırpımları yoğun. | Ana owner olarak kalır; Cin/bulk tekrarlarını kısa referans yap. |
| 9 | `5.5.4 MLCC Cin hesabi` | ~332 satır | MLCC hesabı, dc-bias, tolerance, duty ve cross-checkler birlikte. | Duty anlatımı `3.1`e referans; MLCC hesabı burada kalır. |
| 10 | `5.1.4 EN/UVLO, SS/TRK ve startup notlari` | ~237 satır | Startup pin hesapları ve çok sayıda defter kırpımı aynı alt başlıkta. | Mevcut hali kabul edilebilir; sadece defter kümeleri belirgin etiketlenmeli. |

## En temiz korunmuş 10 owner

| # | Owner | Neden temiz |
|---|---|---|
| 1 | `3.1 Paylaşılan fsw, duty ve zaman alanı owner'ı` | İlk tam tanım noktası net; alt bölümlere referans verebiliyor. |
| 2 | `5.2 Ortak sabitler, duty ve timing referans geçidi` | Bilerek kısa tutulmuş bir referans kapısı; owner'ı ele geçirmiyor. |
| 3 | `5.3 Bobin secimi` | L/ripple/peak/saturation kararları tek yerde; plant sadece buradan besleniyor. |
| 4 | `5.8 Protection, current-limit ve sensing owner` | ILIM/Rilim/Cilim kompanzasyondan ayrılmış ve kısa, net owner'a alınmış. |
| 5 | `5.9 Termal ve Kayıp Kapanışı` | Çoklu termal kaynakları tek kapanış mantığında topluyor; yerel pointerlara izin veriyor. |
| 6 | `6.1 Feedback divider` | RFB ailesinin primary owner'ı net; startup bölümündeki tekrar kısa referans. |
| 7 | `6.3 Hedef fc ve faz marji` | Hedef sayılar tek yerde; WEBENCH doğrulaması ayrı cross-check olarak kalıyor. |
| 8 | `7.1 Hot-loop ve kritik akim yollari` | Layout bağlamı kısa ve teknik owner'lara bağımlılığını aşmıyor. |
| 9 | `7.5 Yerlesim kurallari` | Checklist niteliği korunmuş; uzun hesap anlatımı yok. |
| 10 | `9. Secilmis Gorseller` | Görsel kullanım felsefesini anlatıyor, teknik owner olmaya çalışmıyor. |

## Owner saflığı test notları

- **Summary / handoff tekrarları:** `3.2`, `5.2`, `5.6.4`, `6.2.4`, `10` gibi bloklar çoğunlukla kısa referans seviyesinde. Risk, bu blokların ileride tekrar uzun teknik anlatıma dönüşmesi.
- **Komşu owner sızıntıları:** En belirgin sızıntılar `5.4.4` içinde plant/Type-III, `5.5.7` içinde input filter stability, `5.6.2` içinde EMI/dvdt ve bootstrap charge bağı, `5.7.1` içinde duty/Qg/VCC ayrıntısı.
- **Teknik + termal/EMI/simülasyon tekrarları:** MOSFET kayıpları, Cin RMS sıcaklığı, input filter damping ve Cout transient konuları hem teknik owner'da hem kapanış/doğrulama bölümlerinde geçiyor. Kapanış bölümleri checklist/pointer düzeyinde kalmalı.
- **Şişkin ama korunması gereken izler:** Defter kırpımları ve WEBENCH/calculator görüntüleri silinmemeli; fakat final karar, eski iterasyon ve çapraz teyit etiketleri daha görünür olmalı.
- **Çelişki yönetimi:** MOSFET Qg/kapasitans/Vpl, ESR/fESR, input filter L/C rezonans ve Type-III eski/yeni setleri sessiz birleştirilmemeli; aynı primary owner altında etiketlenmeli.

## Düşük riskli genel taşıma ilkesi

1. Önce kısa handoff/reference bloklarını sabitle: `4`, `5.2`, `6.2.4`, `10`.
2. Sonra ortak girdilerin owner dışı tekrarlarını kısalt: duty, fsw, Vout/Vin zarfı.
3. Ardından büyük teknik owner'larda alt başlık ayrımı yap: `5.4`, `5.5`, `5.6`, `5.7`, `6.4`, `7.4`.
4. Son olarak cross-check ve eski iterasyon etiketlerini güçlendir; hiçbir görseli desteklediği teknik paragraftan koparma.
