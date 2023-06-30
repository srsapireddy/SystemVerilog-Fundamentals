 class transaction;
      bit [4:0] sum;
      randc bit [3:0] a;
      randc bit [3:0] b;
     
      
      function void display();
        $display("a : %0d \t b: %0d \t sum: %0d ", a,b,sum);
      endfunction
     
   
endclass
    
class monitor;
  mailbox #(transaction) mbx);
  transaction trans;
  virtual add_if aif;
  
  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
  
  task run();
    forever begin
      trans = new();
      @(posedge aif.clk);
      trans.a <= aif.a;
      trans.b <= aif.b;
      trans.sum <= aif.sum;
      trans.display();
      $display("[MON]: DATA SENT TO SCOREBOARD");
    end
  endtask
endclass
// testbench.sv
interface add_if;
  logic [3:0] a;
  logic [3:0] b;
  logic [4:0] sum;
  logic clk;
endinterface

module tb;
    
  add_if aif();

      
  add dut (aif.a, aif.b, aif.sum, aif.clk);
  
  initial begin
    aif.clk <= 0;
  end
  
  always #10 aif.clk <= ~aif.clk;
      
  initial begin
    for(int i = 0;i<20;i++) begin
      @(posedge aif.clk);
      aif.a <= $urandom_range(0,15);
      aif.b <= $urandom_range(0,15);
    end
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #450;
    $finish();
  end
     
 endmodule
 
// design.sv
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