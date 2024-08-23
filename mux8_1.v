//8:1 mux using 4:1 mux and 2:1 mux
module mux2_1(i,s,y);
  input [1:0] i;
  input s;
  output y;
  assign y=i[s];
endmodule

module mux4_1(i,s,y);
  input [3:0] i;
  input [1:0] s;
  output y;
  wire [1:0] w;
  mux2_1 m1(.i(i[0:1]),.s(s[0]),.y(w[0]));
  mux2_1 m2(.i(i[2:3]),.s(s[0]),.y(w[1]));
  mux2_1 m3(.i(w),.s(s[1]),.y(y));
endmodule
            
module mux8_1(i,s,y);
  input [7:0] i;
  input [2:0] s;
  output y;
  wire [1:0] w;
  mux4_1 m1(.i(i[0:3]),.s(s[0:1]),.y(w[0]));
  mux4_1 m2(.i(i[4:7]),.s(s[0:1]),.y(w[1]));
  mux2_1 m3(.i(w),.s(s[2]),.y(y));
endmodule
					//8:1 mux using only 4:1 mux
module mux4_1(i,s,y);
  input [3:0] i;
  input [1:0] s;
  output y;
  wire [1:0] w;
  mux2_1 m1(.i(i[0:1]),.s(s[0]),.y(w[0]));
  mux2_1 m2(.i(i[2:3]),.s(s[0]),.y(w[1]));
  mux2_1 m3(.i(w),.s(s[1]),.y(y));
endmodule
module mux8_1(i,s,y);
  input [7:0] i;
  input [2:0] s;
  output y;
  wire [3:0] w;
  mux4_1 m1(.i(i[0:3]),.s(s[0:1]),.y(w[0]));
  mux4_1 m2(.i(i[4:7]),.s(s[0:1]),.y(w[1]));
  mux4_1 m3(.i(w),.s({0,s[2]}),.y(y));
