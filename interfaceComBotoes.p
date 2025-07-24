DEF BUTTON bt-sair LABEL "Sair" AUTO-ENDKEY.
DEF BUTTON bt-inicio LABEL "<<".
DEF BUTTON bt-anterior LABEL "<".
DEF BUTTON bt-proximo LABEL ">".
DEF BUTTON bt-final LABEL ">>".

DEF FRAME fMenu 
      bt-sair bt-inicio bt-anterior bt-proximo bt-final
      WITH CENTERED TITLE "Navegacao" SIDE-LABELS.
      
ON CHOOSE OF bt-sair IN FRAME fMenu DO:
      MESSAGE "Encerrando" VIEW-AS ALERT-BOX INFO. 
END.

ON CHOOSE OF bt-inicio IN FRAME fMenu DO:
      MESSAGE "Inicio" VIEW-AS ALERT-BOX INFO.
END.

ON CHOOSE OF bt-anterior IN FRAME fMenu DO:
      MESSAGE "Anterior" VIEW-AS ALERT-BOX INFO.
END.

ON CHOOSE OF bt-proximo IN FRAME fMenu DO:
      MESSAGE "Proximo" VIEW-AS ALERT-BOX INFO.
END.


/* Habilita os botões */
ENABLE ALL WITH FRAME fMenu.

/* Aguarda o clique do botão sair */
WAIT-FOR CHOOSE OF bt-sair IN FRAME fMenu.
