`timescale 1ns / 1ps

module tb();
  
  reg clk; // X by default
  reg clk50;
  reg clk25 = 0;
  
  initial begin
    clk = 1'b0;
  end
  
  /*
  always #5 clk = ~clk; // 100 MHz
  always #10 clk50 = ~clk50; // 50 MHz
  always #20 clk25 = ~clk25; // 25 Mhz
  */
  
  always #5 clk = ~clk; // 100 MHz
  always begin
    #5;
    clk50 = 1;
    #10;
    clk50 = 0;
    #5;
  end
  
  always begin
  	#5;
    clk25 = 1;
    #20;
    clk25 = 1;
    #15;
  end
  
  initial begin
    #200;
    $finish();
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
endmodule