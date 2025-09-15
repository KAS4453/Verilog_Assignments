module fsm_implementation_tb;
    reg clk;
    reg reset;
    reg x;
    wire Z;
    reg [8*24-1:0] name;

    fsm_implementation dut (.CLK(clk), .RESET(reset), .x(x), .Z(Z));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        name = " Kunwar Arpit Singh 22185";
        $display("Kunwar Arpit Singh");
        $dumpfile("assign4_problem3_FSM_implementation.vcd");
        $dumpvars(1, fsm_implementation_tb);
        $display("Kunwar Arpit Singh");
        
        reset = 1;
        x = 0;
        @(negedge clk);
        @(negedge clk);
        reset = 0;

        $display("\nFor Sequence: 1101");
        $display("| Reset | Input x | State | Output Z |");
        @(negedge clk) x = 1;
        @(negedge clk) x = 1;
        @(negedge clk) x = 0;
        @(negedge clk) x = 1;
        @(negedge clk) x = 0;

        $display("\nFor Sequence: 011010");
        $display("| Reset | Input x | State | Output Z |");
        @(negedge clk) x = 0;
        @(negedge clk) x = 1;
        @(negedge clk) x = 1;
        @(negedge clk) x = 0;
        @(negedge clk) x = 1;
        @(negedge clk) x = 0;

        $display("\nFor Sequence: 1101101");
        $display("| Reset | Input x | State | Output Z |");
        @(negedge clk) x = 1;
        @(negedge clk) x = 1;
        @(negedge clk) x = 0;
        @(negedge clk) x = 1;
        @(negedge clk) x = 1;
        @(negedge clk) x = 0;
        @(negedge clk) x = 1;
        @(negedge clk) x = 0;

        $display("\nFor Sequence: 11101");
        $display("| Reset | Input x | State | Output Z |");
        @(negedge clk) x = 1;
        @(negedge clk) x = 1;
        @(negedge clk) x = 1;
        @(negedge clk) x = 0;
        @(negedge clk) x = 1;
        @(negedge clk) x = 0;

        $display("\nFor Sequence: 0010100");
        $display("| Reset | Input x | State | Output Z |");
        @(negedge clk) x = 0;
        @(negedge clk) x = 0;
        @(negedge clk) x = 1;
        @(negedge clk) x = 0;
        @(negedge clk) x = 1;
        @(negedge clk) x = 0;
        @(negedge clk) x = 0;
        
        #20 $finish;
    end

    // Monitor with timestamps for clearer debugging
    initial begin
        $monitor("|   %b   |    %b    |   %b  |     %b    |", reset, x, dut.current_state, Z);
    end

endmodule