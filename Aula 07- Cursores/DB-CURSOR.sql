SET SERVEROUTPUT ON;

declare
  cursor c_tabelas is
  select table_name, tablespace_name
  from user_tables
  where table_name like 'A%';
  v_tabelas c_tabelas%rowtype;
  v_nome_tabela varchar2(100);
  v_tablespace varchar2(100);
begin
  open c_tabelas;
  loop
    fetch c_tabelas into v_tabelas;
    exit when c_tabelas%notfound;
    DBMS_OUTPUT.PUT_LINE('NOME Tabela: ' || v_tabelas.table_name || ' Tablespaces: ' || v_tabelas.tablespace_name);
  end loop;
  close c_tabelas;
end;

