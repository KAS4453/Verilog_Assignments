module multiply_4_bit_by_2 (input [3:0] A, output [4:0] out);
  assign out = A << 1;
endmodule