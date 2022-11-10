--GROUP BY -- DEPTNO'YA GORE AYRI GRUPLAR OLUSTURUP ONA GORE AYRI AYRI MUAMELE ETME OLAYIDIR.!
SELECT
DEPTNO DEPARTMAN_NUMARASI,
AVG(SAL) ORTALAMA,
MAX(SAL) AZAMI_EN_BUYUK_MAXIMUM,
MIN(SAL) ASGARI_EN_KUCUK_MINIMUM
FROM EMP
GROUP BY DEPTNO;
SELECT * FROM EMP;
SELECT * FROM ILLER;
DESC ILLER;
SELECT * FROM ILCELER;
DESC ILCELER;

--HER IL'IN KAC ILCESI VAR ONU GOSTERIR
SELECT IL_NO, COUNT(*) ILCELER
FROM ILCELER
GROUP BY IL_NO;


--EQUI_JOINLERLE GROUP BY KULLANIMI VE HAVING
SELECT A.IL_NO,
B.ISIM,
COUNT(*) ILGILI_GRUBUN_TOPLAM_SAYISI
FROM ILCELER A, ILLER B
WHERE A.IL_NO = B.IL_NO
GROUP BY A.IL_NO, B.ISIM
HAVING COUNT(*) >= 5
ORDER BY 3 DESC, 2, 1 ASC;