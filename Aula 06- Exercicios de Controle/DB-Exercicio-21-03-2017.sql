-- EXERCICIOS 21-03-2017
SET SERVEROUTPUT ON;

--1) Desenvolver um bloco PL/SQL que exiba o nome e a idade armazenados em variáveis.
DECLARE
  nome varchar2(50);
  idade number(2);
BEGIN
  nome := 'Joao';
  idade := 35;
  DBMS_OUTPUT.PUT_LINE('Meu nome é ' || nome || ',tenho '  || idade || ' anos.');
END;

--2) Desenvolver um script PL/SQL que receba em variáveis o nome, idade e email. Para todas as entradas,
--   validar os casos abaixo:
--  - Caso a idade seja menor que 18 anos, retornar somente a mensagem "Idade não permitida.
--  - O endereço de e-mail obrigatóriamente deve ter o caractere "@".
--  - O nome deve ter no mínimo 2 nomes.
--  - Caso todas as condições acima estejam validadas, exibir todos os dados recebidos nas variáveis.
DECLARE
  v_nome varchar2(50);
  v_idade number(2);
  v_email varchar2(50);
BEGIN
  v_nome :='Carlos Maraslian';
  v_idade :=37;
  v_email :='cmaraslian@hotmail.com';
  
  if v_idade < 18 then
    DBMS_OUTPUT.PUT_LINE('Idade nao permitida');
  elsif 
    instr(v_email,'@')=0 then
    DBMS_OUTPUT.PUT_LINE('Falta o @');
  elsif 
    instr(v_nome,' ')=0 then
    DBMS_OUTPUT.PUT_LINE('O nome não é composto!');
  else
    DBMS_OUTPUT.PUT_LINE('Nome:' || v_nome || ' Idade:' || v_idade || ' Email:' || v_email);
  end if;
END;

-- 3) Desenvolver um bloco PL/SQL que receba 5 valores e armazene a média dos 5 valores. Armazenar somente números inteiros.
DECLARE
 vl_n1 number;
 vl_n2 number;
 vl_n3 number;
 vl_n4 number;
 vl_n5 number;
 vl_media number;
BEGIN
  vl_n1 := 13;
  vl_n2 := 10;
  vl_n3 := 10;
  vl_n4 := 10;
  vl_n5 := 10; --O trunc retira os decimais
  vl_media := trunc((vl_n1 + vl_n2 + vl_n3 + vl_n4 +vl_n5 )/5);
  DBMS_OUTPUT.PUT_LINE(vl_media);
END;

-- 4) Desenvolver um Bloco PL/SQL que receba um número em uma variável e exiba o resto
-- da divisão dos próximos 100 números. Imprimir se é Par ou ímpar.
--Com loop
DECLARE
vl_n1 number;
vl_ct number;
BEGIN
vl_n1 := 200;
vl_ct := 0;
  loop
    vl_ct := vl_ct + 1;
    vl_n1 := vl_n1 + 1;
    
    if MOD(vl_n1, 2) = 0 then
      DBMS_OUTPUT.PUT_LINE(vl_n1 || ' é Par');
    else 
      DBMS_OUTPUT.PUT_LINE(vl_n1 || ' é Impar');
    end if;
    exit when vl_ct = 100;
  end loop;
END ;

--com for
DECLARE
vl_inicio number :=100;

BEGIN
  for x in vl_inicio..vl_inicio+100 loop
   if MOD(vl_inicio, 2) = 0 then
      DBMS_OUTPUT.PUT_LINE(vl_inicio || ' é Par');
    else 
      DBMS_OUTPUT.PUT_LINE(vl_inicio || ' é Impar');
    end if;
    vl_inicio := vl_inicio+1;
  end loop;
END;

--5) Desenvolver um Bloco PL/SQL que receba um nome, caso o nome exceda 30 caracteres exiba somente o sobrenome.
DECLARE
vl_nome VARCHAR(50);
BEGIN
  vl_nome :='AAAAA BBBBB CCCCCC DDDDDD FFFFFF';
  if LENGTH(vl_nome) > 30 then
    DBMS_OUTPUT.PUT_LINE(SUBSTR(vl_nome,INSTR(vl_nome,' ')));
  else 
    DBMS_OUTPUT.PUT_LINE(vl_nome);
  end if;
END; -- O exercicio pede somente o sobrenome, a solução apresentada esta mostrando os nomes do meio tambem

--6) Desenvolver um Bloco PL/SQL que exiba a seguinte mensagem de texto:
--   'Hoje' || <sysdate> || ', estamos no seguinte dia da semana:' || <dia da semana>
DECLARE

BEGIN
  DBMS_OUTPUT.PUT_LINE('Hoje ' || sysdate || ' ,estamos no seguinte dia da semana :' || to_char(sysdate,'day'));

END;

--7) Desenvolva um bloco anônimo que exiba durante 365 dias (1 ano)
--   apenas as datas que caem no sábado e domingo, após a entrada de uma data.
--   Após a solicitação da entrada do campo data, exiba sequencialmente a data e
--   o dia da semana que representa essa data. Utilize o comando loop para realizar essa tarefa.
--   Utilize o pacote DBMS_OUTPUT para exibir esses valores. Exiba os valores em ordem de data

DECLARE 
  vl_data DATE;
  vl_cont INTEGER;
  BEGIN
  vl_data :=('01/01/2000');
  vl_cont :=0;
  loop
    --DBMS_OUTPUT.PUT_LINE(vl_cont);
    --DBMS_OUTPUT.PUT_LINE(to_char(vl_data,'day'));
    --vl_dia := to_char(vl_data,'day');    
    --DBMS_OUTPUT.PUT_LINE(vl_dia);
   --if to_char(vl_data,'fmDAY')= 'SÁBADO' then (melhor forma)
    if to_char(vl_data,'d')=7 then
      DBMS_OUTPUT.PUT_LINE(to_char(vl_data,'DD-mm-YYYY') || ' cai no sabado');
    --elsif to_char(vl_data,'fmDAY')='DOMINGO' then
    elsif to_char(vl_data,'d')=1 then
      DBMS_OUTPUT.PUT_LINE(to_char(vl_data,'DD-mm-YYYY') || ' cai no domingo');
    end if;
    vl_cont := vl_cont + 1;
    vl_data := vl_data + 1;
    exit when vl_cont = 365;
  end loop;
END;



SELECT MOD(19, 2) from dual
select SUBSTR('CARLOS AUGUSTO',3,4) from dual;
select INSTR('CORPORATE FLOOR',' ', -3, 2) from dual;
select SUBSTR('CARLOS AUGUSTO',INSTR('CARLOS AUGUSTO',' ')) from dual;
select LENGTH('CANDIDE') from dual
select  INSTR 'cmaraslian@hotmial.com' from dual
select sysdate from dual;
select to_CHAR(sysdate+2,'fmDAY') from dual;
select SUBSTR('AAAAA BBBBB CCCCCC DDDDDD FFFFFF',INSTR('AAAAA BBBBB CCCCCC DDDDDD FFFFFF',' ')) from dual
select length ('AAAAA BBBBB CCCCCC DDDDDD FFFFFF') from dual

