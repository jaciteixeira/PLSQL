SET SERVEROUTPUT ON;

BEGIN
    IF &num >0 THEN 
    dbms_output.put_line('O numero é maior que 0');
    END IF;
END;

BEGIN
    IF &num >0 THEN 
        dbms_output.put_line('é maior que 0');
    ELSE 
        dbms_output.put_line('é menor ou igual a 0');
    END IF;
END;

DECLARE
    entrada number;
BEGIN
    entrada := &num;
    IF entrada >0 THEN 
        dbms_output.put_line('maior que 0');
    ELSIF entrada =0 THEN 
        dbms_output.put_line('igual a 0');
    ELSE 
        dbms_output.put_line('menor que 0');
    END IF;
END;

ACCEPT operacao PROMPT 'Digite o operador:'; 
ACCEPT num1 PROMPT 'Digite :'; 
ACCEPT num2 PROMPT 'Digite :'; 
DECLARE
    operador char:= '&operacao';
    num1 number := &num1;
    num2 number := &num2;
BEGIN
    IF operador ='+' THEN 
        dbms_output.put_line('O resultado é: ' || num1 + num2);
    ELSIF operador ='-' THEN 
        dbms_output.put_line('O resultado é: ' || num1 - num2);
    ELSIF operador ='*' THEN 
        dbms_output.put_line('O resultado é: ' || num1 * num2);
    ELSIF operador ='/' THEN 
        dbms_output.put_line('O resultado é: ' || num1 / num2);
    ELSE 
        dbms_output.put_line('invalido');
    END IF;
END;
