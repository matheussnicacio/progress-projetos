DEF VAR hprog AS HANDLE NO-UNDO.
DEF VAR ix AS INT NO-UNDO.
DEF VAR iRetorno AS INT NO-UNDO.

RUN persistente.p PERSISTENT SET hprog.

RUN pi-calcula IN hprog (INPUT "catolica"),
                        (INPUT 55800)
                        (OUTPUT iRetorno).

DO ix = 1 TO 5:
      RUN pi-resposta IN hprog.
END.


DELETE PROCEDURE hprog.
