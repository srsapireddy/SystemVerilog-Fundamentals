/*Create an array capable of storing 10 elements of an unsigned integer. 
Initialize all the 10 elements to a value equal to the square of the index of that element. 
for e.g. first element has index no. 0 so initialize it to 0, the second element has index no. 1 
so initialize it to 1, the third element has index no. 2 so initialize it to 4, and so on. 
Verify the code by sending values of all the elements on Console.*/

module tb;
  bit arr1[5];
  logic arr2[5];
  
  // unique
  int arr[10] = '{0,1,4,9,16,25,36,49,64,81};
  initial begin
    $display("arr3: %0p",arr);
  end
  
endmodule