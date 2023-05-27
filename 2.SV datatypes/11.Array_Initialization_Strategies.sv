module tb;
  bit arr1[5];
  logic arr2[5];
  
  initial begin
    $display("arr1: %0p",arr1);
    $display("arr2: %0p",arr2);
  end
  
  // unique
  int arr3[5] = '{1,2,3,4,5};
  initial begin
    $display("arr3: %0p",arr3);
  end
  
  // repetation operator
  int arr4[5] = '{5{0}};
  initial begin
    $display("arr4: %0p",arr4);
  end
  
  // default
  int arr5[10] = '{default:1};
  initial begin
    $display("arr5: %0p",arr5);
  end
  
  // uninitialized
  int arr6[2];
  
endmodule