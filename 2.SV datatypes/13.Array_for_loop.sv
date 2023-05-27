module tb;
  
  int arr[10];
  initial begin
    int i = 0;
    for(i = 0;i<10;i++) begin
      arr[i] = i;
    end  
    
    $display("arr: %0p", arr);
    
  end  
  
endmodule