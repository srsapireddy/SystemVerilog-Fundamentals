/*Create a function that will perform the multiplication of the two unsigned integer variables. Compare values return by function 
with the expected result and if both values match send "Test Passed" to Console else send "Test Failed".*/

module tb;
  bit [3:0] ain = 4'b0100;
  bit [3:0] bin = 4'b0010;
  bit [6:0] res = 0;
  bit [6:0] add = 0;
  bit [6:0] exp = 8;
  
  function bit [6:0] mul();
    add =  ain * bin;
    return add;
  endfunction

  initial begin
    res = mul();
    if (res == exp)
      $display("Test Passed");
    else
      $display("Test Failed");
    $display("Value of multiplication: %0d", res);
  end
endmodule

