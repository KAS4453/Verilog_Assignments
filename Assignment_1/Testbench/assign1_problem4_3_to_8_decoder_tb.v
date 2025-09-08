module decoder_3_to_8_tb;
    reg[2:0] d;
    wire[7:0] y;
    reg [8*24-1:0] name;

    decoder_3_to_8 dut (d, y);

    initial begin
        name = " Kunwar Arpit Singh 22185";
        $display("Kunwar Arpit Singh");
        $dumpfile("assign1_problem4_3_to_8_decoder.vcd");
        $dumpvars(1, decoder_3_to_8_tb);

        $display("d2 | d1 | d0 || y7 | y6 | y5 | y4 | y3 | y2 | y1 | y0");
        $display("-------------------------------");
        d = 3'b000; #10;
        $display("%b  | %b  | %b  || %b | %b | %b | %b | %b | %b | %b | %b", d[2], d[1], d[0], y[7], y[6], y[5], y[4], y[3], y[2], y[1], y[0]);
        d = 3'b001; #10;
        $display("%b  | %b  | %b  || %b | %b | %b | %b | %b | %b | %b | %b", d[2], d[1], d[0], y[7], y[6], y[5], y[4], y[3], y[2], y[1], y[0]);
        d = 3'b010; #10;
        $display("%b  | %b  | %b  || %b | %b | %b | %b | %b | %b | %b | %b", d[2], d[1], d[0], y[7], y[6], y[5], y[4], y[3], y[2], y[1], y[0]);
        d = 3'b011; #10;
        $display("%b  | %b  | %b  || %b | %b | %b | %b | %b | %b | %b | %b", d[2], d[1], d[0], y[7], y[6], y[5], y[4], y[3], y[2], y[1], y[0]);
        d = 3'b100; #10;
        $display("%b  | %b  | %b  || %b | %b | %b | %b | %b | %b | %b | %b", d[2], d[1], d[0], y[7], y[6], y[5], y[4], y[3], y[2], y[1], y[0]);
        d = 3'b101; #10;
        $display("%b  | %b  | %b  || %b | %b | %b | %b | %b | %b | %b | %b", d[2], d[1], d[0], y[7], y[6], y[5], y[4], y[3], y[2], y[1], y[0]);
        d = 3'b110; #10;
        $display("%b  | %b  | %b  || %b | %b | %b | %b | %b | %b | %b | %b", d[2], d[1], d[0], y[7], y[6], y[5], y[4], y[3], y[2], y[1], y[0]);
        d = 3'b111; #10;
        $display("%b  | %b  | %b  || %b | %b | %b | %b | %b | %b | %b | %b", d[2], d[1], d[0], y[7], y[6], y[5], y[4], y[3], y[2], y[1], y[0]);
    end
endmodule