module half_adder(input A, input B, output SUM, output CARRY);

    xor(SUM, A, B);
    and(CARRY, A, B);
endmodule

module full_adder(input A, input B, input CIN, output SUM, output COUT);
    wire SUM1, CARRY1, CARRY2;

    half_adder HA1(A, B, SUM1, CARRY1);

    half_adder HA2(SUM1, CIN, SUM, CARRY2);

    or g1(COUT, CARRY1, CARRY2);
endmodule

module mux_8_to_1_bit (input d0, d1, d2, d3, d4, d5, d6, d7, input [2:0] sel, output out);
    wire s0not, s1not, s2not;
    wire w0, w1, w2, w3, w4, w5, w6, w7;
    not (s0not, sel[0]);
    not (s1not, sel[1]);
    not (s2not, sel[2]);

    and(w0, d0, s2not, s1not, s0not);
    and(w1, d1, s2not, s1not, sel[0]);
    and(w2, d2, s2not, sel[1], s0not);
    and(w3, d3, s2not, sel[1], sel[0]);
    and(w4, d4, sel[2], s1not, s0not);
    and(w5, d5, sel[2], s1not, sel[0]);
    and(w6, d6, sel[2], sel[1], s0not);
    and(w7, d7, sel[2], sel[1], sel[0]);

    or(out, w0, w1, w2, w3, w4, w5, w6, w7);

endmodule

module four_bit_adder(input [3:0] A, input [3:0] B, input CARRYIN, output [3:0] SUM, output CARRYOUT);

    wire C1, C2, C3;

    full_adder FA0(A[0], B[0], CARRYIN, SUM[0], C1);
    full_adder FA1(A[1], B[1], C1, SUM[1], C2);
    full_adder FA2(A[2], B[2], C2, SUM[2], C3);
    full_adder FA3(A[3], B[3], C3, SUM[3], CARRYOUT);
endmodule

module four_bit_subtractor (input [3:0] A, input [3:0] B, output [3:0] DIFFERENCE);
    wire [3:0] B_COMPLEMENT;
    wire CARRYOUT;
    not (B_COMPLEMENT[0], B[0]);
    not (B_COMPLEMENT[1], B[1]);
    not (B_COMPLEMENT[2], B[2]);
    not (B_COMPLEMENT[3], B[3]);

    four_bit_adder SUBTRACTOR_ADDER (A, B_COMPLEMENT, 1'b1, DIFFERENCE, CARRYOUT);
endmodule

module four_by_four_multiplier (
    input  [3:0] A,
    input  [3:0] B,
    output [7:0] PRODUCT
);
    wire [3:0] PP0, PP1, PP2, PP3;

    and (PP0[0], A[0], B[0]);
    and (PP0[1], A[1], B[0]);
    and (PP0[2], A[2], B[0]);
    and (PP0[3], A[3], B[0]);

    and (PP1[0], A[0], B[1]);
    and (PP1[1], A[1], B[1]);
    and (PP1[2], A[2], B[1]);
    and (PP1[3], A[3], B[1]);

    and (PP2[0], A[0], B[2]);
    and (PP2[1], A[1], B[2]);
    and (PP2[2], A[2], B[2]);
    and (PP2[3], A[3], B[2]);

    and (PP3[0], A[0], B[3]);
    and (PP3[1], A[1], B[3]);
    and (PP3[2], A[2], B[3]);
    and (PP3[3], A[3], B[3]);

    wire c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11;
    wire s1, s2, s3, s4, s5, s6;

    assign PRODUCT[0] = PP0[0];

    half_adder HA1 (PP0[1], PP1[0], PRODUCT[1], c1);

    full_adder FA1 (PP0[2], PP1[1], c1, s1, c2);
    half_adder HA2 (s1, PP2[0], PRODUCT[2], c3);

    full_adder FA2 (PP0[3], PP1[2], c2, s2, c4);
    full_adder FA3 (s2, PP2[1], c3, PRODUCT[3], c5);

    full_adder FA4 (PP1[3], PP2[2], c4, s3, c6);
    full_adder FA5 (s3, PP3[0], c5, PRODUCT[4], c7);

    full_adder FA6 (PP2[3], PP3[1], c6, s4, c8);
    full_adder FA7 (s4, c7, 1'b0, PRODUCT[5], c9);

    full_adder FA8 (PP3[2], c8, c9, PRODUCT[6], c10);

    full_adder FA9 (PP3[3], c10, 1'b0, PRODUCT[7], c11);

endmodule


module four_bit_and (input [3:0] A, input [3:0] B, output [3:0] out);
    and(out[0], A[0], B[0]);
    and(out[1], A[1], B[1]);
    and(out[2], A[2], B[2]);
    and(out[3], A[3], B[3]);
endmodule

module four_bit_or(input [3:0] A, input [3:0] B, output [3:0] out);
    or(out[0], A[0], B[0]);
    or(out[1], A[1], B[1]);
    or(out[2], A[2], B[2]);
    or(out[3], A[3], B[3]);
endmodule

module four_bit_xor(input [3:0] A, input [3:0] B, output [3:0] out);
    xor(out[0], A[0], B[0]);
    xor(out[1], A[1], B[1]);
    xor(out[2], A[2], B[2]);
    xor(out[3], A[3], B[3]);
endmodule

module simple_alu_4_bit (input [3:0] A, input [3:0] B, input [2:0] OpCode, output [7:0] out);
    wire [7:0] ADDER_OUT;
    wire [7:0] SUBTRACTOR_OUT;
    wire [7:0] MULTIPLIER_OUT;
    wire [7:0] AND_OUT;
    wire [7:0] OR_OUT;
    wire [7:0] XOR_OUT;
    wire CARRYOUT;

    four_bit_adder adder_unit(A, B, 1'b0, ADDER_OUT[3:0], CARRYOUT);
    four_bit_subtractor subtractor_unit(A, B, SUBTRACTOR_OUT[3:0]);
    four_by_four_multiplier multiplier_unit(A, B, MULTIPLIER_OUT);
    four_bit_and and_unit(A, B, AND_OUT[3:0]);
    four_bit_or or_unit(A, B, OR_OUT[3:0]);
    four_bit_xor xor_unit(A, B, XOR_OUT[3:0]);

    assign ADDER_OUT[7:4] = {3'b000, CARRYOUT};
    assign SUBTRACTOR_OUT[7:4] = 4'b0;
    assign AND_OUT[7:4] = 4'b0;
    assign OR_OUT[7:4] = 4'b0;
    assign XOR_OUT[7:4] = 4'b0;

    mux_8_to_1_bit MUX0 (ADDER_OUT[0], SUBTRACTOR_OUT[0], MULTIPLIER_OUT[0], AND_OUT[0], OR_OUT[0], XOR_OUT[0], 1'b0, 1'b0, OpCode, out[0]);
    mux_8_to_1_bit MUX1 (ADDER_OUT[1], SUBTRACTOR_OUT[1], MULTIPLIER_OUT[1], AND_OUT[1], OR_OUT[1], XOR_OUT[1], 1'b0, 1'b0, OpCode, out[1]);
    mux_8_to_1_bit MUX2 (ADDER_OUT[2], SUBTRACTOR_OUT[2], MULTIPLIER_OUT[2], AND_OUT[2], OR_OUT[2], XOR_OUT[2], 1'b0, 1'b0, OpCode, out[2]);
    mux_8_to_1_bit MUX3 (ADDER_OUT[3], SUBTRACTOR_OUT[3], MULTIPLIER_OUT[3], AND_OUT[3], OR_OUT[3], XOR_OUT[3], 1'b0, 1'b0, OpCode, out[3]);
    mux_8_to_1_bit MUX4 (ADDER_OUT[4], SUBTRACTOR_OUT[4], MULTIPLIER_OUT[4], AND_OUT[4], OR_OUT[4], XOR_OUT[4], 1'b0, 1'b0, OpCode, out[4]);
    mux_8_to_1_bit MUX5 (ADDER_OUT[5], SUBTRACTOR_OUT[5], MULTIPLIER_OUT[5], AND_OUT[5], OR_OUT[5], XOR_OUT[5], 1'b0, 1'b0, OpCode, out[5]);
    mux_8_to_1_bit MUX6 (ADDER_OUT[6], SUBTRACTOR_OUT[6], MULTIPLIER_OUT[6], AND_OUT[6], OR_OUT[6], XOR_OUT[6], 1'b0, 1'b0, OpCode, out[6]);
    mux_8_to_1_bit MUX7 (ADDER_OUT[7], SUBTRACTOR_OUT[7], MULTIPLIER_OUT[7], AND_OUT[7], OR_OUT[7], XOR_OUT[7], 1'b0, 1'b0, OpCode, out[7]);
endmodule