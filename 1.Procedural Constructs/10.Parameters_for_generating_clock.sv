/*
`timescale 1ns / 1ps

module tb();
  
  reg clk = 0;
  reg clk50 = 0;
  
  always #5 clk = ~clk; // 100 MHz
  
  real phase = 10;
  real ton = 5;
  real toff = 5;
  
  initial begin
    #phase;
    while(1) begin
   	  clk50 = 1;
      #ton;
      clk50 = 0;
      #toff;
    end
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
*/

`timescale 1ns / 1ps

module tb();
  
  reg clk = 0;
  reg clk50 = 0;
  
  always #5 clk = ~clk; // 100 MHz
  /*
  real phase = 10;
  real ton = 5;
  real toff = 5;
  */
  task clkgen(input real phase, input real ton, input real toff);
    #phase;
    while(1) begin
   	  clk50 = 1;
      #ton;
      clk50 = 0;
      #toff;
    end
  endtask
  
  
  initial begin
    clkgen(10,5,5);
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