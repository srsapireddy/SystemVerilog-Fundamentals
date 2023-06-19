class generator;
  
  randc bit [3:0] raddr, waddr;
  rand bit wr; // write to memory
  rand bit oe; // output enable when user want to read the data from the memory
  
  constraint wr_c {
    wr dist {0:=50, 1:=50};
  }
  
  constraint oe_c {
    oe dist {1:=50, 0:=50};
  }
  
  constraint wr_oe_c {
    ( wr == 1 ) -> (oe == 0); 
  }
  
endclass

module tb;
  
  generator g;
  
  initial begin
    g = new();
    
    g.wr_oe_c.constraint_mode(0); // 1 -> constraint is on, 0 -> constraint is off
    $display("Constraint Status of oe_c: %0d", g.oe_c.constraint_mode());
    $display("Constraint Status of wr_oe_c: %0d", g.wr_oe_c.constraint_mode());
    
    for(int i = 0; i<20; i++) begin
      assert(g.randomize()) else $display("Randomization Failed");
      $display("Value of wr : %0b | oe : %0b |", g.wr, g.oe);
    end
  end
  
endmodule