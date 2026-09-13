module FIFO_WR
        #(
          parameter P_SIZE = 4
         )
            ( 
              input wire w_clk,
              input wire w_inc,
              input wire w_rst,
              input wire [P_SIZE-1 : 0] r2w_ptr,
              output reg [P_SIZE-1 : 0] w_ptr,
              output wire [P_SIZE-1 : 0] w_addr,
              output wire full
            );


reg [P_SIZE-1 : 0]  w_ptr_reg;
wire [P_SIZE-1 : 0]  comb_gray_w_ptr ;

assign comb_gray_w_ptr = w_ptr_reg ^ (w_ptr_reg >> 1);
assign full = (r2w_ptr[P_SIZE-1] != comb_gray_w_ptr[P_SIZE-1] && r2w_ptr[P_SIZE-2] != comb_gray_w_ptr[P_SIZE-2] && r2w_ptr[P_SIZE-3 : 0] == comb_gray_w_ptr[P_SIZE-3 : 0] );

always@(posedge w_clk or negedge w_rst)
 begin
   if(!w_rst)
    begin
      w_ptr_reg <=0 ;
    end
   else if(!full && w_inc)
      w_ptr_reg <= w_ptr_reg + 1 ; 
 end

always@(posedge w_clk or negedge w_rst)
 begin
   if(!w_rst)
    begin
      w_ptr <=0 ;
    end
   else 
      w_ptr <= comb_gray_w_ptr  ; 
 end 

 assign w_addr = w_ptr_reg[P_SIZE-2:0] ;



endmodule