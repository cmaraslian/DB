-- Exemplo if
DECLARE 
v_idade number;
BEGIN
  v_idade :=17;
  if v_idade >=18 and v_idade <=65 then
    dbms_output.put_line('Maior');
  elsif v_idade >65 then 
    dbms_output.put_line('Idoso');
  else
    dbms_output.put_line('Menor');
  end if;
END;

-- Exemplo loop
DECLARE
  v_cnt number;
BEGIN
  v_cnt := 0;
  loop
    v_cnt := v_cnt + 1;
    dbms_output.put_line(v_cnt);
    exit when v_cnt=100;
  end loop;
END;

--Exemplo for
BEGIN
  for x in 1..1000 loop
    dbms_output.put_line(x);
  end loop;
END;


