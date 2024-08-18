use [şehir gezi rehberi]
create table Ülkeler (
  ülke_id INT PRIMARY KEY identity(1,1),
  ülke_adı VARCHAR(255) NOT NULL,
  kıta VARCHAR(255) NOT NULL
);
create table şehirler(
şehir_id int primary key identity(1,1),
şehir_adı nvarchar(200) not null,
resmi_dil nvarchar(50),
ülke_id int not null,
nüfus int,
plaka int,

foreign key(ülke_id) references ülkeler(ülke_id)
);

create table oteller(
otel_id int primary key identity(1,1),
otel_adı nvarchar(100) not null,
kişi_sayısı varchar(10) not null,
çocuk_sayısı int,
giris_tarihi date not null,
çıkış_tarihi date not null,
fiyat_aralığı decimal(10,2),
kahvaltı_dahil bit,
havuz bit,
alkol_bulundurma bit,
kapalı_otopark bit,
televizyon int,
özel_plaj bit,
internet bit,
spa bit,
puan int check(puan between 1 and 5),
);

create table turlar (
tur_id int primary key,
tur_adı varchar(250),
şehir_id int,
açıklama text,
kalkış_noktası varchar(200),
varış_noktası varchar(200),
kalkış_tarihi date,
varış_tarihi date,
fiyat decimal(10,2),
ulaşım_tipi varchar(200), 
konaklama_tipi varchar(200),    /*otel,çadır,günübirlik*/
katılımcı_sayısı int,
çocuk_sayısı int,
FOREIGN KEY (şehir_id) REFERENCES Şehirler(şehir_id),
);


create table etkinlikler(
etkinlik_id int,
etkinlik_adı nvarchar(200),
etkinlik_türü nvarchar(200),  /*konser,doğa yürüyüşü,tiyatro,standup,film,festival*/
şehir_id int,
yaş_üzeri18 bit,
tarih date,
saat time,
bilet_fiyatı decimal(10,2),
oturma_düzeni bit,
açık_hava bit,
FOREIGN KEY (şehir_id) REFERENCES Şehirler(şehir_id),
);




create table kullanıcı(
kullanıcı_id int identity(1,1)primary key,
kimlik_id varchar(12),
adı nvarchar(150),
soyadı nvarchar(150),
kullanıcı_adı nvarchar(150),
kullanıcı_şifre nvarchar(50)unique,  /*şifre büyük küçük harf ve rakamlardan oluşmalıdır.*/
doğum_tarihi datetime,
email varchar(100),
telefon_numarası int,
cinsiyet bit,
ALTER TABLE kullanıcı
ALTER COLUMN telefon_numarası varchar(20);

);

create table kullanıcı_yorumları(
kullanıcı_id int,
yorum_id int,
gezi_yeri_id int,
yorum_metni text,  /*Yorum metninde 100 karakter sınırı vardır.*/
yer_id int,
fotoğraf_linki varchar(200),
puan int check(puan between 1 and 5),
FOREIGN KEY (kullanıcı_id) REFERENCES kullanıcı(kullanıcı_id),
FOREIGN KEY (gezi_yeri_id) REFERENCES gezilecek_yerler(gezi_yeri_id)
);

create table gezilecek_yerler(
gezi_yeri_id int primary key,
şehir_id int,
gezi_yeri_türü varchar(200),  /*cami,kilise,park,anıt,müze*/
gezi_yeri_adı varchar(200),
açılış_zamanı time,
kapanış_zamanı time,
bilgi text,
FOREIGN KEY (şehir_id) REFERENCES Şehirler(şehir_id),
);

create table ulaşım(
ulaşım_id int primary key identity(1,1),
ulaşım_tipi varchar(250),  /*uçak,gemi,tren,metro,otobüs*/
kalkış_noktası varchar(250),
varış_noktası varchar(250),
kalkış_tarihi date,
varış_tarihi date,
kalkış_saati time,
varış_saati time,
fiyat decimal(10,2),
);

create table restoranlar(
restoran_id int primary key identity(1,1),
restoran_adı varchar(200),
şehir_id int,
mutfak_türü varchar(200),   /*uzakdoğu mutfağı,amerikan mutfağı,fransız mutfağı,italyan mutfağı,çin mutağı,türk mutfağı,hint mutfağı,alman mutfağı,kanada mutfağı,tayland mutfağı*/
açılış_zamanı time,
kapanış_zamanı time,
restoran_puan int check(restoran_puan between 1 and 5),
hayvan_bulundurma bit,
garson_puan int check(garson_puan between 1 and 5),
vale_hizmeti bit,
otopark bit,
çocuk_oyun_alanı bit,
FOREIGN KEY (şehir_id) REFERENCES Şehirler(şehir_id),

);




create table kiralık_evler(
ev_id int primary key identity(1,1),
şehir_id int,
ev_tipi nvarchar(50), /*müstakil,daire,bunglov*/
giriş_tarihi date,
çıkış_tarihi date,
hayvan_bulundurma bit,
şehir_merkezine_yakınlık nvarchar(100),
max_kişi_sayısı int,
yatak_sayısı int,
banyo_sayısı int,
ücret decimal(10,2),
havuz bit,
deniz_manzarası bit,
çamaşır_makinesi bit,
bulaşık_makinesi bit,
FOREIGN KEY (şehir_id) REFERENCES Şehirler(şehir_id),
);


insert into ülkeler(ülke_adı,kıta) values
('Türkiye', 'Avrupa'),
('Fransa', 'Avrupa'),
('İtalya', 'Avrupa'),
('ABD', 'Amerika'),
('İngiltere', 'Avrupa'),
('Japonya', 'Asya'),
('Almanya', 'Avrupa'),
('İspanya', 'Avrupa'),
('Çin', 'Asya'),
('Hindistan', 'Asya'),
('Kanada', 'Amerika'),
('Rusya', 'Avrupa'),
('Brezilya', 'Amerika'),
('Avustralya', 'Avustralya'),
('Meksika', 'Amerika');
 
insert into şehirler(şehir_adı, resmi_dil, ülke_id, nüfus, plaka) values
('İstanbul', 'Türkçe', 1, 15029231, 34),
('Paris', 'Fransızca', 2, 2140526, 75),
('Roma', 'İtalyanca', 3, 2870500, 1),
('New York', 'İngilizce', 4, 8336697, 1),
('Londra', 'İngilizce', 5, 8982000, 1),
('Tokyo', 'Japonca', 6, 13942856, NULL),
('Berlin', 'Almanca', 7, 3769495, 1),
('Madrid', 'İspanyolca', 8, 3223334, 34),
('Pekin', 'Mandarin', 9, 21542000, NULL),
('Yeni Delhi', 'Hintçe', 10, 21753486, NULL),
('Toronto', 'İngilizce', 11, 2731571, NULL),
('Moskova', 'Rusça', 12, 12615882, 7),
('Rio de Janeiro', 'Portekizce', 13, 6718903, 21),
('Sydney', 'İngilizce', 14, 5312163, NULL),
('Meksiko City', 'İspanyolca', 15, 8918653, NULL);

insert into oteller(otel_adı, kişi_sayısı, çocuk_sayısı, giris_tarihi, çıkış_tarihi, fiyat_aralığı, kahvaltı_dahil, havuz, alkol_bulundurma, kapalı_otopark, televizyon, özel_plaj, internet, spa, puan)values
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

insert into ulaşım(ulaşım_tipi, kalkış_noktası, varış_noktası, kalkış_tarihi, varış_tarihi, kalkış_saati, varış_saati, fiyat)values
('Uçak', 'İstanbul', 'Paris', '2024-05-01', '2024-05-01', '08:00:00', '11:30:00', 400.00),
('Gemi', 'İstanbul', 'Roma', '2024-06-01', '2024-06-05', '18:00:00', '09:00:00', 600.00),
('Tren', 'Paris', 'Berlin', '2024-07-10', '2024-07-12', '10:30:00', '16:45:00', 250.00),
('Metro', 'New York', 'Madrid', '2024-08-15', '2024-08-15', '08:00:00', '14:00:00', 300.00),
('Otobüs', 'Londra', 'Berlin', '2024-09-20', '2024-09-21', '09:00:00', '19:00:00', 150.00),
('Uçak', 'Tokyo', 'Toronto', '2024-10-25', '2024-10-26', '11:00:00', '20:30:00', 800.00),
('Gemi', 'Berlin', 'Rio de Janeiro', '2024-11-10', '2024-11-15', '17:00:00', '09:00:00', 1200.00),
('Tren', 'Moskova', 'Sydney', '2024-12-01', '2024-12-05', '08:30:00', '18:00:00', 1500.00),
('Metro', 'Rio de Janeiro', 'Sydney', '2025-01-02', '2025-01-02', '09:30:00', '15:00:00', 600.00),
('Otobüs', 'Sydney', 'İstanbul', '2025-02-01', '2025-02-05', '06:00:00', '21:00:00', 1000.00),
('Uçak', 'İstanbul', 'Toronto', '2025-03-10', '2025-03-12', '13:30:00', '21:00:00', 700.00),
('Gemi', 'Paris', 'Moskova', '2025-04-20', '2025-04-25', '19:00:00', '10:00:00', 900.00),
('Tren', 'Madrid', 'Rio de Janeiro', '2025-05-15', '2025-05-17', '08:45:00', '21:00:00', 1300.00),
('Metro', 'Berlin', 'Sydney', '2025-06-20', '2025-06-20', '09:00:00', '14:00:00', 500.00),
('Otobüs', 'Tokyo', 'Rio de Janeiro', '2025-07-05', '2025-07-10', '07:30:00', '20:00:00', 1100.00),
('Uçak', 'London', 'Sydney', '2025-08-10', '2025-08-12', '10:00:00', '19:30:00', 900.00),
('Gemi', 'Toronto', 'İstanbul', '2025-09-15', '2025-09-20', '16:00:00', '07:00:00', 800.00),
('Tren', 'Moskova', 'Berlin', '2025-10-01', '2025-10-05', '07:45:00', '17:00:00', 300.00),
('Metro', 'Paris', 'Tokyo', '2025-11-20', '2025-11-20', '08:30:00', '15:00:00', 700.00),
('Otobüs', 'Sydney', 'Madrid', '2025-12-15', '2025-12-20', '06:30:00', '19:30:00', 1000.00);

insert into restoranlar(restoran_id,restoran_adı, şehir_id, mutfak_türü, açılış_zamanı, kapanış_zamanı, restoran_puan, hayvan_bulundurma, garson_puan, vale_hizmeti, otopark, çocuk_oyun_alanı)values
(1,'Lezzet Köşesi', 1, 'Türk Mutfağı', '08:00:00', '23:00:00', 4, 0, 5, 1, 1, 1),
(2,'La Petite Bistro', 2, 'Fransız Mutfağı', '12:00:00', '22:00:00', 5, 0, 5, 0, 1, 0),
(3,'Pizza Italia', 3, 'İtalyan Mutfağı', '11:30:00', '21:30:00', 4, 0, 4, 1, 1, 1),
(4,'NY Steakhouse', 4, 'Amerikan Mutfağı', '17:00:00', '23:30:00', 5, 0, 5, 1, 1, 1),
(5,'London Fish', 5, 'İngiliz Mutfağı', '11:00:00', '22:30:00', 4, 0, 4, 1, 1, 1),
(6,'Tokyo Sushi Bar', 6, 'Japon Mutfağı', '12:00:00', '22:00:00', 4, 0, 4, 0, 1, 0),
(7,'Berlin Schnitzel House', 7, 'Alman Mutfağı', '10:30:00', '23:00:00', 4, 0, 4, 1, 1, 1),
(8,'Madrid Tapas ', 8, 'Kore Mutfağı', '14:00:00', '00:00:00', 4, 0, 4, 0, 1, 0),
(9,'Beijing Dumpling House', 9, 'Çin Mutfağı', '11:00:00', '22:30:00', 4, 0, 4, 1, 1, 1),
(10,'Delhi House', 10, 'Hint Mutfağı', '12:30:00', '23:30:00', 4, 0, 4, 1, 1, 1),
(11,'Toronto BBQ ', 11, 'Kanada Mutfağı', '16:00:00', '00:00:00', 4, 0, 4, 0, 1, 0),
(12,'Sydney Seafood ', 14, 'Uzakdoğu Mutfağı', '11:30:00', '22:30:00', 4, 0, 4, 1, 1, 1),
(13,'Mexico Taco', 15, 'Meksika Mutfağı', '10:00:00', '23:00:00', 4, 0, 4, 1, 1, 1),
(14,'Bangkok Street Food', 17, 'Tayland Mutfağı', '17:00:00', '02:00:00', 4, 0, 4, 1, 1, 1),
(15,'Dubai Desert Diner', 18, 'Hint Mutfağı', '19:00:00', '03:00:00', 4, 0, 4, 1, 1, 1),
(16,'Vienna Cafe', 19, 'İtalyan Mutfağı', '08:30:00', '20:00:00', 4, 0, 4, 1, 1, 1),
(17,'Seoul House', 20, 'Kore Mutfağı', '11:30:00', '23:30:00', 4, 0, 4, 1, 1, 1);

insert  into turlar(tur_id,tur_adı, şehir_id, açıklama, kalkış_noktası, varış_noktası, kalkış_tarihi, varış_tarihi, fiyat, ulaşım_tipi, konaklama_tipi, katılımcı_sayısı, çocuk_sayısı)values
(1,'Tarihi İstanbul Turu', 1, 'İstanbulun tarihi ve kültürel yerlerini ziyaret edeceğiniz muhteşem bir tur.', 'İstanbul', 'İstanbul', '2024-06-01', '2024-06-05', 800.00, 'Otobüs', 'Otel', 20, 5),
(2,'Paris Şehir Turu', 2, 'Parisin ünlü simgelerini ziyaret ederek unutulmaz bir Fransa deneyimi yaşayın.', 'Paris', 'Paris', '2024-07-10', '2024-07-15', 1200.00, 'Uçak', 'Otel', 15, 3),
(3,'Roma Tarih Turu', 3, 'Romanın antik kalıntılarını keşfetmek için heyecan verici bir yolculuğa çıkın.', 'İstanbul', 'Roma', '2024-08-20', '2024-08-25', 1500.00, 'Gemi', 'Otel', 25, 7),
(4,'New York Keşif Turu', 4, 'New Yorkun canlı atmosferini keşfedin ve unutulmaz anılar biriktirin.', 'New York', 'New York', '2024-09-05', '2024-09-10', 1100.00, 'Uçak', 'Otel', 30, 8),
(5,'Londra Kültür Turu', 5, 'Londranın tarihini ve kültürünü keşfetmek için unutulmaz bir yolculuğa çıkın.', 'Londra', 'Londra', '2024-10-12', '2024-10-17', 1300.00, 'Tren', 'Otel', 20, 5),
(6,'Tokyo Gezisi', 6, 'Tokyonun modern ve geleneksel yanlarını keşfedin.', 'Tokyo', 'Tokyo', '2024-11-20', '2024-11-25', 1400.00, 'Uçak', 'Otel', 15, 4),
(7,'Berlin Tarihi Turu', 7, 'Berlinde tarih dolu bir yolculuk yapın ve şehrin simgelerini keşfedin.', 'Berlin', 'Berlin', '2024-12-01', '2024-12-06', 1000.00, 'Otobüs', 'Otel', 25, 6),
(8,'Madrid Kültür Turu', 8, 'Madridin sanat ve kültür dolu sokaklarını keşfedin.', 'Madrid', 'Madrid', '2025-01-02', '2025-01-07', 1300.00, 'Uçak', 'Otel', 20, 5),
(9,'Meksiko City Kültür Turu', 15, 'Meksikonun renkli sokaklarını keşfedin ve lezzetli Meksika yemeklerinin tadını çıkarın.', 'Meksiko City', 'Meksiko City', '2025-07-05', '2025-07-08', 1500.00, 'Otobüs', 'Günübirlik', 30, 8),
(10,'Sydney Doğa Turu', 14, 'Sydneynin doğal güzelliklerini keşfedin ve plajlarda dinlenin.', 'Sydney', 'Sydney', '2025-08-10', '2025-08-12', 1600.00, 'Gemi', 'Çadır', 20, 5),
(11,'Rio de Janeiro Doğa Turu', 13, 'Rionun doğal güzelliklerini keşfedin ve berrak suyunun keyfini çıkarın.', 'Rio de Janeiro', 'Rio de Janeiro', '2025-05-20', '2025-05-25', 1300.00, 'Gemi', 'Çadır', 30, 8),
(12,'Moskova Kültür Turu', 12, 'Moskovanın tarih dolu sokaklarında kaybolun.', 'Moskova', 'Moskova', '2025-04-05', '2025-04-10', 1200.00, 'Tren', 'Otel', 25, 6),
(13,'Paris Lezzet Turu', 2, 'Parisin muhteşem lezzetlerini tadın ve şehrin sokaklarını keşfedin.', 'Paris', 'Paris', '2025-11-20', '2025-11-25', 1900.00, 'Uçak', 'Otel', 30, 8),
(14,'Yeni Delhi Kültür Turu', 10, 'Yeni Delhinin renkli kültürünü keşfedin.', 'Yeni Delhi', 'Yeni Delhi', '2025-02-18', '2025-02-23', 900.00, 'Uçak', 'Otel', 20, 5),
(15,'Toronto Şehir Turu', 11, 'Torontonun modern yaşam tarzını keşfedin.', 'Toronto', 'Toronto', '2025-03-10', '2025-03-15', 1100.00, 'Uçak', 'Otel', 20, 5);

insert into kullanıcı(kimlik_id, adı, soyadı, kullanıcı_adı, kullanıcı_şifre, doğum_tarihi, email, telefon_numarası, cinsiyet)values
('12345678901', 'Ali', 'Yılmaz', 'ali123', 'aLi13pass', '1990-05-15', 'ali@email.com', 5551234567, 1),
('23456789012', 'Ayşe', 'Kara', 'ayse345', 'aYse345pas', '1985-08-20', 'ayse@email.com', 5552345678, 0),
('34567890123', 'Mehmet', 'Demir', 'mehmet789', 'mehMet789pss', '1988-11-10', 'mehmet@email.com', 5553456789, 1),
('45678901234', 'Fatma', 'Yıldız', 'fatma012', 'fatmA12pass', '1995-03-25', 'fatma@email.com', 5554567890, 0),
('56789012345', 'Mustafa', 'Arslan', 'mustafa567', 'Mstafa567pass', '1992-06-30', 'mustafa@email.com', 5555678901, 1),
('67890123456', 'Zeynep', 'Öztürk', 'zeynep901', 'zEyep901pass', '1987-09-12', 'zeynep@email.com', 5556789012, 0),
('78901234567', 'Ahmet', 'Şahin', 'ahmet678', 'ahmeT678ass', '1991-02-05', 'ahmet@email.com', 5557890123, 1),
('89012345678', 'Nur', 'Çelik', 'nur123', 'nur123paS', '1984-12-18', 'nur@email.com', 5558901234, 0),
('90123456789', 'Emre', 'Koç', 'emre234', 'emr234pAss', '1993-07-22', 'emre@email.com', 5559012345, 1),
('01234567890', 'Seda', 'Aydın', 'seda456', 'sed456pAss', '1989-04-11', 'seda@email.com', 5550123456, 0),
('09876543210', 'Can', 'Yılmaz', 'can789', 'cn789Pass', '1994-10-08', 'can@email.com', 5550987654, 1),
('98765432109', 'Deniz', 'Aktaş', 'deniz098', 'denz098pasS', '1986-01-29', 'deniz@email.com', 5559876543, 0),
('87654321098', 'Pınar', 'Demir', 'pinar567', 'pinar567pSs', '1997-08-15', 'pinar@email.com', 5558765432, 0),
('76543210987', 'Orhan', 'Kurt', 'orhan345', 'orhan35Pass', '1990-03-07', 'orhan@email.com', 5557654321, 1),
('65432109876', 'Elif', 'Kaya', 'elif678', 'elif678Ass', '1983-11-04', 'elif@email.com', 5556543210, 0);

insert into kullanıcı_yorumları(kullanıcı_id, yorum_id, gezi_yeri_id, yorum_metni, yer_id, fotoğraf_linki, puan)values
(2, 2, 2, 'Muhteşem manzara ve hizmet!', 2, 'https://example.com/photo2.jpg', 4),
(3, 3, 3, 'Çok lezzetli yemekler, kesinlikle deneyin!', 3, 'https://example.com/photo3.jpg', 5),
(4, 4, 4, 'Otel temiz ve konforluydu, tavsiye ederim.', 4, 'https://example.com/photo4.jpg', 4),
(5, 5, 5, 'Personel çok ilgili ve yardımseverdi.', 5, 'https://example.com/photo5.jpg', 5),
(6, 6, 6, 'Harika bir atmosfer ve eğlenceli etkinlikler!', 6, 'https://example.com/photo6.jpg', 4),
(7, 7, 7, 'Yemekler lezzetliydi ancak biraz pahalı.', 7, 'https://example.com/photo7.jpg', 3),
(8, 8, 8, 'Güzel bir restoran, manzara harikaydı!', 8, 'https://example.com/photo8.jpg', 5),
(9, 9, 9, 'Yemekler gerçekten otantik ve lezzetliydi.', 9, 'https://example.com/photo9.jpg', 4),
(10, 10, 10, 'Mükemmel bir konaklama deneyimi yaşadım.', 10, 'https://example.com/photo10.jpg', 5),
(11, 11, 11, 'Personel çok cana yakın ve yardımsever.', 11, 'https://example.com/photo11.jpg', 5),
(12, 12, 12, 'Otelin konumu çok uygun ve temizdi.', 12, 'https://example.com/photo12.jpg', 4),
(13, 13, 13, 'Harika bir tatil geçirdik, teşekkürler!', 13, 'https://example.com/photo13.jpg', 5),
(14, 14, 14, 'Otelin deniz manzarası nefes kesiciydi.', 14, 'https://example.com/photo14.jpg', 4),
(15, 15, 15, 'Restoranın yemekleri çok lezzetliydi!', 15, 'https://example.com/photo15.jpg', 5);

insert into gezilecek_yerler(gezi_yeri_id, şehir_id, gezi_yeri_türü, gezi_yeri_adı, açılış_zamanı, kapanış_zamanı, bilgi)values
(1, 1, 'Müze', 'Ayasofya Müzesi', '09:00:00', '17:00:00', 'İstanbul un sembolü olan tarihi ve mimari açıdan önemli yapı.'),
(2, 2, 'Müze', 'Louvre Müzesi', '09:00:00', '18:00:00', 'Dünyanın en büyük ve ünlü sanat müzelerinden biri.'),
(3, 3, 'Tarihi Yer', 'Kolezyum', '08:30:00', '19:00:00', 'Roma İmparatorluğu döneminden kalan büyük bir amfi tiyatro.'),
(4, 4, 'Park', 'Central Park', '06:00:00', '01:00:00', 'New York City nin en büyük ve ünlü parkı.'),
(5, 5, 'Müze', 'British Museum', '10:00:00', '17:30:00', 'Dünya tarihindeki önemli eserlerin sergilendiği müze.'),
(6, 6, 'Tarihi Yer', 'Asakusa Tapınağı', '08:00:00', '17:00:00', 'Tokyo nun en eski ve en ünlü tapınağı.'),
(7, 7, 'Park', 'Tiergarten', '06:00:00', '22:00:00', 'Berlin in en büyük parkı ve rekreasyon alanı.'),
(8, 8, 'Müze', 'Prado Müzesi', '10:00:00', '20:00:00', 'İspanyol sanatının önemli eserlerini barındıran müze.'),
(9, 9, 'Tarihi Yer', 'Yasak Şehir', '08:00:00', '18:00:00', 'Çin in tarihi ve kültürel öneme sahip yasaklanmış eski bir şehri.'),
(10, 10, 'Tarihi Yer', 'Taj Mahal', '06:00:00', '19:00:00', 'Hindistan ın en ünlü anıtı ve dünya harikası.'),
(11, 11, 'Müze', 'Royal Ontario Museum', '10:00:00', '17:30:00', 'Kanada nın en büyük müzesi ve dünya kültürüne odaklanan bir müze.'),
(12, 12, 'Park', 'Gorky Park', '07:00:00', '23:00:00', 'Moskova nın en popüler dinlenme ve eğlence mekanlarından biri.'),
(13, 13, 'Tarihi Yer', 'Christ the Redeemer', '08:00:00', '19:00:00', 'Riode Janeiro nun sembolü olan büyük bir İsa heykeli.'),
(14, 14, 'Müze', 'Sydney Opera House', '09:00:00', '17:00:00', 'Dünyanın en ünlü opera binalarından biri ve mimari bir harika.'),
(15, 15, 'Park', 'Chapultepec Parkı', '06:00:00', '22:00:00', 'Meksiko City nin en büyük ve en ünlü parkı.');

insert into kiralık_evler(şehir_id, ev_tipi, giriş_tarihi, çıkış_tarihi, hayvan_bulundurma, şehir_merkezine_yakınlık, max_kişi_sayısı, yatak_sayısı, banyo_sayısı, ücret, havuz, deniz_manzarası, çamaşır_makinesi, bulaşık_makinesi)values
(1, 'Daire', '2024-05-10', '2024-05-15', 1, 'Merkeze yakın', 4, 2, 1, 300.00, 0, 0, 1, 1),
(2, 'Müstakil', '2024-06-01', '2024-06-10', 0, 'Kıyıda', 6, 3, 2, 500.00, 1, 1, 1, 1),
(3, 'Daire', '2024-07-15', '2024-07-20', 0, 'Şehir merkezine 10 km', 3, 1, 1, 250.00, 0, 0, 1, 0),
(4, 'Bungalo', '2024-08-05', '2024-08-12', 1, 'Kıyıda', 2, 1, 1, 200.00, 0, 1, 0, 0),
(5, 'Müstakil', '2024-09-20', '2024-09-25', 0, 'Şehir merkezine 5 km', 4, 2, 1, 350.00, 0, 0, 1, 1),
(6, 'Daire', '2024-10-10', '2024-10-17', 1, 'Merkeze yakın', 3, 1, 1, 280.00, 0, 0, 1, 1),
(7, 'Müstakil', '2024-11-01', '2024-11-07', 0, 'Kırsal alanda', 6, 3, 2, 480.00, 1, 1, 1, 1),
(8, 'Daire', '2024-12-15', '2024-12-20', 0, 'Merkeze yakın', 2, 1, 1, 200.00, 0, 0, 0, 0),
(9, 'Müstakil', '2025-01-10', '2025-01-17', 1, 'Şehir merkezine 8 km', 4, 2, 1, 320.00, 0, 0, 1, 1),
(10, 'Daire', '2025-02-05', '2025-02-12', 0, 'Kıyıda', 3, 2, 1, 300.00, 0, 1, 0, 1),
(11, 'Bungalov', '2025-03-20', '2025-03-27', 1, 'Merkeze yakın', 2, 1, 1, 250.00, 1, 0, 0, 0),
(12, 'Müstakil', '2025-04-10', '2025-04-17', 0, 'Kırsal alanda', 5, 3, 2, 450.00, 1, 0, 1, 1),
(13, 'Daire', '2025-05-05', '2025-05-12', 1, 'Şehir merkezine 12 km', 4, 2, 1, 320.00, 0, 0, 1, 0),
(14, 'Müstakil', '2025-06-20', '2025-06-27', 0, 'Kıyıda', 6, 3, 2, 500.00, 1, 1, 1, 1),
(15, 'Daire', '2025-07-10', '2025-07-17', 0, 'Merkeze yakın', 3, 1, 1, 280.00, 0, 0, 1, 1);

insert into etkinlikler(etkinlik_id, etkinlik_adı, etkinlik_türü, şehir_id, yaş_üzeri18, tarih, saat, bilet_fiyatı, oturma_düzeni, açık_hava)values
(1, 'İstanbul Film Festivali', 'Film', 1, 1, '2024-05-15', '19:00:00', 50.00, 1, 0),
(2, 'Paris Fashion Week', 'Moda', 2, 1, '2024-06-20', '16:00:00', 100.00, 1, 1),
(3, 'Roma Opera Gösterisi', 'Opera', 3, 1, '2024-07-25', '20:30:00', 80.00, 1, 0),
(4, 'New York Comic Con', 'Festival', 4, 0, '2024-08-30', '10:00:00', 75.00, 1, 1),
(5, 'Londra West End Tiyatro Oyunu', 'Tiyatro', 5, 1, '2024-09-15', '19:30:00', 60.00, 1, 0),
(6, 'Tokyo Anime Expo', 'Festival', 6, 0, '2024-10-10', '11:00:00', 40.00, 1, 1),
(7, 'Berlin Oktoberfest', 'Festival', 7, 1, '2024-11-05', '17:00:00', 70.00, 1, 1),
(8, 'Madrid Flamenco Şovu', 'Dans', 8, 1, '2024-12-10', '21:00:00', 45.00, 1, 0),
(9, 'Pekin Çin Yeni Yılı Kutlamaları', 'Festival', 9, 0, '2025-01-25', '18:30:00', 55.00, 1, 1),
(10, 'Yeni Delhi Yoga Festivali', 'Festival', 10, 1, '2025-02-20', '08:00:00', 30.00, 1, 1),
(11, 'Toronto Müzik Festivali', 'Müzik', 11, 1, '2025-03-15', '14:00:00', 65.00, 1, 1),
(12, 'Moskova Ballet Gösterisi', 'Bale', 12, 1, '2025-04-20', '19:00:00', 85.00, 1, 0),
(13, 'Rio de Janeiro Carnaval', 'Festival', 13, 0, '2025-05-30', '20:00:00', 90.00, 1, 1),
(14, 'Sydney Opera House Konseri', 'Müzik', 14, 1, '2025-06-25', '18:00:00', 75.00, 1, 0),
(15, 'Meksiko City Güzel Sanatlar Festivali', 'Festival', 15, 1, '2025-07-20', '17:30:00', 50.00, 1, 1);




