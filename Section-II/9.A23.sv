// Write a code to generate a 9MHz square waveform for the signal sclk. Assume timescale with 1nsec time-unit and 3 digit precision.

`timescale 1ns / 1ps

module tb();
  
    reg clk9 = 0;

    always #55.5 clk9 = ~clk9;
  

  initial begin
    #200;
    $finish();
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
endmodule