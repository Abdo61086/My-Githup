module serializer
                 (
                  input wire CLK,RST,
                  input wire [7:0] P_DATA,
                  input wire ser_en,
                  output reg ser_done,
                  output reg ser_data
                 );

    reg [7:0] shift_reg;
    reg [2:0] bit_counter;
    reg load;

    always@(posedge CLK or negedge RST)
     begin
       if(!RST)
        begin
          ser_done <= 1'b0;
          ser_data <= 1'b1; //IDLE STATE
          shift_reg <= 8'b0;
          bit_counter <= 3'b0;
          load <= 1'b1;
        end
      else
       begin
        if(ser_en)
         begin
          if (load)
           begin
            shift_reg <= P_DATA;
            load <= 1'b0;
            ser_done <=1'b0;
            bit_counter <= 3'b0;
            ser_data    <= 1'b1;
           end else begin
                ser_data <= shift_reg[0] ;
                shift_reg <= shift_reg >> 1 ;
                bit_counter <= bit_counter + 1 ;
                if(bit_counter ==3'd7)
                 begin
                   ser_done <= 1'b1 ;
                   load <= 1;
                 end else begin
                  ser_done <= 1'b0;
                 end   
           end 
         end
        else
          begin
           bit_counter <= 3'b0 ;
           load <= 1'b1 ;
           ser_data <=1'b1 ; //IDLE STATE
           ser_done <=1'b0 ;
          end
        end
     end
endmodule
