-- Jaci Teixeira Santo RM:99627
SET SERVEROUTPUT ON;

-------------------------------------------
--Exercicio 1
-------------------------------------------
ACCEPT cp1 PROMPT 'Digite a nota da cp1: (0 a 10)'; 
ACCEPT cp2 PROMPT 'Digite a nota da cp2: (0 a 10)'; 
ACCEPT cp3 PROMPT 'Digite a nota da cp3: (0 a 10)';
VARIABLE cp1 number;
VARIABLE cp2 number;
VARIABLE cp3 number;
VARIABLE media_cp number;
DECLARE
    cp1 number := &cp1;
    cp2 number := &cp2;
    cp3 number := &cp3;
    media_cp number;
BEGIN
    IF (cp1<0 or cp1>10) or (cp2<0 or cp2>10) or (cp3<0 or cp3>10)  THEN
        dbms_output.put_line('numero invalido');
    ELSE
        IF cp1 = 0 and cp2 = 0 and cp3 = 0 THEN
            :media_cp := 0;
        ELSIF cp1 > cp2 and cp2 > cp3 THEN
            :media_cp := (cp1+cp2) / 2;
        ELSIF cp2 > cp1 and cp1 > cp3 THEN
            :media_cp := (cp2+cp1) / 2;
        ELSIF cp3 > cp1 and cp1 > cp2 THEN
            :media_cp := (cp3+cp1) / 2;
        ELSE
            :media_cp := (cp1+cp3) / 2;
        END IF;
        dbms_output.put_line('media  do aluno:' || :media_cp );
    END IF;
END;

-------------------------------------------
--Exercicio 2
-------------------------------------------
ACCEPT sp1 PROMPT 'Digite a nota da sp1 (0 a 100):'; 
ACCEPT sp2 PROMPT 'Digite a nota da sp2 (0 a 100):'; 
VARIABLE sp1 number;
VARIABLE sp2 number;
VARIABLE media_sprint number;
DECLARE
    sp1 number := &sp1;
    sp2 number := &sp2;
    media_sprint number; 
BEGIN
    IF (sp1<0 or sp1>100) and (sp2<0 or sp2>100) THEN
        dbms_output.put_line('nota invalida');
    ELSE
        IF sp1 = 0 and sp2 = 0 THEN
            :media_sprint := 0;
        ELSE
            :media_sprint := ((sp1+sp2)/10)/ 2;
        END IF;
        dbms_output.put_line('media  do aluno: ' || :media_sprint );
    END IF;
END;


-------------------------------------------
--Exercicio 3
-------------------------------------------
ACCEPT gs1 PROMPT 'Digite a nota da global: (0 a 100)'; 
VARIABLE gs1 number;
VARIABLE media_gs number;
DECLARE
    gs1 number := &gs1;
    media_gs number; 
BEGIN
    IF (gs1<0 or gs1>100) THEN
        dbms_output.put_line('nota invalida');
    ELSE
        IF gs1 = 0 THEN
            :media_gs := 0;
        ELSE
            :media_gs := (gs1/10);
        END IF;
        dbms_output.put_line('media  do aluno:' || :media_gs );
    END IF;
END;

-------------------------------------------
--Exercicio 4
-------------------------------------------
VARIABLE media_final number;
DECLARE
    media_final number; 
BEGIN
    media_final := ((:media_gs / 0.6) + (:media_cp / 0.2) + (:media_sprint / 0.2))/10;
    --dbms_output.put_line('media  final: ' || (((:media_gs *6)/100) + ((:media_cp * 2)/100) + ((:media_sprint * 2 )/100))/10 );
    dbms_output.put_line('media  final: ' || media_final );
END;

