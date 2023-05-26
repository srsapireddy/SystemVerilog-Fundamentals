/* Assume you have four variables ( a, b,c, and d )  in your testbench top. a and b are of the 8-bit reg type, while c and d are of the integer type. 
initialize a,b,c, and d to values of 12, 34, 67, and 255 respectively. 
Add a code to print the values of all the variables after 12 nSec.*/

`timescale 1ns/1ps


module tb;
  
  reg [7:0] a = 8'd12;
  reg [7:0] b = 8'd34;
  int c = 67;
  int d = 255;
  
  initial begin
  	#12;
    $display("a = %d, b = %d,c = %d, d =%d",a,b,c,d);
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
  initial begin
    #200;
    $finish();
  end
  
endmodule


