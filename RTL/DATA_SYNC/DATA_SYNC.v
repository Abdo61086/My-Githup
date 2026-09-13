module DATA_SYNC #(parameter BUS_WIDTH = 2 , 
                   parameter NUM_OF_STAGE = 2)
                   (
                    input wire [BUS_WIDTH - 1 : 0] unsync_bus ,
                    input wire bus_enable,
                    input wire clk,
                    input wire rst,
                    output reg [BUS_WIDTH - 1 : 0] sync_bus , 
                    output reg enable_puls
                   );
reg  [BUS_WIDTH - 1 : 0] unsync_bus_c ;
wire pulse_enable_sync ;
wire enable_pulse_d ;
wire[BUS_WIDTH - 1 : 0] sync_bus_c ;
pulse_gen pulse_gen_TOP (
                          .clk(clk),
                          .rst(rst),
                          .in_sig(pulse_enable_sync),
                          .puls_sig(enable_pulse_d)
                        );

bit_sync #(.BUS_WIDTH(BUS_WIDTH) , .NUM_OF_STAGE(NUM_OF_STAGE))
         bit_sync_TOP (
                        .clk(clk),
                        .rst(rst),
                        .ASYNC(bus_enable),
                        .SYNC(pulse_enable_sync)
                      );
assign sync_bus_c = enable_pulse_d ? unsync_bus_c : sync_bus ;

//----------- destination domain flop ---------------

always @(posedge clk or negedge rst)
 begin
  if(!rst)      // active low
   begin
    unsync_bus_c <= 'b0 ;	
   end
  else
   begin
    unsync_bus_c <= unsync_bus ;
   end  
 end

always @(posedge clk or negedge rst)
 begin
  if(!rst)      // active low
   begin
    sync_bus <= 'b0 ;	
   end
  else
   begin
    sync_bus <= sync_bus_c ;
   end  
 end

 //--------------- delay generated pulse ------------

always @(posedge clk or negedge rst)
 begin
  if(!rst)      // active low
   begin
    enable_puls <= 1'b0 ;	
   end
  else
   begin
    enable_puls <= enable_pulse_d ;
   end  
 end

endmodule