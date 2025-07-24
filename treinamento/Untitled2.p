CURRENT-WINDOW:WIDTH = 251.
 
DEF BUTTON bt-pri LABEL "<<".
DEF BUTTON bt-ant LABEL "<".
DEF BUTTON bt-prox LABEL ">".
DEF BUTTON bt-ult LABEL ">>".
DEF BUTTON bt-sair LABEL "Sair" AUTO-ENDKEY.
 
DEF QUERY qCust FOR customer, salesrep SCROLLING.
 
DEF FRAME f-cust
    bt-pri AT 10
    bt-ant 
    bt-prox 
    bt-ult  
    bt-sair  SKIP(1)
    customer.custnum  COLON 20
    customer.NAME     COLON 20
    customer.salesrep COLON 20 salesrep.repname NO-LABEL  
    customer.address  COLON 20
    WITH SIDE-LABELS THREE-D SIZE 100 BY 20.
 
ON 'choose' OF bt-pri DO:
    GET FIRST qCust.
    DISP customer.custnum customer.NAME customer.salesrep
         salesrep.repname customer.address
         WITH FRAME f-cust.
    ASSIGN bt-pri:SENSITIVE IN FRAME f-cust = FALSE
           bt-ant:SENSITIVE IN FRAME f-cust = bt-pri:SENSITIVE.
END.
 
ON 'choose' OF bt-ant DO:
    GET PREV qCust.
    IF AVAIL customer THEN DO:
        DISP customer.custnum customer.NAME customer.salesrep
             salesrep.repname customer.address
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
             salesrep.repname customer.address
             WITH FRAME f-cust.
    END.
    ELSE 
        APPLY "choose" TO bt-ult.
END.
 
ON 'choose' OF bt-ult DO:
    GET LAST qCust.
    DISP customer.custnum customer.NAME customer.salesrep
         salesrep.repname customer.address
         WITH FRAME f-cust.
END.
 
OPEN QUERY qCust 
    FOR EACH customer, 
       FIRST salesrep WHERE salesrep.salesrep = customer.salesrep.
 
ENABLE bt-pri bt-ant bt-prox bt-ult bt-sair WITH FRAME f-cust.
WAIT-FOR "choose" OF bt-sair.
/*
DEF VAR iSeq AS INTEGER NO-UNDO.
DISP NEXT-VALUE(NextCustNum) @ iSeq WITH SIDE-LABELS.
MESSAGE NEXT-VALUE(NextCustNum) VIEW-AS ALERT-BOX.
*/
