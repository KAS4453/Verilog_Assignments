module shift_register_tb;
    localparam N = 8;
    reg clk;
    reg reset;
    reg shift_en, load_en, direction, serial_in;
    reg [N-1:0] parallel_in;
    wire [N-1:0] parallel_out;
    reg [8*24-1:0] name;
    shift_register #(.N(N)) dut (.clk(clk), .reset(reset), .shift_en(shift_en), .load_en(load_en), .direction(direction), .serial_in(serial_in), .parallel_in(parallel_in), .parallel_out(parallel_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        name = " Kunwar Arpit Singh 22185";
        $dumpfile("assign3_problem5_bidirectional_shift_register.vcd");
        $dumpvars(1, shift_register_tb);
        $display("--- N-Bit Shift Register Simulation (N=%0d) ---", N);
        $display("Kunwar Arpit Singh");
        $display("| Reset | Load_en | Shift_en | Direction | Serial_in | Parallel_out |");
        reset = 1; #20; reset = 0;
        $monitor("%b | %b | %b | %b | %b | %b", reset, load_en, shift_en, direction, serial_in, parallel_out);

        load_en = 1; parallel_in = 8'b10110101;
        #10;
        load_en = 0;
        #10;

        shift_en = 1; direction = 1;
        serial_in = 1;
        #10;
        serial_in = 0;
        #10;
        serial_in = 1;
        #10;

        direction = 0;
        serial_in = 0;
        #10;
        serial_in = 1;
        #10;
        serial_in = 0;
        #10;
        shift_en = 0;
        
        $finish;
    end
endmodule
