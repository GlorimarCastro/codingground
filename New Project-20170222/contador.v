//contador
module contador(output reg Q2, Q1, Q0, input u_d, clr, clk);
    always @ (posedge clk, negedge clr)
        if(!clr) {Q2, Q1, Q0} <=  3'b000;
        else
            if(u_d)  {Q2, Q1, Q0} <=  {Q2, Q1, Q0} - 1;
            else     {Q2, Q1, Q0} <=  {Q2, Q1, Q0} + 1;
endmodule