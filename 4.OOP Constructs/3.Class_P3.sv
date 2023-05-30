class first;
  reg [2:0] data;
  reg [1:0] data2;
  
endclass

module tb;
  first f;
  initial begin
    f = new(); // constructor
    f.data = 3'b010;
    f.data2 = 2'b10;
    //f = null; // deallocating class memory (deleting an object)
    #1;
    $display("value of the data: %0d and data2: %d", f.data,f.data2);
  end
endmodule