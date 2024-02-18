--Ba�l� tablo �rnekleri

SELECT * FROM Urunler
SELECT * FROM Kategoriler

--SADECE ELEKTRON�K �R�NLER
SELECT * FROM Urunler
WHERE KategoriRefID=(SELECT KategoriID FROM Kategoriler
WHERE KategoriAdi='Mobilya') OR 
KategoriRefID=(SELECT KategoriID FROM Kategoriler
WHERE KategoriAdi='Beyaz E�ya')

--ortalama �r�n fiyat�ndan b�y�k olan �r�nler

SELECT * FROM Urunler
WHERE UrunFiyati>(SELECT AVG(UrunFiyati) FROM Urunler)

--ortalama �r�n fiyat�ndan b�y�k olan 
--Elektronik �r�nler

SELECT * FROM Urunler
WHERE UrunFiyati>(SELECT AVG(UrunFiyati) FROM Urunler)
AND
KategoriRefID=(SELECT KategoriID FROM Kategoriler
WHERE KategoriAdi='Elektronik')


--En pahal� �r�n�m hangisi ?
SELECT TOP 1 * FROM Urunler
ORDER BY UrunFiyati desc

--En ucuz �r�n�m hangisi ?
SELECT TOP 1 * FROM Urunler
ORDER BY UrunFiyati 

--�r�nlerin toplam stok adedi nedir ?


SELECT * FROM Urunler
SELECT KategoriRefID,SUM(UrunStokAdet) 
FROM Urunler
GROUP BY KategoriRefID






--�r�n ad� | �r�n fiyat� | stok adedi | Toplam tutar

SELECT UrunAdi,
UrunFiyati,UrunStokAdet,
(UrunFiyati*UrunStokAdet) as [Toplam Tutar]
FROM Urunler

--Toplam stoktaki �r�n bedelleri 
SELECT SUM(UrunFiyati*UrunStokAdet) as [Toplam Tutar]
FROM Urunler

----Toplam stoktaki �r�n bedelleri GRUPLAMA
SELECT KategoriRefID,SUM(UrunFiyati*UrunStokAdet) as [Toplam Tutar]
FROM Urunler
GROUP BY KategoriRefID


--�R�N F�YATINA G�RE GRUPLAMA

SELECT UrunFiyati,COUNT(UrunFiyati) FROM Urunler
GROUP BY UrunFiyati

--3 adet yeni �r�n ekle
--1 elektronik 1 mobilya 1 beyaz e�ya
INSERT INTO Urunler(UrunAdi,UrunAciklamasi,UrunFiyati,UrunStokAdet,KategoriRefID)
VALUES('TV','',25000,12,1)
INSERT INTO Urunler(UrunAdi,UrunAciklamasi,UrunFiyati,UrunStokAdet,KategoriRefID)
VALUES('Dolap','',3000,25,3)
INSERT INTO Urunler(UrunAdi,UrunAciklamasi,UrunFiyati,UrunStokAdet,KategoriRefID)
VALUES('Kurutma Mak.','',12500,12,2)

UPDATE Urunler SET UrunStokAdet=100, 
UrunAdi='TestUrun'
WHERE UrunFiyati BETWEEN 20000 and 30000