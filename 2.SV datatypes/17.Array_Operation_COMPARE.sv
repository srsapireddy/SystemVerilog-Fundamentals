module tb;
  int arr1[5] = '{1,2,3,4,5};
  int arr2[5] = '{1,2,3,4,5};
  
  int status;
  initial begin
    status = (arr1 == arr2); // arr1 != arr2 (inequality operator)
    $display("Status: %0d",status);
  end
endmodule