//NOTE: The backslashes before pattern is to comment those pattern bits to avoid error
//PATTERN
//*
//**
//***
//****
module tb;
  integer i,j;
 parameter row=4;
  initial 
  begin
  for(i=1;i<=row;i=i+1)
  begin
    for(j=1;j<=i;j=j+1)
      begin
      $write("* \t");
      end
    $display(" ");
  end
  end
endmodule

//PATTERN
//1
//1 2
//1 2 3
//1 2 3 4
module tb;
  integer i,j;
  parameter row=4;
  initial 
  begin
    for(i=1;i<=row;i=i+1)
  begin
    for(j=1;j<=i;j=j+1)
      begin
        $write(" %0d \t",j);  //removes leading zeroes or space
      end
    $display(" ");
  end
  end
endmodule

//PATTERN
//1
//2 3
//4 5 6
//7 8 9 10
module tb;
  integer i,j;
  parameter row=4;
  integer c=0;
  initial 
  begin
    for(i=1;i<=row;i=i+1)
  begin
    for(j=1;j<=i;j=j+1)
      begin
        c=c+1;
        $write(" %0d \t",c);
      end
    $display(" ");
  end
  end
endmodule
                                      //pattern
	                		 //      *
                    		//	*  *  *
                     //  *  *  *  *  *
        			          //  *  *  *
					                  // *
module tb;
    parameter rows = 3;
    integer i, j, k;

    initial begin
        // Loop to print the top half of the pyramid 
        for (i = 0; i < ROWS; i = i + 1) begin
            // Print leading spaces
            for (j = 0; j < ROWS - i - 1; j = j + 1) begin
                $write(" ");
            end
            for (k = 0; k < (2 * i + 1); k = k + 1) begin
              $write("*");
            end
            $display("");
        end

        // Loop to print the bottom half of the pyramid
        for (i = ROWS - 2; i >= 0; i = i - 1) begin
            // Print leading spaces
            for (j = 0; j < ROWS - i - 1; j = j + 1) begin
                $write(" ");
            end
            for (k = 0; k < (2 * i + 1); k = k + 1) begin
              $write("*");
            end
            $display("");
        end
    end
endmodule
                                                              //pattern
		  //    *
	    //  *	*
	    //* * *
	 // * * * *
module tb;
    parameter rows = 4;
    integer i, j;
    initial begin
      for (i = 0; i < rows; i = i + 1) begin
            // Print leading spaces
        for (j = 0; j < rows - i - 1; j = j + 1) begin
                $write(" ");
            end
            for (j = 0; j <= i; j = j + 1) begin
                $write("*");
            end
            $display("");
        end
    end
endmodule
                                                      //pattern
        //1
      //2 1
    //3 2 1
  //4 3 2 1
module tb;
    parameter rows = 4;
    integer i, j;

    initial begin
        for (i = 1; i <= rows; i = i + 1) begin
            // Print leading spaces
            for (j = rows; j > i; j = j - 1) begin
                $write("  "); // Two spaces for alignment
            end
            for (j = i; j >= 1; j = j - 1) begin
                $write("%0d ", j);
            end
            $display("");
        end
    end
  								// PATTERN
//0 0 1 1 0 0 2 2 0 0 3 3
module tb;
  integer i=0;
  integer j;
  initial begin
    for(j=1;j<=3;j=j+1)
      begin
    $write("%d %d",i,i);
    $write("%d %d",j,j);
      end
  end
endmodule

  
  //PATTERN 1 2 3 4 5 6 7 6 5....(fsm approach)
       
  
module counter(count,clk,rst);
  input clk,rst;
  output reg [2:0] count=0;
  integer i;
  reg d=0;
  always @(posedge clk)
    begin
      if(!rst)
        count<=0;
      else
        begin
          case(d)
            0: begin
              if(count==7)
                begin
                  d<=1;
                  count<=count-1;
                end
              else
                count<=count+1;
            end
            1: begin
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
endmodule
