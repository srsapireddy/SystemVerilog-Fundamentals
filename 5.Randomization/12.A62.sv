/*Assume generator class consists of three 8-bit data members (x,y, and z). 
Write a code to generate 20 random values for all the data members at an interval of 20 ns. 
Random values for all data members should range from 0 to 50.*/

class generator;
  randc bit [7:0] x;
  randc bit [7:0] y;
  randc bit [7:0] z;
  
  extern constraint val;
endclass

constraint generator::val{
    x inside {[0:50]};
    y inside {[0:50]};
    z inside {[0:50]};
  };

module tb;
  generator g;
  int i = 0;
  initial begin
    g = new();
    for(i = 0;i<20;i++) begin
      g.randomize();
      $display("Values of x, y and z are: %0d, %0d and %0d", g.x, g.y, g.z);
      #20;
    end
  end
endmodule