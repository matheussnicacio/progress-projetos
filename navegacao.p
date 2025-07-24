/* Declaração dos botões */
DEF BUTTON bt-sair LABEL "Sair" AUTO-ENDKEY.
DEF BUTTON bt-pri LABEL "<<".
DEF BUTTON bt-ant LABEL "<".
DEF BUTTON bt-prox LABEL ">".
DEF BUTTON bt-ult LABEL ">>".

/* FRAME para conter todos os botões */
DEFINE FRAME fMenu
    bt-sair bt-pri bt-ant bt-prox bt-ult
    WITH CENTERED TITLE "Navegação" SIDE-LABELS.

/* Eventos dos botões – só são possíveis após o FRAME existir */
ON CHOOSE OF bt-sair IN FRAME fMenu DO:
    MESSAGE "Encerrando." VIEW-AS ALERT-BOX INFO.
END.

ON CHOOSE OF bt-pri IN FRAME fMenu DO:
    MESSAGE "Primeiro" VIEW-AS ALERT-BOX INFO.
END.

/* Habilita os botões para interação */
ENABLE ALL WITH FRAME fMenu.

/* Espera por interação do usuário */
WAIT-FOR CHOOSE OF bt-sair IN FRAME fMenu.
