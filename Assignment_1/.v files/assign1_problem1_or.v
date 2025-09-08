module or_gate_3_input (input A, input B, input C, output Y);
    wire w1;
    or g1(w1, A, B);
    or g2(Y, w1, C);
endmodule