module mealy_machine(input CLK, input RESET, input A, input B, output reg Y);

    parameter S0 = 2'b00;
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;

    reg [1:0] current_state; 
    reg [1:0] next_state;

    always @(posedge CLK) begin
        if (RESET)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    always @(current_state or A or B) begin
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
                if (A && B)
                    next_state = S2;
                else
                    next_state = S0;
            end
            default: begin
                next_state = S0;
            end
        endcase
    end

    always @(current_state or A or B) begin
        case (current_state)
            S0: Y = 0;
            S1: Y = 0;
            S2: begin
                if (A && B)
                    Y = 1;
                else
                    Y = 0;
            end
            default: Y = 0;
        endcase
    end

endmodule