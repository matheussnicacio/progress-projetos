DEFINE QUERY qr-cust FOR customer SCROLLING.

DEFINE VARIABLE iPos AS INTEGER FORMAT "9" NO-UNDO.

DISP "1-primeiro" AT 10
     "2-anterior" AT 10
     "3-proximo"  AT 10
     "4-ultimo"   AT 10
     iPos         AT 10
     WITH SIDE-LABELS FRAME f-dados.

OPEN QUERY qr-cust FOR EACH customer. // WHERE customer.creditlimit > 15000.

GET FIRST qr-cust.

REPEAT:
    UPDATE iPos WITH FRAME f-dados.

    CASE iPos:
        WHEN 1 THEN
            GET FIRST qr-cust.
        WHEN 2 THEN
            GET PREV qr-cust.
        WHEN 3 THEN
            GET NEXT qr-cust.
        WHEN 4 THEN
            GET LAST qr-cust.
        OTHERWISE
            MESSAGE "Opção inválida." VIEW-AS ALERT-BOX ERROR.
    END CASE.

    IF AVAILABLE customer THEN DO:
        DISPLAY customer.custnum
                customer.name 
                customer.creditlimit
                WITH FRAME f-cust.
    END.
END.
