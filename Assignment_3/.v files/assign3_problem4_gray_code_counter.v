module gray_counter(input CLK, input RESET, input UP, output reg [2:0] GRAYout);

    always @(posedge CLK or posedge RESET) begin
        if (RESET) begin
            GRAYout <= 3'b000;
        end else begin
            if (UP) begin
                case (GRAYout)
                    3'b000: GRAYout <= 3'b001;
                    3'b001: GRAYout <= 3'b011;
                    3'b011: GRAYout <= 3'b010;
                    3'b010: GRAYout <= 3'b110;
                    3'b110: GRAYout <= 3'b111;
                    3'b111: GRAYout <= 3'b101;
                    3'b101: GRAYout <= 3'b100;
                    3'b100: GRAYout <= 3'b000;
                    default: GRAYout <= 3'b000;
                endcase
            end
        end
    end
endmodule