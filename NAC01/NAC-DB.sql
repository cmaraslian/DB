-- Habilita output
set serveroutput on;


-- Dropa a tabela de destino
DROP TABLE LOC_ITEM_LOCACAO_STG;

-- Cria a estrutura da tabela LOC_ITEM_LOCACAO_STG CASCADE a partir
-- da tabela PF0064.LOC_ITEM_LOCACAO;

CREATE TABLE LOC_ITEM_LOCACAO_STG (
       DT_RETIRADA          DATE 			NULL,
       NR_ITEM              NUMBER(5) 		NOT NULL,
       DT_ENTREGA           DATE 			NULL,
       QT_DIAS              NUMBER(3) 		NULL,
       VL_LOCACAO           NUMBER(11,2) 	NULL,
       NR_PLACA             VARCHAR2(7) 	NOT NULL,
       VL_TOTAL             NUMBER(11,2) 	NULL,
       NR_PEDIDO            NUMBER(8) 		NOT NULL,
       DT_CARGA		    DATE		NOT NULL
);

ALTER TABLE LOC_ITEM_LOCACAO_STG
       ADD CONSTRAINT PK_LOC_ITEM_LOCACAO2 PRIMARY KEY (NR_PEDIDO, NR_ITEM);

DECLARE
  cursor c_tabelas is
  select * from PF0064.LOC_ITEM_LOCACAO;
  v_tabelas c_tabelas%rowtype;
BEGIN
  OPEN c_tabelas;
  LOOP
      FETCH c_tabelas INTO v_tabelas;
      EXIT WHEN c_tabelas%NOTFOUND;
      INSERT INTO LOC_ITEM_LOCACAO_STG (  
        DT_RETIRADA,
        NR_ITEM,
        DT_ENTREGA,
        QT_DIAS,
        VL_LOCACAO,
        NR_PLACA,
        VL_TOTAL,
        NR_PEDIDO,
        DT_CARGA)
      VALUES (
        v_tabelas.DT_RETIRADA,
        v_tabelas.NR_ITEM,
        v_tabelas.DT_ENTREGA,
        v_tabelas.QT_DIAS,
        v_tabelas.VL_LOCACAO,
        v_tabelas.NR_PLACA,
        v_tabelas.VL_TOTAL,
        v_tabelas.NR_PEDIDO,
        sysdate);
    END LOOP;
  CLOSE c_tabelas;
<<<<<<< HEAD
  COMMIT;	 
=======
  COMMIT; 											 	  
>>>>>>> bde9b604b6f5af1355dc3cf73d83dfea3d18e77d
END;

-- Conta quantas tuplas foram copiadas em relação a origem
/*select (select count (*) from PF0064.LOC_ITEM_LOCACAO) as TB_ORIGEM,
(select count (*) from LOC_ITEM_LOCACAO_STG) as TB_DESTINO from dual; */




