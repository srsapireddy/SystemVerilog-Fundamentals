module tb;
  
	byte var1 = -126; // -128 to +127 -> signed
    bit [7:0] var2 = 130; // 0 to 255 -> unsigned
    
  	initial begin
      #10;
      $display("value of VAR: %0d", var2);
    end
  
  	shortint var3 = 0; // 16-bit unsigned
  
endmodule