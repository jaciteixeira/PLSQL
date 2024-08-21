Habilitando saída de dados no ambiente
set serveroutput on

Desabilitando repetição de código nas mensagens
set verify off

-- comentário de linha
/* comentário várias linhas*/

begin
-- saída de dados
    dbms_output.put_line('OI');
end;

begin
-- saída de dados
    dbms_output.put_line('OI');
    dbms_output.put_line('OI novamente');
end;

usando variaveis de memoria

declare
    v_nome varchar(10) := 'Fiap';
begin
    dbms_output.put_line(v_nome);
-- pipe pipe || concatena msg estática com variavel de memoria    
    dbms_output.put_line('Mostrando conteúdo: '||v_nome);
end;

declare
    v_nome varchar(10) := 'Fiap';
    v_nota number(2) := 10;
begin
    -- pipe pipe || concatena msg estática com variavel de memoria    
    dbms_output.put_line('Mostrando conteúdo: '||v_nome||' - Nota: '||v_nota);
end;

entrada de dados via teclado

declare
--& abre uma caixa de msg para digitação via teclado de dados
    v_nome varchar(10) := '&Nome';
    v_nota number(2) := &valor_nota;
begin
    -- pipe pipe || concatena msg estática com variavel de memoria    
    dbms_output.put_line('Mostrando conteúdo: '||v_nome||' - Nota: '||v_nota);
end;

Processamento

begin
    dbms_output.put_line(10 + 10);
end;

declare
--& abre uma caixa de msg para digitação via teclado de dados
    v_1 number(4,2) := &Valor1;
    v_2 v_1%type := &valor2;
    v_res v_1%type;
begin
    v_res := v_1 + v_2;
    -- pipe pipe || concatena msg estática com variavel de memoria    
    dbms_output.put_line('Soma de '||v_1||' com '||v_2||' = '||v_res);
end;

Aula 2 - 28/02/24

set serveroutput on
set verify off

declare
    sx char(1) := '&sexo';
begin
    if sx = 'F' or sx = 'f' then
        dbms_output. put_line('Feminino');
    elsif sx = 'M' or sx = 'm' then
        dbms_output. put_line('Masculino');
    else
        dbms_output. put_line('Outros');
    end if;
end;

declare
    sx char(1) := upper('&sexo');
begin
    if sx = 'F' then
        dbms_output. put_line('Feminino');
    elsif sx = 'M' then
        dbms_output. put_line('Masculino');
    else
        dbms_output. put_line('Outros');
    end if;
end;

1- Escreva	um programa para ler 2 valores (considere que não serão informados 
valores iguais) e escrever o maior deles.

declare
    n1 number(2) := &valor_1;
    n2 number(2) := &valor_2;
begin
    if n1 = n2 then
        dbms_output.put_line('Os valores não podem ser iguais');
    elsif n1 > n2 then
        dbms_output.put_line('N1 maior: '||n1);
    else
        dbms_output.put_line('N2 maior: '||n2);
    end if;
end;

2- Escreva	um programa para ler o ano de nascimento de uma	pessoa e escrever uma 
mensagem que diga se ela poderá ou não votar este ano	
(não é necessário considerar o mês em que ela nasceu).

declare
    ano_nasc number(4) := &ano_nascimento;
    tempo number(4) := 2024 - ano_nasc;
begin
    if tempo >= 16 then
        dbms_output.put_line('Voto permitido');
    else
        dbms_output.put_line('Voto não permitido');
    end if;
end;

3- Escreva	um programa que verifique a validade de uma senha fornecida pelo usuário. 
A senha válida é o número 1234.Devem ser impressas as seguintes mensagens:	
	ACESSO PERMITIDO caso a senha seja válida.	
	ACESSO NEGADO caso a senha seja	inválida.
    
declare
    
4- As maçãs custam R$ 0,30 cada se forem compradas menos do que uma dúzia, 
e R$0,25 se forem compradas pelo menos doze. Escreva um programa que leia o número
de maçãs compradas, calcule e escreva o valor total da compra.

Aula 3 - 06/03/24

Exercício - carga de dados

Exercício:

Tabela: Notas
    rm_aluno - nm_disc - cp1 - cp2 - cp3 - media
    1        - PLSQL   - 10  - 7.5 - 7.5
    1        - POO     - 4.5 - 10  - 7.5
    1        - IA      - 7.5 - 6.5 - 10
    1        - JAVA    - 8   - 2.5 - 2.5

Criar a tabela, inserir dados
Criar um bloco pl para calcular a média e atualizar seu valor na tabela

incluir as colunas: carga_hora - N - 3
                    num_falta - N - 3
                    situacao - A - 40

criar um bloco pl para incluisão dos valores de acordo com a tabela
a seguir:

Tabela: Notas
    rm_aluno - nm_disc - cp1 - cp2 - cp3 - media - carga_hora - num_faltas - situacao
    1        - PLSQL   - 10  - 7.5 - 7.5         - 100        - 0
    1        - POO     - 4.5 - 10  - 7.5         - 100        - 90
    1        - IA      - 1.5 - 1.5 - 1.0         - 80         - 10
    1        - JAVA    - 8   - 2.5 - 2.5         - 80         - 70
    1        - IOT     - 5.0 - 5.0 - 5.0         - 80         - 20
    
Gravar a situação de acordo com as regras a seguir:

Média >= 6.0 e faltas < 25% da carga horária, situação: Aprovado
Média >= 6.0 e faltas >= 25% da carga horária, situação: Rep. por faltas
Média >= 4.5 e < 6.0 e faltas < 25% da carga horária, situação: DP
Média < 4.5 e faltas < 25% da carga horária, situação: Rep. por nota
Média < 4.5 e faltas >= 25% da carga horária, situação: Rep. por nota e faltas

1- Criar a tabela Notas
    drop table notas1;
    create table notas1 (rm_aluno number(2), nm_disc varchar(20),
                        cp1 number(3,1), cp2 number(3,1), cp3 number(3,1), 
                        media number(3,1));
2- Criar um bloco PL para inserção dos dados
    begin
        insert into notas1 values(1,'PLSQL',10,7.5,7.5, null);
        insert into notas1 values(1,'POO',4.5,10,7.5,null);
        insert into notas1 values(1,'IA',7.5,6.5,10,null);
        insert into notas1 values(1,'JAVA',8,2.5,2.5,null);
        commit;
    end;
 OU       
    begin
        insert into notas1 values(&RM1,'&Disciplina1',&CP1,&CP2,&CP3, null);
        insert into notas1 values(&RM1,'&Disciplina2',&CP1,&CP2,&CP3,null);
        insert into notas1 values(&RM1,'&Disciplina3',&CP1,&CP2,&CP3,null);
        insert into notas1 values(&RM1,'&Disciplina4',&CP1,&CP2,&CP3,null);
        commit;
    end;
        
select * from notas1;

Aula - 13/03/24 - CP1
Aula 4 - 20/03/24 - exercícios
Desenvolver um bloco de programação que efetue a soma de todos os 
números ímpares que são múltiplos de 
três e que se encontram no conjunto dos números de 1 até 500.

Desenvolver um bloco de programação que leia um valor inicial A e 
imprima a seqüência de valores do cálculo de 
A! (fatorial) e o seu resultado. Ex: 5! = 5 X 4 X 3 X 2 X 1 = 120

Desenvolver um bloco de programação que leia 50 valores e encontre o maior
e o menor deles. Mostre o resultado.

Aula 4 - 27/03/24 - exercícios

Aula 5 - 03/04/24

Calendário

CP1 - 13/03
CP2 - 24/04
CP3 - 22/05
Sprint 1 - 15/04
Sprint 2 - 20/05
GS - 27/05 a 07/06
Sub - ????
Exame - ????

08/05/24

Exception - tratamento de erros - pré definida

DECLARE
	...
BEGIN	
	...
	EXCEPTION
		WHEN NOME_DA_EXCEÇÃO THEN
		RELAÇÃO_DE_COMANDOS;
		WHEN NOME_DA_EXCEÇÃO THEN
		RELAÇÃO_DE_COMANDOS;
		...
END;

Exemplo
drop table aluno1 cascade constraints;
create table aluno1 (ra number(1) primary key, nome varchar(20));

insert into aluno1 values (1,'Marcel');
insert into aluno1 values (2,'Adriana');
insert into aluno1 values (3,'Samuel');
commit;

set serveroutput on
set verify off

DECLARE
	V_RA ALUNO1.RA%TYPE := &ra;
	V_NOME ALUNO1.NOME%TYPE := '&nome';
BEGIN
	insert into aluno1 values (v_ra, v_nome);
	DBMS_OUTPUT.PUT_LINE('Processo realizado com sucesso');
	EXCEPTION
      WHEN dup_val_on_index THEN
		DBMS_OUTPUT.PUT_LINE ('Ops, Ra já cadastrado');
END;

select * from aluno1

DECLARE
	V_RA ALUNO1.RA%TYPE := &rm;
	V_NOME ALUNO1.NOME%TYPE;
BEGIN
	SELECT NOME INTO V_NOME FROM ALUNO1 WHERE RA > V_Ra;
	DBMS_OUTPUT.PUT_LINE(V_RA ||' - '|| V_NOME);
	EXCEPTION
      	/*WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE ('Não há nenhum aluno com este RM');
		WHEN TOO_MANY_ROWS THEN
			DBMS_OUTPUT.PUT_LINE ('Há mais de um aluno com este RA');*/
        WHEN others THEN
			DBMS_OUTPUT.PUT_LINE ('c vira loko'); 
END;

set serveroutput on
select * from aluno

Personalizada

DECLARE
	NOME_DA_EXCEÇÃO EXCEPTION;
BEGIN
	...
	IF ... THEN
		RAISE NOME_DA_EXCEÇÃO;
	END IF;
	...
	EXCEPTION
		WHEN NOME_DA_EXCEÇÃO THEN
		RELAÇÃO_DE_COMANDOS
END;

select * from aluno1
DECLARE
	V_CONTA NUMBER(2);
	TURMA_CHEIA EXCEPTION;
BEGIN
	SELECT COUNT(RA) INTO V_CONTA FROM ALUNO1;
	IF V_CONTA = 5 THEN 
		RAISE TURMA_CHEIA;
	ELSE 
		INSERT INTO ALUNO1 VALUES (&rm,'&nome');
	END IF;
    EXCEPTION
        WHEN TURMA_CHEIA THEN
		DBMS_OUTPUT.PUT_LINE('Não foi possível incluir: turma cheia');
END;

Exercício: criar a tabela produto com os seguintes campos:
id_prod, nome_prod e dt_fab

drop table produto cascade constraints;
create table produto (id_prod number(3) primary key,
                      nome_prod varchar(20), dt_fab date);

drop table auditoria cascade constraints;
create table auditoria (err_cod varchar(10), err_msg varchar(200), 
                        err_dt date);
                        
criar um bloco pl para inserir dados nesta tabela, não esqueça de usar a exception
caso um produto com código já cadastrado seja usado novamente.

declare
    v_id_prod number(3) := &id_prod;
    v_nome_prod varchar(20) := '&nome_prod';
    v_dt_fab date := '&dt_fab';
begin
    insert into produto values (v_id_prod, v_nome_prod, v_dt_fab);
    commit;
exception
    when dup_val_on_index then
        dbms_output.put_line('Código já cadastrado');
end;

select * from produto

declare
    v_id_prod number(3) := &id_prod;
    v_nome_prod varchar(20) := '&nome_prod';
    v_dt_fab date := '&dt_fab';
    err_code varchar(10);
    err_msg varchar(200);
begin
    insert into produto values (v_id_prod, v_nome_prod, v_dt_fab);
    commit;
EXCEPTION
   WHEN OTHERS THEN
      err_code := SQLCODE; --redebe o código do erro
      err_msg := SUBSTR(SQLERRM, 1, 100); -- recebe a msg de erro
      INSERT INTO auditoria (err_cod, err_msg, err_dt)
    VALUES (err_code, err_msg, sysdate);
END;

delete from auditoria

select * from auditoria

criar um bloco pl para buscar na tabela produto através do código do mesmo seus dados,
caso o produto não exista crie uma exception para previnir este problema de saída de
dados.

DECLARE
	V_id   produto.id_prod%TYPE := &id_prod;
	V_NOME produto.nome_prod%TYPE;
    v_dt   produto.dt_fab%type;
BEGIN
	SELECT id_prod, nome_prod, dt_fab INTO V_id, v_nome, v_dt
    FROM produto WHERE id_prod = V_id;
	DBMS_OUTPUT.PUT_LINE(v_id||' - '|| V_NOME||' - '||v_dt);
	EXCEPTION
    	WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE ('Não há nenhum produto com este código');
END;

Funções

CREATE OR REPLACE FUNCTION nome_função (p1 in/out ou in/out, p2...)
RETURN tipo_dados
IS
    variaveis locais
BEGIN
    programação    
 RETURN nome_função;
END;

IN (padrão): Passa um valor do ambiente chamador para function/procedure
e este valor não pode ser alterado dentro dela (passagem de parâmetro
por valor).

OUT: Passa um valor da function/procedure para o ambiente chamador
(passagem de parâmetro por referência).

IN OUT: Passa um valor do ambiente chamador para a function/procedure.
Esse valor pode ser alterado dentro da function/procedure e retornar 
com o valor atualizado para o ambiente chamador (passagem de parâmetro
por referência).

Chamada, passagem de parâmetros, saída de dados

SELECT nome_função(valor1,valorn) FROM dual;

Exemplo:
drop table funcionarios_tbl cascade constraints;
create table funcionarios_tbl
(primeiro_nome varchar(30),
 id number(2));
 
 insert into funcionarios_tbl values ('Marcel', 10);
 insert into funcionarios_tbl values ('Andrea', 20);
 insert into funcionarios_tbl values ('Samuel', 90);
 commit;

CREATE OR REPLACE FUNCTION primeiro_nome_func
RETURN VARCHAR
IS
  emp_name VARCHAR(20);
BEGIN
    SELECT primeiro_nome INTO emp_name  FROM funcionarios_tbl 
    WHERE ID = 90;
    RETURN emp_name;
END;

SELECT primeiro_nome_func FROM dual;

create or replace function teste_soma (p1 in number, p2 in number)
return number
is
soma number(4);
begin
    soma := p1 + p2;
    return soma;
end;

select teste_soma(10,15) from dual;

set serveroutput on
declare
    n1 number(4) := &valor1;
    -- usando a herança com%type - tipo + tamanho
    -- usando entrada de dados via teclado &
    n2 n1%type   := &valor2;
    re n1%type;
begin
    --chamando a função via variavel de memoria
    re := teste_soma(n1, n2);
    dbms_output.put_line(re);
end;

Criar uma função que analise dois valores numéricos inteiros e retorne o maior deles.

CREATE OR REPLACE FUNCTION maior_num (
    num1 IN NUMBER, 
    num2 IN NUMBER
) RETURN NUMBER IS
    maior_numero NUMBER;
BEGIN
    IF num1 > num2 THEN
        maior_numero := num1;
    ELSE 
        maior_numero := num2;
    END IF;
    RETURN maior_numero;
END;
/
SELECT maior_num(1,5) from dual;


---------------- PROCEDURE
DROP TABLE ALUNO cascade constraints;
CREATE TABLE ALUNO ( RA VARCHAR2(20) PRIMARY KEY, NOME VARCHAR2(20));
INSERT INTO ALUNO VALUES ('RM12345', 'Fulano');
INSERT INTO ALUNO VALUES ('RM78910', 'BELTRANO');
commit;

CREATE OR REPLACE PROCEDURE PROC_NOME_ALUNO (
    P_RA IN VARCHAR2
) IS 
    V_NOME VARCHAR2(50);
BEGIN
    SELECT NOME INTO V_NOME FROM ALUNO WHERE RA = P_RA;
    DBMS_OUTPUT.PUT_LINE(V_NOME);
END PROC_NOME_ALUNO;

--CHAMADA, EXECUÇÃO:
EXEC PROC_NOME_ALUNO('RM78910');



