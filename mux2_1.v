//2:1 MUX
module m1(i0,i1,s,y);
  input i0,i1,s;
  output y;
  wire s_bar;
  assign s_bar=s;
  assign y=(i0&s_bar)|(i1&s);
endmodule
									//TESTBENCH

module tb;
  reg i0,i1,s;
  wire y;
  integer i;
  
  m1 dut(i0,i1,s,y);
  initial begin
    for(i=0;i<8;i=i+1)
    #5 {i0,i1,s}=i;
  end
  initial begin			  
    $monitor("Simtime=%0d,i0=%b;i1=%b;s=%b,y=%b",$time,i0,i1,s,y);
  end
  //generate waveform
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,i0,i1,s,y);
  end
endmodule
