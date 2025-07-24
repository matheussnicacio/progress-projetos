DEF VAR valor AS INT NO-UNDO.
DEF VAR resultado AS INT NO-UNDO.
DEF VAR ix AS INT NO-UNDO.


DO ix = 1 TO 10:
      RUN piCalcula (INPUT ix, 
               INPUT ix * 7,
               OUTPUT resultado).
      MESSAGE resultado VIEW-AS ALERT-BOX.
END.

PROCEDURE piCalcula: 
      DEF INPUT PARAM pNumA AS INT NO-UNDO.
      DEF INPUT PARAM pNumB AS INT NO-UNDO.
      DEF OUTPUT PARAM pRet AS INT NO-UNDO.

      ASSIGN pRet = pNumA * pNumB.
      
END PROCEDURE.
