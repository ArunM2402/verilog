//CLOCK GENERATION
module clk_generate;
reg clk;
  initial begin
    clk=0;
      #200 $finish;
  end
  always #5 clk=~clk;

  //generate waveform
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,clk);
  end
endmodule

// GENERATE CLK BASED ON FREQUENCY
module tb;
  real f=100;//MHz
  real tp=(1/f)*1000;//ns
reg clk;
  initial
    begin
    clk=0;
  #(4*tp) $finish;
    end
  always #(tp/2) clk=~clk;

  //generate waveform
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,clk);
  end
endmodule
