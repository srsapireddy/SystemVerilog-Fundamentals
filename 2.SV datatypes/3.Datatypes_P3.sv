`timescale 1ns/1ps

module tb;
  
	time fix_time = 0; // store fixed point time value
  	realtime real_time = 0; // store floating point time value
  // $time(); -> for fixed point format, $realtime(); -> for floating point time format -> to return the values of time
  
  initial begin
    #12.23;
    real_time = $realtime();
    $display("Current Simulation Time: %0t", real_time);
  end
  
endmodule