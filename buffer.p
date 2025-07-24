
FOR EACH customer NO-LOCK:
    RUN pi-processa(BUFFER customer).
END.
 
PROCEDURE pi-processa:
    DEF PARAM BUFFER b-cust FOR customer.
    DISPLAY b-cust.custnum
            b-cust.NAME.                                                         
END PROCEDURE.
