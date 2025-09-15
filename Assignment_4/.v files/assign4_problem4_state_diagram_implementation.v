module state_diagram_implementation (input clk, input reset, input P_A, input P_B, output reg O);

    reg [1:0] state;
    reg [1:0] next_state;
    
    parameter STATE_0 = 2'b00;
    parameter STATE_1 = 2'b01;
    parameter STATE_2 = 2'b10;
    parameter STATE_3 = 2'b11;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= STATE_0;
            O <= 1'b0;
        end else begin
            state <= next_state;
            O <= (next_state == STATE_1);
        end
    end
    
    always @(*) begin
        case (state)
            STATE_0: begin
                case ({P_A, P_B})
                    2'b00: next_state = STATE_0;
                    2'b01: next_state = STATE_1;
                    2'b10: next_state = STATE_2;
                    2'b11: next_state = STATE_3;
                endcase
            end
            STATE_1: begin
                case ({P_A, P_B})
                    2'b00: next_state = STATE_1;
                    2'b01: next_state = STATE_2;
                    2'b10: next_state = STATE_3;
                    2'b11: next_state = STATE_0;
                endcase
            end
            STATE_2: begin
                case ({P_A, P_B})
                    2'b00: next_state = STATE_2;
                    2'b01: next_state = STATE_3;
                    2'b10: next_state = STATE_0;
                    2'b11: next_state = STATE_1;
                endcase
            end
            STATE_3: begin
                case ({P_A, P_B})
                    2'b00: next_state = STATE_3;
                    2'b01: next_state = STATE_0;
                    2'b10: next_state = STATE_1;
                    2'b11: next_state = STATE_2;
                endcase
            end
            default: next_state = STATE_0;
        endcase
    end

endmodule
