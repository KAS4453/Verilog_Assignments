module half_adder_tb;

    reg A, B;
    wire SUM, CARRY;
    reg [8*24-1:0] name;
    half_adder dut (A, B, SUM, CARRY);

    initial begin
        name = " Kunwar Arpit Singh 22185";
        $display("Kunwar Arpit Singh");
        
        $dumpfile("assign1_problem3_half_adder.vcd");
        $dumpvars(1, half_adder_tb);

        $display("Kunwar Arpit Singh");

        $display("A | B | CARRY | SUM");
        $display("-------------------");

        A = 0 ; B = 0 ; #10;
        $display("%b | %b |   %b   |  %b", A, B, CARRY, SUM);

        A = 0 ; B = 1 ; #10;
        $display("%b | %b |   %b   |  %b", A, B, CARRY, SUM);

        A = 1 ; B = 0 ; #10;
        $display("%b | %b |   %b   |  %b", A, B, CARRY, SUM);

        A = 1 ; B = 1 ; #10;
        $display("%b | %b |   %b   |  %b", A, B, CARRY, SUM);

        $finish;
    end
endmodule