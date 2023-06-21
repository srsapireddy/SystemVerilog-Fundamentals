class transaction;
  bit [7:0] data;
endclass

class generator;
  int data = 12;
  transaction t;
  
  mailbox #(transaction) mbx;
  
  logic [7:0] temp = 3;
  
  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
  
  task main();
    t = new();
    t.data = 45;
    mbx.put(t);
    $display("[GEN] : Data Send from Gen : %0d", t.data);
  endtask
endclass

class driver;
  mailbox #(transaction) mbx;
  transaction data;
  
  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
  
  task main();
    forever begin
      mbx.get(data); // this will automatically create an object for us
      $display("[DRV] : Data rcvd : %0d", data.data);
      #10;
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
    
    fork 
      g.main();
      d.main();
    join
    
  end
endmodule