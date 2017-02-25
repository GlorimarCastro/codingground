module clock (output reg clk, input repeatTime, selectedDelay);
    initial begin
        clk = 1'b0;
        if(repeatTime)
            repeat (repeatTime)
            #selectedDelay  clk <= ~clk;
        else //forever
            forever #selectedDelay clk <= ~clk;
    end
endmodule