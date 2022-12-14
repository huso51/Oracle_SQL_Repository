--DDL DATA DEFINITION LANGUAGE
--CREATE: NESNE OLUSTURMAK ICIN KULLANILIR
--ALTER: NESNE DEGISTIRMEK ICIN KULLANILIR
--DROP: NESNE SILMKE ICIN KULLANILIR
--REPLACE: TABLO ADI DEGISTIRMEK ICIN KULLANILIR
--TRUNCATE: COMMIT GEREKTIRMEDEN TAMLODAKI TUM KAYITLARI SILMEK ICIN KULLANILIR. TABLOYU VE ID'LERI SIFIRLAR. 0 KM HALE GETIRIR.!

--CREATE
CREATE TABLE TAX(
EMPNO NUMBER(5),
TAXDATE DATE,
TAXRATE NUMBER(4,2),
TAX NUMBER(15,2)
);
--OLUSTURDUGUMUZ TABLOYA KAYITLAR GIRDIK.!
INSERT INTO TAX(EMPNO, TAXDATE, TAXRATE, TAX)
SELECT EMPNO, SYSDATE,
DECODE(SIGN(3000 - SAL), 1, 0.05, 0.07),
DECODE(SIGN(3000 - SAL), 1, SAL * 0.05, SAL * 0.07)
FROM EMP;


--
SELECT TAX.EMPNO, ENAME, TAXDATE, TAXRATE, EMP.SAL EMPSAL, TAX FROM TAX, EMP
WHERE TAX.EMPNO = EMP.EMPNO;

--DROP ETME
DROP TABLE TAX;

CREATE TABLE TAX AS
SELECT EMPNO, SYSDATE TAXDATE,
DECODE(SIGN(3000 - SAL), 1, 0.05, 0.07) TAXRATE,
DECODE(SIGN(3000 - SAL), 1, SAL * 0.05, SAL * 0.07) TAX
FROM EMP2;


--ALTER KOMUTU
--TABLOLARDA YAPISAL DEGISIKLIKLER YAPMAK ICIN KULLANILAN KOMUTTUR.!
--TABLOYA YENI KOLON EKLEMEK ADD ILE YAPILIR
--TABLODAKI KOLONLARIN GENISLIGINI VE VERI TIPLERINI DEGISTIRMEK ICIN MODIFY KULLANILIR
DESC EMP;
ALTER TABLE EMP ADD(ADDR VARCHAR2(50), TEL NUMBER(10), EMAIL VARCHAR2(30));
ALTER TABLE EMP MODIFY ADDR VARCHAR2(25); 
--EGER KOLONUN VERI TIPINI DEGISTIRMEK ISTIYORSAK KOLUNUN BOS OLMASI GEREKIR.!
DESC EMP;
ALTER TABLE EMP MODIFY SAL VARCHAR2(4); --HATA KOLUNUN BOS OLMASI GEREKIR.!
ALTER TABLE EMP DROP COLUMN EMAIL; --DROP ET EMAIL KOLONUNU SILER ATAR.!

--CASCADE
ALTER TABLE DEPT DROP COLUMN DEPTNO CASCADE CONSTRAINTS; --PARENT CHILD ILISKISI OLAN VERILERI SILER. ILISKILI VERILERIN TAMAMINI SILER ATAR.!



--RENAME NESNE ISIMLERINI DEGISTIRMEK ICIN KULLANILIR.!
--BIR NESNE ISMI DEGISTIRILDIGINDE ESKI NESNE UZERINDE TANIMLI OLAN INDEX'LER,
--BUTUNLUK KISITLAMALARI, YETKILER OTOMATIK OLARAK YENI NESNEYE GECER
--ESKI NESNE UZERINDE TANIMLI OLAN SYNONIMLER, VIEWLER, PROCUDURELER, FONKSIYONLAR HATAYA DUSER.!
RENAME EMP2 TO EMPLOYEE2;

--DROP
--VERITABANINDAKI NESNELERI SILMEK ICIN DROP KOMUTU KULLANILIR.
--BIR NESNE SILINDIGINDE SILINEN NESNE UZERINDE TANIMLI OLAN SYNONIMLER, VIEWLER, PROCEDURELER, FUNCTIONLAR, TRIGGERLAR HATAYA DUSER.1


--TRUNCATE
--TRUNCATE BIR TABLODAKI KAYITLARI KALICI OLARAK SILME VE TABLOYU SIFIRLAMA ICIN KULLANILIR.!
--ASLINDA TRUNCATE SU DEMEKTIR = DELETE FROM ... + COMMIT;
--TRUNCATE ROLLBACK ILE GERI ALINAMAZ.!
--TRUNCATE ILE SILINEN TABLODA TRIGGER VARSA TRIGGER CALISMAZ.!
DESC EMP;
ALTER TABLE EMP RENAME COLUMN TEL TO TELEFON;

RENAME EMP2 TO EMP3;
DESC EMP2;

SHOW ERRORS;

CREATE TABLE EMP2 AS SELECT * FROM EMP;
SELECT * FROM EMP2;
TRUNCATE TABLE EMP2;

--DROP EDILEN BIR NESNE GERI ALINAMAZ.!
--SQL OGRENIYORUZ KONUMUZ ADMINISTRATORLUK DEGIL
--ADMIN EGITIMINDE COP KUTUSUNDAN GERI GETIRMEYI OGRENECEGIZ.!
--ORNEK: 
FLASHBACK TABLE EMP2 BEFORE DROP;








--