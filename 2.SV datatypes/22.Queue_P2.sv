module tb;
  int arr[$];
      int j = 0;
  initial begin
    arr = {1,2,3};
    $display("arr: %0p",arr);
    
    arr.push_front(7);
    $display("arr: %0p",arr);
    arr.push_back(9);
    $display("arr: %0p",arr);
    arr.insert(2,10);
    $display("arr: %0p",arr);
    
    j = arr.pop_front();
    $display("arr: %0p",arr);
    $display("value of j: %0d",j);
    
    j = arr.pop_back();
    $display("arr: %0p",arr);
    $display("value of j: %0d",j);
    
    arr.delete(1);
    $display("arr: %0p",arr);
    
  end
endmodule