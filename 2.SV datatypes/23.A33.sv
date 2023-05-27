/*Create two arrays of reg type capable of storing 15 elements. Use $urandom function to add 15 values to the array. 
Print the value of all the elements of the array on a single line.*/

module tb;
  reg arr1[0:14];
  reg arr2[0:14];
  initial begin
    for(int i=0;i<15;i++) begin
      arr1[i]=$urandom();
      arr2[i]=$urandom();
    end
    $display("values of all the elements: %0p", arr1);
    $display("values of all the elements: %0p", arr2);
  end

endmodule