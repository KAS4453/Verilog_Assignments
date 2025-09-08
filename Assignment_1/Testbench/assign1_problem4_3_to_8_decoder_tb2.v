module decoder_3_to_8_tb;
    reg d0, d1, d2;
    wire y0, y1, y2, y3, y4, y5, y6, y7;
    reg [8*24-1:0] name;
    decoder_3_to_8 dut (.d({d2, d1, d0}), .y({y7, y6, y5, y4, y3, y2, y1, y0}));

    initial begin
        name = " Kunwar Arpit Singh 22185";
        $display("Kunwar Arpit Singh");
        $dumpfile("assign1_problem4_3_to_8_decoder.vcd");
        $dumpvars(1, decoder_3_to_8_tb);

        $display("d2 | d1 | d0 || y7 | y6 | y5 | y4 | y3 | y2 | y1 | y0");
        $display("-------------------------------");
        d0 = 1'b0; d1 = 1'b0; d2 = 1'b0; #10;
        $display("%b  | %b  | %b  || %b | %b | %b | %b | %b | %b | %b | %b", d2, d1, d0, y7, y6, y5, y4, y3, y2, y1, y0);
        d0 = 1'b1; d1 = 1'b0; d2 = 1'b0; #10;
        $display("%b  | %b  | %b  || %b | %b | %b | %b | %b | %b | %b | %b", d2, d1, d0, y7, y6, y5, y4, y3, y2, y1, y0);
        d0 = 1'b0; d1 = 1'b1; d2 = 1'b0; #10;
        $display("%b  | %b  | %b  || %b | %b | %b | %b | %b | %b | %b | %b", d2, d1, d0, y7, y6, y5, y4, y3, y2, y1, y0);
        d0 = 1'b1; d1 = 1'b1; d2 = 1'b0; #10;
        $display("%b  | %b  | %b  || %b | %b | %b | %b | %b | %b | %b | %b", d2, d1, d0, y7, y6, y5, y4, y3, y2, y1, y0);
        d0 = 1'b0; d1 = 1'b0; d2 = 1'b1; #10;
        $display("%b  | %b  | %b  || %b | %b | %b | %b | %b | %b | %b | %b", d2, d1, d0, y7, y6, y5, y4, y3, y2, y1, y0);
        d0 = 1'b1; d1 = 1'b0; d2 = 1'b1; #10;
        $display("%b  | %b  | %b  || %b | %b | %b | %b | %b | %b | %b | %b", d2, d1, d0, y7, y6, y5, y4, y3, y2, y1, y0);
        d0 = 1'b0; d1 = 1'b1; d2 = 1'b1; #10;
        $display("%b  | %b  | %b  || %b | %b | %b | %b | %b | %b | %b | %b", d2, d1, d0, y7, y6, y5, y4, y3, y2, y1, y0);
        d0 = 1'b1; d1 = 1'b1; d2 = 1'b1; #10;
        $display("%b  | %b  | %b  || %b | %b | %b | %b | %b | %b | %b | %b", d2, d1, d0, y7, y6, y5, y4, y3, y2, y1, y0);
    end
endmodule