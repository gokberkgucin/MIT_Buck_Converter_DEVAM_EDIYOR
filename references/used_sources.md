# Used Sources

Bu dosya, `yeni.md` icinde gercekten kullanilan veya kullanilmasi planlanan kaynaklari izlemek icin tutulur.

Kural:
- Bir dosya `YENI` klasorunde bulunuyor diye otomatik olarak kullanilmis sayilmaz.
- Sadece `yeni.md` icinde atif verilen, hesapta kullanilan veya karar vermede rol oynayan kaynaklari burada tut.
- PDF kaynaklari mumkun oldugunca `./pdfs/` altindan cagirilir.

| ID | Dosya | Durum | Kullanildigi bolum | Not |
| --- | --- | --- | --- | --- |
| G94 | `../G94_SPEC.txt` | used | specification table | proje spesifikasyon kaynagi |
| G31 | `../G31_Robert_Erikson_fundamentals-of-power-electronics-3n_2020.txt` | candidate | teori, kontrol | temel kitap |
| G32 | `./pdfs/G32_lm5146-q1.pdf` | candidate | controller limitleri | datasheet |
| G35 | `./pdfs/G35_Basic Calculation of a Buck Converter's Power Stage (Rev. B).pdf` | candidate | power stage | TI app note |
| L1 | `../BOM/L1_Wurth_Elektronik_7443640680B_7443640680B.pdf` | to-review | inductor selection | secilen bobin adayinin elektriksel degerleri dogrulanacak |
| M2 | `../BOM/M2_Texas_Instruments_CSD18543Q3A_csd18543q3a.pdf` | to-review | mosfet selection | secilen MOSFET adayinin datasheet ozeti dogrulanacak |
| G93 | `../G93_MOSFET.txt` | candidate | mosfet notes | gate charge ve ilk parametre notlari |
| G46 | `./pdfs/G46_LM5146-Q1EVM User's Guide.pdf` | candidate | referans tasarim | EVM karsilastirma |
| G71 | `./pdfs/G71_Voltage Regulator Design and Optimization for High-Current, Fast-Slew-Rate Load.pdf` | used | cikis transientleri | output capacitor transient referansi |
| G34 | `./pdfs/G34_Bootstrap.pdf` | candidate | bootstrap network | bootstrap referans notu |
| G101 | `./pdfs/G101_The K Factor.pdf` | candidate | kompanzasyon | K-factor |
| G103 | `../G103_comp.txt` | used | control modeling | ornek modulator ve kompanzator scripti |
| G95 | `../G95_04_K_FACTOR_CAN_HOCA.txt` | used | K-factor workflow | yontemin adim adim notu |
| G112 | `./pdfs/G112_Simple Success with Conducted EMI and Radiated EMI_snva755.pdf` | candidate | EMI | EMI giris |
| G113 | `./pdfs/G113_An Engineer?s Guide to Low EMI in DC_DC Regulators_slyy208.pdf` | candidate | EMI, layout | dusuk EMI rehberi |
| G114 | `./pdfs/G114_Simple Solution for Input Filter Stability Issue in DC_DC_slua929a.pdf` | candidate | input filter stability | Middlebrook uyumu ve damping |
| N1 | `../EK_FREKANS YERLEŞİMİ.txt` | used | EMI, layout planning | yerel taslak notlar ve frekans / yerlesim dusunceleri |
| N2 | `../input emi filter ve Cin frekansı.txt` | candidate | input filter frequencies | frekans oranlari ve rezonans notlari yeniden dogrulanacak |

Durum alaninda onerilen degerler:
- `candidate`
- `used`
- `rejected`
- `to-review`


