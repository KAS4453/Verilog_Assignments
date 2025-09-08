module comparator_4_bit_tb;
    reg [3:0] A, B;
    wire a_eq_b;
    wire a_gt_b;
    wire a_lt_b;
    integer i, j;
    comparator_4_bit dut (.A(A), .B(B), .a_eq_b(a_eq_b), .a_gt_b(a_gt_b), .a_lt_b(a_lt_b));
    reg [8*24-1:0] name;
    
    initial begin
        name = " Kunwar Arpit Singh 22185";
        $display("Kunwar Arpit Singh");
        $dumpfile("assign1_problem2_comparator_4_bit.vcd");
        $dumpvars(1, comparator_4_bit_tb);

        $display("Kunwar Arpit Singh");
        $display("A    | B     | A == B | A > B | A < B");
        $display("-----------------------");

        for (i = 0 ; i < 16 ; i = i+1) begin
            for (j = 0 ; j < 16 ; j = j+1) begin
                A = i;
                B = j;
                #10;
                $display("%b | %b |   %b |   %b |   %b", A, B, a_eq_b, a_gt_b, a_lt_b);
            end
        end
    end
endmodule