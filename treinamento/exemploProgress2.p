PROMPT-FOR customer.CustNum.
FIND customer
   WHERE customer.CustNum = INPUT customer.CustNum NO-ERROR.
IF AVAILABLE customer THEN
   DISPLAY customer
           EXCEPT customer.Comments
           WITH 1 COLUMNS.
ELSE
    MESSAGE "customer nao encontrado "
           VIEW-AS ALERT-BOX ERROR.
