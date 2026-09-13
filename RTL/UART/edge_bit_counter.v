module edge_bit_counter
                       (
                         input wire CLK ,
                         input wire RST ,
                         input wire enable ,
                         input wire [5:0] Prescale,
                         output reg [3:0] bit_cnt,
                         output reg [4:0] edge_cnt
                       );

    reg [4:0] edge_max ;
    always @(*)
      begin
        case (Prescale)
            6'd8 : edge_max =   5'd7;
            6'd4 : edge_max =   5'd3;
            6'd16 : edge_max =  5'd15;
            6'd32 : edge_max =  5'd31;
            default: edge_max = 5'd7;
        endcase
      end
    always @(posedge CLK or negedge RST) begin
        if(!RST)
          begin
            edge_cnt <= 5'd0;
            bit_cnt  <= 4'd0;
          end 
        else
          begin
                      if ( enable && (edge_cnt == edge_max) )begin
                          edge_cnt <= 5'd0;
                          bit_cnt  <= bit_cnt + 4'd1;
                        end
                      else if (enable && edge_cnt != edge_max) begin
                          edge_cnt <= edge_cnt + 5'd1;
                        end else begin
                          bit_cnt  <= 4'd0;
                          edge_cnt <= 5'd0;
                        end          
          end
      end
endmodule