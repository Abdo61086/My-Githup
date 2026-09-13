module PARITY_CHECK #(parameter WIDTH = 8 )
                   (
                    input wire CLK,
                    input wire RST,
                    input wire par_chk_en,
                    input wire PAR_TYP,
                    input wire sampled_bit,
                    input wire [ WIDTH - 1 : 0 ] P_DATA,
                    output reg par_err
                   );
 always@(posedge CLK or negedge RST)
   begin
     if(!RST)
      begin
        par_err <=1'b0;
      end
     else
      begin
        if(par_chk_en)
         begin
           par_err <= ( ((PAR_TYP) ? ~^P_DATA : ^P_DATA)  != sampled_bit ) ;
         end
      end
   end
endmodule