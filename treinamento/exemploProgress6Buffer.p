DEFINE BUFFER b-aux FOR customer.
 FIND FIRST customer EXCLUSIVE-LOCK NO-ERROR.
 UPDATE customer.CustNum
            customer.Name.
 CREATE b-aux.
 ASSIGN b-aux.CustNum = customer.CustNum + 1
            b-aux.Name      = customer.Name.
 DISPLAY customer.CustNum 
             customer.Name
             b-aux.CustNum
             b-aux.Name 
 WITH 1 COLUMN.
