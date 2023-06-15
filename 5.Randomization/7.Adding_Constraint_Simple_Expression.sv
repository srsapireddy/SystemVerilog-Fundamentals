// code your testbench here
// transaction - holding all the input and output of a DUT
// generator class
class generator;
  randc bit [3:0] a,b; // rand or randc
  bit [3:0] y; // y will be storing the response from the DUT
  /*
  constraint data_a {a > 3; a < 7;}
  constraint data_b {b == 3;}
  */
  constraint data {a>3; a<7; b>0;}
endclass

module tb;
  generator g;
  int i = 0;
  initial begin
    
    for(i = 0; i<10;i++) begin
      g = new(); // creates new object for each stimuli
      g.randomize();
      $display("Value of a: %0d and b: %0d", g.a,g.b);
      #10;
    end
  end
endmodule

// design.sv
// Code your design here
/*
module dut;
  input [3:0] a,b;
  output [3:0] y
  );
endmodule
*/