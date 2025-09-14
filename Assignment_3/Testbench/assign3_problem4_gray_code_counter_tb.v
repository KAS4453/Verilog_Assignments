module gray_counter_tb;
    reg CLK;
    reg RESET;
    reg UP;
    wire [2:0] GRAYout;
    reg [8*24-1:0] name;
    gray_counter dut (.CLK(CLK), .RESET(RESET), .UP(UP), .GRAYout(GRAYout));

    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK;
    end

    initial begin
        name = " Kunwar Arpit Singh 22185";
        $dumpfile("assign3_problem4_gray_code_counter.vcd");
        $dumpvars(1, gray_counter_tb);

        $display("Kunwar Arpit Singh");
        $display("| Reset | UP | Gray Output |");
        $display("----------------------------");
        $monitor("|   %b   |  %b |    %b (%d)   |", RESET, UP, GRAYout, GRAYout);

        RESET = 1; UP = 0; #20;
        RESET = 0; #5;
        
        UP = 1; #70;

        UP = 0; #40;

        UP = 1; #30;
        $finish;
    end
endmodule