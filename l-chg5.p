/* Programa: l-chg5.p */
/* Permite alterar os dados de um cliente existente, exceto o número do cliente */

DEFINE VARIABLE iCodCliente AS INTEGER NO-UNDO.
DEFINE BUFFER bCustomer FOR Customer.

/* Solicita código do cliente */
FORM iCodCliente LABEL "Digite o código do cliente:"
    WITH FRAME fEntrada CENTERED TITLE "Selecionar Cliente".

UPDATE iCodCliente WITH FRAME fEntrada.

/* Busca o cliente */
FIND bCustomer WHERE bCustomer.CustNum = iCodCliente NO-ERROR.

IF AVAILABLE bCustomer THEN DO:
    /* Atualiza os dados do cliente, exceto o código */
       /* Atualiza dados principais */
    UPDATE bCustomer.Country
           bCustomer.Name
           bCustomer.Address
           bCustomer.Address2
           bCustomer.City
           bCustomer.State
           bCustomer.Contact
           bCustomer.Phone
           bCustomer.Balance
           bCustomer.Terms
           bCustomer.Discount
        WITH FRAME fEdicao1 WIDTH 100 1 COLUMN TITLE "Editar Cliente".

    /* Atualiza comentário em frame separado */
    UPDATE bCustomer.Comments FORMAT "x(60)"
        WITH FRAME fEdicao2 TITLE "Comentário" CENTERED.

END.
ELSE DO:
    MESSAGE "Cliente com código" iCodCliente "não encontrado." VIEW-AS ALERT-BOX ERROR.
END.
