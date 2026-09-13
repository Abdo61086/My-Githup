module data_sampling
                     (
                        input wire CLK,
                        input wire RST,
                        input wire [4:0] edge_cnt,
                        input wire data_sample_enable,
                        input wire RX_IN,
                        input wire [5:0]Prescale,
                        output reg sampled_bit
                     );
        reg s_bit1 , s_bit2 , s_bit3 ; //define compared reg bits
    always@(posedge CLK or negedge RST)
      begin
        if(!RST)
          begin
            sampled_bit <= 1'b0;
            s_bit1      <= 1'b0;
            s_bit2      <= 1'b0;
            s_bit3      <= 1'b0;
          end
        else
          begin
           if(data_sample_enable) begin
             case (Prescale)
                6'd4 : begin
                         if (edge_cnt == 3) begin
                            sampled_bit <= RX_IN ;
                         end
                end
                6'd8 : begin
                        case (edge_cnt)
                           5'd4 : s_bit1  <= RX_IN ;
                           5'd5 : s_bit2  <= RX_IN ;
                           5'd6 : s_bit3  <= RX_IN ;
                           5'd7 : sampled_bit <= ((s_bit1 + s_bit2 + s_bit3)>=2);
                        endcase
                end
                6'd16 : begin
                        case (edge_cnt)
                           5'd7 : s_bit1  <= RX_IN ;
                           5'd8 : s_bit2  <= RX_IN ;
                           5'd9 : s_bit3  <= RX_IN ;
                           5'd15 : sampled_bit <= ((s_bit1 + s_bit2 + s_bit3)>=2);
                        endcase
                end
                6'd32 : begin
                        case (edge_cnt)
                           5'd15 : s_bit1  <= RX_IN ;
                           5'd16 : s_bit2  <= RX_IN ;
                           5'd17 : s_bit3  <= RX_IN ;
                           5'd31 : sampled_bit <= ((s_bit1 + s_bit2 + s_bit3)>=2);
                        endcase
                end
                default: begin
                        case (edge_cnt)
                           5'd4 : s_bit1  <= RX_IN ;
                           5'd5 : s_bit2  <= RX_IN ;
                           5'd6 : s_bit3  <= RX_IN ;
                           5'd7 : sampled_bit <= ((s_bit1 + s_bit2 + s_bit3)>=2);
                        endcase
                end
            endcase
            end
            else
              begin
               sampled_bit <= 1'b0;
               s_bit1  <= 1'b0 ;
               s_bit2  <= 1'b0 ;
               s_bit3  <= 1'b0 ;
              end
         end //end of else RST     
    end //end of always block
endmodule