module full_subtractor_tb;

    reg A, B, borrow_in;
    wire diff, borrow_out;
    integer i;
    reg [8*24-1:0] name;

    full_subtractor dut (.A(A), .B(B), .borrow_in(borrow_in), .diff(diff), .borrow_out(borrow_out));

    initial begin
        name = " Kunwar Arpit Singh 22185";
        $display("Kunwar Arpit Singh");
        $dumpfile("assign1_problem3_full_subtractor.vcd");
        $dumpvars(1, full_subtractor_tb);

        $display(" A | B | borrow_in | diff | borrow_out");
        $display("---------------------------");

        for ( i = 0  ; i < 8; i = i + 1) begin
            {A, B, borrow_in} = i;
            #10;
            $display(" %b | %b |    %b     |  %b  |     %b", A, B, borrow_in, diff, borrow_out);
        end
        $finish;
    end
endmodule