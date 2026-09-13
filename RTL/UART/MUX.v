module MUX 
          (
            input wire [1:0]Mux_Sel,
            input wire start_bit,
            input wire stop_bit,
            input wire ser_data,
            input wire par_bit,
            output reg TX_OUT
          );

localparam [1:0] START_SEL = 2'b00,
                 STOP_SEL  = 2'b01,
                 DATA_SEL  = 2'b10,
                 PARITY_SEL= 2'b11;

 always@(*)
  begin
    case(Mux_Sel)
     START_SEL  : TX_OUT = start_bit;
     STOP_SEL   : TX_OUT = stop_bit;   
     DATA_SEL   : TX_OUT = ser_data;
     PARITY_SEL : TX_OUT = par_bit;
    endcase
  end
endmodule