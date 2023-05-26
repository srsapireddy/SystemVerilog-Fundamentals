`timescale 1ns/1ps
/*
module top(
	input a,b,sel, // sel = 0 y = a, sel = 1 y = b
	output y
	);
  
  logic temp;
  
  // procedual block - for combinational
  always@(*)
    begin
      if(sel==1'b0)
        temp=a;
      else
        temp=b;
    end
  assign y = temp;

endmodule
*/

`timescale 1ns/1ps

module ha(
	input wire a,b,cin,
    output wire sout, cout
	);
    
  assign sout = a^b;
  assign cout = a&b;

module fa(
  	input a,b,cin,
  	output s,c
	);
  
logic t1,t2,t3; // reg cannot be used for the output port connection
ha h1(a,b,t1,t2);
ha h2(t1, cin, s, t3);  

assign c = t1 | t3;
  
endmodule