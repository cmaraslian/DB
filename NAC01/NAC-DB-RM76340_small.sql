/*Nome: Carlos Augusto Maraslian
  RM  : 76340 */

-- Cursor
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
  COMMIT; 											 	  
END;

-- Conta quantas tuplas foram copiadas em relação a origem
/*select (select count (*) from PF0064.LOC_ITEM_LOCACAO) as TB_ORIGEM,
(select count (*) from LOC_ITEM_LOCACAO_STG) as TB_DESTINO from dual; */

-- Verifica tabela
/* select * from LOC_ITEM_LOCACAO_STG where ROWNUM BETWEEN 1 and 10; */


