//PRIME NO CHECK

module check(din,dout);
  input [31:0] din;
  output reg dout;

  function prime([31:0]din);
    begin
      integer i;
      if(din<=1)
          prime=0;
       else
      begin
        prime=1;
      for(i=2;i<=din/2;i=i+1)
        begin
          if(din%i==0)
            prime=0;
        end
      end
    end
  endfunction
  
  always @(din)
    dout=prime(din);
endmodule
								//testbench
module tb;
  reg [31:0] din;
  wire dout;
  check dut(din,dout);
  initial begin
    #5 din=7;
    #5 din=2504;
    #5 din=21;
    #5 din=27;
    #5 din=31;
    #5 din=15;
    #500 $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,din,dout);
  end
endmodule
