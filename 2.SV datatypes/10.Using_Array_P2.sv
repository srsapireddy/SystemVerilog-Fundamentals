module tb;
  bit arr1[8];
  bit arr2[] = {1,0,1,1};
  
  initial begin
    $display("Value of first element: %d", arr1[0]);
    arr1[1] = 1;
    $display("Value of second element: %d", arr1[1]);
    $display("Values of all elements of arr2: %0p", arr2);
  end
endmodule