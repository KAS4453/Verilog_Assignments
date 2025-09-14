module simple_dual_port_ram #(parameter DATA_WIDTH = 16, parameter ADDR_WIDTH = 7)( input clk, input we, input [ADDR_WIDTH-1:0] waddr, input [ADDR_WIDTH-1:0] raddr, input [DATA_WIDTH-1:0] wdata, output reg [DATA_WIDTH-1:0] rdata);

    localparam DEPTH = 1 << ADDR_WIDTH;

    reg [DATA_WIDTH-1:0] memory [0:DEPTH-1];

    always @(posedge clk) begin
        if (we) begin
            memory[waddr] <= wdata;
        end
        rdata <= memory[raddr];
    end

endmodule