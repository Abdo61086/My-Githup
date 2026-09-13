module STOP_CHECK 
                 (
                  input wire CLK,
                  input wire RST,
                  input wire stp_chk_en,
                  input wire sampled_bit,
                  output reg stp_err
                 );
    always@(posedge CLK or negedge RST)
      begin
        if(!RST)
          begin
            stp_err <=1'b0;
          end
        else 
          begin
          if(stp_chk_en)
            begin
              stp_err <= ~sampled_bit ;
            end   
          end
      end
endmodule