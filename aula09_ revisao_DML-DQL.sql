set SERVEROUTPUT on;
--------------------------------
-- COM PARAMETRO
--------------------------------
DECLARE 
    CURSOR prod_cursor(id_prod INTEGER) IS
        SELECT desc_produto, valor_produto FROM produto WHERE id_produto = id_prod;
    rowp prod_cursor%rowtype;
BEGIN 
    open prod_cursor(6);
    LOOP
        FETCH prod_cursor INTO rowp;
        EXIT WHEN prod_cursor%NOTFOUND;
        
        dbms_output.put_line('Nome: ' || rowp.desc_produto);
        dbms_output.put_line('Valor: ' || rowp.valor_produto);
    END LOOP;
    CLOSE prod_cursor;
END;
--------------------------------
-- SEM PARAMETRO
--------------------------------
DECLARE 
    CURSOR prod_cursor IS
        SELECT desc_produto, valor_produto FROM produto;
    rowp prod_cursor%rowtype;
BEGIN 
    open prod_cursor;
    LOOP
        FETCH prod_cursor INTO rowp;
        EXIT WHEN prod_cursor%NOTFOUND;
        
        dbms_output.put_line('Nome: ' || rowp.desc_produto);
        dbms_output.put_line('Valor: ' || rowp.valor_produto);
    END LOOP;
    CLOSE prod_cursor;
END;

--------------------------------
-- COM VARIAVEIS LOCAL
--------------------------------
DECLARE 
    CURSOR prod_cursor(id_prod INTEGER) IS
        SELECT desc_produto, valor_produto FROM produto WHERE id_produto = id_prod;
    desc_produto produto.desc_produto%type;
    valor_produto produto.valor_produto%type;
    
BEGIN 
    open prod_cursor(6);
    LOOP
        FETCH prod_cursor INTO desc_produto, valor_produto;
        EXIT WHEN prod_cursor%NOTFOUND;
        
        dbms_output.put_line('Nome: ' || desc_produto);
        dbms_output.put_line('Valor: ' || valor_produto);
    END LOOP;
    CLOSE prod_cursor;
END;

--------------------------------
-- ATRIBUTOS NOS CURSORES
--------------------------------
DECLARE 
    CURSOR prod_cursor(id_prod INTEGER) IS
        SELECT desc_produto, valor_produto FROM produto WHERE id_produto = id_prod;
    
    rowp prod_cursor%rowtype;
    rows_found number :=0;
BEGIN 
    for rowp in prod_cursor(100) LOOP
        IF prod_cursor%FOUND then
        dbms_output.put_line('Nome: ' || rowp.desc_produto);
        dbms_output.put_line('Valor: ' || rowp.valor_produto);
        rows_found := rows_found + 1;
        ELSE
            dbms_output.put_line('Nenhum produto encontrado para ID fornecido ');
        end if;
    END LOOP;
    if rows_found = 0 then
        dbms_output.put_line('Nenhum produto encontrado para ID fornecido ');
    end if;
END;
