module FIFO_RD
        #(
          parameter P_SIZE = 4
         )
         (
              input wire r_clk,
              input wire r_inc,
              input wire r_rst,
              input  wire [P_SIZE-1 : 0] w2r_ptr,
              output reg  [P_SIZE-1 : 0] r_ptr,
              output wire [P_SIZE-1 : 0] r_addr,
              output wire empty
         );
reg  [P_SIZE-1 : 0] rd_ptr; 
wire [P_SIZE-1 : 0] comb_gray_rd_ptr; 

assign comb_gray_rd_ptr = rd_ptr ^ (rd_ptr >> 1);
assign empty = (w2r_ptr == comb_gray_rd_ptr);

always@(posedge r_clk or negedge r_rst)
 begin
  if(!r_rst) begin
    rd_ptr <= 'd0;
  end else if(!empty && r_inc) begin
    rd_ptr <= rd_ptr + 1 ;
  end  
 end

always@(posedge r_clk or negedge r_rst)
 begin
  if(!r_rst) begin
    r_ptr  <= 'd0;
  end else begin
    r_ptr  <= comb_gray_rd_ptr ;
  end  
end
assign r_addr = rd_ptr[P_SIZE-2:0] ;

endmodule