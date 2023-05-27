module tb;
  bit arr1[8];
  bit arr2[] = {1,0,1,1};
  
  initial begin
    $display("Size of arr1: %d", $size(arr1));
    $display("Size of arr2: %d", $size(arr2));
  end
endmodule