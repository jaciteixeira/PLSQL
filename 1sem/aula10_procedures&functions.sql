set SERVEROUTPUT on;

--------------------------------
-- FUNCTIONS
--------------------------------

create or replace function calculadora(
    num1 in number,
    num2 in number ,
    operacao in VARCHAR2
) return number 
as 
    resultado number;
BEGIN 
    CASE operacao
        WHEN '+' THEN 
            resultado := num1 + num2;
        WHEN '-' THEN 
            resultado := num1 - num2;
        WHEN '*' THEN 
            resultado := num1 * num2;
        WHEN '/' THEN 
            IF num2 !=0 THEN 
                resultado := num1 / num2;
            ELSE
                RAISE_APPLICATION_ERROR(-20001, 'Erro: divis�o por zero.');
            END IF;
        ELSE 
            RAISE_APPLICATION_ERROR(-20001, 'Opera��o inv�lida');
    END CASE;
    
    RETURN resultado;
END;


DECLARE 
    resultado_operacao NUMBER;
BEGIN
    resultado_operacao := calculadora(10, 5, '+');
    dbms_output.put_line('Resultado da adi��o: ' || resultado_operacao);
    
    resultado_operacao := calculadora(10, 5, '-');
    dbms_output.put_line('Resultado da subtra��o: ' || resultado_operacao);
    
    resultado_operacao := calculadora(10, 5, '*');
    dbms_output.put_line('Resultado da multiplica��o: ' || resultado_operacao);
    
    resultado_operacao := calculadora(10, 5, '/');
    dbms_output.put_line('Resultado da divis�o: ' || resultado_operacao);
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Erro: ' || SQLERRM);
END;

--------------------------------
--
--------------------------------
select 
    calculadora(10,5, '+') AS resultado_adicao,
    calculadora(10,5, '-') AS resultado_subtracao,
    calculadora(10,5, '*') AS resultado_multiplicacao,
    calculadora(10,5, '/') AS resultado_divisao
from dual;
    
    
    