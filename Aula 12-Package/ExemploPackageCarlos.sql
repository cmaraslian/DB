create or replace package pkg_aula_2tdsr is
  function fnc_soma_dois_numeros (p_n1 number, p_n2 number) return number;
  function fnc_mult_dois_numeros (p_n1 number, p_n2 number) return number;
  procedure prc_elimina_proprietario(p_cd_proprietario LOC_PROPRIETARIO.CD_PROPRIETARIO%type);
end;


create or replace package body pkg_aula_2tdsr is
  function fnc_soma_dois_numeros (p_n1 number, p_n2 number) return number is
    v_retorno number;    
    begin
      v_retorno := p_n1 + p_n2;
      return p_n1 * p_n2;
    end;
  function fnc_mult_dois_numeros (p_n1 number, p_n2 number) return number is
      v_retorno number;
    begin
      v_retorno := p_n1 * p_n2;
      return v_retorno;      
    end;
  
  procedure prc_elimina_proprietario(p_cd_proprietario LOC_PROPRIETARIO.CD_PROPRIETARIO%type) is
  v_cnt_veiculo number;
  v_cnt_endereco  number;
  v_erro_filho  exception;
  begin
   select count(1)
    into v_cnt_veiculo
    from loc_veiculo
   where cd_proprietario=p_cd_proprietario;
   
  select count(1)
    into v_cnt_endereco
    from loc_endereco_proprietario
   where cd_proprietario=p_cd_proprietario;
   
  if v_cnt_veiculo > 0 or v_cnt_endereco > 0 then
    raise v_erro_filho;
  else
    delete from loc_proprietario where cd_proprietario=p_cd_proprietario;
  end if;
exception
  when v_erro_filho then
    raise_application_error(-20001,'Registros dependentes existentes: Tabela LOC_VEICULO ' || v_cnt_veiculo || ' TABELA LOC_ENDERECO_PROPRIETARIO ' || v_cnt_endereco);
  when others then
    raise_application_error (-20002,'Erro inesperado' || sqlerrm);
end;
  end;


