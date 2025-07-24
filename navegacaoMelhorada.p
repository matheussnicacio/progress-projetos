CURRENT-WINDOW:WIDTH = 251.
 
DEF BUTTON bt-pri LABEL "<<".
DEF BUTTON bt-ant LABEL "<".
DEF BUTTON bt-prox LABEL ">".
DEF BUTTON bt-ult LABEL ">>".
DEF BUTTON bt-add LABEL "Novo".
DEF BUTTON bt-save LABEL "Salvar".
DEF BUTTON bt-canc LABEL "Cancelar".
DEF BUTTON bt-sair LABEL "Sair" AUTO-ENDKEY.
 
DEFINE VARIABLE cAction  AS CHARACTER   NO-UNDO.
 
DEF QUERY qCust FOR customer, salesrep SCROLLING.
 
DEF BUFFER bCust  FOR customer.
DEF BUFFER bSales FOR salesrep.
 
DEF FRAME f-cust
    bt-pri AT 10
    bt-ant 
    bt-prox 
    bt-ult SPACE(3) 
    bt-add SPACE(3)
    bt-save 
    bt-canc SPACE(3)
    bt-sair  SKIP(1)
    customer.custnum  COLON 20
    customer.NAME     COLON 20
    customer.salesrep COLON 20 salesrep.repname NO-LABEL  
    customer.address  COLON 20
    customer.comments VIEW-AS EDITOR SIZE 70 BY 3 SCROLLBAR-VERTICAL COLON 20
    WITH SIDE-LABELS THREE-D SIZE 100 BY 20.
 
ON 'choose' OF bt-pri DO:
    GET FIRST qCust.
    DISP customer.custnum customer.NAME customer.salesrep
         salesrep.repname customer.address customer.comments
         WITH FRAME f-cust.
    ASSIGN bt-pri:SENSITIVE IN FRAME f-cust = FALSE
           bt-ant:SENSITIVE IN FRAME f-cust = bt-pri:SENSITIVE.
END.
 
ON 'choose' OF bt-ant DO:
    GET PREV qCust.
    IF AVAIL customer THEN DO:
        DISP customer.custnum customer.NAME customer.salesrep
             salesrep.repname customer.address customer.comments
             WITH FRAME f-cust.
    END.
    ELSE 
        APPLY "choose" TO bt-pri.
END.
 
ON 'choose' OF bt-prox DO:
    ASSIGN bt-pri:SENSITIVE IN FRAME f-cust = YES
           bt-ant:SENSITIVE IN FRAME f-cust = YES.
    GET NEXT qCust.
    IF AVAIL customer THEN DO:
        DISP customer.custnum customer.NAME customer.salesrep
             salesrep.repname customer.address customer.comments
             WITH FRAME f-cust.
    END.
    ELSE 
        APPLY "choose" TO bt-ult.
END.
 
ON 'choose' OF bt-ult DO:
    GET LAST qCust.
    DISP customer.custnum customer.NAME customer.salesrep
         salesrep.repname customer.address customer.comments
         WITH FRAME f-cust.
END.
 
ON 'choose' OF bt-add DO:
    ASSIGN cAction = "add"
           bt-pri:SENSITIVE = FALSE
           bt-ant:SENSITIVE = bt-pri:SENSITIVE
           bt-prox:SENSITIVE = bt-pri:SENSITIVE
           bt-ult:SENSITIVE = bt-pri:SENSITIVE
           bt-sair:SENSITIVE = bt-pri:SENSITIVE
           bt-add:SENSITIVE = bt-pri:SENSITIVE
           bt-save:SENSITIVE = NOT bt-pri:SENSITIVE
           bt-canc:SENSITIVE = NOT bt-pri:SENSITIVE.
    CLEAR FRAME f-cust.
    ENABLE customer.NAME customer.salesrep
           customer.address customer.comments WITH FRAME f-cust.
    DISPLAY NEXT-VALUE(NextCustNum) @ customer.custnum WITH FRAME f-cust.
    ASSIGN customer.comments:SCREEN-VALUE = "". 
END.
 
ON 'leave' OF customer.salesrep DO:
    FIND FIRST bSales
        WHERE bSales.salesrep = INPUT customer.salesrep
        NO-LOCK NO-ERROR.
    IF  NOT AVAIL bSales THEN DO:
        MESSAGE "SalesRep" INPUT customer.salesrep "nao existe!!!"
                VIEW-AS ALERT-BOX ERROR.
        RETURN NO-APPLY.
    END.
    DISP bSales.RepName @ salesrep.RepName WITH FRAME f-cust.
END.
 
ON 'choose' OF bt-save DO:
   IF cAction = "add" THEN DO:
      CREATE bCust.
      ASSIGN bCust.custNum  = INPUT customer.CustNum
             bCust.NAME     = INPUT customer.NAME
             bCust.salesrep = INPUT customer.salesrep
             bCust.address  = INPUT customer.address
             bCust.comments = INPUT customer.comments.
      DISABLE bt-save bt-canc 
              customer.NAME customer.salesrep customer.address customer.comments
              WITH FRAME f-cust.
      ENABLE bt-pri bt-ant bt-prox bt-ult bt-add bt-sair WITH FRAME f-cust.
 
      OPEN QUERY qCust 
          FOR EACH customer, 
             FIRST salesrep WHERE salesrep.salesrep = customer.salesrep.
      APPLY "choose" TO bt-ult.
   END.
END.
 
ON 'choose' OF bt-canc DO:
    DISABLE bt-save bt-canc 
          customer.NAME customer.salesrep customer.address customer.comments
          WITH FRAME f-cust.
    ENABLE bt-pri bt-ant bt-prox bt-ult bt-add bt-sair WITH FRAME f-cust.
    IF AVAIL customer THEN DO:
        DISP customer.custnum customer.NAME customer.salesrep
             salesrep.repname customer.address customer.comments
             WITH FRAME f-cust.
    END.
END.
 
OPEN QUERY qCust 
    FOR EACH customer, 
       FIRST salesrep WHERE salesrep.salesrep = customer.salesrep.
 
ENABLE bt-pri bt-ant bt-prox bt-ult bt-add bt-sair WITH FRAME f-cust.
WAIT-FOR ENDKEY OF FRAME f-cust.
/*
DEF VAR iSeq AS INTEGER NO-UNDO.
DISP NEXT-VALUE(NextCustNum) @ iSeq WITH SIDE-LABELS.
MESSAGE NEXT-VALUE(NextCustNum) VIEW-AS ALERT-BOX.
*/
