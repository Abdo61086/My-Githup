module SYS_CTRL #(parameter DATA_WIDTH = 8 , ADDR_WIDTH = 4 )(
                 input wire CLK ,
                 input wire RST ,
                 input wire RdData_Valid,
                 input wire [DATA_WIDTH - 1 : 0] RdData ,
                 input wire RX_D_VLD,
                 input wire [DATA_WIDTH - 1: 0] RX_P_DATA,
                 input wire FIFO_FULL,
                 input wire OUT_VALID,
                 input wire [DATA_WIDTH - 1 : 0] ALU_OUT,
                 output reg ALU_EN,
                 output reg [3:0] ALU_FUN,
                 output reg CLK_EN,
                 output reg [ADDR_WIDTH - 1 : 0] Address,
                 output reg WrEn,
                 output reg RdEn,
                 output reg [DATA_WIDTH - 1 : 0] WrData,
                 output reg [DATA_WIDTH - 1 : 0] TX_P_DATA,
                 output reg TX_D_VLD,
                 output reg CLK_DIV_EN                     
);

localparam  [2:0] IDLE                       =3'b000 ,
                  Wr_State                   = 3'b001,
                  Rd_State                   = 3'b010,
                  ALU_With_Operand_State     = 3'b011,
                  ALU_With_No_Operand_State  = 3'b100;


localparam  [2:0] State1  = 3'b000,
                  State2  = 3'b001,
                  State3  = 3'b010,
                  State4  = 3'b011,
                  State5  = 3'b100;


reg [2:0] current_state,next_state;
reg [2:0] internal_current_state , internal_next_state;


reg [ADDR_WIDTH - 1 : 0] Address_c;

always@(posedge CLK or negedge RST) begin
    if (!RST) begin
        Address <= 'd0;
    end else begin
        Address <= Address_c ;
    end
end





always@(posedge CLK or negedge RST) begin
    if (!RST) begin
        current_state <= 'd0;
    end else begin
        current_state <= next_state ;
    end
end

always@(posedge CLK or negedge RST) begin
    if (!RST) begin
       internal_current_state <= 'd0;
    end else begin
       internal_current_state <= internal_next_state ;
    end
end
    




always@(*) begin

 ALU_EN     = 0; //
 ALU_FUN    = 0; //
 CLK_EN     = 0; //
 WrEn       = 0;
 RdEn       = 0;
 WrData     = 0;
 TX_P_DATA  = 0;
 TX_D_VLD   = 0;
 CLK_DIV_EN = 1; 


 case (current_state)


  IDLE :                     begin

                               Address_c    = 0;
                               next_state = IDLE;
                               internal_next_state = State1;
                              if (RX_D_VLD) begin
                                case (RX_P_DATA) 
                                 8'hAA   : begin
                                             next_state = Wr_State ;
                                           end 
                                 8'hBB   : begin
                                             next_state = Rd_State ;
                                           end  
                                 8'hCC   : begin
                                             next_state = ALU_With_Operand_State ;
                                           end  
                                 8'hDD   : begin
                                             next_state = ALU_With_No_Operand_State ;
                                           end  
                                 default : begin
                                             next_state = IDLE ;
                                           end   
                               endcase
                              end else begin
                                next_state = IDLE ;
                                internal_next_state = State1;
                              end
                               
                             end

  Wr_State  :                begin
                            
                              case (internal_current_state)
                                State1 : begin
                                  if (RX_D_VLD) begin
                                        
                                        Address_c = RX_P_DATA[ADDR_WIDTH-1:0];
                                        internal_next_state = State2;
                                        next_state = Wr_State ;
                                  end else begin
                                    Address_c = 0;
                                    next_state = Wr_State ;
                                    internal_next_state = internal_current_state ;
                                  end
                                       end 
                                State2 : begin
                                  Address_c = Address ;
                                   if (RX_D_VLD) begin
                                         WrEn = 1'b1;
                                         Address_c = Address ;
                                         WrData  = RX_P_DATA ;
                                         internal_next_state = State1 ;
                                         next_state = IDLE ;
                                   end else begin
                                          Address_c = RX_P_DATA[ADDR_WIDTH-1:0] ;
                                          next_state = Wr_State ;
                                          internal_next_state = internal_current_state ;
                                  end 
                                       end 
                                default: begin
                                           Address_c = 0 ;
                                           next_state = IDLE ;
                                           internal_next_state = internal_current_state ;
                                         end
                              endcase
                            
                              
                             end

  Rd_State :                 begin
                              WrEn = 1'b0;
                              RdEn = 1'b1;
                              
                              case (internal_current_state)
                                State1 : begin
                                     if (RX_D_VLD) begin
                                        Address_c = RX_P_DATA[ADDR_WIDTH-1:0];
                                        internal_next_state = State2;
                                        next_state = Rd_State ;
                                     end else begin
                                        Address_c = 'd0;
                                        internal_next_state = State1;
                                        next_state = Rd_State ;
                                     end
                                       end 
                                State2: begin
                                        Address_c = 'd0;
                                        if(RdData_Valid && !FIFO_FULL) begin
                                          TX_D_VLD = 1;
                                          TX_P_DATA = RdData;
                                          internal_next_state = State1;
                                          next_state = IDLE ;
                                        end else begin
                                          internal_next_state = State2;
                                          next_state = Rd_State ;
                                        end
                                       end
                                default: begin
                                           Address_c = 0 ;
                                           internal_next_state = State1;
                                           next_state = IDLE ;
                                         end
                              endcase
                              
                             end

  ALU_With_Operand_State  :  begin
                              WrEn   = 1'b0;
                              RdEn   = 1'b0;
                              ALU_EN = 1'b0;
                              CLK_EN = 1'b1;
                              Address_c = 'd0;
                              case (internal_current_state)
                                State1 : begin
                                      if(RX_D_VLD) begin
                                        WrEn   = 1'b1;
                                        Address_c = {ADDR_WIDTH{1'd0}} ;
                                        WrData  = RX_P_DATA ;
                                        internal_next_state = State2 ;
                                        next_state = ALU_With_Operand_State ;
                                      end else begin
                                        internal_next_state = State1 ;
                                        next_state = ALU_With_Operand_State ;
                                      end

                                       end 
                                State2 : begin
                                          if(RX_D_VLD) begin
                                           WrEn   = 1'b1;
                                           Address_c = 'd1 ;
                                           WrData  = RX_P_DATA ;
                                           internal_next_state = State3;
                                           next_state = ALU_With_Operand_State ;
                                          end else begin
                                            Address_c = 'd1 ;
                                            internal_next_state = State2 ;
                                            next_state = ALU_With_Operand_State ;
                                          end
                                         end
                                
                                State3 : begin
                                        Address_c = 'd0 ;
                                        if(RX_D_VLD) begin
                                           WrEn = 1'b0 ;
                                           RdEn = 1'b0;
                                           ALU_FUN = RX_P_DATA[3:0] ;
                                           ALU_EN = 1'b1;
                                           internal_next_state = State3;
                                           next_state = ALU_With_Operand_State ;
                                         end else if (OUT_VALID) begin
                                            ALU_FUN = RX_P_DATA[3:0] ;
                                            TX_D_VLD  = 1'b1;
                                            TX_P_DATA = ALU_OUT;
                                            if(ALU_FUN == 4'b0000 || ALU_FUN == 4'b0010 ) begin
                                            ALU_EN = 1'b1;
                                            internal_next_state = State4;
                                            next_state = ALU_With_Operand_State ; 
                                            end else begin
                                            internal_next_state = State1;
                                            next_state = IDLE ;  
                                            end
                                            
                                        end else begin
                                            internal_next_state = State3;
                                            next_state = ALU_With_Operand_State ;
                                          end  
                                         end
                                        
                                State4 : begin
                                           Address_c = 'd0 ;
                                           ALU_FUN = RX_P_DATA[3:0] ;
                                           ALU_EN = 1'b1;
                                           internal_next_state = State4;
                                           next_state = ALU_With_Operand_State ;
                                        if (OUT_VALID) begin
                                            TX_D_VLD  = 1'b1;
                                            TX_P_DATA = ALU_OUT;
                                            internal_next_state = State5;
                                            next_state = ALU_With_Operand_State ;
                                        end else begin
                                            internal_next_state = State4;
                                            next_state = ALU_With_Operand_State ;
                                          end  
                                         end
                                State5 : begin
                                            //TX_D_VLD  = 1'b1;
                                            Address_c = 0 ;
                                            internal_next_state = State1;
                                            next_state = IDLE ;
                                         end

                                default: begin
                                           Address_c = 0 ;
                                           internal_next_state = State1;
                                           next_state = IDLE ;
                                         end
                              endcase
                              end
  


  ALU_With_No_Operand_State: begin
                         WrEn   = 1'b0;
                         RdEn   = 1'b0;
                         ALU_EN = 1'b0;
                         CLK_EN = 1'b1;
                         Address_c = 'd0 ; 
                         case(internal_current_state)
                              State1 : begin 
                                
                                if(RX_D_VLD) begin
                                   ALU_FUN = RX_P_DATA[3:0] ;
                                   ALU_EN = 1'b1;
                                   next_state = ALU_With_No_Operand_State ;
                                   internal_next_state = State1 ;
                                 end else if (OUT_VALID) begin
                                    ALU_FUN = RX_P_DATA[3:0] ;
                                    TX_D_VLD  = 1'b1;
                                    TX_P_DATA = ALU_OUT;
                                    if(ALU_FUN == 4'b0000 || ALU_FUN == 4'b0010 ) begin
                                      ALU_EN = 1'b1;
                                      internal_next_state = State2;
                                      next_state = ALU_With_No_Operand_State ; 
                                    end else begin
                                      internal_next_state = State1;
                                      next_state = IDLE ;  
                                    end
                                 end else begin
                                next_state = ALU_With_No_Operand_State ;
                                internal_next_state =internal_current_state ;
                              end   
                              end 


                              State2 : begin
                                           ALU_FUN = RX_P_DATA[3:0] ;
                                           ALU_EN = 1'b1;
                                           internal_next_state = State2;
                                           next_state =  ALU_With_No_Operand_State ;
                                        if (OUT_VALID) begin
                                            TX_D_VLD  = 1'b1;
                                            TX_P_DATA = ALU_OUT;
                                            internal_next_state = State3;
                                            next_state =  ALU_With_No_Operand_State;
                                        end else begin
                                            internal_next_state = State2;
                                            next_state =  ALU_With_No_Operand_State ;
                                          end 
                                         end
                                State3 : begin
                                            TX_D_VLD  = 1'b1;
                                            internal_next_state = State1;
                                            next_state = IDLE ;
                                         end
                                default : begin
                                            internal_next_state = State1;
                                            next_state = IDLE ;
                                         end       
                              endcase
                             end
  default : begin
                               Address_c    = 0;
                               WrEn       = 0;
                               RdEn       = 0;
                               WrData     = 0;
                               TX_P_DATA  = 0;
                               TX_D_VLD   = 0;
                               next_state = IDLE;
                               internal_next_state = State1;
  end
 endcase                     
end
endmodule