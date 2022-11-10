--DCL DATA CONTROL LANGUAGES
--VERI KONTROL IFADELERI YETKILER ICIN KULLANILIR.
--DCL IFADELER GRANT - REVOKE
--GRANT KOMUTU KULLANICILARA VE ROLLERE YETKI VERMEK ICIN KULLANILIR.!
--REVOKE --VERILAN YETKILERI GERI ALMAK ICIN KULLANILIR.!
--IKI TURLU YETKI VARDIR
--NESNE YETKILERI
--TABLE, VIEW, FUNCTION, PROCEDURE, TRIGGER, SYNONIM, PACKAGE GIBI NESNELERE VERILEN YETKILERDIR.!
--NESNELER UZERINDEKI YETKILER OWNER(SAHIP)'LERI UZERINDEN VERILIR.!
--NESNELER UZERINDEKI YETKILER TABLODA GOSTERILMISTIR.
--ALTER - DELETE - INDEX(TABLO UZERINDE INDEX OLUSTURMA YETKISI)
--INSERT - REFERENCES(TABLOYA REFERANS VERME YETKISI. BU YETKI ROLLERE VERILMEZ.!) - SELECT - UPDATE.


--SYSTEM YETKILERI
--DB'YE BAGLANMA, NESNE OLUSTURMA, KAYNAK KULLANMA CS GIBI YETKILERDIR.
--SISTEM YETKILERI DBA ROLUNE SAHIP KULLANICILAR TARAFINDAN VERILIR.
--CREATE - CREATE TABLE - CREATE USER.


--ORNEKLER:
SHOW USER; 
--HANGI KULLANICIDAYIZ?

--KULLANICI_OLUSTURMA.
CREATE USER AHMET IDENTIFIED BY AHMET;
CREATE USER AYSE IDENTIFIED BY AYSE;

--OLUSAN KULLANICILARA YETKI VERME.
GRANT CONNECT, RESOURCE TO AYSE, AHMET;
GRANT CONNECT, RESOURCE TO PUBLIC; --PUBLIC BIR ROLDUR. SYSTEMDEKI TUM KULLANICILARA YETKI VERMIS OLDUK.!

--DEVRETMELI YETKI VERME
GRANT SELECT, INSERT, UPDATE TO AYSE, AHMET WITH GRANT OPTION;
--BOYLELIKLE AHMET VE AYSE UZERINDEKI YETKILERI BIR BASKASINA VEREBILIYOR.

GRANT UNLIMITED TABLESPACE TO AHMET, AYSE;


--REVOKE
REVOKE INSERT EMP2 FROM AHMET; --AHMET'DEN YETKIYI GERI AL.
REVOKE RESOURCE EMP2 FROM AYSE;




















--__