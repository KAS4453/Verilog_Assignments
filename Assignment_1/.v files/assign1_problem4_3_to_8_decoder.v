module decoder_3_to_8(input [2:0] d, output [7:0] y);

    wire d0_not, d1_not, d2_not;

    not (d0_not, d[0]);
    not (d1_not, d[1]);
    not (d2_not, d[2]);

    and (y[0], d0_not, d1_not, d2_not);
    and (y[1], d[0], d1_not, d2_not);
    and (y[2], d0_not, d[1], d2_not);
    and (y[3], d[0], d[1], d2_not);
    and (y[4], d0_not, d1_not, d[2]);
    and (y[5], d[0], d1_not, d[2]);
    and (y[6], d0_not, d[1], d[2]);
    and (y[7], d[0], d[1], d[2]);

endmodule