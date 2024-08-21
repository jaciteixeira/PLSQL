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
                RAISE_APPLICATION_ERROR(-20001, 'Erro: divisão por zero.');
            END IF;
        ELSE 
            RAISE_APPLICATION_ERROR(-20001, 'Operação inválida');
    END CASE;
    
    RETURN resultado;
END;


DECLARE 
    resultado_operacao NUMBER;
BEGIN
    resultado_operacao := calculadora(10, 5, '+');
    dbms_output.put_line('Resultado da adição: ' || resultado_operacao);
    
    resultado_operacao := calculadora(10, 5, '-');
    dbms_output.put_line('Resultado da subtração: ' || resultado_operacao);
    
    resultado_operacao := calculadora(10, 5, '*');
    dbms_output.put_line('Resultado da multiplicação: ' || resultado_operacao);
    
    resultado_operacao := calculadora(10, 5, '/');
    dbms_output.put_line('Resultado da divisão: ' || resultado_operacao);
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
    
    
    