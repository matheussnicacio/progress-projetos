// Buscar cliente por codigo 
DEF VAR iCod AS INT NO-UNDO.
DEF BUFFER bCustomer FOR customer.
UPDATE iCod LABEL "Codigo: ".
FIND FIRST bCustomer WHERE bCustomer.CustNum = iCod NO-ERROR.
IF AVAILABLE bCustomer THEN
     DISPLAY bCustomer.NAME.
ELSE 
      MESSAGE "Cliente nao encontrado.".
      
// Criar cliente se nao existir 
IF NOT AVAILABLE bCustomer THEN DO:
      CREATE bCustomer.
      ASSIGN bCustomer.CustNum = iCod
             bCustomer.NAME = "Novo Cliente".
      MESSAGE "Cliente criado".
END.

// Listar clientes 
FOR EACH customer:
      DISPLAY customer.CustNum customer.NAME SKIP.
END.

// Filtro com WHERE 
FOR EACH customer WHERE customer.CreditLimit > 1000:
      DISPLAY customer.NAME customer.CreditLimit.
END.

// Criar uma temp-table 
DEF TEMP-TABLE ttCliente NO-UNDO 
      FIELD Cod AS INT
      FIELD Nome AS CHAR.
      
CREATE ttCliente.
ASSIGN ttCliente.Cod = 1
       ttCliente.Nome = "Teste".
       
FOR EACH ttCliente:
      DISPLAY ttCliente.
END.
