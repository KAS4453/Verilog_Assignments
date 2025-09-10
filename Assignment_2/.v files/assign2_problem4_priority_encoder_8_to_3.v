module priority_encoder_8_to_3(input [7:0] A, output reg [2:0] out,  output reg valid);
    always @(*) begin
        valid = |A;
        if (A[7])      out = 3'b111;
        else if (A[6]) out = 3'b110;
        else if (A[5]) out = 3'b101;
        else if (A[4]) out = 3'b100;
        else if (A[3]) out = 3'b011;
        else if (A[2]) out = 3'b010;
        else if (A[1]) out = 3'b001;
        else if (A[0]) out = 3'b000;
        else out = 3'bxxx;
    end
endmodule