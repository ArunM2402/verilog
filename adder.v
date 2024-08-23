module m1(a,b,cin, sum, cout);
  input a,b,cin;
  output sum,cout;
  assign sum= a^b^cin;
  assign cout=(a&b)|(b&c)|(c&a);
  //assign {cout,sum}=a+b+c;
endmodule

                                                            //BEHAVIORAL 
module m1(a,b,cin,sum,cout);		
	input a,b,cin;
	output reg sum,cout;
	always @(a,b,cin)
	begin
	sum=a^b^cin;
	cout=(a&b)| (b&c) | (c&a);
	end
endmodule
                                                            //GATE LEVEL
module m1(a,b,cin,sum,cout);		
       input a,b,cin;
       output sum,cout;
       wire w1
       xor x1(w1,a,b);
       xor x2(sum,w1,cin);
       and a1(w2,a,b);
       and a2(w3,b,cin);
	and a3(w4,a,cin);
	or o1(cout,a,b,cin);
endmodule
									                                        //STRUCTURAL FULL ADDER

module ha(input a,b,output s,c);
  assign s= a^b;
  assign c=a&b; //assign {c,s}=a+b;
endmodule

module or_gate(input a,b, output c);
  assign c= a|b;
endmodule

module fa(input a,b,cin, output sum, cout);
  wire s,c,c1;
  ha h1(.a(a),.b(b),.s(s),.c(c));
  ha h2(.a(s),.b(cin),.s(sum),.c(c1));
  or_gate o1(.a(c),.b(c1),.c(cout));
endmodule
								                                      // FULL ADDER TEST BENCH
module tb;
  reg a,b,cin;
  wire  sum,cout;
  m1 dut(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));
  initial begin
    	a=0;b=0;cin=0;
    #5 	a=0;b=0;cin=1;
    #5 	a=0;b=1;cin=0; //Method 1
    #5 	a=0;b=1;cin=1;
    #5 	a=1;b=0;cin=0;
    #5 	a=1;b=0;cin=1;
    #5 	a=1;b=1;cin=0;
    #5 	a=1;b=1;cin=1;//{a,b,c}=7; Method 2
    //for(i=0;i<8;i=i+1) Method 3
    //#5 {a,b,cin}=i;
  end
  initial begin			  
	$monitor("Simtime=%0d,a=%b;b=%b;c=%b,sum=%b,carry=%b",$time,a,b,c,sum,carry);
  end
  //generate waveform
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,a,b,c,sum,carry);
  end
endmodule
