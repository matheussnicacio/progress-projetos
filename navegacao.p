/* Declara��o dos bot�es */
DEF BUTTON bt-sair LABEL "Sair" AUTO-ENDKEY.
DEF BUTTON bt-pri LABEL "<<".
DEF BUTTON bt-ant LABEL "<".
DEF BUTTON bt-prox LABEL ">".
DEF BUTTON bt-ult LABEL ">>".

/* FRAME para conter todos os bot�es */
DEFINE FRAME fMenu
    bt-sair bt-pri bt-ant bt-prox bt-ult
    WITH CENTERED TITLE "Navega��o" SIDE-LABELS.

/* Eventos dos bot�es � s� s�o poss�veis ap�s o FRAME existir */
ON CHOOSE OF bt-sair IN FRAME fMenu DO:
    MESSAGE "Encerrando." VIEW-AS ALERT-BOX INFO.
END.

ON CHOOSE OF bt-pri IN FRAME fMenu DO:
    MESSAGE "Primeiro" VIEW-AS ALERT-BOX INFO.
END.

/* Habilita os bot�es para intera��o */
ENABLE ALL WITH FRAME fMenu.

/* Espera por intera��o do usu�rio */
WAIT-FOR CHOOSE OF bt-sair IN FRAME fMenu.
