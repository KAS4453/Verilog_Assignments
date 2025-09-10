module carry_look_ahead_adder_4_bit(input [3:0] A, input [3:0] B, input C_IN, output [3:0] SUM, output C_OUT);
    wire [3:0] P;
    wire [3:0] G;
    wire [3:0] C;

    assign P = A ^ B;
    assign G = A & B;

    assign C[0] = C_IN;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & C[0]) | (P[1] & P[0] & C[0]);
    assign C[3] = G[2] | (P[2] & C[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C[0]);
    assign C_OUT = G[3] | (P[3] & G[2]) | (P[3] & p[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & C[0]);
    
    assign SUM = P ^ C;
endmodule