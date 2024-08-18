
CREATE PROCEDURE sp_ListeleUlaþým
    @kalkýþ_noktasý VARCHAR(250),
    @varýþ_noktasý VARCHAR(250),
    @tarih DATE,
    @baþlangýç_saati TIME,
    @bitiþ_saati TIME
AS
BEGIN
    SELECT * FROM ulaþým
    WHERE kalkýþ_noktasý = @kalkýþ_noktasý
    AND varýþ_noktasý = @varýþ_noktasý
    AND kalkýþ_tarihi = @tarih
    AND kalkýþ_saati BETWEEN @baþlangýç_saati AND @bitiþ_saati
END
CREATE PROCEDURE sp_ListeleKiralýkEvler
    @þehir_id INT,
    @giriþ_tarihi DATE,
    @çýkýþ_tarihi DATE,
    @max_kiþi_sayýsý INT
AS
BEGIN
    SELECT * FROM kiralýk_evler
    WHERE þehir_id = @þehir_id
    AND giriþ_tarihi <= @giriþ_tarihi
    AND çýkýþ_tarihi >= @çýkýþ_tarihi
    AND max_kiþi_sayýsý >= @max_kiþi_sayýsý
END
EXEC sp_ListeleUlaþým 'Ýstanbul', 'Ankara', '2024-05-20', '10:00:00', '14:00:00'

EXEC sp_ListeleKiralýkEvler 1, '2024-07-01', '2024-07-15', 4



