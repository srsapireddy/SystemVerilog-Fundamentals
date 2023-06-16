
// generator class
class generator;
  randc bit [3:0] a,b; // rand or randc
  bit [3:0] y; // y will be storing the response from the DUT

  extern constraint data;
  
  extern function void display();
  
endclass

constraint generator::data {
  a inside {[0:3]};
  b inside {[12:15]};
};
    
function void generator::display();
  $display("Value of a : %0d and b : %0d", a , b);
endfunction    

module tb;
  generator g;
  int i = 0;
  initial begin
    
    for(i = 0; i<10;i++) begin
      g = new(); 
      assert(g.randomize()) else $display("Randomization Failed");
      g.display();
      #10;
    end
  end
endmodule