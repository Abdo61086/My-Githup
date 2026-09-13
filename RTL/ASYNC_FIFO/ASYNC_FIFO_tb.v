`timescale 1ns/1ps
module ASYNC_FIFO_tb;

parameter  NUM_OF_STAGE_TB = 2  ;
parameter  DATA_WIDTH_TB   = 8  ; 
parameter  ADDR_WIDTH_TB   = 4  ;
parameter  CLK_WR_PERIOD   = 10 ; //  f_wr=40 MB
parameter  CLK_R_PERIOD   = 25 ; //  f=100 MB


reg w_clk_tb;
reg w_rst_tb;
reg w_inc_tb;
reg r_clk_tb;
reg r_rst_tb;
reg r_inc_tb;
reg  [DATA_WIDTH_TB - 1 : 0 ] w_data_tb;
wire [DATA_WIDTH_TB - 1 : 0 ] r_data_tb;
wire full_tb;
wire empty_tb;

ASYNC_FIFO #(.NUM_OF_STAGE(NUM_OF_STAGE_TB) , .DATA_WIDTH(DATA_WIDTH_TB) , .ADDR_WIDTH(ADDR_WIDTH_TB)) 
                 DUT (
                      .w_clk(w_clk_tb),
                      .w_rst(w_rst_tb),
                      .w_inc(w_inc_tb),
                      .r_clk(r_clk_tb),
                      .r_rst(r_rst_tb),
                      .r_inc(r_inc_tb),
                      .w_data(w_data_tb),
                      .r_data(r_data_tb),
                      .full(full_tb),
                      .empty(empty_tb)
                     );


always #(CLK_WR_PERIOD/2) w_clk_tb = ~w_clk_tb;
always #(CLK_R_PERIOD/2)  r_clk_tb = ~r_clk_tb;


task initialization;
  begin
    w_clk_tb =   0;
    r_clk_tb =   0;
    w_rst_tb =   1;
    r_rst_tb =   1;
    w_inc_tb =   0;
    r_inc_tb =   0;
    w_data_tb = 'd0;
  end
endtask


task RESET_R;
 begin
   #(CLK_R_PERIOD)
   w_rst_tb = 0 ;
   r_rst_tb = 0 ;
   #(CLK_R_PERIOD)
   w_rst_tb = 1 ;
   r_rst_tb = 1 ;
   #(CLK_R_PERIOD);
 end
endtask

task do_oper;
  begin
    #(CLK_WR_PERIOD);
    w_inc_tb =   1;
    r_inc_tb =   0;
    w_data_tb = 'd7;
    #(CLK_WR_PERIOD);
    w_data_tb = 'd6;  
    #(CLK_WR_PERIOD);
    w_data_tb = 'd3; 
    #(CLK_WR_PERIOD);
    r_inc_tb =   1;
    w_data_tb = 'd7; 
    #(CLK_WR_PERIOD);
    w_data_tb = 'd2; 
    #(CLK_WR_PERIOD);

    w_data_tb = 'd9;  
    #(CLK_WR_PERIOD);
    w_data_tb = 'd12; 
    #(CLK_WR_PERIOD);
    r_inc_tb =   1;
    w_data_tb = 'd8; 
    #(CLK_WR_PERIOD);
    w_data_tb = 'd5; 
    #(CLK_WR_PERIOD);

    w_inc_tb =   0;
    w_data_tb = 'd5; 
    #(CLK_WR_PERIOD);
    w_data_tb = 'd4; 
    #(CLK_WR_PERIOD);
    w_data_tb = 'd7; 
    #(CLK_WR_PERIOD);
    w_data_tb = 'd4; 
    #(6*CLK_R_PERIOD);
    r_inc_tb =   0;
         
  end
endtask

initial begin
  $dumpfile("ASYNC_FIFO.vcd");
  $dumpvars;
  initialization();
  #(CLK_R_PERIOD);
  RESET_R ();
  //RESET_WR();
  do_oper();
  #(100*CLK_WR_PERIOD);
  $stop;

end
endmodule