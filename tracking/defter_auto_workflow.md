# Defter Entegrasyon Otomasyonu

Bu dosya, defter entegrasyonunu her mesajda tekrar tarif etmeden sürdürebilmek için kullanılan kısa akışı tanımlar.

## Kısa Komut Dili

- `DEVAM`: sıradaki iki defter sayfasını hazırla, oku, ilgili owner dosyasına entegre et, `tracking/defter_page_pass_log.md` içine pass kaydı aç ve yerel commit oluştur.
- `Riski anladım; <commit> commit'ini GitHub main'e pushla. DEVAM`: önce açıkça onaylanan commit'i GitHub `main` dalına pushla, sonra `DEVAM` akışını uygula.

## Yerel Otomasyon

Sıradaki iki tam sayfa görselini çıkarmak için:

```powershell
powershell -ExecutionPolicy Bypass -File tools/prepare_defter_pass.ps1
```

State dosyası:

```text
tracking/defter_auto_state.json
```

Bu dosyadaki `next_page`, bir sonraki pass'in ilk defter sayfasını gösterir. Script varsayılan olarak iki sayfa çıkarır ve state'i bir sonraki sayfaya ilerletir.

## Sabit Güvenlik Kuralı

Ham DOCX ve Word lock dosyaları Git'e alınmaz:

```text
tracking/defter_sira_ana_fotolu.docx
tracking/.~lock.*.docx#
```

GitHub push, repo içeriğinin dışa aktarımıdır. Bu yüzden yeni oluşturulan commit'ler otomatik pushlanmaz; her yeni commit için kullanıcıdan açık push onayı beklenir.

## Editörlük Kuralı

Script yalnız görselleri hazırlar. Teknik entegrasyon hâlâ sayfa okunarak yapılır:

- yeni teknik değer uydurulmaz,
- çelişen sayı sessizce birleştirilmez,
- her uzun anlatım ilgili primary owner dosyasına gider,
- owner dışındaki konular kısa referans olarak kalır,
- tam sayfa görsel bağlantısı ilgili teknik paragrafın yanında tutulur.
