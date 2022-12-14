--HIERARCHICAL SORGULAR ORNEK OLARAK YONETICI VE YONETICILERIN ALTINDAKI CALISANLARIN HIYERARSIK OLARAK
--CIKTISINI EKRANA BASAN SORGULARDIR.
--SADECE YONETICI VE CALISAN OLARAK BAZ ALINMAMALI. AILE ORNEGIDE VERILEBILIR.
SELECT
EMPNO,
ENAME,
MGR,
LEVEL,
SYS_CONNECT_BY_PATH(ENAME, '/')
FROM EMP
START WITH MGR IS NULL
CONNECT BY PRIOR EMPNO = MGR;

--INSERT
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(101,'HUSEYIN', 'JSV', NULL, '07/11/2022', 5000, 0, 10);

COMMIT;

SELECT * FROM EMP MINUS SELECT * FROM EMP2;


SELECT table_name, column_name, data_type, data_length
FROM USER_TAB_COLUMNS
WHERE table_name = 'EMP';


--IKI TABLO ARASINDAKI FARKI SORGULAYIP FARKLI BIR TABLOYA INSERT ETME
INSERT INTO EMP3
SELECT * FROM EMP MINUS SELECT * FROM EMP2;

--UPDATE KAYDI GUNCELLEME
--ENAME KOLONU KING OLMAYANLARI GUNCELLER. ZAM YAPAR. %1'LIK ZAM.
UPDATE EMP SET SAL = SAL * 0.1 WHERE UPPER(ENAME)<>'KING';

--
SELECT * FROM EMP2 WHERE DEPTNO IS NULL;
SELECT * FROM EMP2 ORDER BY MGR;
UPDATE EMP2 SET DEPTNO = NULL WHERE EMPNO IN(7654, 7521);

UPDATE EMP2 A SET DEPTNO = (SELECT DEPTNO FROM EMP2 B WHERE A.MGR = B.EMPNO)
WHERE A.DEPTNO IS NULL;


--DELETE KULLANIMI
--1.
DELETE FROM EMP2 WHERE COMM IS NULL;
--2.
DELETE FROM EMP2 WHERE NVL(COMM,0)=0;
COMMIT;



