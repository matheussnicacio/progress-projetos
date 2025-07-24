
/*
FUNCTION soma RETURNS DECIMAL(INPUT a AS INT, INPUT b AS INT):

DEF VAR resultado AS DEC.

resultado = a + b.

RETURN resultado.

END FUNCTION.

DEF VAR d-total AS DEC.

d-total=soma(10,20).

MESSAGE d-total VIEW-AS ALERT-BOX.
*/

/*
PROCEDURE saudacao:

DEF OUTPUT PARAMETER nome AS CHAR. 

nome = "alisson".

MESSAGE "ola" + nome VIEW-AS ALERT-BOX.

END PROCEDURE.

DEF VAR c-mensagem AS CHAR. 

RUN saudacao(OUTPUT c-mensagem).

MESSAGE "ola" + c-mensagem VIEW-AS ALERT-BOX.
*/

PROCEDURE atualiza-valor:

      DEF INPUT-OUTPUT PARAMETER valor AS DEC. 

      DEF VAR i-imposto AS INT INITIAL 10.

      ASSIGN valor*=2.
      
      ASSIGN valor+=(valor*(i-imposto/100))
      
END PROCEDURE.

DEF VAR valor-final AS DEC INITIAL 100. 

RUN atualiza-valor (INPUT-OUTPUT valor-final).

MESSAGE valor-final VIEW-AS ALERT-BOX.





