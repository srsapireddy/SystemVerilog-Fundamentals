module tb;
  
  int arr[10];
  int i = 0;
  
  initial begin
  foreach(arr[j]) begin //0---9
    arr[j] = j;
    $display("%0d",arr[j]);
  end
  end
  
endmodule