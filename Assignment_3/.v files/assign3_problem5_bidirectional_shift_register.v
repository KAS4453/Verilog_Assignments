module shift_register #(parameter N = 8)(input clk, reset, input shift_en, load_en, input direction, input serial_in, input [N-1:0] parallel_in, output reg [N-1:0] parallel_out);

    always @(posedge clk, posedge reset) begin
        if (reset) begin
            parallel_out <= {N{1'b0}};
        end else if (load_en) begin
            parallel_out <= parallel_in;
        end else if (shift_en) begin
            if (direction) begin
                parallel_out <= {serial_in, parallel_out[N-1:1]};
            end else begin
                parallel_out <= {parallel_out[N-2:0], serial_in};
            end
        end
    end

endmodule