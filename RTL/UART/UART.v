module UART #(parameter DATA_WIDTH = 8 ) (
//RX_IN_OUT
               input  wire       RX_IN,
               input  wire  [5:0] Prescale,
               input  wire       RX_CLK,
               input  wire       RST,
               output wire  [ DATA_WIDTH - 1 : 0]  RX_OUT_P,
               output wire       RX_OUT_V,
              input  wire       PAR_EN, 
              input  wire       PAR_TYP,
              output  wire       par_err,
              output  wire       stp_err,
//TX_IN_OUT       

               input wire  TX_CLK ,                      
               input wire  [ DATA_WIDTH - 1 :0] TX_IN_P,
               input wire  TX_IN_V , 
               //input wire  r_inc , 
               output wire TX_OUT_S ,     
               output wire Busy         
);


UART_RX #(.DATA_WIDTH(DATA_WIDTH)) UART_TOP_RX 
        (
            .CLK(RX_CLK),
            .RST(RST),
            .RX_IN(RX_IN),
            .Prescale(Prescale),
            .PAR_EN(PAR_EN),
            .PAR_TYP(PAR_TYP),
            .P_DATA(RX_OUT_P),
            .par_err(par_err),
            .stp_err(stp_err),
            .data_valid(RX_OUT_V)
        );
UART_TX #(.DATA_WIDTH(DATA_WIDTH))
         UART_TOP_TX
          (
              .CLK(TX_CLK),
              .RST(RST),
              .TX_OUT(TX_OUT_S),
              .PAR_TYP(PAR_TYP),
              .PAR_EN(PAR_EN),
              .P_DATA(TX_IN_P),
            //  .r_inc(r_inc),
              .DATA_VALID(TX_IN_V),
              .Busy(Busy)
          );

endmodule