module fsm_implementation(input CLK, input RESET, input x, output reg Z);

    parameter S0 = 2'b00;
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;
    parameter S3 = 2'b11;
    
    reg [1:0] current_state;
    reg [1:0] next_state;

    always @(posedge CLK or posedge RESET) begin
        if(RESET)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    always @(current_state or x) begin
        case (current_state)
            S0:
                if(x)
                    next_state = S1;
                else
                    next_state = S0;
            S1:
                if(x)
                    next_state = S2;
                else
                    next_state = S0;
            S2:
                if(x)
                    next_state = S2;
                else
                    next_state = S3;
            S3:
                if(x)
                    next_state = S1;
                else
                    next_state = S0;
            default:
                next_state = S0;
        endcase
    end

    always @(current_state or x) begin
        if (current_state == S3 && x == 1'b1)
            Z = 1'b1;
        else
            Z = 1'b0;
    end

endmodule