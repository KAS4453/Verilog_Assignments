module mealy_machine_tb;

    reg clk;
    reg reset;
    reg A;
    reg B;
    wire Y;
    reg [8*24-1:0] name;
    mealy_machine dut (.CLK(clk), .RESET(reset), .A(A), .B(B), .Y(Y));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        name = " Kunwar Arpit Singh 22185";
        $display("Kunwar Arpit Singh");
        $dumpfile("assign4_problem2_mealy_machine.vcd");
        $dumpvars(1, mealy_machine_tb);
        $display("Kunwar Arpit Singh");
        $display("| Reset | A | B |  State |  Output Y |");
        $monitor("|   %b   | %b | %b |   %b   |     %b     |", reset, A, B, dut.current_state, Y);

        reset = 1; A = 0; B = 0;
        #15;

        reset = 0;
        #10;

        A = 0; B = 0; #10;
        A = 1; B = 0; #10;

        A = 1; B = 0; #10;
        A = 1; B = 0; #10;
        A = 0; B = 1; #10;

        A = 1; B = 1; #10;
        A = 1; B = 1; #10;

        A = 0; B = 1; #10;

        A = 1; B = 0; #10;
        A = 0; B = 1; #10;

        A = 1; B = 0; #10;

        #20;
        $finish;
    end

endmodule