DEF VAR i-valor AS INT NO-UNDO.

bloco-execucao:
DO TRANSACTION:

ASSIGN i-valor=9.

IF i-valor >= 9 THEN
DO:

MESSAGE "valor maior igual a 9" VIEW-AS ALERT-BOX.
UNDO bloco-execucao,LEAVE bloco-execucao.


END.

END.

MESSAGE i-valor VIEW-AS ALERT-BOX.
