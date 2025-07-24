//Buscar clientes cujo nome começa com uma letra informada pelo usuário.
DEF VAR cInicial AS CHAR NO-UNDO.
DEF BUFFER bCustomer FOR customer.

// Entrada do usuario 
FORM cInicial LABEL "Digite a letra inicial do nome"
      WITH FRAME fEntrada CENTERED TITLE "Consulta por Nome".
      
UPDATE cInicial WITH FRAME fEntrada.

// Busca registros no banco
FOR EACH bCustomer
    WHERE bCustomer.NAME BEGINS cInicial
    NO-LOCK:
    
    DISPLAY bCustomer.Cust-Num bCustomer.NAME bCustomer.Phone
         WITH FRAME fResultado 3 DOWN TITLE "Resultados".
END.
