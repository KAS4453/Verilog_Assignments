module multiplexer_8_to_1_tb;
    reg [7:0] A;
    reg [2:0] sel;
    wire out;
    reg [8*24-1:0] name;

    multiplexer_8_to_1 uut (.A(A), .sel(sel), .out(out));

    initial begin
        name = " Kunwar Arpit Singh 22185";
        $display("Kunwar Arpit Singh");
        $dumpfile("assign2_problem3_mutliplexer_8_to_1.vcd");
        $dumpvars(1, multiplexer_8_to_1_tb);
        $display("Kunwar Arpit Singh");
        A = 8'b11001010;
        $display("Output for all the cases");
        $display("A (Binary & Decimal) | Output(Binary) | Output(Decimal)");
        $display("------------------------");
        sel = 3'b000; #10;
        $display("%b  |  %d  |  %b  |  %d  |  %b  |  %d  ", A, A, sel, sel, out, out);
        sel = 3'b001; #10;
        $display("%b  |  %d  |  %b  |  %d  |  %b  |  %d  ", A, A, sel, sel, out, out);
        sel = 3'b010; #10;
        $display("%b  |  %d  |  %b  |  %d  |  %b  |  %d  ", A, A, sel, sel, out, out);
        sel = 3'b011; #10;
        $display("%b  |  %d  |  %b  |  %d  |  %b  |  %d  ", A, A, sel, sel, out, out);
        sel = 3'b100; #10;
        $display("%b  |  %d  |  %b  |  %d  |  %b  |  %d  ", A, A, sel, sel, out, out);
        sel = 3'b101; #10;
        $display("%b  |  %d  |  %b  |  %d  |  %b  |  %d  ", A, A, sel, sel, out, out);
        sel = 3'b110; #10;
        $display("%b  |  %d  |  %b  |  %d  |  %b  |  %d  ", A, A, sel, sel, out, out);
        sel = 3'b111; #10;
        $display("%b  |  %d  |  %b  |  %d  |  %b  |  %d  ", A, A, sel, sel, out, out);

        A = 8'b00110101;
        $display("Output for all the cases");
        $display("A (Binary & Decimal) | Output(Binary) | Output(Decimal)");
        $display("------------------------");
        sel = 3'b000; #10;
        $display("%b  |  %d  |  %b  |  %d  |  %b  |  %d  ", A, A, sel, sel, out, out);
        sel = 3'b001; #10;
        $display("%b  |  %d  |  %b  |  %d  |  %b  |  %d  ", A, A, sel, sel, out, out);
        sel = 3'b010; #10;
        $display("%b  |  %d  |  %b  |  %d  |  %b  |  %d  ", A, A, sel, sel, out, out);
        sel = 3'b011; #10;
        $display("%b  |  %d  |  %b  |  %d  |  %b  |  %d  ", A, A, sel, sel, out, out);
        sel = 3'b100; #10;
        $display("%b  |  %d  |  %b  |  %d  |  %b  |  %d  ", A, A, sel, sel, out, out);
        sel = 3'b101; #10;
        $display("%b  |  %d  |  %b  |  %d  |  %b  |  %d  ", A, A, sel, sel, out, out);
        sel = 3'b110; #10;
        $display("%b  |  %d  |  %b  |  %d  |  %b  |  %d  ", A, A, sel, sel, out, out);
        sel = 3'b111; #10;
        $display("%b  |  %d  |  %b  |  %d  |  %b  |  %d  ", A, A, sel, sel, out, out);
        $finish;
    end
endmodule