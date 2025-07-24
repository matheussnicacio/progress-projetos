/* l-Orders.p */
def var i-ano-ini as int format "9999" no-undo.
def var i-ano-fim as int format "9999" no-undo.
repeat:
    update i-ano-ini
           i-ano-fim.
    for each Order 
        where Order.OrderDate >= date(1,1,i-ano-ini) 
        and   Order.OrderDate <= date(12,31,i-ano-fim):
        disp Order.OrderNum
             Order.CustNum
             Order.OrderDate.
    end.
end.
