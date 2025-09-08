module full_adder_tb;

    reg A, B, CIN;
    wire SUM, COUT;
    integer i;
    reg [8*24-1:0] name;
    full_adder dut (A, B, CIN, SUM, COUT);

    initial begin
        name = " Kunwar Arpit Singh 22185";
        $display("Kunwar Arpit Singh");
        $dumpfile("assign1_problem3_full_adder.vcd");
        $dumpvars(1, full_adder_tb);
        $display("Kunwar Arpit Singh");
        $display("A B CIN | SUM COUT");
        $display("-------------------");

        for (i = 0 ; i < 8 ; i = i + 1) begin
            {A, B, CIN} = i;
            #10;
            $display("%b %b %b |   %b   %b", A, B, CIN, SUM, COUT);
        end
        $finish;
    end
endmodule