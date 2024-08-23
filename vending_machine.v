module vending_machine(input_coin, clk, rst, dispense_prod);
  input [3:0] input_coin;
  input clk, rst;
  output reg dispense_prod;
  
  reg [1:0] ps;
  reg [1:0] ns;
  
  parameter idle = 2'b00;
  parameter a = 2'b01;
  parameter b = 2'b10;
  parameter c = 2'b11;
  
  always @(posedge clk or posedge rst)
    begin
      if (rst)
        ps <= idle;
      else
        ps <= ns;
    end
  
  always @(ps or input_coin)
    begin
      dispense_prod = 0; // Default value
      case(ps)
        idle: begin
          if (input_coin == 4'b0101)
            ns = a;
          else if (input_coin == 4'b1010)
            ns = b;
          else if (input_coin == 4'b1111)
            ns = c;
          else
            ns = idle;
        end
        a: begin
          if (input_coin == 4'b0101)
            ns = b;
          else if (input_coin == 4'b1010)
            ns = c;
          else 
            ns = a;
        end
        b: begin
          if (input_coin == 4'b0101)
            ns = c;
          else
            ns = b;
        end
        c: begin
          dispense_prod = 1;
          ns = idle;
        end
        default: begin
          ns = idle;
          dispense_prod = 0;
        end
      endcase
    end
endmodule
								//testbench
module tb;
  reg [3:0] input_coin;
  wire dispense_prod;
  reg clk,rst;
  reg [15:0] seq= 16'b0101_0000_1010_0000;
  integer i;
  vending_machine dut(input_coin,clk,rst,dispense_prod);
  
  initial begin
    clk=0;
    rst=1;
    #12 rst=0;
    #10 input_coin=seq[15:12];
    #10 input_coin=seq[11:8];
    #10 input_coin=seq[7:4];
    #10 input_coin=seq[3:0];
    #100 $finish;
  end
  
  always #5 clk=~clk;
  
  initial begin
    $display("Sequence=%b",seq);
    $monitor("Simtime=%d,rst=%b,input_coin=%b,dispense_prod=%b",$time,rst,input_coin,dispense_prod);
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,clk,rst,input_coin,dispense_prod);
  end
endmodule
