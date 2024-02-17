--DML (DATA MANUPILATION LANGUAGE)
--SELECT SEÇMEK
--INSERT EKLEME
--UPDATE GÜNCELLEME
--DELETE SÝLME

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

--Puaný 50 den büyük erkek müsteriler
SELECT * FROM Musteriler
WHERE puan>=50  AND cinsiyet='ERKEK'

--Bursa ve Ankarada yaþayan müþteriler
SELECT * FROM Musteriler
WHERE sehir='Bursa' or sehir='Adana'

SELECT * FROM Musteriler
WHERE sehir IN('Bursa','Adana')

SELECT * FROM Musteriler
WHERE puan>50 AND puan<100

SELECT * FROM Musteriler
WHERE puan BETWEEN 50 AND 100

--geliri 20000 ile 30000 arasý olan 
--ve puaný 50 den BÜYÜK olan erkek musteriler
--adý, soyadý, geliri,puan, cinsiyet

SELECT ad AD,soyad SOYAD,gelir MAAS,puan,cinsiyet 
FROM Musteriler
WHERE gelir BETWEEN 20000 AND 30000
AND puan>50 
AND cinsiyet='Erkek'


SELECT * FROM Musteriler
WHERE ad LIKE 'T%'

--SOYADI Z ile biten
--maaþý 10000 ile 50000 arasý olan
--Kadýn müþteriler

SELECT * FROM Musteriler
WHERE soyad LIKE '%Z' 
AND gelir BETWEEN 10000 AND 90000
AND cinsiyet = 'Kadin' 


--SIRALAMA ORDER BY
SELECT * FROM Musteriler
ORDER BY ad 

--desc descending büyükten küçüðe   z-a
--asc ascending  küçükten büyüðe  a-z

--INSERT

INSERT INTO Musteriler(musteriNo,ad,
soyad,dTarih,sehir,cinsiyet,
puan,meslek,gelir)
VALUES(4,'Osman','Yýldýz',
'01-01-2000','Kars','Erkek',
55,'Muhasebeci',17002)

--UPDATE
UPDATE Musteriler SET puan=99
WHERE musteriNo=1

UPDATE Musteriler SET sehir='Burdur', puan=55
WHERE sehir='Bursa'


--Maaþý 15000 30000 arasý olanlarý 40000 yapalým
UPDATE Musteriler SET gelir=40000
WHERE gelir BETWEEN 15000 AND 30000

--DELETE
DELETE FROM Musteriler
WHERE musteriNo=4

SELECT TOP 2 * FROM Musteriler

SELECT TOP 10 PERCENT * FROM Musteriler
ORDER BY gelir desc

--Hazýr fonksiyonlar Aggregate

SELECT SUM(gelir) FROM Musteriler
SELECT MAX(gelir) FROM Musteriler
SELECT MIN(gelir) FROM Musteriler
SELECT AVG(gelir) FROM Musteriler

SELECT AVG(gelir) FROM Musteriler 
WHERE  cinsiyet='Erkek'


--Geliri ortalama gelirden büyük olan müþteriler
SELECT * FROM Musteriler
WHERE gelir>(SELECT AVG(gelir) FROM Musteriler WHERE  cinsiyet='Erkek')

SELECT UPPER(ad) as ÝSÝM, 
UPPER(soyad) as SOYÝSÝM FROM Musteriler

SELECT cinsiyet,COUNT(cinsiyet) FROM Musteriler
GROUP BY cinsiyet


SELECT sehir,COUNT(sehir) as Sayý FROM Musteriler
GROUP BY sehir






