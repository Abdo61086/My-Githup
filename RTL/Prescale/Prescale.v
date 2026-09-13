module Prescale #(parameter DATA_WIDTH = 8)
                 (
                  input wire [DATA_WIDTH-3 : 0] IN_PRE ,
                  output reg [DATA_WIDTH-3 : 0] div_ratio_RX
                 );

always@(*) begin
    case (IN_PRE) 
     6'b100000 : div_ratio_RX = 'd1;
     6'b010000 : div_ratio_RX = 'd4;
     6'b001000 : div_ratio_RX = 'd8;
     default   : div_ratio_RX = 'd4;
    endcase
end

endmodule