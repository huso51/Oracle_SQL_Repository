--DML KOMUTLARININ PERFORMANSI(SQL TUNING)
EXPLAIN PLAN FOR SELECT * FROM EMP;
EXPLAIN PLAN FOR SELECT * FROM EMP WHERE EMPNO > 10; --COST (MALIYET 3'TU 1'E DUSTU.!)
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY());