module testbench;
    reg clk;
    reg rst;
    reg d;
    wire q;
  integer i;
    
    // Instantiate the D flip-flop
    d_flipflop uut (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q)
    );

    // Task to initialize variables
    task initialize_variables;
    begin
        clk = 0;
        rst = 1;
        d = 0;
    end
    endtask

    // Task to generate the clock
    task generate_clock;
    begin
      for(i=0;i<=100;i=i+1)
        begin
          #5 clk = ~clk;
        end
        // Toggle clock every 5 time units
    end
    endtask

    // Task to monitor signals
    task monitor_signals;
    begin
        $monitor("Time: %0d, clk = %b, rst = %b, d = %b, q = %b", $time, clk, rst, d, q);
    end
    endtask

    // Task to dump VCD file
    task dump_vcd;
    begin
        $dumpfile("d_flipflop.vcd");
        $dumpvars(0, testbench);
    end
    endtask

    initial begin
        // Call tasks
        initialize_variables;
        fork
            generate_clock;
            dump_vcd;
            monitor_signals;
        join

        // Test sequence
        #10 rst = 0; d = 1; 
        #10 d = 0;          
        #10 d = 1;          // Change d to 1
        #10 rst = 1;        // Assert reset
        #10 rst = 0; d = 0; // Release reset, set d to 0
        #10 d = 1;          // Change d to 1
        #10 $finish;
    end

endmodule
