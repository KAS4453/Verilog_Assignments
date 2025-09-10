module wallace_tree_multiplier_4_bit(input [3:0] A, input [3:0] B, output [7:0] out);

    wire PP_00, PP_01, PP_02, PP_03;
    wire PP_10, PP_11, PP_12, PP_13;
    wire PP_20, PP_21, PP_22, PP_23;
    wire PP_30, PP_31, PP_32, PP_33;

    assign PP_00 = A[0] & B[0];
    assign PP_01 = A[0] & B[1];
    assign PP_02 = A[0] & B[2];
    assign PP_03 = A[0] & B[3];
    
    assign PP_10 = A[1] & B[0];
    assign PP_11 = A[1] & B[1];
    assign PP_12 = A[1] & B[2];
    assign PP_13 = A[1] & B[3];

    assign PP_20 = A[2] & B[0];
    assign PP_21 = A[2] & B[1];
    assign PP_22 = A[2] & B[2];
    assign PP_23 = A[2] & B[3];

    assign PP_30 = A[3] & B[0];
    assign PP_31 = A[3] & B[1];
    assign PP_32 = A[3] & B[2];
    assign PP_33 = A[3] & B[3];

    wire S1_1, C1_1;
    wire S2_1, C2_1;
    wire S3_1, C3_1;
    wire S4_1, C4_1;
    wire S5_1, C5_1;
    wire S6_1, C6_1;
    
    wire S2_2, C2_2;
    wire S3_2, C3_2;
    wire S4_2, C4_2;
    wire S5_2, C5_2;
    wire C6_sum_final, C6_carry_final;
    wire S3_temp, C3_temp, C3_temp2, C_to_C5;

    assign S1_1 = PP_01 ^ PP_10;
    assign C1_1 = PP_01 & PP_10;
    
    assign S2_1 = PP_02 ^ PP_11 ^ PP_20;
    assign C2_1 = (PP_02 & PP_11) | (PP_11 & PP_20) | (PP_02 & PP_20);
    
    assign S3_temp = PP_03 ^ PP_12 ^ PP_21;
    assign C3_temp = (PP_03 & PP_12) | (PP_12 & PP_21) | (PP_03 & PP_21);
    assign S3_1 = S3_temp ^ PP_30;
    assign C3_temp2 = S3_temp & PP_30;
    assign C3_1 = C3_temp ^ C3_temp2;
    assign C_to_C5 = C3_temp & C3_temp2;
    
    assign S4_1 = PP_13 ^ PP_22 ^ PP_31;
    assign C4_1 = (PP_13 & PP_22) | (PP_22 & PP_31) | (PP_13 & PP_31);
    
    assign S5_1 = PP_23 ^ PP_32;
    assign C5_1 = PP_23 & PP_32;
    
    assign S6_1 = PP_33;
    assign C6_1 = 1'b0;
    
    assign S2_2 = S2_1 ^ C1_1;
    assign C2_2 = S2_1 & C1_1;
    
    assign S3_2 = S3_1 ^ C2_1;
    assign C3_2 = S3_1 & C2_1;
    
    assign S4_2 = S4_1 ^ C3_1;
    assign C4_2 = S4_1 & C3_1;
    
    assign S5_2 = S5_1 ^ C4_1;
    assign C5_2 = S5_1 & C4_1;

    assign C6_sum_final = C5_1 ^ C5_2;
    assign C6_carry_final = C5_1 & C5_2;

    wire [7:0] VEC1, VEC2;
    
    assign VEC1[0] = PP_00;
    assign VEC1[1] = S1_1;
    assign VEC1[2] = S2_2;
    assign VEC1[3] = S3_2;
    assign VEC1[4] = S4_2;
    assign VEC1[5] = S5_2;
    assign VEC1[6] = S6_1;
    assign VEC1[7] = C6_carry_final;

    assign VEC2[0] = 1'b0;
    assign VEC2[1] = 1'b0;
    assign VEC2[2] = 1'b0;
    assign VEC2[3] = C2_2;
    assign VEC2[4] = C3_2;
    assign VEC2[5] = C4_2 | C_to_C5;
    assign VEC2[6] = C6_sum_final;
    assign VEC2[7] = 1'b0;

    assign out = VEC1 + VEC2;

endmodule