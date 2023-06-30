 class transaction;
      bit [4:0] sum;
      randc bit [3:0] a;
      randc bit [3:0] b;
     
      
      function void display();
        $display("a : %0d \t b: %0d \t sum: %0d ", a,b,sum);
      endfunction
      
     virtual function transaction copy();
        copy = new();
        copy.a = this.a;
        copy.b = this.b;
        copy.sum = this.sum;
      endfunction
   
endclass
     
class error extends transaction;
  // constraint data_c {a == 0; b == 0;}
  
  function transaction copy();
        copy = new();
        copy.a = 0;
        copy.b = 0;
        copy.sum = this.sum;
  endfunction
endclass
     
    class generator;
      
      transaction trans;
      mailbox #(transaction) mbx;
      int i = 0;
      event done;
      
      function new(mailbox #(transaction) mbx);
        this.mbx = mbx;
        trans = new();
      endfunction 
      
      task run();
                
        for(i = 0; i<20; i++) begin
          assert(trans.randomize()) else $display("Randomization Failed");
          $display("[GEN] : DATA SENT TO DRIVER");
          trans.display();
          mbx.put(trans.copy); // put method allow us to send transaction data to the class
          #20;
        end
        -> done;
      endtask
    endclass

interface add_if;
  logic [3:0] a;
  logic [3:0] b;
  logic [4:0] sum;
  logic clk;
endinterface
    
class driver;
  virtual add_if aif;
  mailbox #(transaction) mbx;
  transaction data;
  
  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction 
  
  task run();
    forever begin
      mbx.get(data);
      @(posedge aif.clk);
        aif.a <= data.a;
        aif.b <= data.b;
      $display("[DRV]: Interface Trigger");
      data.display;
      end
  endtask
endclass
     
module tb;
    
  add_if aif();
  driver drv;
  generator gen;
  event done;
  mailbox #(transaction) mbx;
  error err;
      
  add dut (aif.a, aif.b, aif.sum, aif.clk);
  
  initial begin
    aif.clk <= 0;
  end
  
  always #10 aif.clk <= ~aif.clk;
      
  initial begin
    err = new();
    mbx = new();
    gen = new(mbx);
    
    gen.trans = err;
    
    drv = new(mbx);
    drv.aif = aif;
    done = gen.done;
  end
  
  initial begin
    fork
      gen.run();
      drv.run();
    join_none
    wait(done.triggered);
    $finish();
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
     
 endmodule