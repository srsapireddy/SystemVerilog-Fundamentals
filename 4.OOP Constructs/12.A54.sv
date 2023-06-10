/*Create a function that generate and return 32 values of multiple of 8 (0, 8, 16, 24, 32, 40 .... 248). 
Store this value in the local array of the testbench top and also print the value of each element of this array on the console.*/

module tb;
  int res[32];
  
  function automatic void init_arr(ref int a[32]);
    for(int i = 0; i< 32; i++) begin
      a[i] = i*8;
    end
  endfunction
  
  initial begin
    init_arr(res);
      $display("Array : %0p",res);
  end
endmodule