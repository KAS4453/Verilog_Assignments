module binary_counter(input CLK, input RESET, output reg [2:0] COUNT);

    always @(posedge CLK, posedge RESET) begin
        if (RESET) begin
            COUNT <= 3'b111;
        end 
        else begin
            if (COUNT == 3'b000) begin
                COUNT <= 3'b111;
            end else begin
                COUNT <= COUNT - 1;
            end
        end
    end
endmodule