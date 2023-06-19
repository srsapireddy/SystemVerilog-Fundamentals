// Trigger an event : ->
// to sence an event : edge sensitive_blocking @(), level_sensitive_non-blocking wait()
module tb;
  event a;
  
  initial begin
    #10;
    -> a;
  end
  
  initial begin
    // @(a);
    wait(a.triggered);
    $display("Received Event at %0t", $time);
  end
endmodule