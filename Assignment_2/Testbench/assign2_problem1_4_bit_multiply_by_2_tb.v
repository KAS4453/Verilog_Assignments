module multiply_4_bit_by_2_tb;
    reg [3:0] A;
    wire [4:0] out;
    reg [8*24-1:0] name;

    multiply_4_bit_by_2 dut (.A(A), .out(out));

    initial begin
        $display("Kunwar Arpit Singh");
        name = " Kunwar Arpit Singh 22185";
        $dumpfile("assign2_problem1_4_bit_multiply_by_2.vcd");
        $dumpvars(1, multiply_4_bit_by_2_tb);
        $display("Kunwar Arpit Singh");

        $display("A (Binary & Decimal) | Output(Binary) | Output(Decimal)");
        $display("----------------------------------------------");

        A = 4'b0000; #10;
        $display("%b    |   %d  |   %b  |   %d", A, A, out, out);
        A = 4'b0001; #10;
        $display("%b    |   %d  |   %b  |   %d", A, A, out, out);
        A = 4'b0010; #10;
        $display("%b    |   %d  |   %b  |   %d", A, A, out, out);
        A = 4'b0011; #10;
        $display("%b    |   %d  |   %b  |   %d", A, A, out, out);
        A = 4'b0100; #10;
        $display("%b    |   %d  |   %b  |   %d", A, A, out, out);
        A = 4'b0101; #10;
        $display("%b    |   %d  |   %b  |   %d", A, A, out, out);
        A = 4'b0110; #10;
        $display("%b    |   %d  |   %b  |   %d", A, A, out, out);
        A = 4'b0111; #10;
        $display("%b    |   %d  |   %b  |   %d", A, A, out, out);
        A = 4'b1000; #10;
        $display("%b    |   %d  |   %b  |   %d", A, A, out, out);
        A = 4'b1001; #10;
        $display("%b    |   %d  |   %b  |   %d", A, A, out, out);
        A = 4'b1010; #10;
        $display("%b    |   %d  |   %b  |   %d", A, A, out, out);
        A = 4'b1011; #10;
        $display("%b    |   %d  |   %b  |   %d", A, A, out, out);
        A = 4'b1100; #10;
        $display("%b    |   %d  |   %b  |   %d", A, A, out, out);
        A = 4'b1101; #10;
        $display("%b    |   %d  |   %b  |   %d", A, A, out, out);
        A = 4'b1110; #10;
        $display("%b    |   %d  |   %b  |   %d", A, A, out, out);
        A = 4'b1111; #10;
        $display("%b    |   %d  |   %b  |   %d", A, A, out, out);
        $finish;
    end
endmodule    