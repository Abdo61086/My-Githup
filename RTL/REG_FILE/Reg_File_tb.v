module Reg_File_tb();
reg [15 : 0] WrData_tb;
reg [2 : 0] Address_tb;
reg WrEn_tb;
reg RdEn_tb;
reg clk_tb;
reg rst_tb;
wire [15 :0]RdData_tb;

 Reg_File DUT(.WrData(WrData_tb),
              .Address(Address_tb),
              .WrEn(WrEn_tb),
              .RdEn(RdEn_tb),
              .clk(clk_tb),
              .rst(rst_tb),
              .RdData(RdData_tb));

reg [15 :0] RegFile_tb [7:0];
always #5 clk_tb = ~clk_tb;

initial
 begin
 $display("===========Start test=============");
   clk_tb =0;
   rst_tb =1;
   WrData_tb =0;
   Address_tb =0;
   RdEn_tb =0;
   WrEn_tb =0;
   #10
   rst_tb=0;
   #10
   rst_tb=1;
   $display("Time = %0t , WrData=%0b , Address =%0b , RdEn =%0b , WrEn_tb = %0b , RdData =%0b ",
              $time      ,WrData_tb   ,Address_tb    ,RdEn_tb    ,WrEn_tb           ,RdData_tb);
    #10
    WrEn_tb=1;
    WrData_tb=16'd66;
    Address_tb=3'b000;
    #10
    WrData_tb=16'd16;
    Address_tb=3'b001;
    #10
    WrData_tb=16'd12;
    Address_tb=3'b010;
    #10
    WrData_tb=16'd15;
    Address_tb=3'b011;
    #10
    WrData_tb=16'd6;
    Address_tb=3'b100;
    #10
    WrData_tb=16'd13;
    Address_tb=3'b101;
    #10
    WrData_tb=16'd34;
    Address_tb=3'b110;
    #10
    WrData_tb=16'd43;
    Address_tb=3'b111;
#10


WrEn_tb=0;
RdEn_tb=1;
Address_tb=3'b101;
#10
$display("Read from Reg[5] = %0d", RdData_tb);
Address_tb=3'b001;
#10
$display("Read from Reg[1] = %0d", RdData_tb);
Address_tb = 3'b111;
#10;
$display("Read from Reg[7] = %0d", RdData_tb);
$display("=========== End Test ===========");
$stop; 
 end
 
endmodule