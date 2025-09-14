module d_latch_improved_tb;
    reg D, CLK;
    wire Q;
    reg [8*24-1:0] name;

    d_latch_improved dut (.D(D), .CLK(CLK), .Q(Q) );

    initial begin
        name = " Kunwar Arpit Singh 22185";
        $dumpfile("assign3_problem2_d_latch.vcd");
        $dumpvars(1, d_latch_improved_tb);
        $display("Kunwar Arpit Singh");
        CLK = 1; D = 0; #10;
        CLK = 0; #10;

        CLK = 1; D = 1; #10;
        CLK = 0; #10;

        CLK = 1; D = 0; #10;
        CLK = 0; D = 1; #10;

        CLK = 1; D = 1; #10;
        CLK = 0; #10;
        
        CLK = 1; D = 0; #10;
        #10;

        CLK = 0; D = 1; #10;
        CLK = 1; D = 0; #10;

        CLK = 0; D = 0; #10;
        CLK = 1; D = 1; #10;

        CLK = 0; D = 1; #10;
        CLK = 1; D = 1; #10;

        $finish;
    end

    initial begin
        $display("| CLK | D | Q |");
        $monitor("| %b | %b | %b |", CLK, D, Q);
    end
endmodule