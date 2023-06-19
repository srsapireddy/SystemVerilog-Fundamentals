// testbench.sv
class transaction;
  // global signal
  bit clk;
  bit rst;
  
  // data control signal
  rand bit wreq, rreq; // Active High
  
  // actual data
  rand bit [7:0] wdata;
  bit [7:0] rdata;
  
  bit e;
  bit f;
  
  constraint ctrl_wr {
    wreq dist {0:=30; 1:=70;};
  }
  
  constraint ctrl_rd {
    rreq dist {0:=30; 1:=70;};
  }
  
  constraint wr_rd {
    wreq!=rreq;
  }
endclass

// design.sv
module fifo(
  input wreq, rreq,
  input clk;
  input rst;
  input [7:0] wdata;
  output [7:0] rdata;
  output f,e
);

endmodule
