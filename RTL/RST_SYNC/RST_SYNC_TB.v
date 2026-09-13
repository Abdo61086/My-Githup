`timescale 1ns/1ps
module RST_SYNC_TB;

parameter NUM_OF_STAGE_TB = 5;
parameter CLK_PERIOD      = 10;
reg clk_tb;
reg rst_tb;
wire sync_rst_tb;

always #(CLK_PERIOD/2) clk_tb = ~clk_tb;

RST_SYNC #(.NUM_OF_STAGE(NUM_OF_STAGE_TB))
         DUT (
            .clk(clk_tb),
            .rst(rst_tb),
            .sync_rst(sync_rst_tb)
             );

initial begin
  clk_tb=0;
  rst_tb = 1;
  #100
  rst_tb = 0;
  #7
  rst_tb = 1;
  #33
  rst_tb = 0;
  #100
  rst_tb = 1;
  #70
  rst_tb = 0;
  #39
  rst_tb = 1;
  #1000;
  $stop;
end

endmodule