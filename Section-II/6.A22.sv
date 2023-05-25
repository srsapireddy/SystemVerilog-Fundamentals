// Assume `timescale 1ps/1ps. Generate a 25 MHz square wave waveform for the Signal clk.

`timescale 1ns / 1ps

module tb();
  

  reg clk25 = 0;
  
  initial begin
    clk25 = 0;
  end
  
  always #20 clk25 = ~clk25; // 25 Mhz
  
  initial begin
    #200;
    $finish();
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
endmodule