use [þehir gezi rehberi]
create table Ülkeler (
  ülke_id INT PRIMARY KEY identity(1,1),
  ülke_adý VARCHAR(255) NOT NULL,
  kýta VARCHAR(255) NOT NULL
);
create table þehirler(
þehir_id int primary key identity(1,1),
þehir_adý nvarchar(200) not null,
resmi_dil nvarchar(50),
ülke_id int not null,
nüfus int,
plaka int,

foreign key(ülke_id) references ülkeler(ülke_id)
);

create table oteller(
otel_id int primary key identity(1,1),
otel_adý nvarchar(100) not null,
kiþi_sayýsý varchar(10) not null,
çocuk_sayýsý int,
giris_tarihi date not null,
çýkýþ_tarihi date not null,
fiyat_aralýðý decimal(10,2),
kahvaltý_dahil bit,
havuz bit,
alkol_bulundurma bit,
kapalý_otopark bit,
televizyon int,
özel_plaj bit,
internet bit,
spa bit,
puan int check(puan between 1 and 5),
);

create table turlar (
tur_id int primary key,
tur_adý varchar(250),
þehir_id int,
açýklama text,
kalkýþ_noktasý varchar(200),
varýþ_noktasý varchar(200),
kalkýþ_tarihi date,
varýþ_tarihi date,
fiyat decimal(10,2),
ulaþým_tipi varchar(200), 
konaklama_tipi varchar(200),    /*otel,çadýr,günübirlik*/
katýlýmcý_sayýsý int,
çocuk_sayýsý int,
FOREIGN KEY (þehir_id) REFERENCES Þehirler(þehir_id),
);


create table etkinlikler(
etkinlik_id int,
etkinlik_adý nvarchar(200),
etkinlik_türü nvarchar(200),  /*konser,doða yürüyüþü,tiyatro,standup,film,festival*/
þehir_id int,
yaþ_üzeri18 bit,
tarih date,
saat time,
bilet_fiyatý decimal(10,2),
oturma_düzeni bit,
açýk_hava bit,
FOREIGN KEY (þehir_id) REFERENCES Þehirler(þehir_id),
);




create table kullanýcý(
kullanýcý_id int identity(1,1)primary key,
kimlik_id varchar(12),
adý nvarchar(150),
soyadý nvarchar(150),
kullanýcý_adý nvarchar(150),
kullanýcý_þifre nvarchar(50)unique,  /*þifre büyük küçük harf ve rakamlardan oluþmalýdýr.*/
doðum_tarihi datetime,
email varchar(100),
telefon_numarasý int,
cinsiyet bit,
ALTER TABLE kullanýcý
ALTER COLUMN telefon_numarasý varchar(20);

);

create table kullanýcý_yorumlarý(
kullanýcý_id int,
yorum_id int,
gezi_yeri_id int,
yorum_metni text,  /*Yorum metninde 100 karakter sýnýrý vardýr.*/
yer_id int,
fotoðraf_linki varchar(200),
puan int check(puan between 1 and 5),
FOREIGN KEY (kullanýcý_id) REFERENCES kullanýcý(kullanýcý_id),
FOREIGN KEY (gezi_yeri_id) REFERENCES gezilecek_yerler(gezi_yeri_id)
);

create table gezilecek_yerler(
gezi_yeri_id int primary key,
þehir_id int,
gezi_yeri_türü varchar(200),  /*cami,kilise,park,anýt,müze*/
gezi_yeri_adý varchar(200),
açýlýþ_zamaný time,
kapanýþ_zamaný time,
bilgi text,
FOREIGN KEY (þehir_id) REFERENCES Þehirler(þehir_id),
);

create table ulaþým(
ulaþým_id int primary key identity(1,1),
ulaþým_tipi varchar(250),  /*uçak,gemi,tren,metro,otobüs*/
kalkýþ_noktasý varchar(250),
varýþ_noktasý varchar(250),
kalkýþ_tarihi date,
varýþ_tarihi date,
kalkýþ_saati time,
varýþ_saati time,
fiyat decimal(10,2),
);

create table restoranlar(
restoran_id int primary key identity(1,1),
restoran_adý varchar(200),
þehir_id int,
mutfak_türü varchar(200),   /*uzakdoðu mutfaðý,amerikan mutfaðý,fransýz mutfaðý,italyan mutfaðý,çin mutaðý,türk mutfaðý,hint mutfaðý,alman mutfaðý,kanada mutfaðý,tayland mutfaðý*/
açýlýþ_zamaný time,
kapanýþ_zamaný time,
restoran_puan int check(restoran_puan between 1 and 5),
hayvan_bulundurma bit,
garson_puan int check(garson_puan between 1 and 5),
vale_hizmeti bit,
otopark bit,
çocuk_oyun_alaný bit,
FOREIGN KEY (þehir_id) REFERENCES Þehirler(þehir_id),

);




create table kiralýk_evler(
ev_id int primary key identity(1,1),
þehir_id int,
ev_tipi nvarchar(50), /*müstakil,daire,bunglov*/
giriþ_tarihi date,
çýkýþ_tarihi date,
hayvan_bulundurma bit,
þehir_merkezine_yakýnlýk nvarchar(100),
max_kiþi_sayýsý int,
yatak_sayýsý int,
banyo_sayýsý int,
ücret decimal(10,2),
havuz bit,
deniz_manzarasý bit,
çamaþýr_makinesi bit,
bulaþýk_makinesi bit,
FOREIGN KEY (þehir_id) REFERENCES Þehirler(þehir_id),
);


insert into ülkeler(ülke_adý,kýta) values
('Türkiye', 'Avrupa'),
('Fransa', 'Avrupa'),
('Ýtalya', 'Avrupa'),
('ABD', 'Amerika'),
('Ýngiltere', 'Avrupa'),
('Japonya', 'Asya'),
('Almanya', 'Avrupa'),
('Ýspanya', 'Avrupa'),
('Çin', 'Asya'),
('Hindistan', 'Asya'),
('Kanada', 'Amerika'),
('Rusya', 'Avrupa'),
('Brezilya', 'Amerika'),
('Avustralya', 'Avustralya'),
('Meksika', 'Amerika');
 
insert into þehirler(þehir_adý, resmi_dil, ülke_id, nüfus, plaka) values
('Ýstanbul', 'Türkçe', 1, 15029231, 34),
('Paris', 'Fransýzca', 2, 2140526, 75),
('Roma', 'Ýtalyanca', 3, 2870500, 1),
('New York', 'Ýngilizce', 4, 8336697, 1),
('Londra', 'Ýngilizce', 5, 8982000, 1),
('Tokyo', 'Japonca', 6, 13942856, NULL),
('Berlin', 'Almanca', 7, 3769495, 1),
('Madrid', 'Ýspanyolca', 8, 3223334, 34),
('Pekin', 'Mandarin', 9, 21542000, NULL),
('Yeni Delhi', 'Hintçe', 10, 21753486, NULL),
('Toronto', 'Ýngilizce', 11, 2731571, NULL),
('Moskova', 'Rusça', 12, 12615882, 7),
('Rio de Janeiro', 'Portekizce', 13, 6718903, 21),
('Sydney', 'Ýngilizce', 14, 5312163, NULL),
('Meksiko City', 'Ýspanyolca', 15, 8918653, NULL);

insert into oteller(otel_adý, kiþi_sayýsý, çocuk_sayýsý, giris_tarihi, çýkýþ_tarihi, fiyat_aralýðý, kahvaltý_dahil, havuz, alkol_bulundurma, kapalý_otopark, televizyon, özel_plaj, internet, spa, puan)values
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

insert into ulaþým(ulaþým_tipi, kalkýþ_noktasý, varýþ_noktasý, kalkýþ_tarihi, varýþ_tarihi, kalkýþ_saati, varýþ_saati, fiyat)values
('Uçak', 'Ýstanbul', 'Paris', '2024-05-01', '2024-05-01', '08:00:00', '11:30:00', 400.00),
('Gemi', 'Ýstanbul', 'Roma', '2024-06-01', '2024-06-05', '18:00:00', '09:00:00', 600.00),
('Tren', 'Paris', 'Berlin', '2024-07-10', '2024-07-12', '10:30:00', '16:45:00', 250.00),
('Metro', 'New York', 'Madrid', '2024-08-15', '2024-08-15', '08:00:00', '14:00:00', 300.00),
('Otobüs', 'Londra', 'Berlin', '2024-09-20', '2024-09-21', '09:00:00', '19:00:00', 150.00),
('Uçak', 'Tokyo', 'Toronto', '2024-10-25', '2024-10-26', '11:00:00', '20:30:00', 800.00),
('Gemi', 'Berlin', 'Rio de Janeiro', '2024-11-10', '2024-11-15', '17:00:00', '09:00:00', 1200.00),
('Tren', 'Moskova', 'Sydney', '2024-12-01', '2024-12-05', '08:30:00', '18:00:00', 1500.00),
('Metro', 'Rio de Janeiro', 'Sydney', '2025-01-02', '2025-01-02', '09:30:00', '15:00:00', 600.00),
('Otobüs', 'Sydney', 'Ýstanbul', '2025-02-01', '2025-02-05', '06:00:00', '21:00:00', 1000.00),
('Uçak', 'Ýstanbul', 'Toronto', '2025-03-10', '2025-03-12', '13:30:00', '21:00:00', 700.00),
('Gemi', 'Paris', 'Moskova', '2025-04-20', '2025-04-25', '19:00:00', '10:00:00', 900.00),
('Tren', 'Madrid', 'Rio de Janeiro', '2025-05-15', '2025-05-17', '08:45:00', '21:00:00', 1300.00),
('Metro', 'Berlin', 'Sydney', '2025-06-20', '2025-06-20', '09:00:00', '14:00:00', 500.00),
('Otobüs', 'Tokyo', 'Rio de Janeiro', '2025-07-05', '2025-07-10', '07:30:00', '20:00:00', 1100.00),
('Uçak', 'London', 'Sydney', '2025-08-10', '2025-08-12', '10:00:00', '19:30:00', 900.00),
('Gemi', 'Toronto', 'Ýstanbul', '2025-09-15', '2025-09-20', '16:00:00', '07:00:00', 800.00),
('Tren', 'Moskova', 'Berlin', '2025-10-01', '2025-10-05', '07:45:00', '17:00:00', 300.00),
('Metro', 'Paris', 'Tokyo', '2025-11-20', '2025-11-20', '08:30:00', '15:00:00', 700.00),
('Otobüs', 'Sydney', 'Madrid', '2025-12-15', '2025-12-20', '06:30:00', '19:30:00', 1000.00);

insert into restoranlar(restoran_id,restoran_adý, þehir_id, mutfak_türü, açýlýþ_zamaný, kapanýþ_zamaný, restoran_puan, hayvan_bulundurma, garson_puan, vale_hizmeti, otopark, çocuk_oyun_alaný)values
(1,'Lezzet Köþesi', 1, 'Türk Mutfaðý', '08:00:00', '23:00:00', 4, 0, 5, 1, 1, 1),
(2,'La Petite Bistro', 2, 'Fransýz Mutfaðý', '12:00:00', '22:00:00', 5, 0, 5, 0, 1, 0),
(3,'Pizza Italia', 3, 'Ýtalyan Mutfaðý', '11:30:00', '21:30:00', 4, 0, 4, 1, 1, 1),
(4,'NY Steakhouse', 4, 'Amerikan Mutfaðý', '17:00:00', '23:30:00', 5, 0, 5, 1, 1, 1),
(5,'London Fish', 5, 'Ýngiliz Mutfaðý', '11:00:00', '22:30:00', 4, 0, 4, 1, 1, 1),
(6,'Tokyo Sushi Bar', 6, 'Japon Mutfaðý', '12:00:00', '22:00:00', 4, 0, 4, 0, 1, 0),
(7,'Berlin Schnitzel House', 7, 'Alman Mutfaðý', '10:30:00', '23:00:00', 4, 0, 4, 1, 1, 1),
(8,'Madrid Tapas ', 8, 'Kore Mutfaðý', '14:00:00', '00:00:00', 4, 0, 4, 0, 1, 0),
(9,'Beijing Dumpling House', 9, 'Çin Mutfaðý', '11:00:00', '22:30:00', 4, 0, 4, 1, 1, 1),
(10,'Delhi House', 10, 'Hint Mutfaðý', '12:30:00', '23:30:00', 4, 0, 4, 1, 1, 1),
(11,'Toronto BBQ ', 11, 'Kanada Mutfaðý', '16:00:00', '00:00:00', 4, 0, 4, 0, 1, 0),
(12,'Sydney Seafood ', 14, 'Uzakdoðu Mutfaðý', '11:30:00', '22:30:00', 4, 0, 4, 1, 1, 1),
(13,'Mexico Taco', 15, 'Meksika Mutfaðý', '10:00:00', '23:00:00', 4, 0, 4, 1, 1, 1),
(14,'Bangkok Street Food', 17, 'Tayland Mutfaðý', '17:00:00', '02:00:00', 4, 0, 4, 1, 1, 1),
(15,'Dubai Desert Diner', 18, 'Hint Mutfaðý', '19:00:00', '03:00:00', 4, 0, 4, 1, 1, 1),
(16,'Vienna Cafe', 19, 'Ýtalyan Mutfaðý', '08:30:00', '20:00:00', 4, 0, 4, 1, 1, 1),
(17,'Seoul House', 20, 'Kore Mutfaðý', '11:30:00', '23:30:00', 4, 0, 4, 1, 1, 1);

insert  into turlar(tur_id,tur_adý, þehir_id, açýklama, kalkýþ_noktasý, varýþ_noktasý, kalkýþ_tarihi, varýþ_tarihi, fiyat, ulaþým_tipi, konaklama_tipi, katýlýmcý_sayýsý, çocuk_sayýsý)values
(1,'Tarihi Ýstanbul Turu', 1, 'Ýstanbulun tarihi ve kültürel yerlerini ziyaret edeceðiniz muhteþem bir tur.', 'Ýstanbul', 'Ýstanbul', '2024-06-01', '2024-06-05', 800.00, 'Otobüs', 'Otel', 20, 5),
(2,'Paris Þehir Turu', 2, 'Parisin ünlü simgelerini ziyaret ederek unutulmaz bir Fransa deneyimi yaþayýn.', 'Paris', 'Paris', '2024-07-10', '2024-07-15', 1200.00, 'Uçak', 'Otel', 15, 3),
(3,'Roma Tarih Turu', 3, 'Romanýn antik kalýntýlarýný keþfetmek için heyecan verici bir yolculuða çýkýn.', 'Ýstanbul', 'Roma', '2024-08-20', '2024-08-25', 1500.00, 'Gemi', 'Otel', 25, 7),
(4,'New York Keþif Turu', 4, 'New Yorkun canlý atmosferini keþfedin ve unutulmaz anýlar biriktirin.', 'New York', 'New York', '2024-09-05', '2024-09-10', 1100.00, 'Uçak', 'Otel', 30, 8),
(5,'Londra Kültür Turu', 5, 'Londranýn tarihini ve kültürünü keþfetmek için unutulmaz bir yolculuða çýkýn.', 'Londra', 'Londra', '2024-10-12', '2024-10-17', 1300.00, 'Tren', 'Otel', 20, 5),
(6,'Tokyo Gezisi', 6, 'Tokyonun modern ve geleneksel yanlarýný keþfedin.', 'Tokyo', 'Tokyo', '2024-11-20', '2024-11-25', 1400.00, 'Uçak', 'Otel', 15, 4),
(7,'Berlin Tarihi Turu', 7, 'Berlinde tarih dolu bir yolculuk yapýn ve þehrin simgelerini keþfedin.', 'Berlin', 'Berlin', '2024-12-01', '2024-12-06', 1000.00, 'Otobüs', 'Otel', 25, 6),
(8,'Madrid Kültür Turu', 8, 'Madridin sanat ve kültür dolu sokaklarýný keþfedin.', 'Madrid', 'Madrid', '2025-01-02', '2025-01-07', 1300.00, 'Uçak', 'Otel', 20, 5),
(9,'Meksiko City Kültür Turu', 15, 'Meksikonun renkli sokaklarýný keþfedin ve lezzetli Meksika yemeklerinin tadýný çýkarýn.', 'Meksiko City', 'Meksiko City', '2025-07-05', '2025-07-08', 1500.00, 'Otobüs', 'Günübirlik', 30, 8),
(10,'Sydney Doða Turu', 14, 'Sydneynin doðal güzelliklerini keþfedin ve plajlarda dinlenin.', 'Sydney', 'Sydney', '2025-08-10', '2025-08-12', 1600.00, 'Gemi', 'Çadýr', 20, 5),
(11,'Rio de Janeiro Doða Turu', 13, 'Rionun doðal güzelliklerini keþfedin ve berrak suyunun keyfini çýkarýn.', 'Rio de Janeiro', 'Rio de Janeiro', '2025-05-20', '2025-05-25', 1300.00, 'Gemi', 'Çadýr', 30, 8),
(12,'Moskova Kültür Turu', 12, 'Moskovanýn tarih dolu sokaklarýnda kaybolun.', 'Moskova', 'Moskova', '2025-04-05', '2025-04-10', 1200.00, 'Tren', 'Otel', 25, 6),
(13,'Paris Lezzet Turu', 2, 'Parisin muhteþem lezzetlerini tadýn ve þehrin sokaklarýný keþfedin.', 'Paris', 'Paris', '2025-11-20', '2025-11-25', 1900.00, 'Uçak', 'Otel', 30, 8),
(14,'Yeni Delhi Kültür Turu', 10, 'Yeni Delhinin renkli kültürünü keþfedin.', 'Yeni Delhi', 'Yeni Delhi', '2025-02-18', '2025-02-23', 900.00, 'Uçak', 'Otel', 20, 5),
(15,'Toronto Þehir Turu', 11, 'Torontonun modern yaþam tarzýný keþfedin.', 'Toronto', 'Toronto', '2025-03-10', '2025-03-15', 1100.00, 'Uçak', 'Otel', 20, 5);

insert into kullanýcý(kimlik_id, adý, soyadý, kullanýcý_adý, kullanýcý_þifre, doðum_tarihi, email, telefon_numarasý, cinsiyet)values
('12345678901', 'Ali', 'Yýlmaz', 'ali123', 'aLi13pass', '1990-05-15', 'ali@email.com', 5551234567, 1),
('23456789012', 'Ayþe', 'Kara', 'ayse345', 'aYse345pas', '1985-08-20', 'ayse@email.com', 5552345678, 0),
('34567890123', 'Mehmet', 'Demir', 'mehmet789', 'mehMet789pss', '1988-11-10', 'mehmet@email.com', 5553456789, 1),
('45678901234', 'Fatma', 'Yýldýz', 'fatma012', 'fatmA12pass', '1995-03-25', 'fatma@email.com', 5554567890, 0),
('56789012345', 'Mustafa', 'Arslan', 'mustafa567', 'Mstafa567pass', '1992-06-30', 'mustafa@email.com', 5555678901, 1),
('67890123456', 'Zeynep', 'Öztürk', 'zeynep901', 'zEyep901pass', '1987-09-12', 'zeynep@email.com', 5556789012, 0),
('78901234567', 'Ahmet', 'Þahin', 'ahmet678', 'ahmeT678ass', '1991-02-05', 'ahmet@email.com', 5557890123, 1),
('89012345678', 'Nur', 'Çelik', 'nur123', 'nur123paS', '1984-12-18', 'nur@email.com', 5558901234, 0),
('90123456789', 'Emre', 'Koç', 'emre234', 'emr234pAss', '1993-07-22', 'emre@email.com', 5559012345, 1),
('01234567890', 'Seda', 'Aydýn', 'seda456', 'sed456pAss', '1989-04-11', 'seda@email.com', 5550123456, 0),
('09876543210', 'Can', 'Yýlmaz', 'can789', 'cn789Pass', '1994-10-08', 'can@email.com', 5550987654, 1),
('98765432109', 'Deniz', 'Aktaþ', 'deniz098', 'denz098pasS', '1986-01-29', 'deniz@email.com', 5559876543, 0),
('87654321098', 'Pýnar', 'Demir', 'pinar567', 'pinar567pSs', '1997-08-15', 'pinar@email.com', 5558765432, 0),
('76543210987', 'Orhan', 'Kurt', 'orhan345', 'orhan35Pass', '1990-03-07', 'orhan@email.com', 5557654321, 1),
('65432109876', 'Elif', 'Kaya', 'elif678', 'elif678Ass', '1983-11-04', 'elif@email.com', 5556543210, 0);

insert into kullanýcý_yorumlarý(kullanýcý_id, yorum_id, gezi_yeri_id, yorum_metni, yer_id, fotoðraf_linki, puan)values
(2, 2, 2, 'Muhteþem manzara ve hizmet!', 2, 'https://example.com/photo2.jpg', 4),
(3, 3, 3, 'Çok lezzetli yemekler, kesinlikle deneyin!', 3, 'https://example.com/photo3.jpg', 5),
(4, 4, 4, 'Otel temiz ve konforluydu, tavsiye ederim.', 4, 'https://example.com/photo4.jpg', 4),
(5, 5, 5, 'Personel çok ilgili ve yardýmseverdi.', 5, 'https://example.com/photo5.jpg', 5),
(6, 6, 6, 'Harika bir atmosfer ve eðlenceli etkinlikler!', 6, 'https://example.com/photo6.jpg', 4),
(7, 7, 7, 'Yemekler lezzetliydi ancak biraz pahalý.', 7, 'https://example.com/photo7.jpg', 3),
(8, 8, 8, 'Güzel bir restoran, manzara harikaydý!', 8, 'https://example.com/photo8.jpg', 5),
(9, 9, 9, 'Yemekler gerçekten otantik ve lezzetliydi.', 9, 'https://example.com/photo9.jpg', 4),
(10, 10, 10, 'Mükemmel bir konaklama deneyimi yaþadým.', 10, 'https://example.com/photo10.jpg', 5),
(11, 11, 11, 'Personel çok cana yakýn ve yardýmsever.', 11, 'https://example.com/photo11.jpg', 5),
(12, 12, 12, 'Otelin konumu çok uygun ve temizdi.', 12, 'https://example.com/photo12.jpg', 4),
(13, 13, 13, 'Harika bir tatil geçirdik, teþekkürler!', 13, 'https://example.com/photo13.jpg', 5),
(14, 14, 14, 'Otelin deniz manzarasý nefes kesiciydi.', 14, 'https://example.com/photo14.jpg', 4),
(15, 15, 15, 'Restoranýn yemekleri çok lezzetliydi!', 15, 'https://example.com/photo15.jpg', 5);

insert into gezilecek_yerler(gezi_yeri_id, þehir_id, gezi_yeri_türü, gezi_yeri_adý, açýlýþ_zamaný, kapanýþ_zamaný, bilgi)values
(1, 1, 'Müze', 'Ayasofya Müzesi', '09:00:00', '17:00:00', 'Ýstanbul un sembolü olan tarihi ve mimari açýdan önemli yapý.'),
(2, 2, 'Müze', 'Louvre Müzesi', '09:00:00', '18:00:00', 'Dünyanýn en büyük ve ünlü sanat müzelerinden biri.'),
(3, 3, 'Tarihi Yer', 'Kolezyum', '08:30:00', '19:00:00', 'Roma Ýmparatorluðu döneminden kalan büyük bir amfi tiyatro.'),
(4, 4, 'Park', 'Central Park', '06:00:00', '01:00:00', 'New York City nin en büyük ve ünlü parký.'),
(5, 5, 'Müze', 'British Museum', '10:00:00', '17:30:00', 'Dünya tarihindeki önemli eserlerin sergilendiði müze.'),
(6, 6, 'Tarihi Yer', 'Asakusa Tapýnaðý', '08:00:00', '17:00:00', 'Tokyo nun en eski ve en ünlü tapýnaðý.'),
(7, 7, 'Park', 'Tiergarten', '06:00:00', '22:00:00', 'Berlin in en büyük parký ve rekreasyon alaný.'),
(8, 8, 'Müze', 'Prado Müzesi', '10:00:00', '20:00:00', 'Ýspanyol sanatýnýn önemli eserlerini barýndýran müze.'),
(9, 9, 'Tarihi Yer', 'Yasak Þehir', '08:00:00', '18:00:00', 'Çin in tarihi ve kültürel öneme sahip yasaklanmýþ eski bir þehri.'),
(10, 10, 'Tarihi Yer', 'Taj Mahal', '06:00:00', '19:00:00', 'Hindistan ýn en ünlü anýtý ve dünya harikasý.'),
(11, 11, 'Müze', 'Royal Ontario Museum', '10:00:00', '17:30:00', 'Kanada nýn en büyük müzesi ve dünya kültürüne odaklanan bir müze.'),
(12, 12, 'Park', 'Gorky Park', '07:00:00', '23:00:00', 'Moskova nýn en popüler dinlenme ve eðlence mekanlarýndan biri.'),
(13, 13, 'Tarihi Yer', 'Christ the Redeemer', '08:00:00', '19:00:00', 'Riode Janeiro nun sembolü olan büyük bir Ýsa heykeli.'),
(14, 14, 'Müze', 'Sydney Opera House', '09:00:00', '17:00:00', 'Dünyanýn en ünlü opera binalarýndan biri ve mimari bir harika.'),
(15, 15, 'Park', 'Chapultepec Parký', '06:00:00', '22:00:00', 'Meksiko City nin en büyük ve en ünlü parký.');

insert into kiralýk_evler(þehir_id, ev_tipi, giriþ_tarihi, çýkýþ_tarihi, hayvan_bulundurma, þehir_merkezine_yakýnlýk, max_kiþi_sayýsý, yatak_sayýsý, banyo_sayýsý, ücret, havuz, deniz_manzarasý, çamaþýr_makinesi, bulaþýk_makinesi)values
(1, 'Daire', '2024-05-10', '2024-05-15', 1, 'Merkeze yakýn', 4, 2, 1, 300.00, 0, 0, 1, 1),
(2, 'Müstakil', '2024-06-01', '2024-06-10', 0, 'Kýyýda', 6, 3, 2, 500.00, 1, 1, 1, 1),
(3, 'Daire', '2024-07-15', '2024-07-20', 0, 'Þehir merkezine 10 km', 3, 1, 1, 250.00, 0, 0, 1, 0),
(4, 'Bungalo', '2024-08-05', '2024-08-12', 1, 'Kýyýda', 2, 1, 1, 200.00, 0, 1, 0, 0),
(5, 'Müstakil', '2024-09-20', '2024-09-25', 0, 'Þehir merkezine 5 km', 4, 2, 1, 350.00, 0, 0, 1, 1),
(6, 'Daire', '2024-10-10', '2024-10-17', 1, 'Merkeze yakýn', 3, 1, 1, 280.00, 0, 0, 1, 1),
(7, 'Müstakil', '2024-11-01', '2024-11-07', 0, 'Kýrsal alanda', 6, 3, 2, 480.00, 1, 1, 1, 1),
(8, 'Daire', '2024-12-15', '2024-12-20', 0, 'Merkeze yakýn', 2, 1, 1, 200.00, 0, 0, 0, 0),
(9, 'Müstakil', '2025-01-10', '2025-01-17', 1, 'Þehir merkezine 8 km', 4, 2, 1, 320.00, 0, 0, 1, 1),
(10, 'Daire', '2025-02-05', '2025-02-12', 0, 'Kýyýda', 3, 2, 1, 300.00, 0, 1, 0, 1),
(11, 'Bungalov', '2025-03-20', '2025-03-27', 1, 'Merkeze yakýn', 2, 1, 1, 250.00, 1, 0, 0, 0),
(12, 'Müstakil', '2025-04-10', '2025-04-17', 0, 'Kýrsal alanda', 5, 3, 2, 450.00, 1, 0, 1, 1),
(13, 'Daire', '2025-05-05', '2025-05-12', 1, 'Þehir merkezine 12 km', 4, 2, 1, 320.00, 0, 0, 1, 0),
(14, 'Müstakil', '2025-06-20', '2025-06-27', 0, 'Kýyýda', 6, 3, 2, 500.00, 1, 1, 1, 1),
(15, 'Daire', '2025-07-10', '2025-07-17', 0, 'Merkeze yakýn', 3, 1, 1, 280.00, 0, 0, 1, 1);

insert into etkinlikler(etkinlik_id, etkinlik_adý, etkinlik_türü, þehir_id, yaþ_üzeri18, tarih, saat, bilet_fiyatý, oturma_düzeni, açýk_hava)values
(1, 'Ýstanbul Film Festivali', 'Film', 1, 1, '2024-05-15', '19:00:00', 50.00, 1, 0),
(2, 'Paris Fashion Week', 'Moda', 2, 1, '2024-06-20', '16:00:00', 100.00, 1, 1),
(3, 'Roma Opera Gösterisi', 'Opera', 3, 1, '2024-07-25', '20:30:00', 80.00, 1, 0),
(4, 'New York Comic Con', 'Festival', 4, 0, '2024-08-30', '10:00:00', 75.00, 1, 1),
(5, 'Londra West End Tiyatro Oyunu', 'Tiyatro', 5, 1, '2024-09-15', '19:30:00', 60.00, 1, 0),
(6, 'Tokyo Anime Expo', 'Festival', 6, 0, '2024-10-10', '11:00:00', 40.00, 1, 1),
(7, 'Berlin Oktoberfest', 'Festival', 7, 1, '2024-11-05', '17:00:00', 70.00, 1, 1),
(8, 'Madrid Flamenco Þovu', 'Dans', 8, 1, '2024-12-10', '21:00:00', 45.00, 1, 0),
(9, 'Pekin Çin Yeni Yýlý Kutlamalarý', 'Festival', 9, 0, '2025-01-25', '18:30:00', 55.00, 1, 1),
(10, 'Yeni Delhi Yoga Festivali', 'Festival', 10, 1, '2025-02-20', '08:00:00', 30.00, 1, 1),
(11, 'Toronto Müzik Festivali', 'Müzik', 11, 1, '2025-03-15', '14:00:00', 65.00, 1, 1),
(12, 'Moskova Ballet Gösterisi', 'Bale', 12, 1, '2025-04-20', '19:00:00', 85.00, 1, 0),
(13, 'Rio de Janeiro Carnaval', 'Festival', 13, 0, '2025-05-30', '20:00:00', 90.00, 1, 1),
(14, 'Sydney Opera House Konseri', 'Müzik', 14, 1, '2025-06-25', '18:00:00', 75.00, 1, 0),
(15, 'Meksiko City Güzel Sanatlar Festivali', 'Festival', 15, 1, '2025-07-20', '17:30:00', 50.00, 1, 1);




