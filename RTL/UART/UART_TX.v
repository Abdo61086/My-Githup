module UART_TX #(parameter DATA_WIDTH = 8)
              (
                input wire CLK ,               //define clock
                input wire RST ,              //define reset
                input wire PAR_TYP,          //define parity type : odd or even
                input wire PAR_EN,          //enable bprity
                input wire [DATA_WIDTH - 1:0] P_DATA ,  //input data type
                input wire DATA_VALID ,   //input data valid signal
              //  input wire  r_inc ,
                output wire TX_OUT ,      //serial data output
                output wire Busy         //Busy signal (high during transmition otherwise low)
              );

////////////////////wires//////////////////////////////////
wire ser_done,ser_en;
wire [1:0] Mux_Sel;
wire ser_data;
wire par_bit;
wire start_bit;
wire stop_bit;
///////////////////assign///////////////////////////
assign start_bit = 1'b0;
assign stop_bit  = 1'b1;
///////////////////inistatiation///////////////////////////
/****************************Mux***************************/

MUX MUX_TOP
           (
            .Mux_Sel(Mux_Sel),
            .start_bit(start_bit),
            .stop_bit(stop_bit),
            .ser_data(ser_data),
            .par_bit(par_bit),
            .TX_OUT(TX_OUT)
           );

/****************************Parity_Calc***************************/
Parity_Calc Parity_Calc_TOP
                           (
                            .CLK(CLK),
                            .RST(RST),
                            .PAR_EN(PAR_EN),
                            .P_DATA(P_DATA),
                            .DATA_VALID(DATA_VALID),
                            .PAR_TYP(PAR_TYP),
                            .Busy(Busy),
                          //  .r_inc(r_inc),
                            .par_bit(par_bit)
                           );

/****************************serializer***************************/
serializer serializer_TOP
                           (
                            .CLK(CLK),
                            .RST(RST),
                            .P_DATA(P_DATA),
                            .ser_en(ser_en),
                            .ser_data(ser_data),
                            .ser_done(ser_done)
                           );
                           
/****************************FSM_UART_TX***************************/
FSM_UART_TX FSM_UART_TX_TOP
                           (
                            .CLK(CLK),
                            .RST(RST),
                            .PAR_EN(PAR_EN),
                            .DATA_VALID(DATA_VALID),
                            .ser_done(ser_done),
                            .ser_en(ser_en),
                            .Mux_Sel(Mux_Sel),
                            .Busy(Busy)
                           );
                           



endmodule