module half_subtractor_tb;
    reg A, B;
    wire diff, borrow_out;
    reg [8*24-1:0] name;
    half_subtractor dut(A, B, diff, borrow_out);

    initial begin
        name = " Kunwar Arpit Singh 22185";
        $display("Kunwar Arpit Singh");
        $dumpfile("assign1_problem3_half_subtractor.vcd");
        $dumpvars(1, half_subtractor_tb);

        $display("A | B | diff | borrow_out");
        $display("-------------------");

        A = 0 ; B = 0 ; #10;
        $display("%b | %b |  %b  |     %b", A, B, diff, borrow_out);

        A = 0 ; B = 1 ; #10;
        $display("%b | %b |  %b  |     %b", A, B, diff, borrow_out);

        A = 1 ; B = 0 ; #10;
        $display("%b | %b |  %b  |     %b", A, B, diff, borrow_out);

        A = 1 ; B = 1 ; #10;
        $display("%b | %b |  %b  |     %b", A, B, diff, borrow_out);

        $finish;
    end
endmodule