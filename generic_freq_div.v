module freq_divider(clk,rst,out_clk);
  input clk,rst;
  output reg out_clk=0;
  integer temp=0;
  parameter mode=3; // decides division frequency
  always @(clk)
    begin
      if(!rst)
        out_clk<=0;
      else
        begin
    temp<=temp+1;
      if(temp==mode)
        begin
        out_clk<=~out_clk;
        temp<=0;
        end
        end
    end
endmodule
