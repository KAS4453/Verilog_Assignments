module d_latch_improved(input D, input CLK, output reg Q);
    wire CLK_n;
    wire D_and_CLK;
    wire Qprev_and_CLK_n;

    not #1 U1(CLK_n, CLK);

    and #1 U2(D_and_CLK, D, CLK);
    and #1 U3(Qprev_and_CLK_n, Q, CLK_n);

    always @(*) begin
        #1 Q = D_and_CLK | Qprev_and_CLK_n;
    end

    initial Q = 0;

endmodule