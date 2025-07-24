CURRENT-WINDOW:WIDTH = 121.

// l-add3
/*
REPEAT :

CREATE customer.
UPDATE customer

WITH SIZE 120 BY 19 1 COLUMNS.

END.
*/
//l-chg1

/*
FOR EACH customer EXCLUSIVE-LOCK:

DISPLAY customer WITH SIZE 120 BY 19 1 COLUMNS. 

UPDATE customer.

END.
*/

//l-chg2

CURRENT-WINDOW:WIDTH = 121.
 
DEF VAR iCustNum AS INTEGER NO-UNDO.
 
REPEAT:
    PROMPT-FOR iCustNum.
 
    FIND FIRST customer
        WHERE customer.custnum = INPUT iCustNum
        EXCLUSIVE-LOCK NO-ERROR.
 
    IF AVAILABLE customer THEN DO:
        DISPLAY customer WITH SIDE-LABELS SIZE 120 BY 19 1 COLUMNS.
        UPDATE customer.name
               customer.address
               customer.phone
               customer.balance.
    END.
    ELSE DO:
        MESSAGE "ID não encontrado." VIEW-AS ALERT-BOX ERROR.
    END.
END.



