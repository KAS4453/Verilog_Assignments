module barrel_shifter_4bit_tb;
    reg [3:0] A;
    reg [1:0] sel;
    reg dir;
    wire [3:0] out;
    reg [8*24-1:0] name;

    barrel_shifter_4bit dut (.A(A), .sel(sel), .dir(dir), .out(out));

    initial begin
        name = " Kunwar Arpit Singh 22185";

        $display("Kunwar Arpit Singh");
        $dumpfile("assign1_problem5_barrel_shifter_tb.vcd");
        $dumpvars(1, barrel_shifter_4bit_tb);

        $display("A | dir | Shift by | out");
        $display("---------------------");

        A = 4'b1011; dir = 0; sel = 2'b00; #10;
        $display("%b | left  | %0d    | %b", A, sel, out);

        A = 4'b1011; dir = 0; sel = 2'b01; #10;
        $display("%b | left  | %0d    | %b", A, sel, out);

        A = 4'b1011; dir = 0; sel = 2'b10; #10;
        $display("%b | left  | %0d    | %b", A, sel, out);

        A = 4'b1011; dir = 1; sel = 2'b00; #10;
        $display("%b | right | %0d    | %b", A, sel, out);

        A = 4'b1011; dir = 1; sel = 2'b01; #10;
        $display("%b | right | %0d    | %b", A, sel, out);

        A = 4'b1011; dir = 1; sel = 2'b10; #10;
        $display("%b | right | %0d    | %b", A, sel, out);
        $finish;
    end
endmodule