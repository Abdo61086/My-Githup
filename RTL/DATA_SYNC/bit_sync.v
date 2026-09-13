module bit_sync #(parameter BUS_WIDTH = 1 , NUM_OF_STAGE = 2)
              (
                input wire clk,
                input wire rst,
                input wire  ASYNC,
                output reg  SYNC
              );

reg [NUM_OF_STAGE - 1 : 0] sync_reg ;


always@(posedge clk or negedge rst) begin
  if(!rst) begin
      sync_reg <= 'd0;
  end else begin
      sync_reg <= {sync_reg[NUM_OF_STAGE-2 : 0] , ASYNC };
  end
end

always @(posedge clk or negedge rst)
 begin
  if(!rst)      // active low
   begin
    SYNC <= 1'b0 ;	
   end
  else
   begin
    SYNC <= sync_reg[NUM_OF_STAGE-1] ;
   end  
 end


endmodule