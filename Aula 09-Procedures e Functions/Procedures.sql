/* Criando uma tabela para o exercicio 
create table agenda2017(nome varchar2(100),
telefone varchar2(100));
*/

-- FALANDO SOBRE PROCEDURES--

/*cria a procedure */
create or replace procedure prc_agenda
(p_nome in agenda2017.nome%type, p_telefone in agenda2017.nome%type) is 
begin
  insert into agenda2017 (nome,telefone)
  values (p_nome, p_telefone);
  commit;
  exception 
  when dup_val_on_index then
    RAISE_APPLICATION_ERROR(-20001, 'Erro no insert');
    RAISE_APPLICATION_ERROR(-20002, 'Erro generico'  || sqlcode);
end;

/*Chama a procedure */
begin
  prc_agenda('Carlos','111111111');
end;

/*Verifica se populou */
select * from agenda2017;


Utilizaçao de procedures:
Limitar e ter controle dos inputs dos dados
