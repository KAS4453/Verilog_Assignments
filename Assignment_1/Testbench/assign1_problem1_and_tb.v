module and_gate_3_input_tb;
    reg A, B, C;
    wire Y;
    reg [8*24-1:0] name;

    and_gate_3_input dut (.A(A), .B(B), .C(C), .Y(Y));

    initial begin
        name = " Kunwar Arpit Singh 22185";
        $dumpfile("assign1_problem1_and_gate_3_input.vcd");
        $dumpvars(1, and_gate_3_input_tb);

        $display("Kunwar Arpit Singh");
        $display("A | B | C | Y");
        $display("-----------------");

        A = 0; B = 0; C = 0; #10;
        $display("%b | %b | %b | %b", A, B, C, Y);

        A = 0; B = 0; C = 1; #10;
        $display("%b | %b | %b | %b", A, B, C, Y);

        A = 0; B = 1; C = 0; #10;
        $display("%b | %b | %b | %b", A, B, C, Y);

        A = 0; B = 1; C = 1; #10;
        $display("%b | %b | %b | %b", A, B, C, Y);

        A = 1; B = 0; C = 0; #10;
        $display("%b | %b | %b | %b", A, B, C, Y);

        A = 1; B = 0; C = 1; #10;
        $display("%b | %b | %b | %b", A, B, C, Y);

        A = 1; B = 1; C = 0; #10;
        $display("%b | %b | %b | %b", A, B, C, Y);

        A = 1; B = 1; C = 1; #10;
        $display("%b | %b | %b | %b", A, B, C, Y);

        $finish;
    end
endmodule