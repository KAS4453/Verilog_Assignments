module wallace_tree_multiplier_4_bit_tb;
    reg [3:0] A;
    reg [3:0] B;
    wire[7:0] out;
    reg [8*24-1:0] name;

    wallace_tree_multiplier_4_bit dut (.A(A), .B(B), .out(out));

    initial begin
        name = " Kunwar Arpit Singh 22185";
        A = 0;
        B = 0;

        $display("Kunwar Arpit Singh");
        $dumpfile("assign2_problem6_wallace_tree_multiplier_4_bit.vcd");
        $dumpvars(1, wallace_tree_multiplier_4_bit_tb);
        $display("Kunwar Arpit Singh");
        $display("| A(B) | A(D)| B(B) | B(D) | Product(B) | Product(D) |");
        
        A = 4'b0001; B = 4'b0001; #10;
        $display("| %b | %d | %b | %d | %b | %d |", A, A, B, B, out, out);

        A = 4'b0101; B = 4'b1010; #10;
        $display("| %b | %d | %b | %d | %b | %d |", A, A, B, B, out, out);

        A = 4'b1111; B = 4'b1111; #10;
        $display("| %b | %d | %b | %d | %b | %d |", A, A, B, B, out, out);

        A = 4'b1001; B = 4'b0111; #10;
        $display("| %b | %d | %b | %d | %b | %d |", A, A, B, B, out, out);

        A = 4'b1100; B = 4'b0011; #10;
        $display("| %b | %d | %b | %d | %b | %d |", A, A, B, B, out, out);
        
        A = 4'b0100; B = 4'b1111; #10;
        $display("| %b | %d | %b | %d | %b | %d |", A, A, B, B, out, out);

        A = 4'b0000; B = 4'b1111; #10;
        $display("| %b | %d | %b | %d | %b | %d |", A, A, B, B, out, out);
        
        $finish;
    end
endmodule