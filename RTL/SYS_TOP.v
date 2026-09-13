module SYS_TOP #(parameter DATA_WIDTH = 8 , ADDR_WIDTH = 4 , DEPTH = 16 , NUM_OF_STAGE = 2 )
              ( input   wire  RST_N,
                input   wire  UART_CLK,
                input   wire  REF_CLK,
                input   wire  UART_RX_IN ,
                output  wire  UART_TX_O,
                output  wire  parity_error,
                output  wire  framing_error
               );

//internal wires
wire TX_CLK ;
wire RX_CLK ;
wire CLK_DIV_EN ;

wire [5 : 0] div_ratio_TX ;
wire [5:0] div_ratio_RX ;
wire [DATA_WIDTH - 1 : 0] WrData ;
wire [ADDR_WIDTH - 1 : 0] Address ;
wire WrEn ;
wire RdEn ;
wire RdData_Valid ;
wire [DATA_WIDTH - 1 : 0 ]RdData;
wire [DATA_WIDTH - 1 : 0] REG0 ;
wire [DATA_WIDTH - 1 : 0] REG1 ;
wire [DATA_WIDTH - 1 : 0] REG2 ;
wire [DATA_WIDTH - 1 : 0] REG3 ;

wire SYNC_REF_RST ;
wire SYNC_UART_RST ;

wire TX_D_VLD ;
wire FIFO_FULL ;
wire empty ;
wire r_inc ;

wire Busy ;
wire CLK_EN ;
wire ALU_CLK ;
wire [3:0]ALU_FUN ;
wire ALU_EN ;
wire [DATA_WIDTH - 1 : 0] ALU_OUT;
wire OUT_VALID ;

wire [DATA_WIDTH - 1 : 0] ASYNC_RX_P_DATA ;
wire RX_OUT_V ;
wire RX_D_VLD ;
wire [DATA_WIDTH - 1 : 0] RX_P_DATA ;
wire [DATA_WIDTH - 1 : 0] TX_P_DATA ;
wire [DATA_WIDTH - 1 : 0] FIFO_RdData;

//Divider blocks 

CLK_DIV  CLK_DIV_TX (
                      .i_ref_clk(UART_CLK),
                      .i_rst_n(RST_N),
                      .i_clk_en(CLK_DIV_EN),
                      .i_div_ratio(REG3[5 : 0]),
                      .o_div_clk(TX_CLK)
                    );

CLK_DIV  CLK_DIV_RX (
                      .i_ref_clk(UART_CLK),
                      .i_rst_n(RST_N),
                      .i_clk_en(CLK_DIV_EN),
                      .i_div_ratio(div_ratio_RX),
                      .o_div_clk(RX_CLK)
                    );

Prescale #(.DATA_WIDTH(DATA_WIDTH))
           Pre_RX (
                   .IN_PRE(REG2[7 : 2]),
                   .div_ratio_RX(div_ratio_RX)
                  );

//REG_FILE
Reg_File #(.DATA_WIDTH( DATA_WIDTH) , .ADDR_WIDTH(ADDR_WIDTH) , .DEPTH(DEPTH))
        Reg_File_SYS_TOP (
                           .WrData(WrData),
                           .Address(Address),
                           .WrEn(WrEn),
                           .RdEn(RdEn),
                           .CLK(REF_CLK),
                           .RST(SYNC_REF_RST),
                           .RdData_Valid(RdData_Valid),
                           .RdData(RdData),
                           .REG0(REG0),
                           .REG1(REG1),
                           .REG2(REG2),
                           .REG3(REG3)   
                         );

//RESET SUNC
RST_SYNC #(.NUM_OF_STAGE(NUM_OF_STAGE))
          RST_SYNC_REG_FILE (
                             .clk(REF_CLK),
                             .rst(RST_N),
                             .sync_rst(SYNC_REF_RST)
                            ); 

RST_SYNC #(.NUM_OF_STAGE(NUM_OF_STAGE))
          RST_SYNC_ASYNC_FIFO (
                               .clk(UART_CLK),
                               .rst(RST_N),
                               .sync_rst(SYNC_UART_RST)
                              ); 

//FIFO
ASYNC_FIFO #(.DATA_WIDTH (DATA_WIDTH),.ADDR_WIDTH(ADDR_WIDTH),.NUM_OF_STAGE(NUM_OF_STAGE))
            ASYNC_FIFO_SYS_TOP (
                                .w_clk(REF_CLK),
                                .w_rst(SYNC_REF_RST),
                                .w_inc(TX_D_VLD),
                                .r_clk(TX_CLK),
                                .r_rst(SYNC_UART_RST),
                                .r_inc(r_inc),
                                .w_data(TX_P_DATA),
                                .r_data(FIFO_RdData),
                                .full(FIFO_FULL),
                                .empty(empty)
                               );

//puls gen
pulse_gen pulse_gen_SYS_TOP (
                              .clk(TX_CLK),
                              .rst(SYNC_UART_RST),
                              .in_sig(Busy),
                              .puls_sig(r_inc)
                            );

//clock gate
Clock_gating Clock_gating_SYS_TOP (
                                    .CLK(REF_CLK),
                                    .CLK_EN(CLK_EN),
                                    .GATED_CLK(ALU_CLK)
                                  );

//ALU
ALU #(.DATA_WIDTH(DATA_WIDTH))
     ALU_SYS_TOP (
                  .A(REG0),
                  .B(REG1),
                  .ALU_FUN(ALU_FUN),
                  .CLK(ALU_CLK),
                  .RST(SYNC_REF_RST),
                  .Enable(ALU_EN),
                  .ALU_OUT(ALU_OUT),
                  .OUT_VALID(OUT_VALID)
                 );

//UART
wire TX_IN_VLD  ;
assign  TX_IN_VLD = ~empty ;
UART #(.DATA_WIDTH(DATA_WIDTH))
       UART_SYS_TOP (
                     .RX_IN(UART_RX_IN),
                     .Prescale(REG2[7 : 2]),
                     .RX_CLK(RX_CLK),
                     .RST(SYNC_UART_RST),
                     .RX_OUT_P(ASYNC_RX_P_DATA),
                     .RX_OUT_V(RX_OUT_V),
                     .TX_CLK(TX_CLK ) ,   
                     .PAR_EN(REG2[0]), 
                     .PAR_TYP(REG2[1]),
                     .par_err(parity_error),
                     .stp_err(framing_error),                   
                     .TX_IN_P(FIFO_RdData),
                     .TX_IN_V(TX_IN_VLD) , 
                     //.r_inc(r_inc) ,
                     .TX_OUT_S(UART_TX_O) , 
                     .Busy(Busy)       
                    );

//Data Synch
DATA_SYNC #(.BUS_WIDTH(DATA_WIDTH) , .NUM_OF_STAGE(NUM_OF_STAGE))
          DATA_SYNC_SYS_TOP (
                             .unsync_bus(ASYNC_RX_P_DATA), 
                             .bus_enable(RX_OUT_V),
                             .clk(REF_CLK),
                             .rst(SYNC_REF_RST),
                             .sync_bus(RX_P_DATA), 
                             .enable_puls(RX_D_VLD) 
                            );

//SYSCTRL
SYS_CTRL #(.DATA_WIDTH (DATA_WIDTH),.ADDR_WIDTH(ADDR_WIDTH))
          SYS_CTRL_SYS_TOP (
                            .CLK(REF_CLK) ,
                            .RST(SYNC_REF_RST) ,
                            .RdData_Valid(RdData_Valid),
                            .RdData(RdData) ,
                            .RX_D_VLD(RX_D_VLD),
                            .RX_P_DATA(RX_P_DATA),
                            .FIFO_FULL(FIFO_FULL),
                            .OUT_VALID(OUT_VALID),
                            .ALU_OUT(ALU_OUT),
                            .ALU_EN(ALU_EN),
                            .ALU_FUN(ALU_FUN),
                            .CLK_EN(CLK_EN),
                            .Address(Address),
                            .WrEn(WrEn),
                            .RdEn(RdEn),
                            .WrData(WrData),
                            .TX_P_DATA(TX_P_DATA),
                            .TX_D_VLD(TX_D_VLD),
                            .CLK_DIV_EN(CLK_DIV_EN)
                           );
            



endmodule