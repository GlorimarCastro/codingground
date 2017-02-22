/*
=================D-LATCH==================
Como es un latch el mismo siempre cambiara
a si el reloj esta en uno no cuando ocurre
el trigger
*/
module D_latch (output reg Q, input D, Enable);
    always @ (D, Enable)
        if (Enable) Q<=D;  //el simbolo <= es una asignacion non bloking
endmodule