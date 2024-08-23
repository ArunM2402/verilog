//4:1 MUX using vectors
module m1(i,s1,s0,y);
  input [3:0] i;			//boolean expressions
  input s0,s1;
  output y;
  wire s0_bar,s1_bar;
  assign s0_bar=~s0;
  assign s1_bar=~s1;
  assign y=(i[0]&s1_bar&s0_bar)|(i[1]&s1_bar&s0)|(i[2]&s1&s0_bar)|(i[3]&s1&s0);
endmodule

// ternary operator
assign y= s0?(s1?i3:i1):(s1?i2:i0);
//behavioral
module m1(i,s2,s0,y);
input [3:0] i;
input s0,s1;
output reg y;
always @(i,s0,s1)
y=(i[0]&(~s1)&(~s0))|(i[1]&(~s1)&s0)|(i[2]&s1&(~s0))|(i[3]&s1&s0);
endmodule
									//4:1 mux using 2:1 mux
module mux2_1(i0,i1,s,y);
  input i0,i1,s;
  output y;
  assign y=s?i1:i0;
endmodule

module mux4_1(i,s1,s0,y);
  input [3:0] i;
  input s1,s0;
  output y;
  wire w1,w2;
  mux2_1 m1(.i0(i[0]),.i1(i[1]),.s(s0),.y(w1));
  mux2_1 m2(.i0(i[2]),.i1(i[3]),.s(s0),.y(w2));
  mux2_1 m3(.i0(w1),.i1(w2),.s(s1),.y(y));
endmodule
										//TEST BENCH

module tb;
  reg [3:0] i;
  reg s0,s1;
  wire y;
  integer j;
  
  m1 dut(i,s1,s0,y);
  initial begin
    for(j=0;j<64;j=j+1)
      #5 {i,s1,s0}=j;
  end
  initial begin			  
    $monitor("Simtime=%0d,i=%b;s1=%b,s0=%b,y=%b",$time,i,s1,s0,y);
  end
  //generate waveform
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,i,s1,s0,y);
  end
endmodule
