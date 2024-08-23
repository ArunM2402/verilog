module nbitadder #(parameter N=4)
  (a,b,cin,sum,cout);
  
  input [N-1:0] a,b;
  input cin;
  output [N-1:0]sum;
  output cout;
  wire [N:0] c;
  assign c[0]=cin;
  assign cout=c[N];
  
  genvar i;
  generate
    for(i=0;i<N;i=i+1)
      begin: nbitadder
        fa f(a[i],b[i],c[i],sum[i],c[i+1]); 
      end
  endgenerate
endmodule

module fa(a,b,cin,sum,cout);
  input a,b,cin;
  output sum,cout;
  assign {cout,sum}=a+b+cin;
endmodule
