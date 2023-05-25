`timescale 1ns / 1ps

module tb();
  
  reg clk; // X by default
  reg clk50;
  reg clk25 = 0;
  
  initial begin
    clk = 1'b0;
    //rst = 1'b0;
    clk50 = 0;
  end
  
  always #5 clk = ~clk; // 100 MHz
  always #10 clk50 = ~clk50; // 50 MHz
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