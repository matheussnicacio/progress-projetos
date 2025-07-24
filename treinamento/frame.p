CURRENT-WINDOW:WIDTH = 251.
 
DEF BUTTON bt-pri LABEL "<<".
DEF BUTTON bt-ant LABEL "<".
DEF BUTTON bt-pro LABEL ">".
DEF BUTTON bt-ult LABEL ">>".
DEF BUTTON bt-add LABEL "Novo".
DEF BUTTON bt-sav LABEL "Salvar".
DEF BUTTON bt-can LABEL "Cancelar".
DEF BUTTON bt-sai LABEL "Sair" AUTO-ENDKEY.
 
DEF QUERY qCust FOR customer, salesrep SCROLLING.
 
DEF VAR cAction AS CHARACTER NO-UNDO.
 
DEF BUFFER bCust FOR customer.
 
DEF FRAME f-cust
    bt-pri AT 10
    bt-ant 
    bt-pro 
    bt-ult
    bt-add
    bt-sav
    bt-can
    bt-sai  SKIP(1)
    customer.custnum  COLON 20
    customer.NAME     COLON 20
    customer.salesrep COLON 20 salesrep.repname NO-LABEL  
    customer.address  COLON 20
    customer.comments VIEW-AS EDITOR SIZE 70 BY 30 SCROLLBAR-VERTICAL COLON 20
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
 
ON 'choose' OF bt-pro DO:
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
 
ON 'choose' OF bt-add DO:
    ASSIGN cAction = "add"
           bt-pri:SENSITIVE = FALSE
           bt-ant:SENSITIVE = bt-pri:SENSITIVE
           bt-pro:SENSITIVE = bt-pri:SENSITIVE
           bt-ult:SENSITIVE = bt-pri:SENSITIVE
           bt-sai:SENSITIVE = bt-pri:SENSITIVE
           bt-add:SENSITIVE = bt-pri:SENSITIVE
           bt-sav:SENSITIVE = NOT bt-pri:SENSITIVE
           bt-can:SENSITIVE = NOT bt-pri:SENSITIVE.
    CLEAR FRAME f-cust.
    ENABLE customer.custnum customer.NAME customer.salesrep
           customer.address customer.comments WITH FRAME f-cust.
    DISPLAY NEXT-VALUE (NextCustNum) @ customer.custnum WITH FRAME f-cust.
    ASSIGN customer.comments:SCREEN-VALUE = "".
END.
 
ON 'choose' OF bt-sav DO:
    IF cAction = "add" THEN DO:
        CREATE bCust.
        ASSIGN bCust.custnum = INPUT customer.custnum
               bCust.NAME = INPUT customer.NAME
               bCust.salesrep = INPUT customer.salesrep
               bCust.address = INPUT customer.address
               bCust.comments = INPUT customer.comments.
        DISABLE bt-sav bt-can 
                customer.NAME 
                customer.salesrep
                customer.address 
                customer.comments
                WITH FRAME f-cust.
    END.
END.
 
OPEN QUERY qCust 
    FOR EACH customer, 
       FIRST salesrep WHERE salesrep.salesrep = customer.salesrep.
 
ENABLE bt-pri bt-ant bt-pro bt-ult bt-sai WITH FRAME f-cust.
WAIT-FOR "choose" OF bt-sai.
//WAIT-FOR ENDKEY OF FRAME f-cust.
 
 
 
 
 
 
/*
DEF VAR iSeq AS INTEGER NO-UNDO.
DISP NEXT-VALUE(NextCustNum) @ iSeq WITH SIDE-LABELS.
MESSAGE NEXT-VALUE(NextCustNum) VIEW-AS ALERT-BOX.
*/
