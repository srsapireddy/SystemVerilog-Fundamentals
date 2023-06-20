// Trigger an event : ->
// to sence an event : edge sensitive_blocking @(), level_sensitive_non-blocking wait()

module tb;
  event a1,a2;
  
  initial begin
    -> a1;
    // #10;
    -> a2;
  end
  
  initial begin
    wait(a1.triggered);
    $display("Event a1 trigger");
    // @(a2);
    wait(a2.triggered);
    $display("Event a2 trigger");
  end
endmodule