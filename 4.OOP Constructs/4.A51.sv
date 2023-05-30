/*Create a Class consisting of 3 data members each of unsigned integer type. Initialize them to 45,78, and 90. 
Use the display function to print the values on the console.*/

class first;
  bit [7:0] data;
  bit [7:0] data2;
  bit [7:0] data3;
  
endclass

module tb;
  first f;
  initial begin
    f = new(); // constructor
    f.data = 45;
    f.data2 = 78;
    f.data3 = 90;
    #1;
    $display("value of the data: %0d, data2: %d and data3: %0d", f.data,f.data2,f.data3);
  end
endmodule