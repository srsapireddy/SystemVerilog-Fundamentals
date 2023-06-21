/*Code for transaction class is mentioned in the Instruction tab. 
Write a code to send transaction data between generator and driver. Also, verify the data by printing the value of data members of Generator and Driver in each transaction. 
Execute the code for 10 random transactions.*/


class transaction;    
  rand bit [7:0] a;
  rand bit [7:0] b;
  rand bit wr;   
endclass

class generator;
  transaction t;
  mailbox #(transaction) mbx;
  
  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
  
  task run();
    for(int i = 0; i < 10; i++) begin
      t = new();
      assert(t.randomize) else $display("Randomization Failed");
      mbx.put(t);
      $display("[GEN]: Data Send: a: %0d, b: %0d, wr: %0d", t.a,t.b,t.wr);
      #10;
    end   
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
      $display("[DRV]: Data Receive: a: %0d, b: %0d, wr: %0d", tb.a,tb.b,tb.wr);
      #10;
    end
  endtask
endclass

module tb;
  mailbox #(transaction) mbx;
  generator g;
  driver d;
  
  initial begin
    mbx = new();
    g = new(mbx);
    d = new(mbx);
    
    fork
      g.run();
      d.run();
    join
  end
endmodule