module ASYNC_FIFO 
#(parameter DATA_WIDTH   = 8 ,
  parameter P_SIZE   = 4 ,
  parameter ADDR_WIDTH   = 3 ,
  parameter NUM_OF_STAGE = 2 )
               (
                input wire w_clk,
                input wire w_rst,
                input wire w_inc,
                input wire r_clk,
                input wire r_rst,
                input wire r_inc,
                input wire  [DATA_WIDTH - 1 : 0 ] w_data,
                output wire [DATA_WIDTH - 1 : 0 ] r_data,
                output wire full,
                output wire empty
               );


wire [ADDR_WIDTH -1 : 0] w_addr ;
wire [ADDR_WIDTH -1 : 0] r_addr ;
wire [P_SIZE-1 : 0] r_ptr   ;
wire [P_SIZE-1 : 0] w_ptr   ;
wire [P_SIZE-1 : 0] w2r_ptr ;
wire [P_SIZE-1 : 0] r2w_ptr ;

FIFO_MEM_CNTRL #(.ADDR_WIDTH(ADDR_WIDTH ) , .DATA_WIDTH(DATA_WIDTH))
               FIFO_MEM_CNTRL_TOP 
                               (
                                .w_data(w_data),
                                .w_rst(w_rst),
                                .r_data(r_data),
                                .w_clk(w_clk),
                                .w_inc(w_inc),
                                .full(full),
                                .w_addr(w_addr),
                                .r_addr(r_addr)
                               );

FIFO_WR  #(.P_SIZE(P_SIZE))
                FIFO_WR_TOP
                          (
                            .w_clk(w_clk),
                            .w_inc(w_inc),
                            .w_rst(w_rst),
                            .r2w_ptr(r2w_ptr),
                            .w_ptr(w_ptr),
                            .w_addr(w_addr),
                            .full(full)
                          );

FIFO_RD  #(.P_SIZE(P_SIZE))
               FIFO_RD_TOP
                         (
                           .r_clk(r_clk),
                           .r_inc(r_inc),
                           .r_rst(r_rst),
                           .w2r_ptr(w2r_ptr),
                           .r_ptr(r_ptr),
                           .r_addr(r_addr),
                           .empty(empty)
                         );

df_sync #( .BUS_WIDTH(P_SIZE)  ) 
                bit_sync_w2r_TOP
                               (
                                .clk(r_clk),
                                .rst(r_rst),
                                .unsync(w_ptr),
                                .sync(w2r_ptr)
                               );
df_sync #( .BUS_WIDTH(P_SIZE)  )    
                bit_sync_r2w_TOP
                               (
                                .clk(w_clk),
                                .rst(w_rst),
                                .unsync(r_ptr),
                                .sync(r2w_ptr)
                               );
 
endmodule
