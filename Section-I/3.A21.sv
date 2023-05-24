`timescale 1ns / 1ps

module tb();
  
  //// global signal clk, rst
  reg resetn;
  reg clk;

  
  initial begin
    clk = 1'b0;
    resetn = 1'b0;
    #60
    resetn = 1'b1;
  end
  
  
  // 4. Analyzing the values of a variable on console
  initial begin
    $monitor("resetn: %d at time %0t", resetn, $time);
  end
  
  // 3. Run system task at the start of simulation
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars; 
  end

	
endmodule
  
  
