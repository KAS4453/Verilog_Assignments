module carry_look_ahead_adder_4_bit_tb;
    reg [3:0] A;
    reg [3:0] B;
    reg C_IN;
    wire [3:0] SUM;
    wire C_OUT;
    reg [8*24-1:0] name;
    carry_look_ahead_adder_4_bit dut (.A(A), .B(B), .C_IN(C_IN), .SUM(SUM), .C_OUT(C_OUT));

    initial begin
        name = " Kunwar Arpit Singh 22185";
        
        $display("Kunwar Arpit Singh");
        $dumpfile("assign2_problem5_carry_look_ahead_adder_4_bit.vcd");
        $dumpvars(1, carry_look_ahead_adder_4_bit_tb);
        $display("Outputs for some sample input (in both Binary and Decimal)");
        $display("A(B)| A(D)| B(D) |B(D)|  Cin | Cout | Sum");
        $display("---------------------------------");
        A=4'b0101; B = 4'b0010; C_IN = 1'b0; #10;
        $display("%04b | %d | %04b | %d | %b | %d | %b | %d | %04b | %d | ", A, A, B, B, C_IN, C_IN, C_OUT, C_OUT, SUM, SUM);
        A=4'b1010; B = 4'b1000; C_IN = 1'b0; #10;
        $display("%04b | %d | %04b | %d | %b | %d | %b | %d | %04b | %d | ", A, A, B, B, C_IN, C_IN, C_OUT, C_OUT, SUM, SUM);
        A=4'b1001; B = 4'b0011; C_IN = 1'b1; #10;
        $display("%04b | %d | %04b | %d | %b | %d | %b | %d | %04b | %d | ", A, A, B, B, C_IN, C_IN, C_OUT, C_OUT, SUM, SUM);
        A=4'b1111; B = 4'b0000; C_IN = 1'b1; #10;
        $display("%04b | %d | %04b | %d | %b | %d | %b | %d | %04b | %d | ", A, A, B, B, C_IN, C_IN, C_OUT, C_OUT, SUM, SUM);
        A=4'b1111; B = 4'b1111; C_IN = 1'b1; #10;
        $display("%04b | %d | %04b | %d | %b | %d | %b | %d | %04b | %d | ", A, A, B, B, C_IN, C_IN, C_OUT, C_OUT, SUM, SUM);
        $finish;
    end
endmodule