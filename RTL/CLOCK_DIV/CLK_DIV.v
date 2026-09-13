module CLK_DIV #(parameter div_ratio_width = 6 )
            (
             input wire i_ref_clk,
             input wire i_rst_n,
             input wire i_clk_en,
             input wire [div_ratio_width  - 1:0] i_div_ratio,
             output wire o_div_clk
            );
  reg [div_ratio_width  - 1:0] i_div_ratio_c;
  reg flag;
  reg [ div_ratio_width :0] counter   ;
  reg temp_output_clk;
  reg div_clk;
  wire enable;
  wire odd ;
  wire [ div_ratio_width - 1 : 0 ] div_value ;
  wire [ div_ratio_width - 1 : 0 ] anti_div_value;

  always@(posedge i_ref_clk or negedge i_rst_n) begin
    if(!i_rst_n) begin
     i_div_ratio_c <= 'd0;
    end else begin
      i_div_ratio_c <= i_div_ratio;
    end
  end

  assign enable = ( !i_clk_en | i_div_ratio_c == 0 | i_div_ratio_c == 1 ) ;
  assign o_div_clk = enable ? i_ref_clk : div_clk ;
  assign div_value = ((i_div_ratio_c >> 1) - 1);
  assign anti_div_value = i_div_ratio_c - div_value ; 
  assign odd = i_div_ratio_c[0];


  always@( posedge i_ref_clk or negedge i_rst_n) begin
    if(!i_rst_n) begin
      div_clk <= 0;
      counter   <= 'b0;
      flag      <= 'b1;
    end
    else if( !odd && counter == div_value  && i_clk_en ) begin
      counter   <= 'b0;
      div_clk <= ~div_clk;
    end
    else if(odd && (((counter == div_value) && !flag ) || (counter == anti_div_value && flag )) && i_clk_en ) begin
       div_clk <= ~div_clk ;
       flag      <= ~flag ;
       counter   <= 'b0;
    end else  begin
      counter <= counter + 1 ;
    end
  end
  
endmodule