SET SERVEROUTPUT ON

-- Exemplo de exception
DECLARE
  v_idade number;
BEGIN
  v_idade :='zzzzz';
EXCEPTION WHEN OTHERS THEN 
  RAISE_APPLICATION_ERROR(-20001, 'Erro desconhecido: ' || sqlerrm );
END;


-- Outro exemplo utilizando 2 declarees
DECLARE
  v_numero_par number;
  v_erro_numero_par exception;
BEGIN
  FOR x IN 1..10 LOOP
        begin
          if mod(x,2)=0 then
            raise v_erro_numero_par;
          end if;
       exception when v_erro_numero_par then 
        DBMS_OUTPUT.PUT_LINE(X || 'É par');
       -- RAISE_APPLICATION_ERROR(-20003, 'Erro desconhecido: ' || sqlerrm );
       end; 
      END LOOP;
      Exception
      when others then
        RAISE_APPLICATION_ERROR(-20001, 'Erro desconhecido: ' || sqlerrm );
END;


