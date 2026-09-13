module RST_SYNC #(parameter NUM_OF_STAGE = 2 )
            (
             input wire clk,
             input wire rst,
             output wire sync_rst
            );
reg  [NUM_OF_STAGE - 1 :0 ] reset_ff;
always@(posedge clk or negedge rst ) begin
  if (!rst) begin
      reset_ff <= {NUM_OF_STAGE{1'b0}};

  end else begin
      reset_ff <= {reset_ff[NUM_OF_STAGE-2 : 0] , 1'b1};
  end
end

assign sync_rst = reset_ff[NUM_OF_STAGE-1];
endmodule
