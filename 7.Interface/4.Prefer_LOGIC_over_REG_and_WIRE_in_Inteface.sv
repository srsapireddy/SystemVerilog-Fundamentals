// testbench.sv
interface add_if;
  wire [3:0] a;
  wire [3:0] b;
  wire [4:0] sum;
endinterface
// interface with all reg type. we are not allowed to connect variable in interface to the output port of DUT
// interface with all wire type, we are not allowed to apply stimulus using initial or always 


module tb;
  add_if aif();
  // add dut (aif.a,  aif.b, aif.sum); // positional mapping
  add dut (.b(aif.b), .a(aif.a), .sum(aif.sum)); // mapping by name
  
  initial begin
    aif.a = 1;
    aif.b = 3;
   
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #100;
    $finish();
  end
endmodule

// design.sv
module add (
  input [3:0] a,b,
  output [4:0] sum,
);

  assign sum = a + b;

endmodule