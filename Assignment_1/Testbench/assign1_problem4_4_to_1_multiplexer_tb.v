module mux_4_to_1_tb;
    reg [3:0] d_in;
    reg [1:0] s;
    wire y;
    reg [8*24-1:0] name;

    mux_4_to_1 dut(.d_in(d_in), .s(s), .y(y));

    initial begin
        name = " Kunwar Arpit Singh 22185";
        $display("Kunwar Arpit Singh");
        $dumpfile("assign1_problem4_mux_4_to_1.vcd");
        $dumpvars(1, mux_4_to_1_tb);

        d_in = 4'b1010;

        $display("s1 | s0 | y (selected data)");
        $display("-----------------------");

        s = 2'b00; #10;
        $display(" %b | %b |  %b (d0)", s[1], s[0], y);

        s = 2'b01; #10;
        $display(" %b | %b |  %b (d1)", s[1], s[0], y);

        s = 2'b10; #10;
        $display(" %b | %b |  %b (d2)", s[1], s[0], y);

        s = 2'b11; #10;
        $display(" %b | %b |  %b (d3)", s[1], s[0], y);

        d_in = 4'b0101;

        $display("s1 | s0 | y (selected data)");
        $display("-----------------------");

        s = 2'b00; #10;
        $display(" %b | %b |  %b (d0)", s[1], s[0], y);

        s = 2'b01; #10;
        $display(" %b | %b |  %b (d1)", s[1], s[0], y);

        s = 2'b10; #10;
        $display(" %b | %b |  %b (d2)", s[1], s[0], y);

        s = 2'b11; #10;
        $display(" %b | %b |  %b (d3)", s[1], s[0], y);

        d_in = 4'b1111;

        $display("s1 | s0 | y (selected data)");
        $display("-----------------------");

        s = 2'b00; #10;
        $display(" %b | %b |  %b (d0)", s[1], s[0], y);

        s = 2'b01; #10;
        $display(" %b | %b |  %b (d1)", s[1], s[0], y);

        s = 2'b10; #10;
        $display(" %b | %b |  %b (d2)", s[1], s[0], y);

        s = 2'b11; #10;
        $display(" %b | %b |  %b (d3)", s[1], s[0], y);

        $finish;
    end
endmodule