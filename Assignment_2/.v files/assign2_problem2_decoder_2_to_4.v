module decoder_2_to_4(input [1:0] A, output [3:0] out);
    assign out = (A == 2'b00) ? 4'b0001 :
                 (A == 2'b01) ? 4'b0010 :
                 (A == 2'b10) ? 4'b0100 :
                 (A == 2'b11) ? 4'b1000 : 4'bxxxx;
endmodule