/* l-cred2.p */
def var i-cod as int format ">>>,>>9" NO-UNDO.
prompt-for Customer.CustNum.
find Customer 
    where Customer.CustNum = input Customer.CustNum.  
display Customer.CustNum 
    Customer.Name 
    Customer.CreditLimit.
assign i-cod = Customer.CreditLimit.
for each Customer 
    where Customer.CreditLimit >= i-cod 
      by Customer.CreditLimit desc:
      display Customer.CustNum 
          Customer.Name 
          Customer.CreditLimit.
end.
