/* i-mostra.i */
FOR EACH {&table}
&IF "{&ord}" <> "" &THEN
          BY {&table}.{&ord}
&ENDIF
          :
          DISPLAY {&table}.{&field1}
&IF "{&field2}" <> "" &THEN
                    {&table}.{&field2}
&ENDIF
                .
END.
