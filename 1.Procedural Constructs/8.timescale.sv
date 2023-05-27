`timescale 1ns / 1ps

module tb();
  
  reg clk16 = 0;
  reg clk8 = 0;
  
  always #31.25 clk16 = ~clk16;
  always #62.5 clk8 = ~clk8;

  initial begin
    #200;
    $finish();
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
endmodule