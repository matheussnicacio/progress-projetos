CURRENT-WINDOW:WIDTH = 200.
   
   /*FOR EACH customer NO-LOCK
      WHERE customer.salesrep = "bbb":

      DISP customer.custnum
      customer.NAME
      customer.salesrep
      WITH FONT 2 WIDTH 180.

      END.
      */
      
 FOR EACH customer EXCLUSIVE-LOCK:
       DISPLAY customer.CustNum customer.creditlimit WITH SIDE-LABELS FONT 2 WIDTH 200.
       IF  CreditLimit > 15000 THEN DO:
            UPDATE customer.Name  
                                    customer.Address.
            MESSAGE "Registro Alterado".
       END.
  END.
