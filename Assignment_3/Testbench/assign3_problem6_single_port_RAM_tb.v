module simple_dual_port_ram_tb;

    localparam DATA_WIDTH = 16;
    localparam ADDR_WIDTH = 7;

    reg clk;
    reg we;
    reg [ADDR_WIDTH-1:0] waddr;
    reg [ADDR_WIDTH-1:0] raddr;
    reg [DATA_WIDTH-1:0] wdata;
    wire [DATA_WIDTH-1:0] rdata;
    reg [8*24-1:0] name;
    simple_dual_port_ram #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(ADDR_WIDTH)) dut (.clk(clk), .we(we), .waddr(waddr), .raddr(raddr), .wdata(wdata), .rdata(rdata));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;    end

    initial begin
        name = " Kunwar Arpit Singh 22185";
        $dumpfile("assign3_problem6_single_port_RAM.vcd");
        $dumpvars(1, simple_dual_port_ram_tb);
        $display("Kunwar Arpit Singh");
        $display("| WE | WAddr | WData | RAddr | RData");
        $monitor("| %b | %d | %h | %d | %h", we, waddr, wdata, raddr, rdata);

        we = 0;
        waddr = 0;
        raddr = 0;
        wdata = 0;
        #10;

        we = 1;
        waddr = 10;
        wdata = 16'hABCD;
        #10;
        we = 0;
        #10;

        we = 1;
        waddr = 42;
        wdata = 16'hDEAD;
        #10;
        we = 0;
        #10;

        raddr = 10;
        #10;
        raddr = 42;
        #10;
        raddr = 5;
        #10;
        we = 1;
        waddr = 127;
        wdata = 16'hFD;
        raddr = 10;
        #10;
        we = 0;
        #10;

        raddr = 127;
        #10;

        $finish;
    end

endmodule