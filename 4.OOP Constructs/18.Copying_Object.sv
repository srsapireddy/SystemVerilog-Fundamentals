class first;
  int data;
endclass

module tb;
  first f1;
  first f2;
  initial begin
    f1 = new(); // constructor
    f1.data = 24; // processing
    
    f2 = new f1; // copy f1 class data into f2
    $display("Value of data member: %0d", f2.data); // processing
    
    f2.data = 22;
    $display("Value of data member: %0d", f1.data); // processing
  end
endmodule