/*

CURRENT-WINDOW:WIDTH = 251.
DEF VAR iCont AS INT NO-UNDO LABEL "total".
FOR EACH customer

      BREAK BY customer.SalesRep:
            IF FIRST-OF(customer.SalesRep) THEN DO:
            
            FIND FIRST salesrep
                  WHERE salesrep.salesrep = customer.salesrep
                  NO-LOCK NO-ERROR.
            IF AVAIL salesrep THEN DO:
                  DISPLAY customer.SalesRep
                          salesrep.repname
                          WITH FRAME f-x WIDTH 250 DOWN.
            END.
      
      END.

      DISP customer.custnum
            customer.NAME
            WITH FRAME f-x.
      ASSIGN iCont = iCont + 1.
    
    IF LAST-OF(customer.salesrep) THEN DO:
       DISP iCont WITH FRAME f-x.
       ASSIGN iCont = 0.
      
      
      
    END.     
END.

*/

DEF BUTTON bt-cancel LABEL "Cancela" AUTO-ENDKEY.
DEF BUTTON bt-salva  LABEL "Gravar"  AUTO-GO.
DEF BUTTON bt-editar LABEL "Editar"  SIZE 20 BY 1.
 
DEF VAR cNome AS CHAR NO-UNDO LABEL "Nome" FORMAT "x(40)".
 
DEF FRAME f-dados
    cNome       AT ROW 1   COL 20
    bt-editar   AT ROW 2.5 COL 10
    bt-salva
    bt-cancel   
    WITH SIDE-LABELS THREE-D VIEW-AS DIALOG-BOX
        TITLE "Manutenção".
 
ON 'choose' OF bt-editar DO:
    ENABLE cNome WITH FRAME f-dados.
END.
 
ON 'choose' OF bt-salva DO:
    DISABLE cNome WITH FRAME f-dados.
END.
 
VIEW FRAME f-dados.        
ENABLE bt-salva
       bt-cancel
       bt-editar
       WITH FRAME f-dados.
WAIT-FOR "choose" OF bt-cancel.
