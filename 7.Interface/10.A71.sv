// Create transaction, Generator and Driver code for Synchronus 4-bit Multiplier.
// design.sv

    module top
    (
      input clk,
      input [3:0] a,b,
      output reg [7:0] mul
    );
      
      always@(posedge clk)
        begin
         mul <= a * b;
        end
      
    endmodule

// testbench.sv
class transaction;

  randc bit [3:0]a,b;

  bit [7:0]mul;

 

  function void display();

    $display("a:%0d\tb:%0d",a,b);

  endfunction

 

  function transaction copy();

    copy=new();

    copy.a=a;

    copy.b=b;

    copy.mul=mul;

  endfunction

endclass


class generator;

  transaction t;

  mailbox #(transaction) mbx;

  event done;

 

  function new(mailbox #(transaction) mbx);

    this.mbx=mbx;

    t=new();

  endfunction

 

  task run;

    for(int i=0;i<10;i++) begin

      t.randomize();

      mbx.put(t.copy);

      $display("DATA SENT FROM GEN");

      t.display();

      #20;

    end

   ->done;

  endtask

endclass


interface top_if;

  logic clk;

  logic [3:0]a,b;

  logic [7:0]mul;

 

  modport DRV(output a,b, input clk,mul);

endinterface


class driver;

  transaction dc;

  mailbox #(transaction) mbx;

  virtual top_if tif;

 

  function new(mailbox #(transaction) mbx);

    this.mbx=mbx;

  endfunction

 

  task run;

    forever begin

    mbx.get(dc);

       #10;

    @(negedge tif.clk);

    tif.a <= dc.a;

    tif.b <= dc.b;

    $display("INTERFACE TRIGGRED");

    dc.display();

   

    end

  endtask

endclass


module tb();

  top_if tif();

  mailbox #(transaction) mbx;

  generator gen;

  driver drv;

  event done;

 

  top dut(tif.clk,tif.a,tif.b,tif.mul);

 

  initial tif.clk = 0;

  always #10 tif.clk=~tif.clk;

 

  initial begin

    mbx=new();

    gen=new(mbx);

    drv=new(mbx);

    drv.tif=tif;

    gen.done =done;

   

  end

 

  initial begin

    fork

    gen.run();

    drv.run();

    join 

  end

 

  initial begin

    $dumpfile("dump.vcd");

    $dumpvars;

 

  wait(done.triggered);

  $finish;

  end

endmodule