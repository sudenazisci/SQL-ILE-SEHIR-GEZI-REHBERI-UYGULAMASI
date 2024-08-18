
CREATE PROCEDURE sp_ListeleUla��m
    @kalk��_noktas� VARCHAR(250),
    @var��_noktas� VARCHAR(250),
    @tarih DATE,
    @ba�lang��_saati TIME,
    @biti�_saati TIME
AS
BEGIN
    SELECT * FROM ula��m
    WHERE kalk��_noktas� = @kalk��_noktas�
    AND var��_noktas� = @var��_noktas�
    AND kalk��_tarihi = @tarih
    AND kalk��_saati BETWEEN @ba�lang��_saati AND @biti�_saati
END
CREATE PROCEDURE sp_ListeleKiral�kEvler
    @�ehir_id INT,
    @giri�_tarihi DATE,
    @��k��_tarihi DATE,
    @max_ki�i_say�s� INT
AS
BEGIN
    SELECT * FROM kiral�k_evler
    WHERE �ehir_id = @�ehir_id
    AND giri�_tarihi <= @giri�_tarihi
    AND ��k��_tarihi >= @��k��_tarihi
    AND max_ki�i_say�s� >= @max_ki�i_say�s�
END
EXEC sp_ListeleUla��m '�stanbul', 'Ankara', '2024-05-20', '10:00:00', '14:00:00'

EXEC sp_ListeleKiral�kEvler 1, '2024-07-01', '2024-07-15', 4



