module state_diagram_implementation_tb;

    // Testbench signals
    reg clk;
    reg reset;
    reg P_A;
    reg P_B;
    wire O;
    reg [8*24-1:0] name;
    state_diagram_implementation uut (.clk(clk), .reset(reset), .P_A(P_A), .P_B(P_B), .O(O));
    
    always #5 clk = ~clk;
    
    integer N_PA, N_PB;
    integer expected_value;
    integer cycle_count;
    
    initial begin
        name = " Kunwar Arpit Singh 22185";
        $display("Kunwar Arpit Singh");
        $dumpfile("assign4_problem4_state_diagram_implementation.vcd");
        $dumpvars(1, state_diagram_implementation_tb);
        $display("Kunwar Arpit Singh");

        clk = 0;
        reset = 1;
        P_A = 0;
        P_B = 0;
        N_PA = 0;
        N_PB = 0;
        cycle_count = 0;
        
        #10;
        reset = 0;
        
        $display("| Cycle | P_A | P_B | N(P_A) | N(P_B) | 2*N(P_A)+N(P_B) | mod4 | O | Expected |");
        $display("-------------------------------------------------------------------------------");
        
        test_cycle(0, 0);
        test_cycle(1, 1);
        test_cycle(1, 0);
        test_cycle(0, 1);
        
        test_cycle(1, 1);
        test_cycle(0, 0);
        test_cycle(1, 0);
        test_cycle(0, 1);
        
        #20;
        $finish;
    end
    
    task test_cycle;
        input pa_val;
        input pb_val;
        begin
            P_A = pa_val;
            P_B = pb_val;
            
            @(posedge clk);
            
            if (pa_val) N_PA = N_PA + 1;
            if (pb_val) N_PB = N_PB + 1;
            
            cycle_count = cycle_count + 1;
            
            #2;
            
            expected_value = (2 * N_PA + N_PB) % 4;
            
            $display("|   %0d   |  %0d  |  %0d  |    %0d   |    %0d   |        %0d        |  %0d   | %0d |    %0d    |", cycle_count, P_A, P_B, N_PA, N_PB, 2*N_PA + N_PB, expected_value, O, (expected_value == 1));
            
        end
    endtask

endmodule
