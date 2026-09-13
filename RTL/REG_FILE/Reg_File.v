module Reg_File #(parameter DATA_WIDTH = 8 , ADDR_WIDTH = 4 , DEPTH = 16 )(
                input wire [DATA_WIDTH - 1 : 0] WrData,
                input wire [ADDR_WIDTH - 1 : 0] Address,
                input wire WrEn,
                input wire RdEn,
                input wire CLK,
                input wire RST,
                output reg RdData_Valid,
                output reg [ DATA_WIDTH - 1 : 0 ]RdData,
                output wire [ DATA_WIDTH - 1 : 0 ]REG0,
                output wire [ DATA_WIDTH - 1 : 0 ]REG1,
                output wire [ DATA_WIDTH - 1 : 0 ]REG2,
                output wire [ DATA_WIDTH - 1 : 0 ]REG3   
               );
    reg [DATA_WIDTH - 1 : 0] RegFile [ DEPTH - 1 : 0 ];
    integer i;

always@(posedge CLK , negedge RST)
   begin
     if(!RST)
      begin
       RdData_Valid <= 1'b0;
       RdData <= {DATA_WIDTH{1'b0}}; 
    for(i = 0 ; i< DEPTH ; i = i + 1) begin
      if(i==2) begin
        RegFile[i] <= 'b100000_01; 
      end else if(i==3) begin
        RegFile[i] <= 'b00_100000; 
      end else begin
        RegFile[i] <= {DATA_WIDTH{1'b0}};
      end 
    end
      end
     else if(WrEn && !RdEn)
        begin
          RegFile[Address] <= WrData;
        end 
       else if(RdEn && !WrEn)
        begin
          RdData <= RegFile[Address];
          RdData_Valid <= 1'b1;
        end else begin
          RdData_Valid <= 1'b0;
        end
   end
assign REG0 = RegFile[0];
assign REG1 = RegFile[1];
assign REG2 = RegFile[2];
assign REG3 = RegFile[3];
endmodule