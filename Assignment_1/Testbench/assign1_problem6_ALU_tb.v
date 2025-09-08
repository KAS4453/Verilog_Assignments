module simple_alu_4_bit_tb;
    reg [3:0] A;
    reg [3:0] B;
    reg [2:0] OpCode;
    wire signed [7:0] out;
    reg [8*24-1:0] name;

    simple_alu_4_bit dut (.A(A), .B(B), .OpCode(OpCode), .out(out));

    initial begin
        name = " Kunwar Arpit Singh 22185";
        $display("Kunwar Arpit Singh");
        $dumpfile("assign1_problem6_ALU_tb.vcd");
        $dumpvars(1, simple_alu_4_bit_tb);

        A = 4'b0001;
        B = 4'b0011;

        $display("A=%d, B=%d", A, B);
        $display("------------------------------------");
        $display("A (Binary & Decimal) | B (Binary & Decimal) | OpCode | Operation | Output(Binary) | Output(Decimal)");
        $display("------------------------------------");

        OpCode = 3'b000; #10;
        $display("%b    |   %d  |   %b  |   %d  |   %b  |   ADD |   %b  |   %d", A, A, B, B, OpCode, out, $signed(out[3:0]));
        OpCode = 3'b001; #10;
        $display("%b    |   %d  |   %b  |   %d  |   %b  |   SUB |   %b  |   %d", A, A, B, B, OpCode, out, $signed(out[3:0]));
        OpCode = 3'b010; #10;
        $display("%b    |   %d  |   %b  |   %d  |   %b  |   MUL |   %b  |   %d", A, A, B, B, OpCode, out, $signed(out[3:0]));
        OpCode = 3'b011; #10;
        $display("%b    |   %d  |   %b  |   %d  |   %b  |   AND |   %b  |   %d", A, A, B, B, OpCode, out, $signed(out[3:0]));
        OpCode = 3'b100; #10;
        $display("%b    |   %d  |   %b  |   %d  |   %b  |   OR  |   %b  |   %d", A, A, B, B, OpCode, out, $signed(out[3:0]));
        OpCode = 3'b101; #10;
        $display("%b    |   %d  |   %b  |   %d  |   %b  |   XOR |   %b  |   %d", A, A, B, B, OpCode, out, $signed(out[3:0]));


        A = 4'b1000;
        B = 4'b0011;

        $display("A=%d, B=%d", A, B);
        $display("------------------------------------");
        $display("A (Binary & Decimal) | B (Binary & Decimal) | OpCode | Operation | Output(Binary) | Output(Decimal)");
        $display("------------------------------------");

        OpCode = 3'b000; #10;
        $display("%b    |   %d  |   %b  |   %d  |   %b  |   ADD |   %b  |   %d", A, A, B, B, OpCode, out, $signed(out));
        OpCode = 3'b001; #10;
        $display("%b    |   %d  |   %b  |   %d  |   %b  |   SUB |   %b  |   %d", A, A, B, B, OpCode, out, $signed(out));
        OpCode = 3'b010; #10;
        $display("%b    |   %d  |   %b  |   %d  |   %b  |   MUL |   %b  |   %d", A, A, B, B, OpCode, out, $signed(out));
        OpCode = 3'b011; #10;
        $display("%b    |   %d  |   %b  |   %d  |   %b  |   AND |   %b  |   %d", A, A, B, B, OpCode, out, $signed(out));
        OpCode = 3'b100; #10;
        $display("%b    |   %d  |   %b  |   %d  |   %b  |   OR  |   %b  |   %d", A, A, B, B, OpCode, out, $signed(out));
        OpCode = 3'b101; #10;
        $display("%b    |   %d  |   %b  |   %d  |   %b  |   XOR |   %b  |   %d", A, A, B, B, OpCode, out, $signed(out));
        $finish;
    end
endmodule
