module pulse_gen
               (
                input wire clk,
                input wire rst,
                input wire in_sig,
                output wire puls_sig
               );
reg enable_f;

always@(posedge clk or negedge rst) begin
  if(!rst) begin
    enable_f <= 'd0;
  end else begin
    enable_f <= in_sig;
  end
end
assign puls_sig = in_sig & !enable_f ;
endmodule