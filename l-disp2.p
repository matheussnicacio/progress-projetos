/* l-disp2.p */
def var c-nome   as char format "x(1)" label "nome" NO-UNDO.
def var de-limit like Customer.CreditLimit label "limite de credito" NO-UNDO.
repeat:
    update c-nome de-limit.
    for each Customer 
        where Customer.Name begins c-nome 
        and   Customer.CreditLimit > de-limit:
        display Customer.CustNum 
                Customer.Name 
                Customer.CreditLimit.
    end.
end.   
