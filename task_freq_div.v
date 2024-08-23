
module tb;
  reg clk;reg rst;
integer temp;
  reg out_clk;
  task freq_div(input clk,rst,output out_clk);
    begin
      if(!rst)
        begin
        out_clk<=0;
        temp<=0;
        end
      else
        begin
    	temp<=temp+1;
          if(temp==3)
        begin
        out_clk<=~out_clk;
        temp<=0;
        end
        end
    end
  endtask
  
  initial begin
    clk=0; rst=0;
    #5 rst=1;
    #500 $finish;
  end
  
  always @(clk)
    freq_div(clk,rst,out_clk);
  
  always #2 clk=~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,clk,out_clk);
  end
endmodule
