`timescale 1us/1ns


module UART_TX_RX_tb() ;


////////////////////////////////////////////////////////////////////
/////////////////////// Parameters ////////////////////////////////
//////////////////////////////////////////////////////////////////
parameter  CLK_PERIOD_TX = 8.681 ;  // F = 115.2
parameter  CLK_PERIOD_RX = 0.543 ; // prescale = 8 F = 115.2 * 8
parameter  DATA_WIDTH_tb = 8 ;


////////////////////////////////////////////////////////////////////
/////////////////////// DUT Signals ///////////////////////////////
//////////////////////////////////////////////////////////////////


wire TX_OUT_RX_IN_tb;

reg [5:0] Prescale_tb;
reg PAR_EN_tb;
reg PAR_TYP_tb;
reg CLK_RX_tb;
reg CLK_TX_tb;
reg RST_tb;
reg DATA_VALID_TX_tb;
reg [ DATA_WIDTH_tb - 1 :0] P_DATA_TX_tb;
wire [ DATA_WIDTH_tb - 1 :0] P_DATA_RX_tb;
wire par_err_tb;
wire stp_err_tb;
wire data_valid_RX_tb;
wire Busy_tb;

////////////////////////////////////////////////////////////////////
/////////////////////// Clock Definition //////////////////////////
//////////////////////////////////////////////////////////////////

always #(CLK_PERIOD_RX/2) CLK_RX_tb = ~CLK_RX_tb;
always #(CLK_PERIOD_TX/2) CLK_TX_tb = ~CLK_TX_tb;

////////////////////////////////////////////////////////////////////
/////////////////////// inistatiation /////////////////////////////
//////////////////////////////////////////////////////////////////

UART_RX #(.DATA_WIDTH(DATA_WIDTH_tb)) DUT 
        (
            .CLK(CLK_RX_tb),
            .RST(RST_tb),
            .RX_IN(TX_OUT_RX_IN_tb),
            .Prescale(Prescale_tb),
            .PAR_EN(PAR_EN_tb),
            .PAR_TYP(PAR_TYP_tb),
            .P_DATA(P_DATA_RX_tb),
            .par_err(par_err_tb),
            .stp_err(stp_err_tb),
            .data_valid(data_valid_RX_tb)
        );
UART_TX DUT_TX
        (
            .CLK(CLK_TX_tb),
            .RST(RST_tb),
            .TX_OUT(TX_OUT_RX_IN_tb),
            .PAR_TYP(PAR_TYP_tb),
            .PAR_EN(PAR_EN_tb),
            .P_DATA(P_DATA_TX_tb),
            .DATA_VALID(DATA_VALID_TX_tb),
            .Busy(Busy_tb)
        );
////////////////////////////////////////////////////////////////////
////////////////////////// initial ////////////////////////////////
//////////////////////////////////////////////////////////////////   
initial begin
  $dumpfile("UART.vcd");
  $dumpvars;

  //initialization
  Initialization ();
  //restart
  RESTART();
  //Parity enable | Odd Parity 
  Data_Confg(1'b1,1'b1,6'd16);
  input_data_TX(8'b11001001);
  check_out(8'b11001001,3'd1);

  #2000
  //Parity enable | even Parity 
  Data_Confg(1'b1,1'b0,6'd16);
  input_data_TX(8'b00101101);
  check_out(8'b00101101,3'd2);
  #2000
  //Parity not enable
  Data_Confg(1'b0,1'b0,6'd16);
  input_data_TX(8'b11010010);
  check_out(8'b11010010,3'd3);
  #2000
    //Parity enable | Odd Parity 
  Data_Confg(1'b1,1'b1,6'd16);
  input_data_TX(8'b10010001);
  check_out(8'b10010001,3'd1);

  #2000
  //Parity enable | even Parity 
  Data_Confg(1'b1,1'b0,6'd16);
  input_data_TX(8'b10010110);
  check_out(8'b10010110,3'd2);
  #2000
  //Parity not enable
  Data_Confg(1'b0,1'b0,6'd16);
  input_data_TX(8'b11010010);
  check_out(8'b11010010,3'd3);


  $stop;
end
////////////////////////////////////////////////////////////////////
/////////////////////// Initialization ////////////////////////////
//////////////////////////////////////////////////////////////////

task Initialization ;
 begin
   DATA_VALID_TX_tb   = 0 ;
   Prescale_tb        = 0 ;
   PAR_EN_tb          = 0 ;
   PAR_TYP_tb         = 0 ;
   CLK_RX_tb          = 0 ;
   CLK_TX_tb          = 0 ;
   RST_tb             = 1 ;
 end
endtask

////////////////////////////////////////////////////////////////////
/////////////////////// RESTART ///////////////////////////////////
//////////////////////////////////////////////////////////////////

task RESTART;
  begin
    #(CLK_PERIOD_TX)
    RST_tb = 0 ;
    #(CLK_PERIOD_TX)
    RST_tb =1 ;
    #(CLK_PERIOD_TX);
  end
endtask
////////////////////////////////////////////////////////////////////
/////////////////////// Data_Confg ////////////////////////////////
//////////////////////////////////////////////////////////////////
task Data_Confg ;
  input       PAR_EN;
  input       PAR_TYP;
  input [5:0] Prescale;

  begin
    PAR_EN_tb   = PAR_EN;
    PAR_TYP_tb  = PAR_TYP;
    Prescale_tb = Prescale;
  end
endtask
////////////////////////////////////////////////////////////////////
/////////////////////// Data_input ////////////////////////////////
//////////////////////////////////////////////////////////////////
task input_data_TX;
 input  [ DATA_WIDTH_tb - 1 : 0] P_DATA;

 begin
  P_DATA_TX_tb = P_DATA;
  DATA_VALID_TX_tb = 1'b1;
  #(CLK_PERIOD_TX)
  DATA_VALID_TX_tb = 1'b0;
 end
endtask
////////////////////////////////////////////////////////////////////
/////////////////////// Check output ////////////////////////////////
//////////////////////////////////////////////////////////////////
task check_out;
  input   [ DATA_WIDTH_tb - 1 : 0] P_DATA ;
  input   [2:0]  Test_NUM ;
  reg     [ 10 : 0] gener_out,expected_out;
  reg     parity_bit;
  
  begin
   if(PAR_EN_tb)
     begin
      parity_bit = PAR_TYP_tb ? ~^P_DATA : ^P_DATA ;
     end
    else
     begin
      parity_bit = 1'b1;
     end
    
    #(11*CLK_PERIOD_TX);
    if(PAR_EN_tb)
     begin
      gener_out    = {1'b0,P_DATA_RX_tb,parity_bit,1'b1} ;
      expected_out = {1'b0,P_DATA,parity_bit,1'b1} ;
     end
     else
      begin
      gener_out    = {1'b0,P_DATA_RX_tb,1'b1} ;
      expected_out = {1'b0,P_DATA,1'b1} ;
      end
    if(gener_out == expected_out) 
		begin
			$display("Test Case %d is succeeded | P_DATA_RX = %8b | Parity_error = %0b  | Stop_Error = %0b | data_valid = %0b ",Test_NUM , P_DATA_RX_tb,par_err_tb,stp_err_tb ,data_valid_RX_tb);
		end
	else
		begin
			$display("Test Case %d is failed | P_DATA_RX = %8b | Parity_error = %0b  | Stop_Error = %0b  | data_valid = %0b ",Test_NUM , P_DATA_RX_tb,par_err_tb,stp_err_tb,data_valid_RX_tb);
		end
  end
endtask
endmodule