module sr_latch(input S, input R, input en, input reset, output reg Q, output reg Q_n);
    always @(S, R, en, reset) begin
        if (reset) begin
            Q <=1'b0;
            Q_n <= 1'b1;
        end
        else if (en) begin
            case ({S, R})
                2'b00: begin
                    Q <= Q;
                    Q_n <= Q_n;
                end
                
                2'b01: begin
                    Q <= 1'b0;
                    Q_n <=1'b1;
                end

                2'b10: begin
                    Q <= 1'b1;
                    Q_n <=1'b0;
                end

                2'b11: begin
                    Q <= 1'bx;
                    Q_n <= 1'bx;
                end
            endcase
        end
    end
endmodule