class first;
  int data = 12;
endclass

class second;
  int ds = 34;
  
  first f1; // handler
  function new(); // custom constructor
    f1 = new();
  endfunction
endclass

module tb;
  second s1, s2;
  initial begin
    s1 = new();
    s1.ds = 45;
    s2 = new s1;
    $display("Value of ds: %0d", s2.ds);
    s2.ds = 78;
    $display("Value of ds: %0d", s1.ds);
    // we get an independent copy of the data member but not the class object
    // both s1 and s2 point to the same handler
    s2.f1.data = 56;
    $display("Value of data: %0d", s1.f1.data);
  end
endmodule