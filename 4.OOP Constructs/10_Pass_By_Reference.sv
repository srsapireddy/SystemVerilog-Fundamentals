module tb;
  task automatic swap(ref bit [1:0] a,b); // function automatic bit [1:0] add(arguments);
    bit [1:0] temp;
    
    temp = a;
    a = b;
    b = temp;
    $display("Value of a: %0d and b: %0d", a,b);
  endtask
  
  bit [1:0] a;
  bit [1:0] b;
  initial begin
    a = 1;
    b = 2;
    swap(a,b);
    $display("Value of a: %0d and b: %0d", a,b);
  end
endmodule