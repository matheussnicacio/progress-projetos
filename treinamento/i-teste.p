/* i-teste.i */
 
 
{ i-mostra.i &table="customer" &field1="Name"}
 
{ i-mostra.i &table="salesrep" 
&field1="RepName"
&field2="salesrep"
&ord="RepName"}
{i-mostra.i &table="order"
&field1="ordernum"}
 
/* i-mostra.i */
 
 
//FOR EACH {&table}:
//            DISPLAY {&table}.{&field}.
//END.
