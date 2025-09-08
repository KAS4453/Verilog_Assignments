`include "assign1_problem3_half_subtractor.v"
module full_subtractor (input A, input B, input borrow_in, output diff, output borrow_out);
    
    wire diff1, borrow1, borrow2;

    half_subtractor hs1 (.A(A), .B(B), .diff(diff1), .borrow_out(borrow1));
    half_subtractor hs2 (.A(diff1), .B(borrow_in), .diff(diff), .borrow_out(borrow2));

    or g1(borrow_out, borrow1, borrow2);
    
endmodule