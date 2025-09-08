module mux_4_to_1(input [3:0] d_in, input[1:0] s, output y);
    wire s0_not, s1_not;
    wire w0, w1, w2, w3;

    not(s0_not, s[0]);
    not(s1_not, s[1]);

    and(w0, d_in[0], s0_not, s1_not);
    and(w1, d_in[1], s[0], s1_not);
    and(w2, d_in[2], s0_not, s[1]);
    and(w3, d_in[3], s[0], s[1]);

    or(y, w0, w1, w2, w3);

endmodule