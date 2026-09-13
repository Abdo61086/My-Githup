module ALU #(parameter DATA_WIDTH = 8) (
            input wire [DATA_WIDTH-1:0 ]A,
            input wire [DATA_WIDTH-1:0] B,
            input wire [3:0]ALU_FUN,
            input wire CLK,
            input wire RST,
            input wire Enable,
            output reg [DATA_WIDTH-1:0] ALU_OUT,
            output reg OUT_VALID
);
reg [2*DATA_WIDTH-1:0] ALU_OUT_reg;
reg OUT_VALID_reg;
reg counter;

always@(posedge CLK or negedge RST) 
    begin
     if(!RST) begin
     counter <= 0;
     end else if((ALU_FUN == 4'b0000 || ALU_FUN == 4'b0010) && Enable) begin
      counter <=  1 ;
     end else begin
       counter <= 0;
     end
    end

always@(posedge CLK or negedge RST) 
    begin
     if(!RST) begin
      ALU_OUT   <= 'd0;
      OUT_VALID <= 'd0;
     end else begin
    if (!counter) begin
        ALU_OUT   <=  ALU_OUT_reg[DATA_WIDTH-1:0];
    end else begin
        ALU_OUT   <=  ALU_OUT_reg [ 2*DATA_WIDTH -1 : DATA_WIDTH ];
         
    end
    OUT_VALID <=  OUT_VALID_reg;
     end
    end

always @(*) begin
 ALU_OUT_reg = 'd0;
 OUT_VALID_reg = 0;
 if(Enable) begin
  OUT_VALID_reg = 1;
   case (ALU_FUN)
     4'b0000://Added
             begin
              ALU_OUT_reg = A + B ; 
             end
     4'b0001:
             begin
              ALU_OUT_reg = A - B ; 
             end
     4'b0010:
             begin
               ALU_OUT_reg = A * B ;
             end
     4'b0011:
             begin
               ALU_OUT_reg = (B !='d0) ? A / B : {DATA_WIDTH{1'b0}};
             end
     4'b0100:
             begin
               ALU_OUT_reg = A & B ;
             end
     4'b0101:
             begin
               ALU_OUT_reg = A | B ;
             end
     4'b0110:
             begin
               ALU_OUT_reg = ~(A & B) ;
             end
     4'b0111:
             begin
               ALU_OUT_reg = ~(A | B) ;
             end
     4'b1000:
             begin
               ALU_OUT_reg = A ^ B ;
             end
     4'b1001:
             begin
               ALU_OUT_reg = A ~^ B ;
             end
     4'b1010:
             begin
               ALU_OUT_reg = A ~^ B;
             end
     4'b1011:
             begin
               ALU_OUT_reg = (A > B) ? 2 : 0;
             end
     4'b1100:
             begin
               ALU_OUT_reg = (A < B) ? 3 : 0;
             end
     4'b1101:
             begin
               ALU_OUT_reg = A>>1;
             end
     4'b1110:
             begin
               ALU_OUT_reg = A<<1;
             end
    default:
             begin
               ALU_OUT_reg = 'd0;
               OUT_VALID_reg = 'd0;
             end
     endcase
 end else begin
              ALU_OUT_reg   = 'd0;
              OUT_VALID_reg = 'd0;
 end
end

endmodule