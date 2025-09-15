module moore_machine (input CLK, input RESET, input A, input B, output reg Q);

    parameter S0 = 2'b00;
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;
    
    reg [1:0] current_state;
    reg [1:0] next_state;

    always @(posedge CLK) begin
        if (RESET) begin
            current_state <= S0;
        end else begin
            current_state <= next_state;
        end
    end

    always @(*) begin
        case (current_state)
            S0: begin
                if (A)
                    next_state = S1;
                else
                    next_state = S0;
            end

            S1: begin
                if (B)
                    next_state = S2;
                else
                    next_state = S0;
            end

            S2: begin
                next_state = S0;
            end
            
            default: begin
                next_state = S0;
            end
        endcase
    end

    always @(*) begin
        case (current_state)
            S0: Q = 1'b0;
            S1: Q = 1'b0;
            S2: Q = 1'b1;
            default: Q = 1'b0;
        endcase
    end
endmodule