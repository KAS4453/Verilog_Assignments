module half_subtractor (input A, input B, output diff, output borrow_out);

    xor g1(diff, A, B);
    wire not_A;
    not g2(not_A, A);
    and g3(borrow_out, not_A, B);
endmodule