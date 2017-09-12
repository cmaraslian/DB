/* 1) Desenvolva uma trigger chamada trg_sincro_tot_pedido que para cada item movimentado de um
   determinado pedido na tabela LOC_ITEM_LOCACAO, o valor total de locação da tabela LOC_PEDIDO_LOCACAO
   seja atualizado.


2) Crie uma trigger que garanta que o valor da coluna DT_RETIRADA não seja MAIOR que o valor da coluna
   DT_ENTREGA na tabela LOC_ITEM_LOCACAO ? Caso isso ocorra, emita uma mensagem de erro pertinente e pare
   o processamento.
   
*/      
SET SERVEROUTPUT ON;

  create or replace trigger trg_check_date 
  before insert on LOC_ITEM_LOCACAO
  for each row
  begin
    if (:new.DT_RETIRADA > :new.DT_ENTREGA) then
      RAISE_APPLICATION_ERROR(-20001,'Data de Retidada maior que a data de Entrega');
    end if;  
  end;
  
  select * from LOC_PEDIDO_LOCACAO;    
  select * from LOC_ITEM_LOCACAO;
  insert into LOC_ITEM_LOCACAO (DT_RETIRADA,
                                NR_ITEM,
                                DT_ENTREGA,
                                QT_DIAS,
                                VL_LOCACAO,
                                NR_PLACA,
                                VL_TOTAL,
                                NR_PEDIDO)
   values (sysdate+2,10,sysdate,2,10,'DRV4395',10,87);

/*
3) Implemente uma regra de negócio que garanta que não se tenha nenhum valor negativo nas coluna  VL_LOCACAO
   e VL_TOTAL da tabela LOC_ITEM_LOCACAO ? Caso isso ocorra, emita uma mensagem de erro pertinente e pare o 
   processamento. (caso queira, também gere informação na tabela de log criada no seu último exercício complexo).
*/

select * from LOC_ITEM_LOCACAO;

create or replace trigger trg_check_vl_negativo 
  before insert on LOC_ITEM_LOCACAO
  for each row
  begin
    if (:new.VL_LOCACAO < 0) then 
      RAISE_APPLICATION_ERROR(-20001,'Valor da locação negativo!');
    elsif (:new.VL_TOTAL < 0) then
      RAISE_APPLICATION_ERROR(-20002,'Valor total negativo!');
    end if;  
  end;

select * from LOC_ITEM_LOCACAO where NR_PEDIDO = 87;
  insert into LOC_ITEM_LOCACAO (DT_RETIRADA,
                                NR_ITEM,
                                DT_ENTREGA,
                                QT_DIAS,
                                VL_LOCACAO,
                                NR_PLACA,
                                VL_TOTAL,
                                NR_PEDIDO)
   values (sysdate,15,sysdate,2,10,'DRV4395',-10,87);



4) Crie uma trigger que faça o autoincremento do código do departamento no momento da inclusão. Isso quer dizer
   que não é necessário gerar o código, pois esse valor será automaticamente atribuído após o comando insert. Siga
   os seguintes passos: - tabela LOC_DEPTO Siga as seguintes regras :
  
  - Crie a sequence SEQ_DEPTO (defina um valor inicial apropriado)

  - Crie uma trigger for each row somente para o evento de insert que irá utilizar essa sequence no momento
    da inserção. Ex. SELECT SEQ_DEPTO.NEXTVAL INTO :new.cd_depto  from DUAL;

 - Realize o insert e utilize o conteúdo acima para o código do cliente 

   Crie um exception para qualquer erro inesperado que possa ocorrer, interrompendo o processamento, emitindo
   a seguinte mensagem de erro. ‘Erro crítico no INSERT do departamento|| SQLERRM (exiba a mensagem e o código
   de erro fornecido pelo SGBDOR)    
   */
   
   


