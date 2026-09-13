module FIFO_MEM_CNTRL
        #(parameter ADDR_WIDTH = 3,
          parameter DATA_WIDTH = 8
           )
                  (
                    input wire w_inc,
                    input wire full,
                    input wire w_clk,
                    input wire w_rst,
                    input wire [DATA_WIDTH -1 : 0] w_data,
                    input wire [ADDR_WIDTH -1 : 0] w_addr,
                    input wire [ADDR_WIDTH -1 : 0] r_addr,
                    output wire [DATA_WIDTH -1 : 0] r_data
                  );
wire w_clk_en ;
reg [DATA_WIDTH -1 : 0] FIFO_MEM [ (1<<ADDR_WIDTH) -1 : 0];

integer I ;

assign w_clk_en = w_inc & !full ;
always@(posedge w_clk or negedge w_rst) begin
if(!w_rst) begin
  for (I=0;I<(1<<(ADDR_WIDTH));I=I+1) begin
     FIFO_MEM [I] <= 'd0 ;
  end
end
  else if(w_clk_en) begin
    FIFO_MEM [w_addr] <= w_data ;
  end
end
  assign  r_data = FIFO_MEM [r_addr] ;


endmodule