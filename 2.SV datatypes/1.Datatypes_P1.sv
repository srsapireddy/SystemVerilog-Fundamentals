
module tb;
  
  // SIGNLE BIT DATATYPE
  bit a = 0; // single bit variable
  
  // VARIABLE DATATYPE
  // SIGNED DATATYPE
  byte     b = 0; // 2 state signed -> by default = 0, for 4 state -> X
  shortint c = 0; // 16 bit datatype
  int      e = 0; // 32 bit datatype
  longint  d = 0; // 32 bit datatype
  
  // UNSIGNED DATATYPE
  bit [7:0]  f = 8'd0; // 8'b00000000; 
  bit [15:0] g = 16'h0000;
  bit [31:0] h = 32'd0;
  
  real i = 0;
  
  initial begin
    a = 1'b0; // signle bit variable
  end
  
endmodule


