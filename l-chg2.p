current-window:width = 251.
rep-blk:
REPEAT:
    PROMPT-FOR Customer.CustNum.
    FIND Customer USING CustNum.
    UPDATE Customer EXCEPT CustNum WITH 1 COLUMN width 250.
END.
