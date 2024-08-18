use [�ehir gezi rehberi]
 /*EN �OK YORUM YAPILAN RESTORANLARI L�STELEME SORGUSU
Bu sorgu, restoranlara yap�lan yorumlar�n say�s�na g�re en �ok yoruma sahip restoranlar� listeler.*/
SELECT restoranlar.restoran_ad�, COUNT(*) AS yorum_say�s�
FROM restoranlar
JOIN kullan�c�_Yorumlar� ON restoranlar.restoran_id = kullan�c�_yorumlar�.yer_id
GROUP BY restoranlar.restoran_ad�
ORDER BY yorum_say�s� DESC
;
/*Her �lkedeki En Pahal� Turun Hangi �ehirde Ger�ekle�ti�ini Bulma
Bu sorgu, her �lkedeki en pahal� turun hangi �ehirde ger�ekle�ti�ini bulur.*/
SELECT �lkeler.�lke_ad�, Turlar.tur_ad�, MAX(Turlar.fiyat) AS en_y�ksek_fiyat
FROM �lkeler
JOIN �ehirler ON �lkeler.�lke_id = �ehirler.�lke_id
JOIN Turlar ON �ehirler.�ehir_id = Turlar.�ehir_id
GROUP BY �lkeler.�lke_ad�, Turlar.tur_ad�;
;

 /* Her �lkede Ka� Tane Etkinlik Ger�ekle�ti�ini Bulma
Bu sorgu, her �lkede ger�ekle�en etkinlik say�s�n� bulur.*/
SELECT �lkeler.�lke_ad�, COUNT(*) AS etkinlik_say�s�
FROM �lkeler
JOIN �ehirler ON �lkeler.�lke_id = �ehirler.�lke_id
JOIN Etkinlikler ON �ehirler.�ehir_id = Etkinlikler.�ehir_id
GROUP BY �lkeler.�lke_ad�;

/*En �ok Kullan�c�ya Sahip Olan �lkeleri Bulma
Bu sorgu, her �lkede ka� kullan�c�n�n bulundu�unu hesaplar ve en �ok kullan�c�ya sahip olan �lkeleri listeler.*/
SELECT �lkeler.�lke_ad�, COUNT(*) AS kullan�c�_say�s�
FROM �lkeler
JOIN �ehirler ON �lkeler.�lke_id = �ehirler.�lke_id
JOIN Kullan�c� ON �ehirler.�ehir_id = Kullan�c�.�ehir_id
GROUP BY �lkeler.�lke_ad�
ORDER BY kullan�c�_say�s� DESC
;

/*Her �ehirdeki Otellerin Ortalama Fiyat�n� ve En Y�ksek Fiyatl� Otelin Ad�n� Bulma
Bu sorgu, her �ehirdeki otellerin ortalama fiyat�n� hesaplar ve her �ehir i�in en y�ksek fiyatl� otelin ad�n� g�sterir.*/
SELECT �ehirler.�ehir_ad�, AVG(Oteller.fiyat_aral���) AS ortalama_fiyat, MAX(Oteller.fiyat_aral���) AS en_y�ksek_fiyat
FROM �ehirler
JOIN Oteller ON �ehirler.�ehir_id = Oteller.�ehir_id
GROUP BY �ehirler.�ehir_ad�;

/*Her �lkedeki Ortalama Restoran Puan�n� Bulma
Bu sorgu, her �lkedeki restoranlar�n ortalama puan�n� hesaplar.*/
SELECT �lkeler.�lke_ad�, AVG(Restoranlar.restoran_puan) AS ortalama_puan
FROM �lkeler
JOIN �ehirler ON �lkeler.�lke_id = �ehirler.�lke_id
JOIN Restoranlar ON �ehirler.�ehir_id = Restoranlar.�ehir_id
GROUP BY �lkeler.�lke_ad�;

 /*Her �lkenin En Pop�ler Gezilecek Yerini ve Bu Yerlerin Toplam Ziyaret Say�s�n� Bulma
Bu sorgu, her �lkenin en pop�ler gezilecek yerini ve bu yerlere yap�lan toplam ziyaret say�s�n� hesaplar.*/
SELECT �lkeler.�lke_ad�, Gezilecek_Yerler.gezi_yeri_ad� AS en_pop�ler_yer, COUNT(Kullan�c�_Yorumlar�.yorum_id) AS ziyaret_say�s�
FROM �lkeler
JOIN �ehirler ON �lkeler.�lke_id = �ehirler.�lke_id
JOIN Gezilecek_Yerler ON �ehirler.�ehir_id = Gezilecek_Yerler.�ehir_id
JOIN Kullan�c�_Yorumlar� ON Gezilecek_Yerler.gezi_yeri_id = Kullan�c�_Yorumlar�.gezi_yeri_id
GROUP BY �lkeler.�lke_ad�;









