DEF TEMP-TABLE tt-cliente
     FIELD id AS INT.
     bloco-execucao:
     
     DO TRANSACTION:
     
     CREATE tt-cliente.
     ASSIGN tt-cliente.id=2.
     
     FIND FIRST tt-cliente WHERE tt-cliente.id = 123 NO-ERROR.
     
     IF ERROR-STATUS:ERROR THEN
     DO:
       
       MESSAGE "erro no sistema: " ERROR-STATUS:GET-MESSAGE
       
     END.
     
     
     
     END.
