module Parity_Calc #(parameter WIDTH = 8) (
    input wire CLK, RST,
    input wire [ WIDTH - 1 : 0 ] P_DATA,
    input wire DATA_VALID,
    input wire PAR_EN,
    input wire PAR_TYP,
    input wire Busy,
    output reg par_bit
);
reg [ WIDTH - 1 : 0 ] P_DATA_V;

always @(posedge CLK or negedge RST) begin
    if (!RST) begin
        P_DATA_V <= 'b0;
    end else if (DATA_VALID && !Busy) begin
          P_DATA_V <= P_DATA;
    end
end


always @(posedge CLK or negedge RST) begin
    if (!RST) begin
        par_bit <= 1'b0;
    end else if (PAR_EN) begin
          par_bit <= (PAR_TYP) ? ~^P_DATA_V : ^P_DATA_V; 
    end
end

endmodule
 