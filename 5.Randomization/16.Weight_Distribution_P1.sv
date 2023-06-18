class first;
  
  rand bit wr; // :=
  rand bit rd; // :/
  
  constraint cntrl {
    wr dist {0 := 30, 1 := 70};
    rd dist {0 :/ 30, 1 :/ 70};
  }
  
endclass

module tb;
  first f;
  initial begin
    f = new();
    for(int i = 0;i<10;i++) begin
      f.randomize();
      $display("Value of wr: %0d and rd: %0d", f.wr, f.rd);
    end
  end
endmodule