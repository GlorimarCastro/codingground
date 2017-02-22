/*===========JK-FLIP-FLOP===========
Tenemos que asegurarnos que solo 
cambie de valor cuando el relo esta
en una de las transiciones para que
sea un flip-flop.
Recordemos:
1. 2 input: J K
2. Characteristic Table:
    J K| Q(t+1)
    ----------
    0 0| Q(t)  
    0 1| 0     (reset)
    1 0| 1     (set)
    1 1| Q(t)' 
3. Hace 3 de las 3 operaciones: 
        complemento, set y reset
*/
module jk_ff (output reg  Q, output Q_n, input J, K, clr, clk);
    assign Q_n = ~Q;
    always @ (posedge clk, negedge clr) //este tiene un clear asincronico y cambia si clr es 0
        if (!clr) Q <= 1'b0;
        else 
            case ({J,K})
                2'b00 : Q <= Q;
                2'b01 : Q <= 1'b0;
                2'b10 : Q <= 1'b1;
                2'b11 : Q <= !Q;
            endcase
endmodule