module df_sync #(parameter BUS_WIDTH = 1 )
              (
                input wire clk,
                input wire rst,
                input wire [BUS_WIDTH-1 : 0 ] unsync,
                output reg [BUS_WIDTH-1 : 0 ] sync
              );

reg [BUS_WIDTH-1:0]  meta_flop ;


always@(posedge clk or negedge rst) begin
  if(!rst) begin
     meta_flop   <= 0 ;
     sync    <= 0 ;
    end
   else begin
     meta_flop   <= unsync ;
     sync    <= meta_flop ;
  end
end
endmodule
