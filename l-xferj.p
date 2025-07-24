/* l-xferj.p */
def var c-rep-new as char format "x(3)" label "representante novo".
def var c-rep-old as char format "x(3)" label "rapresentante velho". 
update c-rep-old
       c-rep-new 
       with side-label.
for each Customer 
    where Customer.SalesRep = c-rep-old:
    assign Customer.SalesRep = c-rep-new.
    pause 1.
    display Customer.SalesRep Customer.CustNum Customer.Name.
end.
