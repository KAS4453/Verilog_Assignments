module comparator_1_bit(input A, input B, output eq, output gt, output lt);
    xnor(eq, A, B);
    and(gt, A, ~B);
    and(lt, ~A, B);
endmodule

module comparator_4_bit(input [3:0] A, input [3:0] B, output a_eq_b, output a_gt_b, output a_lt_b);
    wire [3:0] eq, gt, lt;

    comparator_1_bit comp0(A[0], B[0], eq[0], gt[0], lt[0]);
    comparator_1_bit comp1(A[1], B[1], eq[1], gt[1], lt[1]);
    comparator_1_bit comp2(A[2], B[2], eq[2], gt[2], lt[2]);
    comparator_1_bit comp3(A[3], B[3], eq[3], gt[3], lt[3]);

    assign a_eq_b = eq[0] & eq[1] & eq[2] & eq[3];
    assign a_gt_b = gt[0] | (eq[0] & gt[1]) | (eq[0] & eq[1] & gt[2]) | (eq[0] & eq[1] & eq[2] & gt[3]);
    assign a_lt_b = lt[0] | (eq[0] & lt[1]) | (eq[0] & eq[1] & lt[2]) | (eq[0] & eq[1] & eq[2] & lt[3]);
endmodule