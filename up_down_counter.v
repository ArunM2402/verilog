module counter(count,clk,rst);
  input clk,rst;
  output reg [1:0] count=0;
  reg d=0;
  always @(posedge clk)
    begin
      if(!rst)
        count<=0;
      else
        begin
          case(d)
            0: begin			//increasing slope
              if(count==3)
                begin
                  d<=1;
                  count<=count-1;
                end
              else
                count<=count+1;
            end
            1: begin			//decreasing slope
              if(count==0)
                begin
                  d<=0;
                  count<=count+1;
                end
              else
                count<=count-1;
            end
            default: begin
              d<=0;
            end
          endcase
        end        
    end
endmodule
					//testbench
module tb;
reg clk,rst;
wire [1:0] count;
counter dut(count,clk,rst);
initial begin
clk=0;
rst=0;
#5 rst=1;
#100 $finish;
end
always #2 clk=~clk;
initial begin
$dumpfile("dump.vcd");
$dumpvars(0,clk,rst,count);
end
endmodule
