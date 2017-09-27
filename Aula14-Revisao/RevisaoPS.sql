SET SERVEROUTPUT ON;

--Exemplo Cursor
declare
 cursor c_depto is
 select nm_depto
  from loc_depto;
  
  v_depto c_depto%rowtype;
  
begin
  open c_depto;
  loop
    fetch c_depto into v_depto; 
    exit when c_depto%notfound;
    --Aqui vem os inserts, updates e delets dependendo do algoritmo
    DBMS_OUTPUT.PUT_LINE(v_depto.nm_depto);
  end loop;
  close c_depto;
end;

--Exemplo Function com cursor implicito
create or replace function fnc_nome_func(p_cd_func loc_funcionario.cd_func%type) return varchar2 is
v_nome loc_funcionario.nm_func%type;
begin
  select nm_func into v_nome
  from loc_funcionario
  where cd_func = p_cd_func;
  return  v_nome;
exception
  when no_data_found then
  return 'Funcionario nao encontrado';
  when too_many_rows then
    return 'Este codigo de funcionario retorna mais do que uma ocorrencia';
  when others then
    raise_application_error(-2001,'Erro:' || sqlerrm);
end;

select fnc_nome_func(1) from dual;

--Exemplo procedure
create or replace procedure prc_dados_depto is
 cursor c_depto is
 select nm_depto
  from loc_depto;
  
  v_depto c_depto%rowtype;
  
begin
  open c_depto;
  loop
    fetch c_depto into v_depto; 
    exit when c_depto%notfound;
    --Aqui vem os inserts, updates e delets dependendo do algoritmo
    DBMS_OUTPUT.PUT_LINE(v_depto.nm_depto);
  end loop;
  close c_depto;
end;

--Chama a procedure
begin
  prc_dados_depto;
end; 

--Cria uma package ** PRECISA ARRUMAR
create or replace package pkg_rev_2tdsr is
  function fnc_nome_func(p_cd_func loc_funcionario.cd_func%type) return varchar2 ;
end;

create or replace package body pkg_rev_2tdsr is
  function fnc_nome_func(p_cd_func loc_funcionario.cd_func%type) return varchar2 is
v_nome loc_funcionario.nm_func%type;
begin
  select nm_func into v_nome
  from loc_funcionario
  where cd_func = p_cd_func;
  return  v_nome;
exception
  when no_data_found then
  prc_log_autonomous('Tentativa com o funcionario'|| p_cd_func);
  return 'Funcionario nao encontrado';
  
  when too_many_rows then
    return 'Este codigo de funcionario retorna mais do que uma ocorrencia';
  when others then
    raise_application_error(-2001,'Erro:' || sqlerrm);
end;
   procedure prc_dados_depto is 
    begin
      null;
end;
 
end;

--Chamar a package nao esta funcionando!!
begin
 pkg_rev_2tdsr.prc_dados_depto;
end;

create table teste_autonomous (data_evento date, evento varchar2(100));

create or replace procedure prc_log_autonomous
(p_evento varchar2) is
  pragma autonomous_transaction;
begin
  insert into teste_autonomous values (sysdate,p_evento);
  commit;
end;

