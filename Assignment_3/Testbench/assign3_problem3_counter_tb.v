module binary_counter_tb;
    reg CLK;
    reg RESET;
    wire [2:0] COUNT;
    reg [8*24-1:0] name;

    binary_counter dut (.CLK(CLK), .RESET(RESET), .COUNT(COUNT));

    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK;
    end

    initial begin
        name = " Kunwar Arpit Singh 22185";
        
        $dumpfile("assign3_problem3_counter.vcd");
        $dumpvars(1, binary_counter_tb);

        $display("Kunwar Arpit Singh");
        $display("| Reset | Clock | Count |");
        $display("----------------------");

        $monitor("| %b | %b | %b (%d) |", RESET, CLK, COUNT, COUNT);
        RESET = 1; #15;
        RESET = 0; #65;
        $finish;
    end
endmodule
