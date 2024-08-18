use [�ehir gezi rehberi]
create table �lkeler (
  �lke_id INT PRIMARY KEY identity(1,1),
  �lke_ad� VARCHAR(255) NOT NULL,
  k�ta VARCHAR(255) NOT NULL
);
create table �ehirler(
�ehir_id int primary key identity(1,1),
�ehir_ad� nvarchar(200) not null,
resmi_dil nvarchar(50),
�lke_id int not null,
n�fus int,
plaka int,

foreign key(�lke_id) references �lkeler(�lke_id)
);

create table oteller(
otel_id int primary key identity(1,1),
otel_ad� nvarchar(100) not null,
ki�i_say�s� varchar(10) not null,
�ocuk_say�s� int,
giris_tarihi date not null,
��k��_tarihi date not null,
fiyat_aral��� decimal(10,2),
kahvalt�_dahil bit,
havuz bit,
alkol_bulundurma bit,
kapal�_otopark bit,
televizyon int,
�zel_plaj bit,
internet bit,
spa bit,
puan int check(puan between 1 and 5),
);

create table turlar (
tur_id int primary key,
tur_ad� varchar(250),
�ehir_id int,
a��klama text,
kalk��_noktas� varchar(200),
var��_noktas� varchar(200),
kalk��_tarihi date,
var��_tarihi date,
fiyat decimal(10,2),
ula��m_tipi varchar(200), 
konaklama_tipi varchar(200),    /*otel,�ad�r,g�n�birlik*/
kat�l�mc�_say�s� int,
�ocuk_say�s� int,
FOREIGN KEY (�ehir_id) REFERENCES �ehirler(�ehir_id),
);


create table etkinlikler(
etkinlik_id int,
etkinlik_ad� nvarchar(200),
etkinlik_t�r� nvarchar(200),  /*konser,do�a y�r�y���,tiyatro,standup,film,festival*/
�ehir_id int,
ya�_�zeri18 bit,
tarih date,
saat time,
bilet_fiyat� decimal(10,2),
oturma_d�zeni bit,
a��k_hava bit,
FOREIGN KEY (�ehir_id) REFERENCES �ehirler(�ehir_id),
);




create table kullan�c�(
kullan�c�_id int identity(1,1)primary key,
kimlik_id varchar(12),
ad� nvarchar(150),
soyad� nvarchar(150),
kullan�c�_ad� nvarchar(150),
kullan�c�_�ifre nvarchar(50)unique,  /*�ifre b�y�k k���k harf ve rakamlardan olu�mal�d�r.*/
do�um_tarihi datetime,
email varchar(100),
telefon_numaras� int,
cinsiyet bit,
ALTER TABLE kullan�c�
ALTER COLUMN telefon_numaras� varchar(20);

);

create table kullan�c�_yorumlar�(
kullan�c�_id int,
yorum_id int,
gezi_yeri_id int,
yorum_metni text,  /*Yorum metninde 100 karakter s�n�r� vard�r.*/
yer_id int,
foto�raf_linki varchar(200),
puan int check(puan between 1 and 5),
FOREIGN KEY (kullan�c�_id) REFERENCES kullan�c�(kullan�c�_id),
FOREIGN KEY (gezi_yeri_id) REFERENCES gezilecek_yerler(gezi_yeri_id)
);

create table gezilecek_yerler(
gezi_yeri_id int primary key,
�ehir_id int,
gezi_yeri_t�r� varchar(200),  /*cami,kilise,park,an�t,m�ze*/
gezi_yeri_ad� varchar(200),
a��l��_zaman� time,
kapan��_zaman� time,
bilgi text,
FOREIGN KEY (�ehir_id) REFERENCES �ehirler(�ehir_id),
);

create table ula��m(
ula��m_id int primary key identity(1,1),
ula��m_tipi varchar(250),  /*u�ak,gemi,tren,metro,otob�s*/
kalk��_noktas� varchar(250),
var��_noktas� varchar(250),
kalk��_tarihi date,
var��_tarihi date,
kalk��_saati time,
var��_saati time,
fiyat decimal(10,2),
);

create table restoranlar(
restoran_id int primary key identity(1,1),
restoran_ad� varchar(200),
�ehir_id int,
mutfak_t�r� varchar(200),   /*uzakdo�u mutfa��,amerikan mutfa��,frans�z mutfa��,italyan mutfa��,�in muta��,t�rk mutfa��,hint mutfa��,alman mutfa��,kanada mutfa��,tayland mutfa��*/
a��l��_zaman� time,
kapan��_zaman� time,
restoran_puan int check(restoran_puan between 1 and 5),
hayvan_bulundurma bit,
garson_puan int check(garson_puan between 1 and 5),
vale_hizmeti bit,
otopark bit,
�ocuk_oyun_alan� bit,
FOREIGN KEY (�ehir_id) REFERENCES �ehirler(�ehir_id),

);




create table kiral�k_evler(
ev_id int primary key identity(1,1),
�ehir_id int,
ev_tipi nvarchar(50), /*m�stakil,daire,bunglov*/
giri�_tarihi date,
��k��_tarihi date,
hayvan_bulundurma bit,
�ehir_merkezine_yak�nl�k nvarchar(100),
max_ki�i_say�s� int,
yatak_say�s� int,
banyo_say�s� int,
�cret decimal(10,2),
havuz bit,
deniz_manzaras� bit,
�ama��r_makinesi bit,
bula��k_makinesi bit,
FOREIGN KEY (�ehir_id) REFERENCES �ehirler(�ehir_id),
);


insert into �lkeler(�lke_ad�,k�ta) values
('T�rkiye', 'Avrupa'),
('Fransa', 'Avrupa'),
('�talya', 'Avrupa'),
('ABD', 'Amerika'),
('�ngiltere', 'Avrupa'),
('Japonya', 'Asya'),
('Almanya', 'Avrupa'),
('�spanya', 'Avrupa'),
('�in', 'Asya'),
('Hindistan', 'Asya'),
('Kanada', 'Amerika'),
('Rusya', 'Avrupa'),
('Brezilya', 'Amerika'),
('Avustralya', 'Avustralya'),
('Meksika', 'Amerika');
 
insert into �ehirler(�ehir_ad�, resmi_dil, �lke_id, n�fus, plaka) values
('�stanbul', 'T�rk�e', 1, 15029231, 34),
('Paris', 'Frans�zca', 2, 2140526, 75),
('Roma', '�talyanca', 3, 2870500, 1),
('New York', '�ngilizce', 4, 8336697, 1),
('Londra', '�ngilizce', 5, 8982000, 1),
('Tokyo', 'Japonca', 6, 13942856, NULL),
('Berlin', 'Almanca', 7, 3769495, 1),
('Madrid', '�spanyolca', 8, 3223334, 34),
('Pekin', 'Mandarin', 9, 21542000, NULL),
('Yeni Delhi', 'Hint�e', 10, 21753486, NULL),
('Toronto', '�ngilizce', 11, 2731571, NULL),
('Moskova', 'Rus�a', 12, 12615882, 7),
('Rio de Janeiro', 'Portekizce', 13, 6718903, 21),
('Sydney', '�ngilizce', 14, 5312163, NULL),
('Meksiko City', '�spanyolca', 15, 8918653, NULL);

insert into oteller(otel_ad�, ki�i_say�s�, �ocuk_say�s�, giris_tarihi, ��k��_tarihi, fiyat_aral���, kahvalt�_dahil, havuz, alkol_bulundurma, kapal�_otopark, televizyon, �zel_plaj, internet, spa, puan)values
('Grand Hotel', '2', 1, '2024-05-01', '2024-05-05', 500.00, 1, 1, 0, 1, 1, 1, 1, 1, 4),
('Eiffel Palace Hotel', '2', 0, '2024-06-10', '2024-06-15', 800.00, 1, 1, 1, 1, 1, 0, 1, 1, 5),
('Roma Relax Hotel', '2', 0, '2024-07-20', '2024-07-25', 650.00, 1, 1, 0, 1, 1, 1, 1, 0, 4),
('NY City Suites', '4', 2, '2024-08-15', '2024-08-20', 1200.00, 1, 1, 1, 1, 1, 0, 1, 1, 5),
('London Bridge Hotel', '3', 1, '2024-09-05', '2024-09-10', 900.00, 1, 1, 0, 1, 1, 0, 1, 0, 4),
('Tokyo View Hotel', '2', 0, '2024-10-12', '2024-10-17', 700.00, 1, 1, 1, 0, 1, 1, 1, 1, 4),
('Berlin Heights', '2', 1, '2024-11-20', '2024-11-25', 600.00, 1, 1, 0, 1, 1, 1, 1, 0, 4),
('Madrid Magic Hotel', '2', 0, '2024-12-01', '2024-12-06', 750.00, 1, 1, 0, 1, 1, 1, 1, 1, 4),
('Beijing Palace', '2', 0, '2025-01-02', '2025-01-07', 700.00, 1, 1, 0, 1, 1, 0, 1, 1, 4),
('Delhi Dreams Resort', '3', 1, '2025-02-18', '2025-02-23', 850.00, 1, 1, 1, 1, 1, 1, 1, 1, 5),
('Toronto Towers', '2', 0, '2025-03-10', '2025-03-15', 700.00, 1, 1, 0, 1, 1, 0, 1, 0, 4),
('Moscow Comfort Inn', '2', 0, '2025-04-05', '2025-04-10', 600.00, 1, 1, 0, 1, 1, 1, 1, 0, 4),
('Rio Paradise Resort', '3', 2, '2025-05-20', '2025-05-25', 950.00, 1, 1, 1, 1, 1, 1, 1, 1, 5),
('Sydney Sands Hotel', '2', 0, '2025-06-15','2025-05-25',700.00, 1 , 0 ,1 ,0 ,1 ,0 ,1 ,1 ,3);

insert into ula��m(ula��m_tipi, kalk��_noktas�, var��_noktas�, kalk��_tarihi, var��_tarihi, kalk��_saati, var��_saati, fiyat)values
('U�ak', '�stanbul', 'Paris', '2024-05-01', '2024-05-01', '08:00:00', '11:30:00', 400.00),
('Gemi', '�stanbul', 'Roma', '2024-06-01', '2024-06-05', '18:00:00', '09:00:00', 600.00),
('Tren', 'Paris', 'Berlin', '2024-07-10', '2024-07-12', '10:30:00', '16:45:00', 250.00),
('Metro', 'New York', 'Madrid', '2024-08-15', '2024-08-15', '08:00:00', '14:00:00', 300.00),
('Otob�s', 'Londra', 'Berlin', '2024-09-20', '2024-09-21', '09:00:00', '19:00:00', 150.00),
('U�ak', 'Tokyo', 'Toronto', '2024-10-25', '2024-10-26', '11:00:00', '20:30:00', 800.00),
('Gemi', 'Berlin', 'Rio de Janeiro', '2024-11-10', '2024-11-15', '17:00:00', '09:00:00', 1200.00),
('Tren', 'Moskova', 'Sydney', '2024-12-01', '2024-12-05', '08:30:00', '18:00:00', 1500.00),
('Metro', 'Rio de Janeiro', 'Sydney', '2025-01-02', '2025-01-02', '09:30:00', '15:00:00', 600.00),
('Otob�s', 'Sydney', '�stanbul', '2025-02-01', '2025-02-05', '06:00:00', '21:00:00', 1000.00),
('U�ak', '�stanbul', 'Toronto', '2025-03-10', '2025-03-12', '13:30:00', '21:00:00', 700.00),
('Gemi', 'Paris', 'Moskova', '2025-04-20', '2025-04-25', '19:00:00', '10:00:00', 900.00),
('Tren', 'Madrid', 'Rio de Janeiro', '2025-05-15', '2025-05-17', '08:45:00', '21:00:00', 1300.00),
('Metro', 'Berlin', 'Sydney', '2025-06-20', '2025-06-20', '09:00:00', '14:00:00', 500.00),
('Otob�s', 'Tokyo', 'Rio de Janeiro', '2025-07-05', '2025-07-10', '07:30:00', '20:00:00', 1100.00),
('U�ak', 'London', 'Sydney', '2025-08-10', '2025-08-12', '10:00:00', '19:30:00', 900.00),
('Gemi', 'Toronto', '�stanbul', '2025-09-15', '2025-09-20', '16:00:00', '07:00:00', 800.00),
('Tren', 'Moskova', 'Berlin', '2025-10-01', '2025-10-05', '07:45:00', '17:00:00', 300.00),
('Metro', 'Paris', 'Tokyo', '2025-11-20', '2025-11-20', '08:30:00', '15:00:00', 700.00),
('Otob�s', 'Sydney', 'Madrid', '2025-12-15', '2025-12-20', '06:30:00', '19:30:00', 1000.00);

insert into restoranlar(restoran_id,restoran_ad�, �ehir_id, mutfak_t�r�, a��l��_zaman�, kapan��_zaman�, restoran_puan, hayvan_bulundurma, garson_puan, vale_hizmeti, otopark, �ocuk_oyun_alan�)values
(1,'Lezzet K��esi', 1, 'T�rk Mutfa��', '08:00:00', '23:00:00', 4, 0, 5, 1, 1, 1),
(2,'La Petite Bistro', 2, 'Frans�z Mutfa��', '12:00:00', '22:00:00', 5, 0, 5, 0, 1, 0),
(3,'Pizza Italia', 3, '�talyan Mutfa��', '11:30:00', '21:30:00', 4, 0, 4, 1, 1, 1),
(4,'NY Steakhouse', 4, 'Amerikan Mutfa��', '17:00:00', '23:30:00', 5, 0, 5, 1, 1, 1),
(5,'London Fish', 5, '�ngiliz Mutfa��', '11:00:00', '22:30:00', 4, 0, 4, 1, 1, 1),
(6,'Tokyo Sushi Bar', 6, 'Japon Mutfa��', '12:00:00', '22:00:00', 4, 0, 4, 0, 1, 0),
(7,'Berlin Schnitzel House', 7, 'Alman Mutfa��', '10:30:00', '23:00:00', 4, 0, 4, 1, 1, 1),
(8,'Madrid Tapas ', 8, 'Kore Mutfa��', '14:00:00', '00:00:00', 4, 0, 4, 0, 1, 0),
(9,'Beijing Dumpling House', 9, '�in Mutfa��', '11:00:00', '22:30:00', 4, 0, 4, 1, 1, 1),
(10,'Delhi House', 10, 'Hint Mutfa��', '12:30:00', '23:30:00', 4, 0, 4, 1, 1, 1),
(11,'Toronto BBQ ', 11, 'Kanada Mutfa��', '16:00:00', '00:00:00', 4, 0, 4, 0, 1, 0),
(12,'Sydney Seafood ', 14, 'Uzakdo�u Mutfa��', '11:30:00', '22:30:00', 4, 0, 4, 1, 1, 1),
(13,'Mexico Taco', 15, 'Meksika Mutfa��', '10:00:00', '23:00:00', 4, 0, 4, 1, 1, 1),
(14,'Bangkok Street Food', 17, 'Tayland Mutfa��', '17:00:00', '02:00:00', 4, 0, 4, 1, 1, 1),
(15,'Dubai Desert Diner', 18, 'Hint Mutfa��', '19:00:00', '03:00:00', 4, 0, 4, 1, 1, 1),
(16,'Vienna Cafe', 19, '�talyan Mutfa��', '08:30:00', '20:00:00', 4, 0, 4, 1, 1, 1),
(17,'Seoul House', 20, 'Kore Mutfa��', '11:30:00', '23:30:00', 4, 0, 4, 1, 1, 1);

insert  into turlar(tur_id,tur_ad�, �ehir_id, a��klama, kalk��_noktas�, var��_noktas�, kalk��_tarihi, var��_tarihi, fiyat, ula��m_tipi, konaklama_tipi, kat�l�mc�_say�s�, �ocuk_say�s�)values
(1,'Tarihi �stanbul Turu', 1, '�stanbulun tarihi ve k�lt�rel yerlerini ziyaret edece�iniz muhte�em bir tur.', '�stanbul', '�stanbul', '2024-06-01', '2024-06-05', 800.00, 'Otob�s', 'Otel', 20, 5),
(2,'Paris �ehir Turu', 2, 'Parisin �nl� simgelerini ziyaret ederek unutulmaz bir Fransa deneyimi ya�ay�n.', 'Paris', 'Paris', '2024-07-10', '2024-07-15', 1200.00, 'U�ak', 'Otel', 15, 3),
(3,'Roma Tarih Turu', 3, 'Roman�n antik kal�nt�lar�n� ke�fetmek i�in heyecan verici bir yolculu�a ��k�n.', '�stanbul', 'Roma', '2024-08-20', '2024-08-25', 1500.00, 'Gemi', 'Otel', 25, 7),
(4,'New York Ke�if Turu', 4, 'New Yorkun canl� atmosferini ke�fedin ve unutulmaz an�lar biriktirin.', 'New York', 'New York', '2024-09-05', '2024-09-10', 1100.00, 'U�ak', 'Otel', 30, 8),
(5,'Londra K�lt�r Turu', 5, 'Londran�n tarihini ve k�lt�r�n� ke�fetmek i�in unutulmaz bir yolculu�a ��k�n.', 'Londra', 'Londra', '2024-10-12', '2024-10-17', 1300.00, 'Tren', 'Otel', 20, 5),
(6,'Tokyo Gezisi', 6, 'Tokyonun modern ve geleneksel yanlar�n� ke�fedin.', 'Tokyo', 'Tokyo', '2024-11-20', '2024-11-25', 1400.00, 'U�ak', 'Otel', 15, 4),
(7,'Berlin Tarihi Turu', 7, 'Berlinde tarih dolu bir yolculuk yap�n ve �ehrin simgelerini ke�fedin.', 'Berlin', 'Berlin', '2024-12-01', '2024-12-06', 1000.00, 'Otob�s', 'Otel', 25, 6),
(8,'Madrid K�lt�r Turu', 8, 'Madridin sanat ve k�lt�r dolu sokaklar�n� ke�fedin.', 'Madrid', 'Madrid', '2025-01-02', '2025-01-07', 1300.00, 'U�ak', 'Otel', 20, 5),
(9,'Meksiko City K�lt�r Turu', 15, 'Meksikonun renkli sokaklar�n� ke�fedin ve lezzetli Meksika yemeklerinin tad�n� ��kar�n.', 'Meksiko City', 'Meksiko City', '2025-07-05', '2025-07-08', 1500.00, 'Otob�s', 'G�n�birlik', 30, 8),
(10,'Sydney Do�a Turu', 14, 'Sydneynin do�al g�zelliklerini ke�fedin ve plajlarda dinlenin.', 'Sydney', 'Sydney', '2025-08-10', '2025-08-12', 1600.00, 'Gemi', '�ad�r', 20, 5),
(11,'Rio de Janeiro Do�a Turu', 13, 'Rionun do�al g�zelliklerini ke�fedin ve berrak suyunun keyfini ��kar�n.', 'Rio de Janeiro', 'Rio de Janeiro', '2025-05-20', '2025-05-25', 1300.00, 'Gemi', '�ad�r', 30, 8),
(12,'Moskova K�lt�r Turu', 12, 'Moskovan�n tarih dolu sokaklar�nda kaybolun.', 'Moskova', 'Moskova', '2025-04-05', '2025-04-10', 1200.00, 'Tren', 'Otel', 25, 6),
(13,'Paris Lezzet Turu', 2, 'Parisin muhte�em lezzetlerini tad�n ve �ehrin sokaklar�n� ke�fedin.', 'Paris', 'Paris', '2025-11-20', '2025-11-25', 1900.00, 'U�ak', 'Otel', 30, 8),
(14,'Yeni Delhi K�lt�r Turu', 10, 'Yeni Delhinin renkli k�lt�r�n� ke�fedin.', 'Yeni Delhi', 'Yeni Delhi', '2025-02-18', '2025-02-23', 900.00, 'U�ak', 'Otel', 20, 5),
(15,'Toronto �ehir Turu', 11, 'Torontonun modern ya�am tarz�n� ke�fedin.', 'Toronto', 'Toronto', '2025-03-10', '2025-03-15', 1100.00, 'U�ak', 'Otel', 20, 5);

insert into kullan�c�(kimlik_id, ad�, soyad�, kullan�c�_ad�, kullan�c�_�ifre, do�um_tarihi, email, telefon_numaras�, cinsiyet)values
('12345678901', 'Ali', 'Y�lmaz', 'ali123', 'aLi13pass', '1990-05-15', 'ali@email.com', 5551234567, 1),
('23456789012', 'Ay�e', 'Kara', 'ayse345', 'aYse345pas', '1985-08-20', 'ayse@email.com', 5552345678, 0),
('34567890123', 'Mehmet', 'Demir', 'mehmet789', 'mehMet789pss', '1988-11-10', 'mehmet@email.com', 5553456789, 1),
('45678901234', 'Fatma', 'Y�ld�z', 'fatma012', 'fatmA12pass', '1995-03-25', 'fatma@email.com', 5554567890, 0),
('56789012345', 'Mustafa', 'Arslan', 'mustafa567', 'Mstafa567pass', '1992-06-30', 'mustafa@email.com', 5555678901, 1),
('67890123456', 'Zeynep', '�zt�rk', 'zeynep901', 'zEyep901pass', '1987-09-12', 'zeynep@email.com', 5556789012, 0),
('78901234567', 'Ahmet', '�ahin', 'ahmet678', 'ahmeT678ass', '1991-02-05', 'ahmet@email.com', 5557890123, 1),
('89012345678', 'Nur', '�elik', 'nur123', 'nur123paS', '1984-12-18', 'nur@email.com', 5558901234, 0),
('90123456789', 'Emre', 'Ko�', 'emre234', 'emr234pAss', '1993-07-22', 'emre@email.com', 5559012345, 1),
('01234567890', 'Seda', 'Ayd�n', 'seda456', 'sed456pAss', '1989-04-11', 'seda@email.com', 5550123456, 0),
('09876543210', 'Can', 'Y�lmaz', 'can789', 'cn789Pass', '1994-10-08', 'can@email.com', 5550987654, 1),
('98765432109', 'Deniz', 'Akta�', 'deniz098', 'denz098pasS', '1986-01-29', 'deniz@email.com', 5559876543, 0),
('87654321098', 'P�nar', 'Demir', 'pinar567', 'pinar567pSs', '1997-08-15', 'pinar@email.com', 5558765432, 0),
('76543210987', 'Orhan', 'Kurt', 'orhan345', 'orhan35Pass', '1990-03-07', 'orhan@email.com', 5557654321, 1),
('65432109876', 'Elif', 'Kaya', 'elif678', 'elif678Ass', '1983-11-04', 'elif@email.com', 5556543210, 0);

insert into kullan�c�_yorumlar�(kullan�c�_id, yorum_id, gezi_yeri_id, yorum_metni, yer_id, foto�raf_linki, puan)values
(2, 2, 2, 'Muhte�em manzara ve hizmet!', 2, 'https://example.com/photo2.jpg', 4),
(3, 3, 3, '�ok lezzetli yemekler, kesinlikle deneyin!', 3, 'https://example.com/photo3.jpg', 5),
(4, 4, 4, 'Otel temiz ve konforluydu, tavsiye ederim.', 4, 'https://example.com/photo4.jpg', 4),
(5, 5, 5, 'Personel �ok ilgili ve yard�mseverdi.', 5, 'https://example.com/photo5.jpg', 5),
(6, 6, 6, 'Harika bir atmosfer ve e�lenceli etkinlikler!', 6, 'https://example.com/photo6.jpg', 4),
(7, 7, 7, 'Yemekler lezzetliydi ancak biraz pahal�.', 7, 'https://example.com/photo7.jpg', 3),
(8, 8, 8, 'G�zel bir restoran, manzara harikayd�!', 8, 'https://example.com/photo8.jpg', 5),
(9, 9, 9, 'Yemekler ger�ekten otantik ve lezzetliydi.', 9, 'https://example.com/photo9.jpg', 4),
(10, 10, 10, 'M�kemmel bir konaklama deneyimi ya�ad�m.', 10, 'https://example.com/photo10.jpg', 5),
(11, 11, 11, 'Personel �ok cana yak�n ve yard�msever.', 11, 'https://example.com/photo11.jpg', 5),
(12, 12, 12, 'Otelin konumu �ok uygun ve temizdi.', 12, 'https://example.com/photo12.jpg', 4),
(13, 13, 13, 'Harika bir tatil ge�irdik, te�ekk�rler!', 13, 'https://example.com/photo13.jpg', 5),
(14, 14, 14, 'Otelin deniz manzaras� nefes kesiciydi.', 14, 'https://example.com/photo14.jpg', 4),
(15, 15, 15, 'Restoran�n yemekleri �ok lezzetliydi!', 15, 'https://example.com/photo15.jpg', 5);

insert into gezilecek_yerler(gezi_yeri_id, �ehir_id, gezi_yeri_t�r�, gezi_yeri_ad�, a��l��_zaman�, kapan��_zaman�, bilgi)values
(1, 1, 'M�ze', 'Ayasofya M�zesi', '09:00:00', '17:00:00', '�stanbul un sembol� olan tarihi ve mimari a��dan �nemli yap�.'),
(2, 2, 'M�ze', 'Louvre M�zesi', '09:00:00', '18:00:00', 'D�nyan�n en b�y�k ve �nl� sanat m�zelerinden biri.'),
(3, 3, 'Tarihi Yer', 'Kolezyum', '08:30:00', '19:00:00', 'Roma �mparatorlu�u d�neminden kalan b�y�k bir amfi tiyatro.'),
(4, 4, 'Park', 'Central Park', '06:00:00', '01:00:00', 'New York City nin en b�y�k ve �nl� park�.'),
(5, 5, 'M�ze', 'British Museum', '10:00:00', '17:30:00', 'D�nya tarihindeki �nemli eserlerin sergilendi�i m�ze.'),
(6, 6, 'Tarihi Yer', 'Asakusa Tap�na��', '08:00:00', '17:00:00', 'Tokyo nun en eski ve en �nl� tap�na��.'),
(7, 7, 'Park', 'Tiergarten', '06:00:00', '22:00:00', 'Berlin in en b�y�k park� ve rekreasyon alan�.'),
(8, 8, 'M�ze', 'Prado M�zesi', '10:00:00', '20:00:00', '�spanyol sanat�n�n �nemli eserlerini bar�nd�ran m�ze.'),
(9, 9, 'Tarihi Yer', 'Yasak �ehir', '08:00:00', '18:00:00', '�in in tarihi ve k�lt�rel �neme sahip yasaklanm�� eski bir �ehri.'),
(10, 10, 'Tarihi Yer', 'Taj Mahal', '06:00:00', '19:00:00', 'Hindistan �n en �nl� an�t� ve d�nya harikas�.'),
(11, 11, 'M�ze', 'Royal Ontario Museum', '10:00:00', '17:30:00', 'Kanada n�n en b�y�k m�zesi ve d�nya k�lt�r�ne odaklanan bir m�ze.'),
(12, 12, 'Park', 'Gorky Park', '07:00:00', '23:00:00', 'Moskova n�n en pop�ler dinlenme ve e�lence mekanlar�ndan biri.'),
(13, 13, 'Tarihi Yer', 'Christ the Redeemer', '08:00:00', '19:00:00', 'Riode Janeiro nun sembol� olan b�y�k bir �sa heykeli.'),
(14, 14, 'M�ze', 'Sydney Opera House', '09:00:00', '17:00:00', 'D�nyan�n en �nl� opera binalar�ndan biri ve mimari bir harika.'),
(15, 15, 'Park', 'Chapultepec Park�', '06:00:00', '22:00:00', 'Meksiko City nin en b�y�k ve en �nl� park�.');

insert into kiral�k_evler(�ehir_id, ev_tipi, giri�_tarihi, ��k��_tarihi, hayvan_bulundurma, �ehir_merkezine_yak�nl�k, max_ki�i_say�s�, yatak_say�s�, banyo_say�s�, �cret, havuz, deniz_manzaras�, �ama��r_makinesi, bula��k_makinesi)values
(1, 'Daire', '2024-05-10', '2024-05-15', 1, 'Merkeze yak�n', 4, 2, 1, 300.00, 0, 0, 1, 1),
(2, 'M�stakil', '2024-06-01', '2024-06-10', 0, 'K�y�da', 6, 3, 2, 500.00, 1, 1, 1, 1),
(3, 'Daire', '2024-07-15', '2024-07-20', 0, '�ehir merkezine 10 km', 3, 1, 1, 250.00, 0, 0, 1, 0),
(4, 'Bungalo', '2024-08-05', '2024-08-12', 1, 'K�y�da', 2, 1, 1, 200.00, 0, 1, 0, 0),
(5, 'M�stakil', '2024-09-20', '2024-09-25', 0, '�ehir merkezine 5 km', 4, 2, 1, 350.00, 0, 0, 1, 1),
(6, 'Daire', '2024-10-10', '2024-10-17', 1, 'Merkeze yak�n', 3, 1, 1, 280.00, 0, 0, 1, 1),
(7, 'M�stakil', '2024-11-01', '2024-11-07', 0, 'K�rsal alanda', 6, 3, 2, 480.00, 1, 1, 1, 1),
(8, 'Daire', '2024-12-15', '2024-12-20', 0, 'Merkeze yak�n', 2, 1, 1, 200.00, 0, 0, 0, 0),
(9, 'M�stakil', '2025-01-10', '2025-01-17', 1, '�ehir merkezine 8 km', 4, 2, 1, 320.00, 0, 0, 1, 1),
(10, 'Daire', '2025-02-05', '2025-02-12', 0, 'K�y�da', 3, 2, 1, 300.00, 0, 1, 0, 1),
(11, 'Bungalov', '2025-03-20', '2025-03-27', 1, 'Merkeze yak�n', 2, 1, 1, 250.00, 1, 0, 0, 0),
(12, 'M�stakil', '2025-04-10', '2025-04-17', 0, 'K�rsal alanda', 5, 3, 2, 450.00, 1, 0, 1, 1),
(13, 'Daire', '2025-05-05', '2025-05-12', 1, '�ehir merkezine 12 km', 4, 2, 1, 320.00, 0, 0, 1, 0),
(14, 'M�stakil', '2025-06-20', '2025-06-27', 0, 'K�y�da', 6, 3, 2, 500.00, 1, 1, 1, 1),
(15, 'Daire', '2025-07-10', '2025-07-17', 0, 'Merkeze yak�n', 3, 1, 1, 280.00, 0, 0, 1, 1);

insert into etkinlikler(etkinlik_id, etkinlik_ad�, etkinlik_t�r�, �ehir_id, ya�_�zeri18, tarih, saat, bilet_fiyat�, oturma_d�zeni, a��k_hava)values
(1, '�stanbul Film Festivali', 'Film', 1, 1, '2024-05-15', '19:00:00', 50.00, 1, 0),
(2, 'Paris Fashion Week', 'Moda', 2, 1, '2024-06-20', '16:00:00', 100.00, 1, 1),
(3, 'Roma Opera G�sterisi', 'Opera', 3, 1, '2024-07-25', '20:30:00', 80.00, 1, 0),
(4, 'New York Comic Con', 'Festival', 4, 0, '2024-08-30', '10:00:00', 75.00, 1, 1),
(5, 'Londra West End Tiyatro Oyunu', 'Tiyatro', 5, 1, '2024-09-15', '19:30:00', 60.00, 1, 0),
(6, 'Tokyo Anime Expo', 'Festival', 6, 0, '2024-10-10', '11:00:00', 40.00, 1, 1),
(7, 'Berlin Oktoberfest', 'Festival', 7, 1, '2024-11-05', '17:00:00', 70.00, 1, 1),
(8, 'Madrid Flamenco �ovu', 'Dans', 8, 1, '2024-12-10', '21:00:00', 45.00, 1, 0),
(9, 'Pekin �in Yeni Y�l� Kutlamalar�', 'Festival', 9, 0, '2025-01-25', '18:30:00', 55.00, 1, 1),
(10, 'Yeni Delhi Yoga Festivali', 'Festival', 10, 1, '2025-02-20', '08:00:00', 30.00, 1, 1),
(11, 'Toronto M�zik Festivali', 'M�zik', 11, 1, '2025-03-15', '14:00:00', 65.00, 1, 1),
(12, 'Moskova Ballet G�sterisi', 'Bale', 12, 1, '2025-04-20', '19:00:00', 85.00, 1, 0),
(13, 'Rio de Janeiro Carnaval', 'Festival', 13, 0, '2025-05-30', '20:00:00', 90.00, 1, 1),
(14, 'Sydney Opera House Konseri', 'M�zik', 14, 1, '2025-06-25', '18:00:00', 75.00, 1, 0),
(15, 'Meksiko City G�zel Sanatlar Festivali', 'Festival', 15, 1, '2025-07-20', '17:30:00', 50.00, 1, 1);




