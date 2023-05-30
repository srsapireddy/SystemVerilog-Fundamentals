/*Create a task that will generate stimulus for addr , wr, and en signal as mentioned in a waveform of the Instruction tab.
Assume address is 6-bit wide while en and wr both are 1-bit wide. 
The stimulus should be sent on a positive edge of 25 MHz clock signal.*/

module tb;
  bit [6:0] addr = 6'd0;
  bit en = 1'd0;
  bit wr = 1'd0;
  bit clk = 1'd0;
  
  always #20 clk=~clk;
  
  task stim_val();
    $display("en : %0d and wr : %0d and addr : %0d",en,wr,addr);
  endtask
  
  task stim();
    en = 1'd1;
    wr = 1'd1;
    addr = 6'd12;
    stim_val();
    #20;
    en = 1'd1;
    wr = 1'd1;
    addr = 6'd14;
    stim_val();
    #20;
    en = 1'd1;
    wr = 1'd0;
    addr = 6'd23;
    stim_val();
    #20;
    en = 1'd1;
    wr = 1'd0;
    addr = 6'd48;
    stim_val();
    #20;
    en = 1'd0;
    wr = 1'd0;
    addr = 6'd56;
    stim_val();
    #20;
  endtask
  
  task stim_clk();
    @(posedge clk);
    stim();
  endtask
  
  initial begin
    for(int i = 0;i<11;i++) begin
      stim_clk();
    end
  end
  
  initial begin
   $dumpfile("dump.vcd");
   $dumpvars();
  end 
  
  initial begin
    #110
    $finish();
  end
endmodule