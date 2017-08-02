-- Aula 03 - PL SQL
set serveroutput on; -- Ativa o console output para verificar a saida da procedure

DECLARE 
mensagem VARCHAR2(100):='OLA MUNDO';
BEGIN
DBMS_OUTPUT.PUT_LINE(mensagem);
END;

--- Outro Exemplo
DECLARE
valor1 NUMBER(1):=5;
valor2 NUMBER(1):=5;
resultado NUMBER(2);
BEGIN
resultado:=(valor1 + valor2);
DBMS_OUTPUT.PUT_LINE(resultado);
END;

DECLARE
nome varchar2(50):='Carlos Augusto Maraslian';
concatena VARCHAR2(10);
BEGIN
concatena:=SUBSTR(nome, 0, INSTR(nome,' ')-1);
DBMS_OUTPUT.PUT_LINE(concatena);
END;



DECLARE
v_data date;
v_mes varchar2(20);
BEGIN
v_data := TO_DATE('11/05/80','dd/mm/YYYY');
v_mes  := TO_CHAR(v_data,'MONTH');
DBMS_OUTPUT.PUT_LINE(v_mes);
END;


