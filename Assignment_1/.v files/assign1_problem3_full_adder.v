`include "assign1_problem3_half_adder.v"

module full_adder(input A, input B, input CIN, output SUM, output COUT);
    wire SUM1, CARRY1, CARRY2;

    half_adder HA1(A, B, SUM1, CARRY1);

    half_adder HA2(SUM1, CIN, SUM, CARRY2);

    or g1(COUT, CARRY1, CARRY2);
endmodule