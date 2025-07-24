/* l-dcust.p */
current-window:width = 251.
for-proj:
for each Customer:
   define frame cust-frame
         CustNum Name colon 20 SalesRep at 55
         Address colon 20
         Address2 no-label colon 20 skip
         City colon 20 State colon 39 
         PostalCode colon 20 Country colon 39 skip(1)
         CreditLimit colon 20
         Balance  colon 39 skip
         Terms colon 20 skip
         Discount colon 20 
         Comments
          with title "Customer" side-labels width 250.
    display Customer except Contact Phone with frame cust-frame.
end.  /* for-proj */
