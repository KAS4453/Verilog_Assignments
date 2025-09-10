module priority_encoder_8_to_3_tb;
    reg [7:0] A;
    wire [2:0] out;
    wire valid;
    reg[8*24-1:0] name;
    integer i;
    priority_encoder_8_to_3 dut (.A(A), .out(out), .valid(valid));

    initial begin
        name = " Kunwar Arpit Singh 22185";
        $display("Kunwar Arpit Singh");
        $dumpfile("assign2_problem4_priority_encoder_8_to_3.vcd");
        $dumpvars(1, priority_encoder_8_to_3_tb);
        $display("Kunwar Arpit Singh");
        $display("A(Input)  |   out(Output)    |    Valid");
        for (i = 0 ; i < 256 ; i=i+1) begin
            A = i; #10;
            $display("%b    |    %b    |    %b    |", A, out, valid);
        end
        $finish;
    end
endmodule