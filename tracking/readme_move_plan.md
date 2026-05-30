# README Tek-Owner Taşıma Planı

Okuma tarihi: 2026-05-28  
Kapsam: `README.md` dosyasının tamamı.  
Not: Bu dosya taşıma planıdır; bu aşamada `README.md` üzerinde düzenleme yapılmadı.

## Kolon Anlamları

- **Tam taşınacak mı:** Blok gövdesinin yeni owner altında büyük ölçüde korunup korunmayacağı.
- **İkiye ayrılacak mı:** Blok içinde komşu owner'a ait uzun içerik varsa bölünmesi gerekip gerekmediği.
- **Yalnız referans mı:** Mevcut blok yeni yapıda uzun anlatım değil, kısa handoff/reference olacaksa "Evet".
- **Neden:** Owner saflığı ve dependency akışı açısından gerekçe.

## Taşıma Planı

| Mevcut konum | Yeni owner | Yeni heading path | Tam taşınacak mı | İkiye ayrılacak mı | Yalnız referans mı | Neden |
|---|---|---|---|---|---|---|
| `# LM5146-Q1 Tabanli Buck Converter Tasarimi` | Belge felsefesi ve ana başlık | `# LM5146-Q1 Tabanlı Buck Converter Tasarımı` + `0` | Kısmen | Evet | Hayır | Ana başlık kalır; felsefe/etiket/okuma kuralı `0` altında toplanır. |
| `## 0. Calisma Plani` | Çalışma planı | `1.1 Çalışma planı` | Evet | Hayır | Hayır | Teknik hesap üretmiyor; tarihçe ve plan katmanına taşınmalı. |
| `## 1. Arka Plan` | Arka plan | `1.2 Arka plan` | Evet | Hayır | Hayır | Proje bağlamı teknik owner'lardan önce okunmalı. |
| `## 2. Durum Ozeti` | Durum özeti | `1.3`-`1.5` | Kısmen | Evet | Hayır | İlk/yeni tasarım ve yaklaşım değişimi ayrı alt başlıklarda daha temiz okunur. |
| `### 2.1 Ilk tasarim` | İlk tasarım | `1.3 İlk tasarım [Eski İterasyon]` | Evet | Hayır | Hayır | Eski iterasyon silinmeden tarihçe owner'ında kalır. |
| `### 2.2 Yeni tasarim` | Yeni tasarım yönü | `1.4 Yeni tasarım yönü [Güncel Omurga]` | Evet | Hayır | Hayır | Global hedeflere geçiş öncesi kısa bağlam sağlar. |
| `### 2.3 Tasarim yaklasimindaki degisim` | Yaklaşım değişimi | `1.5 Tasarım yaklaşımındaki değişim [Tasarım İzi]` | Evet | Hayır | Hayır | Linear-regulator geçmişi ve buck yaklaşımı tarihsel owner'da kalmalı. |
| `## 3. Güncel Tasarım Omurgası ve Paylaşılan Tasarım Girdileri` | Global tasarım girdileri | `2. Güncel Tasarım Omurgası ve Paylaşılan Girdiler` | Evet | Hayır | Hayır | Ortak sabitlerin ilk tam tanımı burada olmalı. |
| `### 3.1 Paylaşılan fsw, duty ve zaman alanı owner'ı` | `fsw`, duty ve timing | `2.4 Paylaşılan fsw, duty ve zaman alanı owner'ı` | Evet | Hayır | Hayır | Duty/timing ailesinin tek primary owner'ı. |
| `### 3.2 Startup / pin-programming handoff özeti` | Startup handoff | `2.7 Startup / pin-programming kısa handoff'u` | Evet | Hayır | Evet | Tam pin hesabı `4.1`de; burada yalnız yönlendirme kalır. |
| `## 4. Kullanilan Ana Kaynaklar` | Kaynaklar ve güven seviyesi | `3. Kaynaklar, Güven Seviyesi ve Cross-check Haritası` | Evet | Hayır | Hayır | Kaynakların rolü ayrı katmanda kalmalı. |
| `### 4.1 Cross-check ciktılarinin owner haritasi` | Cross-check haritası | `3.3 Cross-check çıktılarının owner haritası` | Evet | Hayır | Hayır | Teknik sayı değil owner haritası tuttuğu için burada kalır. |
| `### 4.2 Arac ciktisi okuma kurali` | Araç çıktısı okuma kuralı | `3.4 WEBENCH / calculator / EVM çıktısı okuma kuralı` | Evet | Hayır | Hayır | Araç çıktılarının final gibi okunmaması genel kaynak kuralıdır. |
| `## 5. Guc Katinin Tasarimi` | Güç katı kapısı | `4. Güç Katı Owner'ları` | Evet | Hayır | Hayır | Teknik owner'ların dependency sırasına göre ana kapısı. |
| `### 5.1 Controller pin programming ve startup owner` | Controller startup | `4.1 Controller Pin Programming ve Startup` | Evet | Hayır | Hayır | LDO, EN/UVLO, SS/TRK, RT tek owner altında kalır. |
| `#### 5.1.1 LM5146-Q1 dahili LDO siniri` | Controller startup | `4.1.1 VCC/LDO çalışma koşulu` | Kısmen | Hayır | Hayır | Çalışma koşulu burada; termal kayıp sonucu `4.8`e referans olur. |
| `#### 5.1.2 Ek notlar: dusuk Vin bolgesinin etkisi` | Controller startup | `4.1.2 Düşük Vin bölgesi ve VCCX kullanılmaması` | Evet | Hayır | Hayır | Düşük Vin/VCC davranışı startup owner'ına ait. |
| `#### 5.1.3 FB divider referans notu` | Feedback divider | `4.1.7 Kısa referanslar` ve `5.1 Feedback divider` | Hayır | Hayır | Evet | Tam divider hesabı `5.1`de; startup altında kısa referans kalır. |
| `#### 5.1.4 EN/UVLO, SS/TRK ve startup notlari` | Controller startup | `4.1.3 EN/UVLO`, `4.1.4 SS/TRK`, `4.1.6 Startup defter izleri` | Kısmen | Evet | Hayır | EN/UVLO ve SS/TRK aynı owner'da kalır ama alt-owner ayrımı gerekir. |
| `#### 5.1.5 RT pini ve anahtarlama frekansi` | Controller startup + global `fsw` | `4.1.5 RT pini ve fsw programlama` | Kısmen | Hayır | Hayır | RT programlama burada; `fsw` tasarım girdisi `2.4`e referanslanır. |
| `### 5.2 Ortak sabitler, duty ve timing referans geçidi` | Duty/timing referans kapısı | `4. Güç Katı Owner'ları` giriş notu veya `2.4` referansı | Hayır | Hayır | Evet | Tam duty anlatımı `2.4`te; güç katında sadece kısa geçit kalır. |
| `#### 5.2.1 Donanımsal zaman sınırı kaynak notu` | Duty/timing owner | `2.4 Paylaşılan fsw, duty ve zaman alanı owner'ı` | Hayır | Hayır | Evet | Donanımsal sınırların tam tanımı global timing owner'ında kalmalı. |
| `#### 5.2.2 Bootstrap duty referans notu` | Bootstrap + duty handoff | `4.6.4 Charge time, leakage ve duty handoff` | Hayır | Hayır | Evet | Duty `2.4`, bootstrap uygulaması `4.6`; burada uzun anlatım gerekmez. |
| `### 5.3 Bobin secimi` | İndüktör | `4.2 İndüktör Owner'ı` | Evet | Hayır | Hayır | İndüktör tek owner olarak korunur. |
| `#### 5.3.1 Cikis bobini` | İndüktör | `4.2.1`-`4.2.2` | Evet | Hayır | Hayır | L, ripple, peak, Isat ve DCR burada yaşar. |
| `#### 5.3.2 Slew-rate mantigi` | İndüktör | `4.2.3 Slew-rate ilişkisi` | Kısmen | Hayır | Hayır | İndüktör yönü burada; Cout energy-buffer'a kısa çapraz referans. |
| `#### 5.3.3 Mevcut durum` | İndüktör | `4.2.1 Güncel indüktör kararı` | Evet | Hayır | Hayır | Karar özeti owner içinde başa alınır. |
| `#### 5.3.4 Bu bolumde acik tuttugum maddeler` | İndüktör açık kontrol | `4.2.5 Açık kontroller` ve `9.1` | Kısmen | Hayır | Hayır | Teknik bağlam owner'da; genel takip `9`da kısa özet. |
| `### 5.4 Cikis kapasiteleri` | Çıkış kapasiteleri | `4.3 Çıkış Kapasiteleri Owner'ı` | Evet | Hayır | Hayır | Cout ailesinin tek primary owner'ı. |
| `#### 5.4.1 Cikis sigaçlari` | Çıkış kapasiteleri | `4.3.1 Güncel Cout kararı` | Evet | Hayır | Hayır | Giriş özeti owner başına alınır. |
| `#### 5.4.2 Bu iterasyondaki tasarim karari` | Çıkış kapasiteleri | `4.3.1 Güncel Cout kararı` | Evet | Hayır | Hayır | Güncel karar tek yerde görünmeli. |
| `#### 5.4.3 Overshoot / Undershoot gerilimi ve acik-cevrim cikis impedance` | Çıkış kapasiteleri | `4.3.2`-`4.3.6` | Evet | Evet | Hayır | Static/transient zarf, overshoot/undershoot ve Zout alt başlıklara ayrılmalı. |
| `#### 5.4.4 Vripple ve fsw civarindaki Zout` | Çıkış kapasiteleri | `4.3.7`, `4.3.8`, `4.3.12` | Kısmen | Evet | Hayır | Ripple/ESR/ESL burada kalır; plant/Type-III pasajları cross-check notuna iner. |
| `#### 5.4.5 Bulk kapasitör eklemenin getirdigi sifirlar` | Çıkış kapasiteleri | `4.3.9 Çıkış bulk mantığı ve getirdiği sıfırlar` | Evet | Hayır | Hayır | Çıkış bulk giriş bulk'tan ayrı owner parçası olarak kalmalı. |
| `#### 5.4.6 Slew-rate ve cikis kapasitörlerinin enerji tamponu rolu` | Çıkış kapasiteleri | `4.3.10 Energy buffer ve slew-rate ilişkisi` | Evet | Hayır | Hayır | Cout energy-buffer anlatımının ana owner'ı. |
| `#### 5.4.7 Acik teknik dogrulamalar` | Çıkış kapasiteleri açık kontrol | `4.3.13 Açık kontroller` ve `9.1` | Kısmen | Hayır | Hayır | Yerel teknik bağlam korunur; genel açık liste kısa olur. |
| `### 5.5 Giris kapasiteleri` | Giriş kapasiteleri | `4.4 Giriş Kapasiteleri Owner'ı` | Evet | Hayır | Hayır | Cin ailesinin tek primary owner'ı. |
| `#### 5.5.1 Giris sigaçlari` | Giriş kapasiteleri | `4.4.1 Giriş kapasitörlerinin görevi` | Evet | Hayır | Hayır | Giriş görevi owner başında okunmalı. |
| `#### 5.5.2 Yeni eklenen giris gereksinimleri` | Giriş kapasiteleri | `4.4.2 Güncel Cin stratejisi` | Evet | Hayır | Hayır | Gereksinimlerden stratejiye geçiş aynı owner'da. |
| `#### 5.5.3 Secilen genel strateji` | Giriş kapasiteleri | `4.4.2 Güncel Cin stratejisi` | Evet | Hayır | Hayır | MLCC + helper + bulk stratejisi owner özeti olur. |
| `#### 5.5.4 MLCC Cin hesabi` | Giriş kapasiteleri | `4.4.3`-`4.4.4` | Kısmen | Evet | Hayır | MLCC hesabı, dc-bias ve tolerance ayrı alt başlıklara bölünür; duty referansı kısa kalır. |
| `#### 5.5.5 RMS akimi ve termal bakis` | Giriş kapasiteleri + termal handoff | `4.4.5 RMS akımı`, `4.4.8 Termal handoff`, `4.8.4` | Kısmen | Evet | Hayır | RMS hesabı Cin owner'ında; sıcaklık kapanışı termal owner'da. |
| `#### 5.5.6 ESL ve kucuk degerli yardimci MLCC'ler` | Giriş kapasiteleri | `4.4.6 ESR`, `4.4.7 ESL ve helper MLCC'ler` | Kısmen | Evet | Hayır | ESL/helper ana kalır; EMI/layout etkileri kısa referansa iner. |
| `#### 5.5.7 Bulk kapasitör secimi mantigi` | Giriş kapasiteleri + input filter handoff | `4.4.9`-`4.4.12`, `6.4` | Kısmen | Evet | Hayır | Giriş bulk ve transient buffer burada; filter stability ayrıntısı `6.4`te. |
| `#### 5.5.8 Acik teknik dogrulamalar` | Giriş kapasiteleri açık kontrol | `4.4.13 Açık kontroller` ve `9.1` | Kısmen | Hayır | Hayır | Yerel kontrol owner'da; genel takip `9`da kısa. |
| `### 5.6 MOSFET secimi ve kayiplar` | MOSFET seçimi ve kayıplar | `4.5 MOSFET Seçimi ve Kayıplar` | Evet | Evet | Hayır | Çok şişkin owner korunur ama alt-ownerlara bölünür. |
| `#### 5.6.1 Mevcut aday parca` | MOSFET seçimi | `4.5.1 Mevcut aday parça` | Evet | Hayır | Hayır | Aday parça özeti owner başında kalır. |
| `#### 5.6.2 Secim mantigi` | MOSFET seçimi | `4.5.2`-`4.5.5`, `4.5.10` | Kısmen | Evet | Hayır | SOA, RDS/Qg/Qoss, dvdt ve defter izleri ayrılmalı. |
| `#### 5.6.3 Ilk kayip notlari` | MOSFET kayıpları | `4.5.6`-`4.5.9`, `4.5.10` | Kısmen | Evet | Hayır | Kayıp türlerine bölünür; termal sonuç `4.8`e handoff olur. |
| `#### 5.6.4 Thermal ve datasheet yorumu referans notu` | Termal handoff | `4.5.9 MOSFET kayıp bütçesi handoff'u` ve `4.8.5` | Hayır | Hayır | Evet | Tam termal anlatım `4.8`de; burada kısa pointer yeterli. |
| `#### 5.6.5 Bu bolumde acik tuttugum maddeler` | MOSFET açık kontrol | `4.5.11 Açık kontroller` ve `9.1` | Kısmen | Hayır | Hayır | Yerel MOSFET doğrulama bağlamı korunur. |
| `### 5.7 Bootstrap agi` | Bootstrap | `4.6 Bootstrap ve Gate-drive Yerel Besleme` | Evet | Hayır | Hayır | Bootstrap tek owner olarak korunur. |
| `#### 5.7.1 Bootstrap direncini (Rboot) hesaplama ve secim mantigi` | Bootstrap | `4.6.1`-`4.6.7` | Kısmen | Evet | Hayır | Bootstrap sizing burada; duty/Qg/VCC uzun tekrarları kısa handoff'a iner. |
| `### 5.8 Protection, current-limit ve sensing owner` | Protection/current-limit/sensing | `4.7 Protection, Current-limit ve Sensing` | Evet | Hayır | Hayır | ILIM/Rilim/Cilim burada kalmalı; kontrol bölümüne dönmemeli. |
| `### 5.9 Termal ve Kayıp Kapanışı` | Termal ve kayıp kapanışı | `4.8 Termal ve Kayıp Kapanışı` | Evet | Hayır | Hayır | Çok adımlı termal hesabın tek primary owner'ı. |
| `#### 5.9.1 Controller VCC/LDO, thermal shutdown ve exposed pad` | Termal | `4.8.2`-`4.8.3` | Evet | Hayır | Hayır | LDO güç kaybı ve exposed pad bağlamı burada. |
| `#### 5.9.2 Giriş MLCC RMS kaynaklı sıcaklık artışı` | Termal | `4.8.4 Giriş MLCC RMS kaynaklı sıcaklık artışı` | Kısmen | Hayır | Evet | Cin RMS hesabı `4.4`te; sıcaklık sonucu burada. |
| `#### 5.9.3 MOSFET termal yolu, datasheet current ve T_J` | Termal | `4.8.5`-`4.8.7` | Evet | Hayır | Hayır | Rth/Psi/Tj ve datasheet current yorumu termal owner'a ait. |
| `#### 5.9.4 Board worst-case ve kayıp kapanış sırası` | Termal açık kontrol | `4.8.8`-`4.8.9` ve `9.1` | Kısmen | Hayır | Hayır | Kapanış sırası owner'da; genel takip kısa olur. |
| `## 6. Kontrolcu ve Kompanzasyon Owner` | Kontrol ve kompanzasyon | `5. Kontrol ve Kompanzasyon Owner'ı` | Evet | Hayır | Hayır | Kontrol akışı güç katından sonra okunmalı. |
| `### 6.1 Feedback divider` | Feedback divider | `5.1 Feedback divider` | Evet | Hayır | Hayır | RFB1/RFB2 tek primary owner. |
| `### 6.2 Plant modeli ve modulator referansi` | Plant modeli | `5.2 Plant modeli ve modülatör referansı` | Evet | Hayır | Hayır | Kontrol içinde plant handoff gerekir; fiziksel L/C owner değildir. |
| `#### 6.2.1 Genel kontrol yapisi` | Kontrol | `5.2 Plant modeli ve modülatör referansı` | Evet | Hayır | Hayır | Plant akışının giriş açıklaması. |
| `#### 6.2.2 Modulator blogunun rolu` | Modülatör | `5.2 Plant modeli ve modülatör referansı` | Evet | Hayır | Hayır | PWM/modülatör kazancı kontrol owner'ında. |
| `#### 6.2.3 Cikis filtresi ve yuk` | Plant handoff | `5.2 Plant modeli ve modülatör referansı` | Kısmen | Hayır | Hayır | L/C/ESR fiziksel owner'lardan alınan plant girdisi olarak kalır. |
| `#### 6.2.4 Bu bolumde korunacak ayrim` | Protection referansı | `5.7 Kararlılık kriterleri ve açık kontroller` veya `5.2` notu | Hayır | Hayır | Evet | ILIM/Rilim/Cilim `4.7`de; kontrol içinde sadece ayrım notu. |
| `### 6.3 Hedef fc ve faz marji` | Crossover ve faz marjı | `5.3 Hedef crossover ve faz marjı` | Evet | Hayır | Hayır | fc/PM tek owner. |
| `### 6.4 K-factor mantigi ve Type-III komponent seti` | K-factor ve Type-III | `5.4 K-factor mantığı`, `5.5 Type-III komponent seti` | Kısmen | Evet | Hayır | Mantık ve komponent seti ayrı alt başlıklarda daha okunur. |
| `#### 6.4.1 Neden bu yontem?` | K-factor | `5.4 K-factor mantığı` | Evet | Hayır | Hayır | Yöntem gerekçesi burada. |
| `#### 6.4.2 Taslaktaki akisin ozeti` | K-factor | `5.4 K-factor mantığı` | Evet | Hayır | Hayır | Akış özeti final setten önce okunmalı. |
| `#### 6.4.3 Scriptlerde gorulen ilk ipuclari` | Kontrol cross-check | `5.6 Calculator / WEBENCH / defter cross-checkleri` | Kısmen | Hayır | Hayır | Script çıktıları final değil cross-check olarak etiketlenmeli. |
| `#### 6.4.4 Bu projede K-factor'un gorevi` | K-factor | `5.4 K-factor mantığı` | Kısmen | Evet | Hayır | K-factor görevi burada; W.1-W.24 defter taraması cross-check altına ayrılabilir. |
| `##### Defter taramasi: W.1-W.24` | Kontrol defter izi | `5.6 Calculator / WEBENCH / defter cross-checkleri` | Evet | Hayır | Hayır | Defter izi kontrol owner içinde ama cross-check/eski iterasyon etiketiyle kalmalı. |
| `#### 6.4.5 Compensator topolojisi ve temel model` | Type-III komponent seti | `5.5 Type-III komponent seti` | Kısmen | Evet | Hayır | Final RC/CC seti ve eski/cross-check setleri ayrılmalı. |
| `### 6.5 Calculator / defter frekans yerlestirme cross-checkleri` | Kontrol cross-checkleri | `5.6 Calculator / WEBENCH / defter cross-checkleri` | Evet | Hayır | Hayır | Calculator/defter çıktıları burada etiketli kalır. |
| `#### 6.5.1 Ilk ilke` | Kontrol cross-checkleri | `5.6 Calculator / WEBENCH / defter cross-checkleri` | Evet | Hayır | Hayır | Cross-check okuma ilkesi kontrol owner'ında gerekli. |
| `#### 6.5.2 Defterden gelen ilk sayisal adaylar` | Kontrol cross-checkleri | `5.6 Calculator / WEBENCH / defter cross-checkleri` | Evet | Hayır | Hayır | Eski/farklı sayılar silinmeden etiketlenir. |
| `#### 6.5.3 Sonraki sikilastirma hedefleri` | Kontrol açık kontrol | `5.7 Kararlılık kriterleri ve açık kontroller` ve `9.2` | Kısmen | Hayır | Hayır | Teknik bağlam kontrol owner'da; genel takip `9`da kısa. |
| `### 6.6 Faz, kazanc marji ve WEBENCH cross-checkleri` | Kontrol cross-checkleri | `5.6 Calculator / WEBENCH / defter cross-checkleri`, `5.7` | Kısmen | Evet | Hayır | WEBENCH cross-check ve kararlılık kriteri alt başlıklara ayrılmalı. |
| `#### 6.6.1 Taslak hedef bandi` | Crossover/faz marjı | `5.3 Hedef crossover ve faz marjı` veya `5.6` cross-check | Kısmen | Hayır | Hayır | Hedef band primary `5.3`; burada cross-check notu kalabilir. |
| `#### 6.6.2 Neden bu kadar onemli?` | Kontrol kararlılığı | `5.7 Kararlılık kriterleri ve açık kontroller` | Evet | Hayır | Hayır | Kararlılık önemi kontrol owner'ında kalır; Cout transient tekrarı olmamalı. |
| `#### 6.6.3 Kararlilik kriterinin bu projedeki anlami` | Kontrol kararlılığı | `5.7 Kararlılık kriterleri ve açık kontroller` | Evet | Hayır | Hayır | Simülasyonla kapanacak kontrol kriteri. |
| `## 7. EMI, Giris Filtresi ve Yerlesim` | EMI/input filter/layout | `6. EMI, Giriş Filtresi ve Yerleşim` | Evet | Hayır | Hayır | Teknik akışta kontrolden sonra okunur. |
| `### 7.1 Hot-loop ve kritik akim yollari` | Hot-loop/layout | `6.1 Hot-loop ve kritik akım yolları` | Evet | Hayır | Hayır | Layout owner'ı kısa ve temiz. |
| `### 7.2 Differential-mode EMI` | DM EMI | `6.2 Differential-mode EMI` | Kısmen | Hayır | Hayır | EMI hesapları burada; Cin hesabı `4.4`e referanslanır. |
| `### 7.3 Common-mode EMI` | CM EMI | `6.3 Common-mode EMI` | Kısmen | Hayır | Hayır | CM EMI burada; MOSFET dvdt uzun hesapları `4.5`te kalır. |
| `### 7.4 Giris filtresi kararliligi` | Input filter stability | `6.4 Giriş filtresi kararlılığı` | Evet | Hayır | Hayır | Rezonans, damping, negatif giriş empedansı tek owner. |
| `### 7.5 Yerlesim kurallari` | Layout | `6.5 Yerleşim kuralları` | Evet | Hayır | Hayır | Kısa checklist olarak kalır. |
| `## 8. LTspice Dogrulama Plani` | Simülasyon/doğrulama | `7. LTspice / PSpice Doğrulama Planı` | Evet | Hayır | Hayır | Teknik owner'lardan sonra doğrulama katmanı. |
| `### 8.1 Baslangic model seti` | Simülasyon model seti | `7.1 Başlangıç model seti` | Evet | Hayır | Hayır | Model kaynakları ve başlangıç düzeni burada. |
| `### 8.2 Simulasyon asamalari` | Simülasyon aşamaları | `7.2 Simülasyon aşamaları` | Evet | Hayır | Hayır | Doğrulama planının iş sırası. |
| `### 8.3 Steady-state kontrol listesi` | Steady-state doğrulama | `7.3 Steady-state kontrol listesi` | Kısmen | Hayır | Hayır | Hesap tekrarları değil kabul checklist'i olmalı. |
| `### 8.4 Dinamik testler` | Dinamik doğrulama | `7.4 Dinamik testler` | Kısmen | Hayır | Hayır | Load-step/startup testleri; Cout/SS hesapları tekrarlanmaz. |
| `### 8.5 Giris filtresi ve EMI ile baglantili testler` | EMI/input filter doğrulama | `7.5 Giriş filtresi ve EMI testleri` | Kısmen | Hayır | Hayır | EMI/filter hesapları `6`da; burada test matrisi. |
| `### 8.6 44 V transient notu` | 44 V doğrulama | `7.6 44 V transient testi` | Evet | Hayır | Hayır | Survive-only koşulu simülasyonda test edilir; global tanım `2.5`. |
| `### 8.7 Hesapla simulasyonun birlestirilmesi` | Doğrulama kapanışı | `7.7 Hesap ve simülasyonun birleştirilmesi` | Evet | Hayır | Hayır | Hesap-simülasyon bağlantı kuralı burada. |
| `## 9. Secilmis Gorseller` | Görsel/defter yönetimi | `8. Görsel, Defter Kırpımı ve Kaynak İzi Yönetimi` | Evet | Hayır | Hayır | Görsel mantığı ayrı katman; teknik görseller owner yanında kalır. |
| `## 10. Acik Sorular` | Açık kontroller | `9. Açık Kontroller ve Kapanış Listesi` | Kısmen | Evet | Hayır | Yerel teknik açıklar owner'da; genel liste kısa takip olur. |
| `## 11. Degisiklik Gunlugu` | Değişiklik günlüğü | `10. Değişiklik Günlüğü` | Evet | Hayır | Hayır | Belge değişiklik izi en sonda kalır. |
| `### 2026-03-20` | Tarihli değişiklik | `10.1 Tarihli değişiklikler` | Evet | Hayır | Hayır | Tarihli kayıt korunmalı; teknik içerik owner'a taşınmaz. |

## Kritik Taşıma Kümeleri

| Küme | Kaynak konumlar | Hedef owner | İşlem |
|---|---|---|---|
| Duty / `fsw` / timing | `3.1`, `5.2`, `5.5.4`, `5.7.1`, `7.2` | `2.4` | Tek tam anlatım `2.4`; alt owner'larda kısa kullanım notu. |
| Controller startup pinleri | `3.2`, `5.1`, `5.9.1` | `4.1` | Pin programlama `4.1`; termal sonucu `4.8`. |
| Cout / Zout / bulk / energy buffer | `5.4`, `6.2.3`, `6.5`, `8.4` | `4.3` | Fiziksel çıkış kapasite hesabı `4.3`; plant/simülasyon kısa handoff. |
| Cin / MLCC / bulk / RMS / damping | `5.5`, `7.2`, `7.4`, `8.5` | `4.4` ve `6.4` | Cin seçimi `4.4`; input filter stability `6.4`. |
| MOSFET seçim ve kayıp parametreleri | `5.6`, `5.7`, `5.9`, `7.3` | `4.5` | Elektriksel parametre ve kayıp `4.5`; termal `4.8`; bootstrap `4.6`. |
| Bootstrap | `5.7`, `3.1`, `5.6`, `5.9` | `4.6` | Bootstrap sizing `4.6`; duty/Qg/VCC yalnız handoff. |
| ILIM / Rilim / Cilim | `5.8`, `6.2.4` | `4.7` | Protection owner'da kalır; kontrolde yalnız ayrım notu. |
| Termal kapanış | `5.1`, `5.5.5`, `5.6.4`, `5.9`, `8.3` | `4.8` | Çok adımlı termal hesap tek yerde. |
| RFB / plant / K-factor / Type-III | `5.1.3`, `6.1`-`6.6`, `4.1` | `5` | Kontrol akışı tek owner altında; eski setler etiketlenir. |
| EMI / input filter / layout | `5.5.7`, `7`, `8.5` | `6` | EMI/filter/layout hesapları `6`; simülasyon `7`de test. |

## Owner Dışı Kısa Referans Olarak Kalacak Kümeler

| Kısa referans kümesi | Kalacağı yer | İşlev |
|---|---|---|
| Startup handoff | `2.7` | Global girdilerden `4.1`e geçiş. |
| Duty/timing güç katı geçidi | `4` giriş notu | Alt güç katı hesaplarının `2.4`e bağlı olduğunu hatırlatır. |
| FB divider startup notu | `4.1.7` | FB hesabının `5.1`de yaşadığını belirtir. |
| Bootstrap duty notu | `4.6.4` | Duty ailesinin `2.4`te olduğunu söyler. |
| MOSFET termal pointer | `4.5.9` | Kayıp bütçesinden `4.8` termal kapanışa geçiş. |
| Cin termal pointer | `4.4.8` | RMS kaynağından `4.8.4` sıcaklık yorumuna geçiş. |
| Plant L/C/ESR handoff | `5.2` | Fiziksel L/C owner'larından kontrol plantine değer aktarır. |
| Current-limit ayrım notu | `5.7` | ILIM/Rilim/Cilim'in `4.7`de yaşadığını belirtir. |
| EMI simülasyon referansı | `7.5` | `6`daki EMI/filter owner'larının test matrisine bağlanması. |
| Yerel açık kontrol özeti | `9` | Owner'lardaki açık maddeleri tek takip listesinde kısa gösterir. |
