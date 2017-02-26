module cont_test;
    reg u_d, clr, clk; //senales que seran controlada tienen que ser registro
    wire [2:0] Q;
    u_dCounter contador(Q[2], Q[1], Q[0], u_d, clr, clk);
    initial #300 $finish;
    reloj clock (clk, 50, 5);
    initial fork
        clr = 0; #3 clr =1; #223 clr = 0; #233 clr = 1;
        u_d = 1; #100 u_d = 0;
    join
    initial begin
        $display(" clr  u_d  Q2  Q1  Q0  time");
        $monitor(" %b  %b  %b  %b  %b  %d", clr, u_d, Q[2], Q[1], Q[0], $time);
    end
endmodule


