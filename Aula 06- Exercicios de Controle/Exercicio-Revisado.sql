set SERVEROUTPUT ON;

--Ex 1- Desenvolver um bloco PL/SQL que exiba o nome e a idade armazenados em variáveis.

DECLARE
  vl_nome VARCHAR2(50);
  vl_idade number(2);
BEGIN
  vl_nome :='Carlos';
  vl_idade :=37;
  DBMS_OUTPUT.PUT_LINE('Nome:' || vl_nome || ', idade:' || vl_idade);
END;

/* Ex2 -  Desenvolver um script PL/SQL que receba em variáveis o nome, idade e email. Para todas as entradas,
   validar os casos abaixo:
  - Caso a idade seja menor que 18 anos, retornar somente a mensagem "Idade não permitida.
  - O endereço de e-mail obrigatóriamente deve ter o caractere "@".
  - O nome deve ter no mínimo 2 nomes.
  - Caso todas as condições acima estejam validadas, exibir todos os dados recebidos nas variáveis. */

DECLARE
vl_nome VARCHAR2(100);
vl_idade NUMBER(2);
vl_email VARCHAR2(50);
BEGIN
vl_nome := 'Carlos Augusto Maraslian';
vl_idade := 37;
vl_email := 'cmaraslian@hotmail.com';

if vl_idade < 18 then
 DBMS_OUTPUT.PUT_LINE('Idade não permitida');
elsif INSTR(vl_email,'@')=0 then
 DBMS_OUTPUT.PUT_LINE('endereço de e-mail obrigatóriamente deve ter o caractere "@"');
elsif INSTR(vl_nome,' ')=0 then
 DBMS_OUTPUT.PUT_LINE('O nome deve ter no mínimo 2 nomes');
else
  DBMS_OUTPUT.PUT_LINE('Nome:' || vl_nome || ', idade:' || vl_idade || ', email:' || vl_email);
end if;
END;

/* 3) Desenvolver um bloco PL/SQL que receba 5 valores e armazene a média dos 5 valores. Armazenar somente números inteiros. */
DECLARE
  vl_num1 number;
  vl_num2 number;
  vl_num3 number;
  vl_num4 number;
  vl_num5 number;
  vl_res number;
BEGIN
  vl_num1 := 10;
  vl_num2 := 14;
  vl_num3 := 17;
  vl_num4 := 30;
  vl_num5 := 13;
  vl_res :=(vl_num1 + vl_num2 + vl_num3 + vl_num4 + vl_num5)/5;
  DBMS_OUTPUT.PUT_line(trunc(vl_res));
END;
/* 4) Desenvolver um Bloco PL/SQL que receba um número em uma variável e exiba o resto da divisão dos próximos 100 números.
      Imprimir se é Par ou ímpar. */
DECLARE
  vl_entrada number:=0;
BEGIN
  FOR i IN vl_entrada..vl_entrada+100 LOOP
        
        If mod(vl_entrada,2)= 0 THEN
              DBMS_OUTPUT.PUT_LINE(vl_entrada || ' É par');
        ELSE 
           DBMS_OUTPUT.PUT_LINE(vl_entrada || ' É impar');
            END IF;
        vl_entrada := vl_entrada + 1;
      END LOOP;
END;    

/* 5) Desenvolver um Bloco PL/SQL que receba um nome, caso o nome exceda 30 caracteres exiba somente o sobrenome.*/
DECLARE
  vl_nome varchar(50):='AAAA BBBB CCCC DDDD';
BEGIN
  IF LENGTH(vl_nome) > 30 then
    DBMS_OUTPUT.PUT_LINE(SUBSTR(vl_nome, INSTR(vl_nome,' ',-1)+1));  
  END if;
END;

/*6) Desenvolver um Bloco PL/SQL que exiba a seguinte mensagem de texto:
'Hoje' || <sysdate> || ', estamos no seguinte dia da semana:' || <dia da semana>*/

BEGIN
  IF TO_CHAR(SYSDATE,'d') = 1 THEN
    DBMS_OUTPUT.PUT_LINE('Hoje é Domingo');
  ELSIF TO_CHAR(SYSDATE,'d') = 2 THEN
    DBMS_OUTPUT.PUT_LINE('Hoje é Segunda-Feira');
  ELSIF TO_CHAR(SYSDATE,'d') = 3 THEN
    DBMS_OUTPUT.PUT_LINE('Hoje é Terca-Feira');
  ELSIF TO_CHAR(SYSDATE,'d') = 4 THEN
    DBMS_OUTPUT.PUT_LINE('Hoje é Quarta-Feira');
  ELSIF TO_CHAR(SYSDATE,'d') = 5 THEN
    DBMS_OUTPUT.PUT_LINE('Hoje é Quinta-Feira');
  ELSIF TO_CHAR(SYSDATE,'d') = 6 THEN
    DBMS_OUTPUT.PUT_LINE('Hoje é Sexta-Feira');
  ELSIF TO_CHAR(SYSDATE,'d') = 7 THEN
    DBMS_OUTPUT.PUT_LINE('Hoje é Sabado');  
  END IF;
END;

/*7) Desenvolva um bloco anônimo que exiba durante 365 dias (1 ano) apenas as datas que caem no sábado e domingo,
após a entrada de uma data. Após a solicitação da entrada do campo data, exiba sequencialmente a data e o dia da
semana que representa essa data. Utilize o comando loop para realizar essa tarefa.
Utilize o pacote DBMS_OUTPUT para exibir esses valores. Exiba os valores em ordem de data */

DECLARE
  vl_data date;
BEGIN
  vl_data :=TO_CHAR(SYSDATE,'dd/mm/yyyy');
 FOR i IN 1..365 LOOP
     IF to_char(vl_data+i,'d')= 7 or to_char(vl_data+i,'d')= 1 then
           DBMS_OUTPUT.PUT_LINE(TO_CHAR(vl_data+i,'dd/mm/yyyy') || ' é ' || TO_CHAR(vl_data+i,'day') );
         END IF; 
     END LOOP;
END;








