use [þehir gezi rehberi]
 /*EN ÇOK YORUM YAPILAN RESTORANLARI LÝSTELEME SORGUSU
Bu sorgu, restoranlara yapýlan yorumlarýn sayýsýna göre en çok yoruma sahip restoranlarý listeler.*/
SELECT restoranlar.restoran_adý, COUNT(*) AS yorum_sayýsý
FROM restoranlar
JOIN kullanýcý_Yorumlarý ON restoranlar.restoran_id = kullanýcý_yorumlarý.yer_id
GROUP BY restoranlar.restoran_adý
ORDER BY yorum_sayýsý DESC
;
/*Her Ülkedeki En Pahalý Turun Hangi Þehirde Gerçekleþtiðini Bulma
Bu sorgu, her ülkedeki en pahalý turun hangi þehirde gerçekleþtiðini bulur.*/
SELECT Ülkeler.ülke_adý, Turlar.tur_adý, MAX(Turlar.fiyat) AS en_yüksek_fiyat
FROM Ülkeler
JOIN Þehirler ON Ülkeler.ülke_id = Þehirler.ülke_id
JOIN Turlar ON Þehirler.þehir_id = Turlar.þehir_id
GROUP BY Ülkeler.ülke_adý, Turlar.tur_adý;
;

 /* Her Ülkede Kaç Tane Etkinlik Gerçekleþtiðini Bulma
Bu sorgu, her ülkede gerçekleþen etkinlik sayýsýný bulur.*/
SELECT Ülkeler.ülke_adý, COUNT(*) AS etkinlik_sayýsý
FROM Ülkeler
JOIN Þehirler ON Ülkeler.ülke_id = Þehirler.ülke_id
JOIN Etkinlikler ON Þehirler.þehir_id = Etkinlikler.þehir_id
GROUP BY Ülkeler.ülke_adý;

/*En Çok Kullanýcýya Sahip Olan Ülkeleri Bulma
Bu sorgu, her ülkede kaç kullanýcýnýn bulunduðunu hesaplar ve en çok kullanýcýya sahip olan ülkeleri listeler.*/
SELECT Ülkeler.ülke_adý, COUNT(*) AS kullanýcý_sayýsý
FROM Ülkeler
JOIN Þehirler ON Ülkeler.ülke_id = Þehirler.ülke_id
JOIN Kullanýcý ON Þehirler.þehir_id = Kullanýcý.þehir_id
GROUP BY Ülkeler.ülke_adý
ORDER BY kullanýcý_sayýsý DESC
;

/*Her Þehirdeki Otellerin Ortalama Fiyatýný ve En Yüksek Fiyatlý Otelin Adýný Bulma
Bu sorgu, her þehirdeki otellerin ortalama fiyatýný hesaplar ve her þehir için en yüksek fiyatlý otelin adýný gösterir.*/
SELECT Þehirler.þehir_adý, AVG(Oteller.fiyat_aralýðý) AS ortalama_fiyat, MAX(Oteller.fiyat_aralýðý) AS en_yüksek_fiyat
FROM Þehirler
JOIN Oteller ON Þehirler.þehir_id = Oteller.þehir_id
GROUP BY Þehirler.þehir_adý;

/*Her Ülkedeki Ortalama Restoran Puanýný Bulma
Bu sorgu, her ülkedeki restoranlarýn ortalama puanýný hesaplar.*/
SELECT Ülkeler.ülke_adý, AVG(Restoranlar.restoran_puan) AS ortalama_puan
FROM Ülkeler
JOIN Þehirler ON Ülkeler.ülke_id = Þehirler.ülke_id
JOIN Restoranlar ON Þehirler.þehir_id = Restoranlar.þehir_id
GROUP BY Ülkeler.ülke_adý;

 /*Her Ülkenin En Popüler Gezilecek Yerini ve Bu Yerlerin Toplam Ziyaret Sayýsýný Bulma
Bu sorgu, her ülkenin en popüler gezilecek yerini ve bu yerlere yapýlan toplam ziyaret sayýsýný hesaplar.*/
SELECT Ülkeler.ülke_adý, Gezilecek_Yerler.gezi_yeri_adý AS en_popüler_yer, COUNT(Kullanýcý_Yorumlarý.yorum_id) AS ziyaret_sayýsý
FROM Ülkeler
JOIN Þehirler ON Ülkeler.ülke_id = Þehirler.ülke_id
JOIN Gezilecek_Yerler ON Þehirler.þehir_id = Gezilecek_Yerler.þehir_id
JOIN Kullanýcý_Yorumlarý ON Gezilecek_Yerler.gezi_yeri_id = Kullanýcý_Yorumlarý.gezi_yeri_id
GROUP BY Ülkeler.ülke_adý;









