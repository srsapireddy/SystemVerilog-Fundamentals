// testbench.sv
interface add_if;
  logic [3:0] a,b;
  logic [4:0] sum;
  logic clk;
  
  modport DRV(output a,b, input sum,clk);
  
endinterface

class driver;
  virtual add_if.DRV aif;
  
  task run();
    forever begin
      @(posedge aif.clk);
        aif.a <= 2;
        aif.b <= 3;
        $display("[DRV] : Interface Trigger");
      end
  endtask
endclass

module tb;
  add_if aif();
  
  add dut (.a(aif.a), .b(aif.b), .sum(aif.sum), .clk(aif.clk));
  
  initial begin
    aif.clk <= 0;
  end
  
  always #10 aif.clk = ~aif.clk;
  
  driver drv;
  
  initial begin
    drv = new();
    drv.aif = aif;
    drv.run();
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #100;
    $finish();
  end
endmodule

//design.sv
module add (
  input [3:0] a,b,
  output reg [4:0] sum,
  input clk
);

  always@(posedge clk)
    begin
      sum <= a + b;
    end

endmodule