module deserializer #(parameter WIDTH = 8 )
                   (
                    input wire CLK,
                    input wire RST,
                    input wire deser_en,
                    input wire sampled_bit,
                    input wire [3:0] bit_cnt,
                    output reg [ WIDTH - 1 : 0 ] P_DATA
                   );
    


    always@(posedge CLK or negedge RST)
      begin
        if(!RST)
          begin
            P_DATA      <= {WIDTH{1'b0}};
          end
        else
          begin
            if(deser_en)
              begin
                P_DATA [bit_cnt-2] <= sampled_bit ;
              end
         end
     end
endmodule