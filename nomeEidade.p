// Solicitar nome e idade 
DEF VAR cNome AS CHAR NO-UNDO.
DEF VAR iIdade AS INT NO-UNDO.

UPDATE cNome LABEL "Nome : " iIdade LABEL "Idade : "
      WITH FRAME fEntrada CENTERED.
     
MESSAGE "Olá, " cNome ", voce tem " iIdade " anos."
      VIEW-AS ALERT-BOX INFO.

// Formulario simples 
DEF VAR cCidade AS CHAR NO-UNDO.
FORM cCidade LABEL "Cidade" WITH FRAME fCidade CENTERED.
UPDATE cCidade WITH FRAME fCidade.
