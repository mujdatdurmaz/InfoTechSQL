SELECT *FROM Personel



INSERT INTO Personel(adi,
soyadi,
gorevi,
yoneticisi,
girisTarihi,
ucret)
VALUES('Ali','Veli',
'Yaz�l�mc�',1,'01-01-2000',56000)

INSERT INTO Personel(adi,
soyadi,
gorevi,
yoneticisi,
girisTarihi,
ucret)
VALUES('Veli','Can',
'Analist',2,'01-01-2000',50000)

INSERT INTO Personel(adi,
soyadi,
gorevi,
yoneticisi,
girisTarihi,
ucret)
VALUES('Ay�e','Y�ld�z',
'Sql Uzman�',1,'01-01-2000',36500)





SELECT *FROM Personel
WHERE ucret>(SELECT AVG(ucret) FROM Personel)


--G�R�� TAR�H� 2000 DEN �NCE OLUP 
--MAA�I 25000 DEN B�Y�K OLANLAR


SELECT *FROM Personel
WHERE girisTarihi<'01-01-2000' AND ucret>25000


UPDATE Personel SET girisTarihi='05-06-1998'
WHERE personelNo=1

DELETE FROM Personel


TRUNCATE TABLE Personel

DELETE FROM Personel
where not ucret<45000 

