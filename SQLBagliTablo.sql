--Baðlý tablo örnekleri

SELECT * FROM Urunler
SELECT * FROM Kategoriler

--SADECE ELEKTRONÝK ÜRÜNLER
SELECT * FROM Urunler
WHERE KategoriRefID=(SELECT KategoriID FROM Kategoriler
WHERE KategoriAdi='Mobilya') OR 
KategoriRefID=(SELECT KategoriID FROM Kategoriler
WHERE KategoriAdi='Beyaz Eþya')

--ortalama ürün fiyatýndan büyük olan ürünler

SELECT * FROM Urunler
WHERE UrunFiyati>(SELECT AVG(UrunFiyati) FROM Urunler)

--ortalama ürün fiyatýndan büyük olan 
--Elektronik ürünler

SELECT * FROM Urunler
WHERE UrunFiyati>(SELECT AVG(UrunFiyati) FROM Urunler)
AND
KategoriRefID=(SELECT KategoriID FROM Kategoriler
WHERE KategoriAdi='Elektronik')


--En pahalý ürünüm hangisi ?
SELECT TOP 1 * FROM Urunler
ORDER BY UrunFiyati desc

--En ucuz ürünüm hangisi ?
SELECT TOP 1 * FROM Urunler
ORDER BY UrunFiyati 

--ürünlerin toplam stok adedi nedir ?


SELECT * FROM Urunler
SELECT KategoriRefID,SUM(UrunStokAdet) 
FROM Urunler
GROUP BY KategoriRefID






--Ürün adý | Ürün fiyatý | stok adedi | Toplam tutar

SELECT UrunAdi,
UrunFiyati,UrunStokAdet,
(UrunFiyati*UrunStokAdet) as [Toplam Tutar]
FROM Urunler

--Toplam stoktaki ürün bedelleri 
SELECT SUM(UrunFiyati*UrunStokAdet) as [Toplam Tutar]
FROM Urunler

----Toplam stoktaki ürün bedelleri GRUPLAMA
SELECT KategoriRefID,SUM(UrunFiyati*UrunStokAdet) as [Toplam Tutar]
FROM Urunler
GROUP BY KategoriRefID


--ÜRÜN FÝYATINA GÖRE GRUPLAMA

SELECT UrunFiyati,COUNT(UrunFiyati) FROM Urunler
GROUP BY UrunFiyati

--3 adet yeni ürün ekle
--1 elektronik 1 mobilya 1 beyaz eþya
INSERT INTO Urunler(UrunAdi,UrunAciklamasi,UrunFiyati,UrunStokAdet,KategoriRefID)
VALUES('TV','',25000,12,1)
INSERT INTO Urunler(UrunAdi,UrunAciklamasi,UrunFiyati,UrunStokAdet,KategoriRefID)
VALUES('Dolap','',3000,25,3)
INSERT INTO Urunler(UrunAdi,UrunAciklamasi,UrunFiyati,UrunStokAdet,KategoriRefID)
VALUES('Kurutma Mak.','',12500,12,2)

UPDATE Urunler SET UrunStokAdet=100, 
UrunAdi='TestUrun'
WHERE UrunFiyati BETWEEN 20000 and 30000