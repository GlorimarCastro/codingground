/*===========D-FLIP-FLOP===========
Tenemos que asegurarnos que solo 
cambie de valor cuando el relo esta
en una de las transiciones para que
sea un flip-flop.
Recordemos:
1. 1 input: D
2. Characteristic Table:
    D| Q(t+1)
    ----------
    0| 0 (reset)
    1| 1 (set)
3. Hace 2 de las 3 operaciones: set y reset
*/
module d_flipflop(output reg Q, output Q_n, input D, clr, clk);
    assign Q_n = ~Q;
    //always @ (posedge clk, negedge clr) //cleare asincronico
    always @ (posedge clk) //cleare sincronico
        if(!clr) Q <= 1'b0;
        else Q <= D;
endmodule