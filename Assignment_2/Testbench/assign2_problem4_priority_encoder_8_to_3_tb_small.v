module priority_encoder_8_to_3_tb_small;
    reg [7:0] A;
    wire [2:0] out;
    wire valid;
    reg[8*24-1:0] name;
    integer i;
    priority_encoder_8_to_3 dut (.A(A), .out(out), .valid(valid));

    initial begin
        name = " Kunwar Arpit Singh 22185";
        $display("Kunwar Arpit Singh");
        $dumpfile("assign2_problem4_priority_encoder_8_to_3_small.vcd");
        $dumpvars(1, priority_encoder_8_to_3_tb_small);
        $display("Kunwar Arpit Singh");
        $display("Outputs for Single Active Inputs");
        $display("A(Input)  |   out(Output)    |    Valid");
        A = 8'b00000000; #10; $display("%b | %b | %b |", A, out, valid);
        A = 8'b00000001; #10; $display("%b | %b | %b |", A, out, valid); 
        A = 8'b00000010; #10; $display("%b | %b | %b |", A, out, valid); 
        A = 8'b00000100; #10; $display("%b | %b | %b |", A, out, valid);
        A = 8'b00001000; #10; $display("%b | %b | %b |", A, out, valid);
        A = 8'b00010000; #10; $display("%b | %b | %b |", A, out, valid);
        A = 8'b00100000; #10; $display("%b | %b | %b |", A, out, valid);
        A = 8'b01000000; #10; $display("%b | %b | %b |", A, out, valid);
        A = 8'b10000000; #10; $display("%b | %b | %b |", A, out, valid);
        
        $display("Outputs for Multiple Active Inputs");
        $display("A(Input)  |   out(Output)    |    Valid");
        A = 8'b00000001; #10; $display("%b | %b | %b |", A, out, valid); 
        A = 8'b00000011; #10; $display("%b | %b | %b |", A, out, valid); 
        A = 8'b00000110; #10; $display("%b | %b | %b |", A, out, valid);
        A = 8'b00001100; #10; $display("%b | %b | %b |", A, out, valid);
        A = 8'b00010001; #10; $display("%b | %b | %b |", A, out, valid);
        A = 8'b00101000; #10; $display("%b | %b | %b |", A, out, valid);
        A = 8'b01010000; #10; $display("%b | %b | %b |", A, out, valid);
        A = 8'b11111111; #10; $display("%b | %b | %b |", A, out, valid);
        $finish;
    end
endmodule