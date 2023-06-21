/*Code for transaction class is mentioned in the Instruction tab. Write a code to send transaction data between generator and driver. 
Also, verify the data by printing the value of data members of Generator and Driver. */

 class transaction;
   bit [7:0] addr = 7'h12;
   bit [3:0] data = 4'h4;
   bit we = 1'b1;
   bit rst = 1'b0;
endclass

class generator;
  transaction t;
  mailbox #(transaction) mbx;
  
  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
  
  task run();
    t = new();
    $display("[GEN]: Data Send: addr: %0d, data: %0d, we: %0d, rst: %0d", t.addr,t.data,t.we,t.rst);
    mbx.put(t);
  endtask
endclass

class driver;
  transaction tb;
  mailbox #(transaction) mbx;
  
  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
  
  task run();
    forever begin
      mbx.get(tb);
      $display("[DRV]: Data Received: addr: %0d, data: %0d, we: %0d, rst: %0d", tb.addr,tb.data,tb.we,tb.rst);
    end
  endtask
endclass

module tb;
  generator g;
  driver d;
  mailbox #(transaction) mbx;
  
  initial begin
    mbx = new();
    g = new(mbx);
    d = new(mbx);
    g.run();
    d.run();
  end
endmodule

