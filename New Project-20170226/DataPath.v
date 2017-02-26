//=================================================
//=================COUNTER=========================
//=================================================
module ud_counter (output reg [5:0]Q, input [5:0]D, input [1:0]M, input clr, clk);
    //solo hace algo a comando del clr y el reloj
    always @ (posedge clk, negedge clr)
        if(!clr) Q <= 6'b000000;
        else
            case (M)
                2'b00 : Q <= Q;     //hold
                2'b01 : Q <= Q + 1; //incrementar
                2'b10 : Q <= Q - 1; //disminuir
                2'b11 : Q <= D;     //parallel load
            endcase
endmodule
//=================================================
//=================SHIFTER=========================
//=================================================
module shifftreg (output reg [31:0]Q, input [31:0]D, input [1:0]M, input clr, clk);
    always @ (posedge clk, negedge clr)
        if (!clr) Q <= 32'h00000000;
        else
            case (M)
                2'b00 : Q <= Q;      //hold
                2'b01 : Q <= Q << 1; //shift left
                2'b10 : Q <= Q >> 1; //shift right
                2'b11 : Q <= D;      //parallel load
            endcase
endmodule
//=================================================
//=================DATA REG========================
//=================================================
module datareg;
endmodule