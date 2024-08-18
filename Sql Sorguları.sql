use [şehir gezi rehberi]
 /*EN ÇOK YORUM YAPILAN RESTORANLARI LİSTELEME SORGUSU
Bu sorgu, restoranlara yapılan yorumların sayısına göre en çok yoruma sahip restoranları listeler.*/
SELECT restoranlar.restoran_adı, COUNT(*) AS yorum_sayısı
FROM restoranlar
JOIN kullanıcı_Yorumları ON restoranlar.restoran_id = kullanıcı_yorumları.yer_id
GROUP BY restoranlar.restoran_adı
ORDER BY yorum_sayısı DESC
;
/*Her Ülkedeki En Pahalı Turun Hangi Şehirde Gerçekleştiğini Bulma
Bu sorgu, her ülkedeki en pahalı turun hangi şehirde gerçekleştiğini bulur.*/
SELECT Ülkeler.ülke_adı, Turlar.tur_adı, MAX(Turlar.fiyat) AS en_yüksek_fiyat
FROM Ülkeler
JOIN Şehirler ON Ülkeler.ülke_id = Şehirler.ülke_id
JOIN Turlar ON Şehirler.şehir_id = Turlar.şehir_id
GROUP BY Ülkeler.ülke_adı, Turlar.tur_adı;
;

 /* Her Ülkede Kaç Tane Etkinlik Gerçekleştiğini Bulma
Bu sorgu, her ülkede gerçekleşen etkinlik sayısını bulur.*/
SELECT Ülkeler.ülke_adı, COUNT(*) AS etkinlik_sayısı
FROM Ülkeler
JOIN Şehirler ON Ülkeler.ülke_id = Şehirler.ülke_id
JOIN Etkinlikler ON Şehirler.şehir_id = Etkinlikler.şehir_id
GROUP BY Ülkeler.ülke_adı;

/*En Çok Kullanıcıya Sahip Olan Ülkeleri Bulma
Bu sorgu, her ülkede kaç kullanıcının bulunduğunu hesaplar ve en çok kullanıcıya sahip olan ülkeleri listeler.*/
SELECT Ülkeler.ülke_adı, COUNT(*) AS kullanıcı_sayısı
FROM Ülkeler
JOIN Şehirler ON Ülkeler.ülke_id = Şehirler.ülke_id
JOIN Kullanıcı ON Şehirler.şehir_id = Kullanıcı.şehir_id
GROUP BY Ülkeler.ülke_adı
ORDER BY kullanıcı_sayısı DESC
;

/*Her Şehirdeki Otellerin Ortalama Fiyatını ve En Yüksek Fiyatlı Otelin Adını Bulma
Bu sorgu, her şehirdeki otellerin ortalama fiyatını hesaplar ve her şehir için en yüksek fiyatlı otelin adını gösterir.*/
SELECT Şehirler.şehir_adı, AVG(Oteller.fiyat_aralığı) AS ortalama_fiyat, MAX(Oteller.fiyat_aralığı) AS en_yüksek_fiyat
FROM Şehirler
JOIN Oteller ON Şehirler.şehir_id = Oteller.şehir_id
GROUP BY Şehirler.şehir_adı;

/*Her Ülkedeki Ortalama Restoran Puanını Bulma
Bu sorgu, her ülkedeki restoranların ortalama puanını hesaplar.*/
SELECT Ülkeler.ülke_adı, AVG(Restoranlar.restoran_puan) AS ortalama_puan
FROM Ülkeler
JOIN Şehirler ON Ülkeler.ülke_id = Şehirler.ülke_id
JOIN Restoranlar ON Şehirler.şehir_id = Restoranlar.şehir_id
GROUP BY Ülkeler.ülke_adı;

 /*Her Ülkenin En Popüler Gezilecek Yerini ve Bu Yerlerin Toplam Ziyaret Sayısını Bulma
Bu sorgu, her ülkenin en popüler gezilecek yerini ve bu yerlere yapılan toplam ziyaret sayısını hesaplar.*/
SELECT Ülkeler.ülke_adı, Gezilecek_Yerler.gezi_yeri_adı AS en_popüler_yer, COUNT(Kullanıcı_Yorumları.yorum_id) AS ziyaret_sayısı
FROM Ülkeler
JOIN Şehirler ON Ülkeler.ülke_id = Şehirler.ülke_id
JOIN Gezilecek_Yerler ON Şehirler.şehir_id = Gezilecek_Yerler.şehir_id
JOIN Kullanıcı_Yorumları ON Gezilecek_Yerler.gezi_yeri_id = Kullanıcı_Yorumları.gezi_yeri_id
GROUP BY Ülkeler.ülke_adı;









