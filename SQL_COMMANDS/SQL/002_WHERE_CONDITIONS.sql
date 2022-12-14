SELECT TABLE_NAME FROM TABS; 
--TABS TABLOSU ILGILI SCHEMADAKI TABLOLARI GOSTERIR


SELECT * FROM EMP WHERE NOT (COMM IS NULL);
--EMP TABLOSUNDAKI KOMISYON KOLUNUNDAKI DEGERLERIN NULL OLMAYANLARINI GETIRIR


SELECT * FROM EMP;
--EMP TABLOSUNU CEKER GETIRIR


SELECT * FROM EMP WHERE NOT (COMM BETWEEN 300 AND 600);
--EMP TABLOSUNDAKI KOMISYON KOLONUNUN 300 ILA 600 ARASINDA OLMAYAN KAYITLARI GETIRIR


SELECT * FROM EMP WHERE (COMM BETWEEN 300 AND 600);
--EMP TABLOSUNDAKI KOMISYON KOLONUNUN 300 ILA 600 ARASINDA OLAN KAYITLARI GETIRIR


SELECT * FROM EMP WHERE (COMM BETWEEN 300 AND 600);
--EMP TABLOSUNDAKI KOMISYON KOLONUNUN 300 ILA 600 ARASINDA OLAN KAYITLARI GETIRIR


--AND OPERATOR
SELECT * FROM EMP WHERE JOB = 'SALESMAN' AND SAL > 1000;
--MESLEGI SALESMAN(SATICI) VE MAASI 1000'DEN BUYUK OLANLARI GETIRIR


--OR OPERATOR
SELECT * FROM EMP WHERE JOB = 'SALESMAN' OR SAL > 1000;
--MESLEGI SALESMAN(SATICI) VEYA MAASI 1000'DEN BUYUK OLANLARI GETIRIR


--IN -ICINDE GECENLER
SELECT * FROM EMP WHERE DEPTNO IN (20,30);
--DEPTNO'SU 20 VEYA 30 OLANLAR. YADA 20 VE 30 OLANLARI GETIRIR ICINDE GECENLERI


--NOT IN -ICINDE GECMEYENLER
SELECT * FROM EMP WHERE DEPTNO NOT IN (20,30);
--DEPTNO'SU 20 VEYA 30 OLMAYANLAR. YADA 20 VE 30 OLMAYANLAR GETIRIR ICINDE GECMEYENLERI


--NULL CONDITIOS
DESC EMP;
--EMP TABLOSUNUN YAPISINI VERIR. ACIKLAMASINI.


SELECT * FROM EMP;


--KOMISYON KOLONU NULL OLANLAR
SELECT * FROM EMP WHERE COMM IS NULL;


--KOMISYON KOLONU NULL OLMAYANLAR
SELECT * FROM EMP WHERE COMM IS NOT NULL;


--EXISTS VE JOIN'LEME
SELECT * FROM DEPT D WHERE EXISTS (SELECT * FROM EMP E WHERE E.DEPTNO = D.DEPTNO);
--ONCE ALT SORGU CALISIR.
--ALT SORGUDA E'NIN DEPTNO'SU ILE D'NIN DEPTNO'SUNUN UYUSANLARI VAR MI KONTROL EDER VARSA DEPT TABLOSUNDAKI UYUSANLARI GETIRIR


SELECT * FROM EMP WHERE DEPTNO IN(10,20,30);
SELECT * FROM DEPT WHERE DEPTNO IN(10,20,30);
--BURASI DESTEKLEYICI NITELIKTE


--EXISTS VE JOIN'LEME
SELECT * FROM DEPT D WHERE NOT EXISTS (SELECT * FROM EMP E WHERE E.DEPTNO = D.DEPTNO);
--ONCE ALT SORGU CALISIR.
--ALT SORGUDA E'NIN DEPTNO'SU ILE D'NIN DEPTNO'SUNUN UYUSMAYANLAR VAR MI KONTROL EDER VARSA DEPT TABLOSUNDAKI UYUSMAYANLARI GETIRIR

--LIKE KOMUTU
SELECT * FROM EMP WHERE ENAME LIKE 'J%';
--ENAME KOLONUNDAKI BASINDA J HARFI SONU OENMLI DEGIL GETIRIR

SELECT * FROM EMP WHERE ENAME LIKE '%S';
--ENAME KOLONU ICIN S ILE BITENLERI GETIRIR

SELECT * FROM EMP WHERE ENAME LIKE 'J%S';
--ENAME KOLONU ICIN J ILE BASLAYAN VE S ILE BITENLERI GETIRIR

SELECT * FROM EMP WHERE ENAME LIKE '%L%';
--ENAME KOLONU ICIN ORTASINDA L GECEN

SELECT * FROM EMP WHERE ENAME LIKE '_L%';
--NAME KOLONU ICIN ILK KARAKTER ONEMLI DEGIL. IKINCI L OLMAK ZORUNDA. SONU ONEMLI DEGIL

SELECT * FROM EMP WHERE ENAME LIKE '%K_';
--NAME KOLONU ICIN SON KARAKTER ONEMLI DEGIL. SONDAN IKINCI K OLMAK ZORUNDA. BASI ONEMLI DEGIL































--