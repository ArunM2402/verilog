module tb;
  integer f=0;
  integer s=1;
  integer i;
  integer temp=0;
  parameter n=10;
  initial begin
    $write("%d \t %d",f,s);
    for(i=2;i<=n;i=i+1)
      begin 
      temp=f+s;
      f=s;
      s=temp;
      $write("%d \t",s);
      end
  end
endmodule
