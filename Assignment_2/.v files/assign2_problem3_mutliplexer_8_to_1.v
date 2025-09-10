module multiplexer_8_to_1(input [7:0] A, input [2:0] sel, output out);
    assign out = (sel == 3'b000) ? A[0] :
                 (sel == 3'b001) ? A[1] :
                 (sel == 3'b010) ? A[2] :
                 (sel == 3'b011) ? A[3] :
                 (sel == 3'b100) ? A[4] :
                 (sel == 3'b101) ? A[5] :
                 (sel == 3'b110) ? A[6] :
                 (sel == 3'b111) ? A[7] : 
                 1'bx;
endmodule