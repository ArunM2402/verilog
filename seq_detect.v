//detect 101 sequence(mealy model)
module seq_detect(clk,rst,in,out);
  input clk,rst,in;
  output reg out
  
  //state variables
reg [1:0] ps;
reg [1:0] ns;
  
  //encoding states
parameter idle=2'b00;
parameter s1=2'b01;
parameter s10=2'b10;  
    //state registar
always @(posedge clk)
begin
if(!rst)
ps<=idle;
else
ps<=ns;
end

     //next state decoder
always @(in,ps)
begin
case(ps)
idle: if(in==1)
	begin
	ns=s1;
	out=0;
	end
      else
        begin
	ns=idle;
	out=0;
	end
s1:  if(in)
	begin
	ns=s1;
	out=0;
	end
     else
	begin
        ns=s10;
	out=0;
	end
s10:  if(in)
	begin
	ns=s1;
	out=1;
	end
     else
	begin
	ns=idle;
	out=0;
	end
default: begin
	ns=idle;
	out=0;
	end
endcase
end
endmodule  

//testbench
module tb;
  reg clk,rst,in;
  wire out;
  reg [15:0] seq= 16'b0101_0111_1010_0011;
  integer i;
  seq_detect dut(clk,rst,in,out);
  initial begin
    clk=0;
    rst=0;
    #12 rst=1;
    for(i=15;i>=0;i=i-1)
      #10 in=seq[i];
    #100 $finish;
  end
  
  always 
    #5 clk=~clk;
  
  initial begin
    $display("Sequence=%b",seq);
$monitor("Simtime=%d,rst=%b,in=%b,out=%b",$time,rst,in,out);
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,clk,rst,in,out);
  end
endmodule

								//10x detection
// Code your design here
module seq_detect(clk,rst,in,out);
  input clk,rst,in;
  output reg out;
  
  //state variables
reg [1:0] ps;
reg [1:0] ns;
  
  //encoding states
parameter idle=2'b00;
parameter s1=2'b01;
parameter s10=2'b10;  
    //state registar
always @(posedge clk)
begin
if(!rst)
ps<=idle;
else
ps<=ns;
end

     //next state decoder
always @(in,ps)
begin
case(ps)
  idle: if(in)
	begin
	ns=s1;
	out=0;
	end
      else
        begin
	ns=idle;
	out=0;
	end
s1:  if(in)
	begin
	ns=s1;
	out=0;
	end
     else
	begin
        ns=s10;
	out=0;
	end
s10:  if(in)
	begin
	ns=s1;
	out=1;
	end
     else
	begin
	ns=idle;
	out=1;
	end
default: begin
	ns=idle;
	out=0;
	end
endcase
end
endmodule  

//testbench

module tb;
  reg clk,rst,in;
  wire out;
  reg [15:0] seq= 16'b0101_0011_0010_1011;
  integer i;
  seq_detect dut(clk,rst,in,out);
  initial begin
    clk=0;
    rst=0;
    #12 rst=1;
    for(i=15;i>=0;i=i-1)
      #10 in=seq[i];
    #100 $finish;
  end
  
  always 
    #5 clk=~clk;
  
  initial begin
    $display("Sequence=%b",seq);
$monitor("Simtime=%d,rst=%b,in=%b,out=%b",$time,rst,in,out);
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,clk,rst,in,out);
  end
endmodule

           								//101 detection moore machine
module seq_detect(clk,rst,in,out);
  input clk,rst,in;
  output reg out;
  
  //state variables
reg [1:0] ps;
reg [1:0] ns;
  
  //encoding states
parameter idle=2'b00;
parameter s1=2'b01;
parameter s10=2'b10;
parameter s101=2'b11;
    //state registar
always @(posedge clk)
begin
if(!rst)
ps<=idle;
else
ps<=ns;
end

     //next state decoder
always @(in,ps)
begin
case(ps)
 idle:
   begin
     out=0;
     if(in)
       ns=s1;
     else
       ns=idle;
   end
 s1:
   begin
     out=0;
     if(in)
       ns=s1;
     else
       ns=s10;
   end
 s10: 
   begin
     out=0;
     if(in)
       ns=s101;
     else
       ns=idle;
   end
  s101:
    begin
      out=1;
      if(in)
        ns=s1;
      else
        ns=s10;
    end
  default: begin
    out=0;
    ns=idle;
  end
endcase
end
  endmodule

							//10x moore machine
module seq_detect(clk,rst,in,out);
  input clk,rst,in;
  output reg out;
  
  //state variables
  reg [2:0] ps;
  reg [2:0] ns;
  
  //encoding states
parameter idle=3'b000;
parameter s1=3'b001;
parameter s10=3'b010;
parameter s101=3'b011;
parameter s100=3'b100;
    //state registar
always @(posedge clk)
begin
if(!rst)
ps<=idle;
else
ps<=ns;
end

     //next state decoder
always @(in,ps)
begin
case(ps)
 idle:
   begin
     out=0;
     if(in)
       ns=s1;
     else
       ns=idle;
   end
 s1:
   begin
     out=0;
     if(in)
       ns=s1;
     else
       ns=s10;
   end
 s10: 
   begin
     out=0;
     if(in)
       ns=s101;
     else
       ns=s100;
   end
  s101:
    begin
      out=1;
      if(in)
        ns=s1;
      else
        ns=s10;
    end
  s100:
    begin
      out=1;
      if(in)
        ns=s1;
      else
        ns=idle;
    end
  default: begin
    out=0;
    ns=idle;
  end
endcase
end
  endmodule
