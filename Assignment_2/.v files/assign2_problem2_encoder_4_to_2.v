module encoder_4_to_2 (input [3:0] A, output [1:0] out);
    assign out = (A == 4'b1000) ? 2'b11 :
                 (A == 4'b0100) ? 2'b10 :
                 (A == 4'b0010) ? 2'b01 :
                 (A == 4'b0001) ? 2'b00 : 2'bxx;
endmodule
