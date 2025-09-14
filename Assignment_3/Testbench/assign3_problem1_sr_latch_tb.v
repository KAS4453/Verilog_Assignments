module sr_latch_tb;
    reg S;
    reg R;
    reg en;
    reg reset;
    wire Q;
    wire Q_n;
    reg [8*24-1:0] name;
    sr_latch dut (.S(S), .R(R), .en(en), .reset(reset), .Q(Q), .Q_n(Q_n));

    initial begin
        name = " Kunwar Arpit Singh 22185";
        $display("Kunwar Arpit Singh");
        $dumpfile("assign3_problem1_sr_latch.vcd");
        $dumpvars(1, sr_latch_tb);
        $display("Kunwar Arpit Singh");

        $display("| reset | en | S | R | Q |  Q_n |");
        $display("---------------------------------");

        reset = 1'b1; S = 1'b0; R = 1'b0; en = 1'b0; #10;
        $display("|   %b   | %b  | %b | %b | %b |  %b  |",reset, en, S, R, Q, Q_n);

        reset = 1'b0; S = 1'b0; R = 1'b0; en = 1'b0; #10;
        $display("|   %b   | %b  | %b | %b | %b |  %b  |",reset, en, S, R, Q, Q_n);

        reset = 1'b0; S = 1'b0; R = 1'b0; en = 1'b1; #10;
        $display("|   %b   | %b  | %b | %b | %b |  %b  |",reset, en, S, R, Q, Q_n);

        reset = 1'b0; S = 1'b0; R = 1'b1; en = 1'b1; #10;
        $display("|   %b   | %b  | %b | %b | %b |  %b  |",reset, en, S, R, Q, Q_n);

        reset = 1'b0; S = 1'b0; R = 1'b0; en = 1'b1; #10;
        $display("|   %b   | %b  | %b | %b | %b |  %b  |",reset, en, S, R, Q, Q_n);

        reset = 1'b0; S = 1'b1; R = 1'b0; en = 1'b1; #10;
        $display("|   %b   | %b  | %b | %b | %b |  %b  |",reset, en, S, R, Q, Q_n);
        
        reset = 1'b0; S = 1'b0; R = 1'b0; en = 1'b1; #10;
        $display("|   %b   | %b  | %b | %b | %b |  %b  |",reset, en, S, R, Q, Q_n);

        reset = 1'b0; S = 1'b1; R = 1'b1; en = 1'b1; #10;
        $display("|   %b   | %b  | %b | %b | %b |  %b  |",reset, en, S, R, Q, Q_n);

        $finish;
    end
endmodule