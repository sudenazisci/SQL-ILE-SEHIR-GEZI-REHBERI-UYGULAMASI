
CREATE PROCEDURE sp_ListeleUlasım
    @kalkıs_noktası VARCHAR(250),
    @varıs_noktası VARCHAR(250),
    @tarih DATE,
    @baþlangıc_saati TIME,
    @bitiþ_saati TIME
AS
BEGIN
    SELECT * FROM ulasım
    WHERE kalkýþ_noktasý = @kalkıs_noktası
    AND varýþ_noktası = @varıs_noktası
    AND kalkıs_tarihi = @tarih
    AND kalkıs_saati BETWEEN @baslangıç_saati AND @bitis_saati
END
CREATE PROCEDURE sp_ListeleKiralıkEvler
    @sehir_id INT,
    @giris_tarihi DATE,
    @cıkıs_tarihi DATE,
    @max_kisi_sayısı INT
AS
BEGIN
    SELECT * FROM kiralık_evler
    WHERE sehir_id = @sehir_id
    AND giris_tarihi <= @giris_tarihi
    AND cıkıs_tarihi >= @cıkıs_tarihi
    AND max_kisi_sayısı >= @max_kisi_sayısı
END
EXEC sp_ListeleUlasım 'Istanbul', 'Ankara', '2024-05-20', '10:00:00', '14:00:00'

EXEC sp_ListeleKiralıkEvler 1, '2024-07-01', '2024-07-15', 4



