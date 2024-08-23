//SYNCHRONOUS T LATCH
module t_latch(t,clk,rst,q);

  input t,clk,rst;
  output reg q=0;
  always @(clk,t,rst)
  begin
    if(clk)
      	if(!rst)
        q<=0;
   	else
      if(t)
      	q<=~q;
  end
endmodule
								//ASYNCHRONOUS T LATCH
module t_latch(t,clk,rst,q);
  input t,clk,rst;
  output reg q=0;
  always @(clk,t,rst)
  begin
    if(!rst)
      q<=0;
    else
      if(clk)
	if(t)
         q<=~q;
  end
endmodule
								//TEST BENCH
module tb;
  reg clk,t,rst;
  wire q;
  t_latch dut(.t(t),.clk(clk),.rst(rst),.q(q));
  
  initial begin
    clk=0;
    rst=0;
    t=1;
    #2 rst=1;
      #100 $finish;
  end
  always 
    begin
      #5 clk=~clk;
      #8 t=~t;
    end

  //generate waveform
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,rst,q,t,clk);
  end
endmodule
