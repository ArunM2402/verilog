//Mod counter
module counter(count,clk,rst);
  input clk,rst;
  output [2:0] count; //width depends on no of bits required
  reg [2:0] temp=0;
  assign count=temp;
  always @(posedge clk)
    begin
      if(!rst)
        temp<=3'b000;
      else if(temp>=3'b100) //mod maximum value
        temp<=3'b000;
     else
        temp<=temp+1;
    end
endmodule
//UP DOWN COUNTER
module counter(count,clk,rst,ctrl);
  input clk,rst,ctrl;
  output [2:0] count;
  reg [2:0] temp=0;
  
  assign count=temp;
  always @(posedge clk)
    begin
      if(!rst)
        temp<=3'b000;
      else if(ctrl==1)
        temp<=temp+1;
      else
        temp<=temp-1;
    end
endmodule
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
//3 bit up counter

module counter(clk,count);
  input clk;
  output [2:0] count;
  reg [2:0] temp=0;
  always @(posedge clk)
    begin
      temp<=temp+1;
    end
  assign count=temp;
endmodule
//testbench
module tb;
  reg clk;
  wire [2:0] count;
  counter dut(clk,count);
  initial begin
    clk=0;
    force dut.count=0;
    #10 release dut.count;
    #100 $finish;
  end
always #5 clk=~clk;
initial begin
$dumpfile("dump.vcd");
  $dumpvars(0,clk,count);
end
endmodule
