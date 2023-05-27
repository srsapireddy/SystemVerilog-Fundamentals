/*
Write a function capable of generating a square waveform with the help of period(in nSec) and duty cycle(0 to 1). 
The phase difference is assumed to be 0 for the entire system operation. 
Verify function behavior by generating waveform for the signal clk with period: 40 nsec and duty cycle: 0.4
*/

    `timescale 1ns / 1ps
     
    module tb();
     
      
      reg clk = 0; 
      reg clk50 = 0;
      
      always #40 clk = ~clk; //100 MHz
        
      /*
      real phase = 10;
      real ton = 5;
      real toff = 5;
      */
    /*  
    task clkgen(input real phase, input real ton, input real toff);  
      #phase;
      while(1) begin
      clk50 = 1;
      #ton;
      clk50 = 0;
      #toff;
      end
    endtask
    */
     
     
    task calc (input real freq_hz, input real duty_cycle, input real phase, output real pout, output real ton, output real toff);
    pout = phase;
    ton = (1.0 / freq_hz) * duty_cycle * 1000_000_000;
    toff =  (1000_000_000 / freq_hz) - ton;
    endtask
     
     
    task clkgen(input real phase, input real ton, input real toff);  
      @(posedge clk);
      #phase;
      while(1) begin
      clk50 = 1;
      #ton;
      clk50 = 0;
      #toff;
      end
    endtask
     
    real phase;
    real ton;
    real toff;
     
     
    initial begin
      calc(100_000_000, 0.4, 0, phase, ton, toff);
    clkgen(phase, ton, toff);
    end
     
    initial begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end
     
      initial begin
        #200;
        $finish();
      end
      
    endmodule