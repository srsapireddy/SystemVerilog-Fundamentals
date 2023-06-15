// code your testbench here
// transaction - holding all the input and output of a DUT
// generator class
class generator;
  randc bit [3:0] a,b; // rand or randc
  bit [3:0] y; // y will be storing the response from the DUT
  
  constraint data {a > 15;}
  
endclass

module tb;
  generator g;
  int i = 0;
  int status = 0;
  initial begin
    g = new();
    for(i = 0; i<10;i++) begin
      
      assert(g.randomize())else begin
        $display("Randomization Failed at %0t", $time);
        $finish();
      end
      
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