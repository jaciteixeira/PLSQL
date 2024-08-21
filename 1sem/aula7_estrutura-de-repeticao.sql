set SERVEROUTPUT on;

--FOR LOOP
DECLARE
    soma NUMBER :=0;
BEGIN
    FOR i IN 1..10 LOOP 
        dbms_output.put_line(soma || '+' || i);
        soma := soma + i;
    end loop;
    dbms_output.put_line('Soma: '|| soma);
end;

-------------------------
--FOR LOOP - REVERSE
-- LOOP DE TRAS PARA FRENTE   
begin
     FOR i IN reverse 1..10 LOOP 
        dbms_output.put_line(i);
    end loop;
end;

------------------
-- WHILE LOOP
declare
    i number := 1;
    total number := 0;
begin
    while i <=5 loop
        dbms_output.put_line('Antes: '|| total || '+' || i);
        total := total + i;
        i := i + 1;
        dbms_output.put_line('Depois: '|| total || '+' || i);
    end loop;
        dbms_output.put_line('Total: '|| total);
end;

declare
    st_ VARCHAR2(10):= 'o';
    nome varchar2(50):='Francisco';
begin
    while (st_ = 'o') loop
        st_:= 'i';
    end loop;
    dbms_output.put_line(nome);
end;

ACCEPT nome_ent PROMPT 'Digite seu nome';
DECLARE
    nome_ VARCHAR2(255);
BEGIN 
    nome_:= '&nome_ent';
    
    WHILE nome_ != 'Francisco' LOOP
        nome_ :='nome_ent';
    END LOOP;
    dbms_output.put_line(nome_);
END;

------------------------
-- LOOP
DECLARE
    i number :=1;
    total number :=0;
BEGIN
    LOOP
        total:= total+i;
        i:= i+1;
        EXIT WHEN i > 7;
    END LOOP;
    dbms_output.put_line('Total: '|| total);
END;

-----------------------------
-- LOOP DENTRO DE LOOP
declare
    multiplicando number;
    multiplicador number;
    resultado number;
begin
    FOR multiplicando IN 1..2 LOOP 
        FOR multiplicador IN 1..10 LOOP
            resultado := multiplicando * multiplicador;
            dbms_output.put_line(multiplicando ||'*'|| multiplicador||'='||resultado);
        END LOOP;
        dbms_output.put_line(' ');
    END LOOP;
END;