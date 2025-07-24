/* l-col1.p */
define variable cust-rep as character format "x(26)".
display "Relatorio de Pedidos" with centered no-box.
for-blk:
for each Order:
    find Customer of Order no-error.
    cust-rep = Customer.Name + " - " + Order.SalesRep.
    display Order.OrderNum  at 10 column-label "Order!number"
            Order.OrderDate at 21 column-label "Order!date"
            Order.CustNum   at 34 column-label "Customer!number"
            cust-rep        at 46 column-label "Customer Name!sales rep".
end. /* for-blk */
