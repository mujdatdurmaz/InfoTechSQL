--DML (DATA MANUPILATION LANGUAGE)
--SELECT SE�MEK
--INSERT EKLEME
--UPDATE G�NCELLEME
--DELETE S�LME

USE InfoTechDB

SELECT * FROM Musteriler

SELECT ad,soyad,sehir FROM Musteriler

SELECT * FROM Musteriler
WHERE sehir='Bursa' AND cinsiyet='Erkek'

--Alias
SELECT ad AS ADI,
soyad AS SOYADI,
sehir AS [DOGUM YERI] 
FROM Musteriler

--Puan� 50 den b�y�k erkek m�steriler
SELECT * FROM Musteriler
WHERE puan>=50  AND cinsiyet='ERKEK'

--Bursa ve Ankarada ya�ayan m��teriler
SELECT * FROM Musteriler
WHERE sehir='Bursa' or sehir='Adana'

SELECT * FROM Musteriler
WHERE sehir IN('Bursa','Adana')

SELECT * FROM Musteriler
WHERE puan>50 AND puan<100

SELECT * FROM Musteriler
WHERE puan BETWEEN 50 AND 100

--geliri 20000 ile 30000 aras� olan 
--ve puan� 50 den B�Y�K olan erkek musteriler
--ad�, soyad�, geliri,puan, cinsiyet

SELECT ad AD,soyad SOYAD,gelir MAAS,puan,cinsiyet 
FROM Musteriler
WHERE gelir BETWEEN 20000 AND 30000
AND puan>50 
AND cinsiyet='Erkek'


SELECT * FROM Musteriler
WHERE ad LIKE 'T%'

--SOYADI Z ile biten
--maa�� 10000 ile 50000 aras� olan
--Kad�n m��teriler

SELECT * FROM Musteriler
WHERE soyad LIKE '%Z' 
AND gelir BETWEEN 10000 AND 90000
AND cinsiyet = 'Kadin' 


--SIRALAMA ORDER BY
SELECT * FROM Musteriler
ORDER BY ad 

--desc descending b�y�kten k����e   z-a
--asc ascending  k���kten b�y��e  a-z

--INSERT

INSERT INTO Musteriler(musteriNo,ad,
soyad,dTarih,sehir,cinsiyet,
puan,meslek,gelir)
VALUES(4,'Osman','Y�ld�z',
'01-01-2000','Kars','Erkek',
55,'Muhasebeci',17002)

--UPDATE
UPDATE Musteriler SET puan=99
WHERE musteriNo=1

UPDATE Musteriler SET sehir='Burdur', puan=55
WHERE sehir='Bursa'


--Maa�� 15000 30000 aras� olanlar� 40000 yapal�m
UPDATE Musteriler SET gelir=40000
WHERE gelir BETWEEN 15000 AND 30000

--DELETE
DELETE FROM Musteriler
WHERE musteriNo=4

SELECT TOP 2 * FROM Musteriler

SELECT TOP 10 PERCENT * FROM Musteriler
ORDER BY gelir desc

--Haz�r fonksiyonlar Aggregate

SELECT SUM(gelir) FROM Musteriler
SELECT MAX(gelir) FROM Musteriler
SELECT MIN(gelir) FROM Musteriler
SELECT AVG(gelir) FROM Musteriler

SELECT AVG(gelir) FROM Musteriler 
WHERE  cinsiyet='Erkek'


--Geliri ortalama gelirden b�y�k olan m��teriler
SELECT * FROM Musteriler
WHERE gelir>(SELECT AVG(gelir) FROM Musteriler WHERE  cinsiyet='Erkek')

SELECT UPPER(ad) as �S�M, 
UPPER(soyad) as SOY�S�M FROM Musteriler

SELECT cinsiyet,COUNT(cinsiyet) FROM Musteriler
GROUP BY cinsiyet


SELECT sehir,COUNT(sehir) as Say� FROM Musteriler
GROUP BY sehir






