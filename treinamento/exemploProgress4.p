CURRENT-WINDOW:WIDTH = 251.
DEF VAR cTxt AS CHARACTER FORMAT "x(20)" NO-UNDO.
REPEAT:
UPDATE cTxt.
FOR EACH customer NO-LOCK
//BY customer.NAME DESCENDING:
WHERE customer.NAME MATCHES "*" + cTxt + "*":
DISP  customer.custnum   
      customer.Balance 
      customer.NAME
      customer.phone
      WITH WIDTH 250.
      
END.
END.
