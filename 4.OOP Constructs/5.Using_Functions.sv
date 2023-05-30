/*module tb;

  function bit [4:0] add());
   return a + b;
  endfunction
  
  bit [4:0] res = 0;
  bit [3:0] ain = 4'b0100;
  bit [3:0] bin = 4'b0010;
  
  initial begin
    res = add();
    $display("value of addition: %0d", res);
  end
endmodule*/

/*
module tb;
  
  bit [4:0] res = 0;
  bit [3:0] ain = 4'b0100;
  bit [3:0] bin = 4'b0010;

  function bit [4:0] add();
   return ain + bin;
  endfunction
  
  initial begin
    res = add();
    $display("value of addition: %0d", res);
  end
endmodule
*/

module tb;
  
  bit [4:0] res = 0;
  bit [3:0] ain = 4'b0100;
  bit [3:0] bin = 4'b0010;

  function bit [4:0] add();
   return ain + bin;
  endfunction
  
  function void display_ain_bin();
    $display("value of ain: %0d and bin %0d", ain, bin);
  endfunction
  
  initial begin
    display_ain_bin();
    //$display("value of addition: %0d", res);
  end
endmodule