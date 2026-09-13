module FSM_UART_RX
                  ( //clock & Rest input
                    input wire CLK,
                    input wire RST,
                    //inputs from abroad
                    input wire RX_IN,
                    input wire PAR_EN,
                    //inputs from edge_bit_counter
                    input wire [3:0] bit_cnt,
                    //inputs from checkers
                    input wire par_err,
                    input wire strt_glitch,
                    input wire stp_err,
                    //outputs to data_sampling
                    output reg data_sample_enable,
                    //output to edge_bit_counter
                    output reg enable,
                    //output to check errors
                    output reg par_chk_en,
                    output reg strt_chk_en,
                    output reg stp_chk_en,
                    //output for deserializer
                    output reg deser_en,
                    //data_valid output
                    output reg data_valid

                  );
    //state encoding
    localparam [2:0]
        IDLE   = 3'b000,
        START  = 3'b001,
        DATA   = 3'b010,
        PARITY = 3'b011,
        STOP   = 3'b100,
        CHECK  = 3'b101;
    //internal block
    reg [2:0] current_state , next_state ;
    //sequintial block
    always@(posedge CLK or negedge RST) begin
        if (!RST) begin
           current_state <= IDLE ;
          end else begin
           current_state <= next_state;
          end
      end
    //next state logic and outputs (compinational)
    always @(*) begin
        //defualt outputs
         data_sample_enable = 0 ;
         enable             = 0 ;
         par_chk_en         = 0 ;
         strt_chk_en        = 0 ;
         stp_chk_en         = 0 ;
         deser_en           = 0 ;
         data_valid         = 0;
         case (current_state)
      IDLE   : begin
             if(!RX_IN)
              begin
                next_state = START;
                enable      = 1'b1;
                data_sample_enable = 1'b0;
              end
             else
              begin
                next_state = IDLE;
                enable     = 1'b0;
                data_sample_enable = 1'b0;
              end
      end

      START  : begin
            strt_chk_en = 1'b1;
            enable      = 1'b1;
            data_sample_enable = 1'b1;
            if(bit_cnt == 1) begin
             if(!strt_glitch)
              begin
                strt_chk_en  = 1'b0;
                next_state   = DATA;
              end else begin
               next_state = IDLE ;
               strt_chk_en = 1'b0;
             end
            end else begin
              next_state = START ;
            end

      end

      DATA   : begin
             data_sample_enable = 1'b1;
             deser_en    = 1'b1;
             enable      = 1'b1;
             if(bit_cnt == 10) begin
               if(PAR_EN) begin
                 next_state = PARITY;
               end else begin
                 next_state = STOP;
                 stp_chk_en = 1'b1;
               end
             end else begin
                 next_state   = DATA;
             end
       end

      PARITY : begin
            data_sample_enable = 1'b1;
            par_chk_en = 1'b1;
            enable     = 1'b1;
            if(bit_cnt==11) begin
             if(!par_err) begin
               par_chk_en = 1'b0;
               next_state = STOP;
             end else begin
               par_chk_en = 1'b1;
               next_state = PARITY;
             end
            end else begin
              next_state = PARITY;
            end
      end

      STOP   : begin
            data_sample_enable = 1'b1;
           // stp_chk_en = 1'b1;
            enable     = 1'b1;
            if(PAR_EN)
             begin
               if(bit_cnt == 12) begin
                   next_state = CHECK;
                   data_valid = 0;
               end else begin
                 next_state = STOP ;
               end
             end else begin         //false
               if(bit_cnt == 11) begin
                 
                   next_state = CHECK;
                   data_valid = 0;
        
                end else begin
                 next_state = STOP ;
               end
             end 
      end

      CHECK   : begin
              data_sample_enable = 1'b1;
              stp_chk_en = 1'b1;
              enable     = 1'b1;
              if(PAR_EN) begin
                if (bit_cnt == 12 && !stp_err) begin
                  data_valid = 1'b1;
                  enable     = 1'b0;
                  next_state = IDLE;
                end else begin
                  data_valid = 1'b0;
                  enable     = 1'b1;
                  next_state = CHECK;
                end
              end else begin
                if (bit_cnt == 11 && !stp_err) begin
                  data_valid = 1'b1;
                  enable     = 1'b0;
                  next_state = IDLE;
                end else begin
                  data_valid = 1'b0;
                  enable     = 1'b1;
                  next_state = CHECK;
                end
              end
      end


            default: begin
              next_state = IDLE;   
            end
                    
         endcase
    end

endmodule
