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
