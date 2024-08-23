//dual clock generation 
module tb;
  reg out_clk1=0;
  reg out_clk2=0;
  task clk_gen1();
    begin
      #15 out_clk1=1;
      #5 out_clk1=0;
    end
  endtask
  task clk_gen2();
    begin
      #5 out_clk2=1;
      #5 out_clk2=0;
    end
  endtask
  
  initial begin
    #500 $finish;
  end
  initial begin
  repeat(100)
    begin
      clk_gen1();
      clk_gen2();
    end
  end
 
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,out_clk1,out_clk2);
  end
endmodule
