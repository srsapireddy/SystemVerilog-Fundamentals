module tb;
  int arr[$];
  initial begin
    arr = {1,2,3};
    $display("arr: %0p",arr);
  end
endmodule