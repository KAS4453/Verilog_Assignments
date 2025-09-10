module decoder_2_to_4_tb;
    reg[1:0] A;
    wire[3:0] out;
    reg[8*24-1:0] name;

    decoder_2_to_4 dut (.A(A), .out(out));

    initial begin
        name = " Kunwar Arpit Singh 22185";
        $display("Kunwar Arpit Singh");
        $dumpfile("assign2_problem2_decoder_2_to_4.vcd");
        $dumpvars(1, decoder_2_to_4_tb);
        $display("Kunwar Arpit Singh");
        $display("A (Binary & Decimal) | Output(Binary) | Output(Decimal)");
        $display("----------------------------------------------");
        A = 2'b00; #10;
        $display("%b    |   %d  |   %b  |   %d", A, A, out, out);
        A = 2'b01; #10;
        $display("%b    |   %d  |   %b  |   %d", A, A, out, out);
        A = 2'b10; #10;
        $display("%b    |   %d  |   %b  |   %d", A, A, out, out);
        A = 2'b11; #10;
        $display("%b    |   %d  |   %b  |   %d", A, A, out, out);
        $finish;
    end
endmodule