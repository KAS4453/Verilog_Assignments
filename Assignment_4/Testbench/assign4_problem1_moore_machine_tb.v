module moore_machine_tb;

    reg clk;
    reg reset;
    reg A;
    reg B;
    wire Q;
    reg [8*24-1:0] name;

    moore_machine dut (.CLK(clk), .RESET(reset), .A(A), .B(B), .Q(Q));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        name = " Kunwar Arpit Singh 22185";
        $display("Kunwar Arpit Singh");
        $dumpfile("assign4_problem1_moore_machine.vcd");
        $dumpvars(1, moore_machine_tb);
        $display("Kunwar Arpit Singh");

        $display("| CLK | RESET | A | B | State | Output Q  |");
        $monitor("|  %b  |   %b   | %b | %b |   %b   |     %b     |", clk, reset, A, B, dut.current_state, Q);

        reset = 1; A = 0; B = 0;
        @(posedge clk);
        @(posedge clk);

        reset = 0;
        @(posedge clk);

        A = 0; B = 1;
        $display("For S0 -> S0 (A=0)");
        $display("| CLK | RESET | A | B |  State | Output Q  |");
        @(posedge clk);

        A = 1; B = 0;
        $display("For S0 -> S1 (A=1)");
        $display("| CLK | RESET | A | B |  State | Output Q  |");
        @(posedge clk);

        A = 1; B = 0;
        $display("For S1 -> S0 (B=0)");
        $display("| CLK | RESET | A | B |  State | Output Q  |");
        @(posedge clk);

        A = 1; B = 0;
        $display("For transition to S1");
        $display("| CLK | RESET | A | B |  State | Output Q  |");
        @(posedge clk);

        A = 0; B = 1;
        $display("For S1 -> S2 (B=1)");
        $display("| CLK | RESET | A | B |  State | Output Q  |");
        @(posedge clk);

        A = 1; B = 1;
        $display("For S2 -> S0 (unconditional)");
        $display("| CLK | RESET | A | B |  State | Output Q  |"); 
        @(posedge clk);

        @(posedge clk);
        @(posedge clk);
        $finish;
    end
endmodule