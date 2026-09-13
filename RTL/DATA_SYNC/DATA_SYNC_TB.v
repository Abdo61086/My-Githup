module  DATA_SYNC_TB ;

parameter BUS_WIDTH_TB = 8 ;
parameter NUM_OF_STAGE_TB = 2;
parameter CLK_PERIOD = 10 ;

reg clk_tb;
reg rst_tb;
reg [BUS_WIDTH_TB - 1 : 0] unsync_bus_tb;
reg bus_enable_tb;
wire [BUS_WIDTH_TB - 1 : 0] sync_bus_tb;
wire enable_puls_tb;

DATA_SYNC #(.BUS_WIDTH(BUS_WIDTH_TB) , .NUM_OF_STAGE(NUM_OF_STAGE_TB)) DUT 
           (
            .clk(clk_tb),
            .rst(rst_tb),
            .unsync_bus(unsync_bus_tb),
            .bus_enable(bus_enable_tb),
            .sync_bus(sync_bus_tb),
            .enable_puls(enable_puls_tb)
           );

always #(CLK_PERIOD/2) clk_tb = ~clk_tb;

task RESET;
begin
  #(CLK_PERIOD)
  rst_tb = 0 ;
  #(CLK_PERIOD)
  rst_tb = 1 ;
  #(CLK_PERIOD);
end
endtask

task initialization;
 begin
   clk_tb = 0;
   rst_tb = 1;
   unsync_bus_tb = 'd0;
   bus_enable_tb = 'd0;
 end
endtask

task do_oper;
  begin
    #7
    unsync_bus_tb = 'd8 ;
    #(3*CLK_PERIOD);
    bus_enable_tb = 'd1;
    #(CLK_PERIOD);
    bus_enable_tb = 'd0;
    #(3*CLK_PERIOD);
    bus_enable_tb = 'd0;
    #(CLK_PERIOD);
    bus_enable_tb = 'd0;
    unsync_bus_tb = 'd64 ;
    #(5*CLK_PERIOD);
    bus_enable_tb = 'd1; 
    #(CLK_PERIOD);
    bus_enable_tb = 'd0; 

  end
endtask

initial begin
  initialization();
  #(CLK_PERIOD);
  RESET();
  #(CLK_PERIOD);
  do_oper();
  #(100*CLK_PERIOD);
    $stop;
end
endmodule