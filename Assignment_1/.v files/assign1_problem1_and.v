module and_gate_3_input (input A, input B, input C, output Y);
    wire w1;
    and g1(w1, A, B);
    and g2(Y, w1, C);
endmodule