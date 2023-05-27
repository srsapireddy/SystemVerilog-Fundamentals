    `timescale 1ns / 1ps
    module clk_gen_tb_assignment;
    reg clk = 0;
    reg clk50 = 0;
    always #5 clk = ~clk; //100 MHz
    task calc_clk_params(
    input real period, input real duty_cycle,
    output real ton, output real toff);
    ton = period*duty_cycle;
    toff = period - ton;
    endtask
    //task to generate clock
    task clkgen( input real ton, input real toff);
    @(posedge clk); //Start wrt the posedge of system clock
    while(1) begin
    clk50 = 1'b1;
    #ton;
    clk50 = 1'b0;
    #toff;
    end
    endtask
    real ton;
    real toff;
    initial begin
    calc_clk_params(40,0.4,ton,toff);
    clkgen(ton,toff);
    end
    initial begin
     $dumpvars;
     $dumpfile("dump.vcd");
     #200;
     $stop;
    end
    endmodule