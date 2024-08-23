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
//GENERATE CLK FOR DIFFERENT FREQUENCY(GENERIC CODE)
module tb;
  	real f=100;//FREQUENCY IN MHz
  	real tp=(1/f)*1000;//TIME PERIOD IN ns
  	real duty=0.6;//DUTY CYCLE
  	real ton=duty*tp;//ON TIME
  	real toff=tp-ton;//OFF TIME
	reg clk;
  initial
    begin
    clk=0;
  #(4*tp) $finish;
    end
  always 
    begin
      #(toff) clk=1;
      #(ton) clk=0;
    end

  //generate waveform
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,clk);
  end
endmodule
