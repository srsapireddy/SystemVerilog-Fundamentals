// testbench.sv

class transaction;
      bit [4:0] sum;
      randc bit [3:0] a;
      randc bit [3:0] b;
     
      
      function void display();
        $display("a : %0d \t b: %0d \t sum: %0d ", a,b,sum);
      endfunction
     
   
endclass

interface add_if;
  logic [3:0] a;
  logic [3:0] b;
  logic [4:0] sum;
  logic clk;
endinterface

class monitor;
  mailbox #(transaction) mbx;
  transaction trans;
  virtual add_if aif;
  
  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
  
  task run();
    forever begin
      trans = new();
      repeat (2) @(posedge aif.clk);
      trans.a = aif.a;
      trans.b = aif.b;
      trans.sum = aif.sum;
      $display("-----------------------------------");
      $display("[MON]: DATA SENT TO SCOREBOARD");
      trans.display();
      mbx.put(trans);
    end
  endtask
endclass

class scoreboard;
  mailbox #(transaction) mbx;
  transaction trans;
  virtual add_if aif;
  
  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
  
  task compare(input transaction trans);
    if( (trans.sum) == (trans.a + trans.b))
      $display("[SCO]: SUM RESULT MATCH");
    else
      $error("[SCO]: SUM RESULT MISMATCH"); // $warning, $fatal
  endtask
  
  task run();
    forever begin
      mbx.get(trans);
      $display("[SCO]: DATA RECEIVED FROM MONITOR");
      trans.display();
      compare(trans);
      $display("-----------------------------------");
      #40;
    end
  endtask
endclass

module tb;
  monitor mon;
  scoreboard sco;
  mailbox #(transaction) mbx;
    
  add_if aif();

      
  add dut (aif.a, aif.b, aif.sum, aif.clk);
  
  initial begin
    aif.clk <= 0;
  end
  
  always #10 aif.clk <= ~aif.clk;
      
  initial begin
    for(int i = 0;i<20;i++) begin
      repeat (2) @(posedge aif.clk);
      aif.a <= $urandom_range(0,15);
      aif.b <= $urandom_range(0,15);
    end
  end
  
  initial begin
    mbx = new();
    mon = new(mbx);
    sco = new(mbx);
    mon.aif = aif;
  end
  
  initial begin
    fork
      mon.run();
      sco.run();
    join
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
      sum <= a - b;
    end

endmodule