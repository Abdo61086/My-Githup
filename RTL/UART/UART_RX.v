module UART_RX #(parameter DATA_WIDTH = 8 )
              (
               input  wire       RX_IN,
               input  wire [5:0] Prescale,
               input  wire       PAR_EN,
               input  wire       PAR_TYP,
               input  wire       CLK,
               input  wire       RST,
               output wire [ DATA_WIDTH - 1 : 0]  P_DATA,
               output wire       par_err,
               output wire       stp_err,
               output wire       data_valid
              );
////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////define wires/////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
wire par_chk_en;
wire strt_chk_en;
wire strt_glitch;
wire stp_chk_en;
wire sampled_bit;
wire enable;
wire [3:0] bit_cnt;
wire [4:0] edge_cnt;
wire data_sample_enable;
wire deser_en;

////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////inistantiation///////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////

//Finite State Machine (FSM)
FSM_UART_RX FSM_UART_RX_TOP 
    (
        .CLK(CLK),
        .RST(RST),
        .RX_IN(RX_IN),
        .PAR_EN(PAR_EN),
        .bit_cnt(bit_cnt),
        .par_err(par_err),
        .strt_glitch(strt_glitch),
        .stp_err(stp_err),
        .data_sample_enable(data_sample_enable),
        .enable(enable),
        .par_chk_en(par_chk_en),
        .strt_chk_en(strt_chk_en),
        .stp_chk_en(stp_chk_en),
        .deser_en(deser_en),
        .data_valid(data_valid)
    );

//Data Sampling
data_sampling DATA_SAMPLE_TOP
    (
       .CLK(CLK),
       .RST(RST), 
       .edge_cnt(edge_cnt),
       .data_sample_enable(data_sample_enable),
       .RX_IN(RX_IN),
       .Prescale(Prescale),
       .sampled_bit(sampled_bit)
    );

//edge bit counter
edge_bit_counter EDGE_BIT_COUNTER_TOP
      (
        .CLK(CLK),
        .RST(RST),
        .enable(enable),
        .Prescale(Prescale),
        .bit_cnt(bit_cnt),
        .edge_cnt(edge_cnt)
      );

//DESERIALIZER
deserializer #(.WIDTH(DATA_WIDTH)) DESERIALIZER_TOP
      (
        .CLK(CLK),
        .RST(RST),
        .deser_en(deser_en),
        .sampled_bit(sampled_bit),
        .bit_cnt(bit_cnt),
        .P_DATA(P_DATA)
      );

//STOP CHECKER
STOP_CHECK STOP_CHECK_TOP
      (
        .CLK(CLK),
        .RST(RST),
        .stp_chk_en(stp_chk_en),
        .sampled_bit(sampled_bit),
        .stp_err(stp_err)
      );
      
//START CHECKER
START_CHECK START_CHECK_TOP
      (
        .CLK(CLK),
        .RST(RST),
        .strt_chk_en(strt_chk_en),
        .sampled_bit(sampled_bit),
        .strt_glitch(strt_glitch)
      );

//PARITY CHECKER
PARITY_CHECK #(.WIDTH(DATA_WIDTH)) PARITY_CHECK_TOP
      (
        .CLK(CLK),
        .RST(RST),
        .par_chk_en(par_chk_en),
        .sampled_bit(sampled_bit),
        .PAR_TYP(PAR_TYP),
        .P_DATA(P_DATA),
        .par_err(par_err)
      );



endmodule