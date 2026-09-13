module ALU_tb();
            reg [15:0]tb_A,tb_B;
            reg [3:0]tb_ALU_FUN;
            reg tb_CLK;
            wire [15:0]tb_ALU_OUT;
            wire tb_Carry_Flag;
            wire tb_Arith_flag;
            wire tb_Logic_flag;
            wire tb_CMP_flag;
            wire tb_Shift_flag;
//instantiatiom
    ALU DUT(
            .A(tb_A),
            .B(tb_B),
            .CLK(tb_CLK),
            .ALU_FUN(tb_ALU_FUN),
            .ALU_OUT(tb_ALU_OUT),
            .Carry_Flag(tb_Carry_Flag),
            .Arith_flag(tb_Arith_flag),
            .Logic_flag(tb_Logic_flag),
            .CMP_flag(tb_CMP_flag),
            .Shift_flag(tb_Shift_flag)
          );

//Clock generator
   always #5000 tb_CLK = ~ tb_CLK;

//Start initial block
initial 
  begin
    tb_CLK =1'b0;
    #5000
     tb_A =16'h0000;
     tb_B =16'h0000;
     
     tb_ALU_FUN = 4'b0;
    #10000
//print value
     $display("** time = %0t ** , A = %0d , B = %0d , ALU_FUN = %4b , ALU_OUT = %0d , Carry_Flag = %0b , Arith_flag = %0b , Logic_flag = %0b , CMP_flag = %0b , Shift_flag = %0b  " ,
               $time , tb_A ,tb_B ,tb_ALU_FUN ,tb_ALU_OUT,tb_Carry_Flag,tb_Arith_flag,tb_Logic_flag,tb_CMP_flag,tb_Shift_flag );
//test addition
     tb_A=16'h0401;
     tb_B=16'h0015;
     tb_ALU_FUN = 4'b0000;
    #10000
//print value
     $display("** time = %0t ** , A = %0d , B = %0d , ALU_FUN = %4b , ALU_OUT = %0d , Carry_Flag = %0b , Arith_flag = %0b , Logic_flag = %0b , CMP_flag = %0b , Shift_flag = %0b  ", 
               $time , tb_A ,tb_B ,tb_ALU_FUN ,tb_ALU_OUT,tb_Carry_Flag,tb_Arith_flag,tb_Logic_flag,tb_CMP_flag,tb_Shift_flag );
//test subtractor
     tb_ALU_FUN = 4'b0001;
    #10000
//print value
     $display("** time = %0t ** , A = %0d , B = %0d , ALU_FUN = %4b , ALU_OUT = %0d , Carry_Flag = %0b , Arith_flag = %0b , Logic_flag = %0b , CMP_flag = %0b , Shift_flag = %0b  " ,
               $time , tb_A ,tb_B ,tb_ALU_FUN ,tb_ALU_OUT,tb_Carry_Flag,tb_Arith_flag,tb_Logic_flag,tb_CMP_flag,tb_Shift_flag );
//test multiplication
     tb_ALU_FUN = 4'b0010;
    #10000
//print value
     $display("** time = %0t ** , A = %0d , B = %0d , ALU_FUN = %4b , ALU_OUT = %0d , Carry_Flag = %0b , Arith_flag = %0b , Logic_flag = %0b , CMP_flag = %0b , Shift_flag = %0b  " ,
               $time , tb_A ,tb_B ,tb_ALU_FUN ,tb_ALU_OUT,tb_Carry_Flag,tb_Arith_flag,tb_Logic_flag,tb_CMP_flag,tb_Shift_flag );
//test division
     tb_ALU_FUN = 4'b0011;
    #10000
//print value
     $display("** time = %0t ** , A = %0d , B = %0d , ALU_FUN = %4b , ALU_OUT = %0d , Carry_Flag = %0b , Arith_flag = %0b , Logic_flag = %0b , CMP_flag = %0b , Shift_flag = %0b  " ,
               $time , tb_A ,tb_B ,tb_ALU_FUN ,tb_ALU_OUT,tb_Carry_Flag,tb_Arith_flag,tb_Logic_flag,tb_CMP_flag,tb_Shift_flag );
//test AND
     tb_ALU_FUN = 4'b0100;
    #10000
//print value
     $display("** time = %0t ** , A = %0b , B = %0b , ALU_FUN = %4b , ALU_OUT = %0b , Carry_Flag = %0b , Arith_flag = %0b , Logic_flag = %0b , CMP_flag = %0b , Shift_flag = %0b  " ,
               $time , tb_A ,tb_B ,tb_ALU_FUN ,tb_ALU_OUT,tb_Carry_Flag,tb_Arith_flag,tb_Logic_flag,tb_CMP_flag,tb_Shift_flag );
//test OR
     tb_ALU_FUN = 4'b0101;
    #10000
//print value
     $display("** time = %0t ** , A = %0b , B = %0b , ALU_FUN = %4b , ALU_OUT = %0b , Carry_Flag = %0b , Arith_flag = %0b , Logic_flag = %0b , CMP_flag = %0b , Shift_flag = %0b  " ,
               $time , tb_A ,tb_B ,tb_ALU_FUN ,tb_ALU_OUT,tb_Carry_Flag,tb_Arith_flag,tb_Logic_flag,tb_CMP_flag,tb_Shift_flag );
//test NAND
     tb_ALU_FUN = 4'b0110;
    #10000
//print value
     $display("** time = %0t ** , A = %0b , B = %0b , ALU_FUN = %4b , ALU_OUT = %0b , Carry_Flag = %0b , Arith_flag = %0b , Logic_flag = %0b , CMP_flag = %0b , Shift_flag = %0b  " ,
               $time , tb_A ,tb_B ,tb_ALU_FUN ,tb_ALU_OUT,tb_Carry_Flag,tb_Arith_flag,tb_Logic_flag,tb_CMP_flag,tb_Shift_flag );
//test NOR
     tb_ALU_FUN = 4'b0111;
    #10000
//print value
     $display("** time = %0t ** , A = %0b , B = %0b , ALU_FUN = %4b , ALU_OUT = %0b , Carry_Flag = %0b , Arith_flag = %0b , Logic_flag = %0b , CMP_flag = %0b , Shift_flag = %0b  " ,
               $time , tb_A ,tb_B ,tb_ALU_FUN ,tb_ALU_OUT,tb_Carry_Flag,tb_Arith_flag,tb_Logic_flag,tb_CMP_flag,tb_Shift_flag );
//test XOR
     tb_ALU_FUN = 4'b1000;
    #10000
//print value
     $display("** time = %0t ** , A = %0b , B = %0b , ALU_FUN = %4b , ALU_OUT = %0b , Carry_Flag = %0b , Arith_flag = %0b , Logic_flag = %0b , CMP_flag = %0b , Shift_flag = %0b  " ,
               $time , tb_A ,tb_B ,tb_ALU_FUN ,tb_ALU_OUT,tb_Carry_Flag,tb_Arith_flag,tb_Logic_flag,tb_CMP_flag,tb_Shift_flag );
//test XNOR
     tb_ALU_FUN = 4'b1001;
    #10000
//print value
     $display("** time = %0t ** , A = %0b , B = %0b , ALU_FUN = %4b , ALU_OUT = %0b , Carry_Flag = %0b , Arith_flag = %0b , Logic_flag = %0b , CMP_flag = %0b , Shift_flag = %0b  " ,
               $time , tb_A ,tb_B ,tb_ALU_FUN ,tb_ALU_OUT,tb_Carry_Flag,tb_Arith_flag,tb_Logic_flag,tb_CMP_flag,tb_Shift_flag );
//test CMP equal TRUE
     tb_A=16'h0011;
     tb_B=16'h0011;
     tb_ALU_FUN = 4'b1010;
    #10000
//print value
     $display("** time = %0t ** , A = %0d , B = %0d , ALU_FUN = %4b , ALU_OUT = %0d , Carry_Flag = %0b , Arith_flag = %0b , Logic_flag = %0b , CMP_flag = %0b , Shift_flag = %0b  " ,
               $time , tb_A ,tb_B ,tb_ALU_FUN ,tb_ALU_OUT,tb_Carry_Flag,tb_Arith_flag,tb_Logic_flag,tb_CMP_flag,tb_Shift_flag );
//test CMP not equal false
     tb_A=16'h0001;
     tb_B=16'h0011;
     tb_ALU_FUN = 4'b1010;
    #10000
//print value
     $display("** time = %0t ** , A = %0d , B = %0d , ALU_FUN = %4b , ALU_OUT = %0d , Carry_Flag = %0b , Arith_flag = %0b , Logic_flag = %0b , CMP_flag = %0b , Shift_flag = %0b  " ,
               $time , tb_A ,tb_B ,tb_ALU_FUN ,tb_ALU_OUT,tb_Carry_Flag,tb_Arith_flag,tb_Logic_flag,tb_CMP_flag,tb_Shift_flag );
//test CMP greater than TRUE
     tb_A=16'h0021;
     tb_B=16'h0011;
     tb_ALU_FUN = 4'b1011;
    #10000
//print value
     $display("** time = %0t ** , A = %0d , B = %0d , ALU_FUN = %4b , ALU_OUT = %0d , Carry_Flag = %0b , Arith_flag = %0b , Logic_flag = %0b , CMP_flag = %0b , Shift_flag = %0b  " ,
               $time , tb_A ,tb_B ,tb_ALU_FUN ,tb_ALU_OUT,tb_Carry_Flag,tb_Arith_flag,tb_Logic_flag,tb_CMP_flag,tb_Shift_flag );

//test CMP greater than false
     tb_A=16'h0001;
     tb_B=16'h0011;
     tb_ALU_FUN = 4'b1011;
    #10000
//print value
     $display("** time = %0t ** , A = %0d , B = %0d , ALU_FUN = %4b , ALU_OUT = %0d , Carry_Flag = %0b , Arith_flag = %0b , Logic_flag = %0b , CMP_flag = %0b , Shift_flag = %0b  " ,
               $time , tb_A ,tb_B ,tb_ALU_FUN ,tb_ALU_OUT,tb_Carry_Flag,tb_Arith_flag,tb_Logic_flag,tb_CMP_flag,tb_Shift_flag );
//test CMP Smaller than TRUE
     tb_A=16'h0001;
     tb_B=16'h0011;
     tb_ALU_FUN = 4'b1100;
    #10000
//print value
     $display("** time = %0t ** , A = %0d , B = %0d , ALU_FUN = %4b , ALU_OUT = %0d , Carry_Flag = %0b , Arith_flag = %0b , Logic_flag = %0b , CMP_flag = %0b , Shift_flag = %0b  " ,
               $time , tb_A ,tb_B ,tb_ALU_FUN ,tb_ALU_OUT,tb_Carry_Flag,tb_Arith_flag,tb_Logic_flag,tb_CMP_flag,tb_Shift_flag );

//test CMP smaller than false
     tb_A=16'h0021;
     tb_B=16'h0011;
     tb_ALU_FUN = 4'b1100;
    #10000
//print value
     $display("** time = %0t ** , A = %0d , B = %0d , ALU_FUN = %4b , ALU_OUT = %0d , Carry_Flag = %0b , Arith_flag = %0b , Logic_flag = %0b , CMP_flag = %0b , Shift_flag = %0b  " ,
               $time , tb_A ,tb_B ,tb_ALU_FUN ,tb_ALU_OUT,tb_Carry_Flag,tb_Arith_flag,tb_Logic_flag,tb_CMP_flag,tb_Shift_flag );
//test Shift right

     tb_ALU_FUN = 4'b1101;
    #10000
//print value
     $display("** time = %0t ** , A = %0d , B = %0d , ALU_FUN = %4b , ALU_OUT = %0d , Carry_Flag = %0b , Arith_flag = %0b , Logic_flag = %0b , CMP_flag = %0b , Shift_flag = %0b  " ,
               $time , tb_A ,tb_B ,tb_ALU_FUN ,tb_ALU_OUT,tb_Carry_Flag,tb_Arith_flag,tb_Logic_flag,tb_CMP_flag,tb_Shift_flag );
//test Shift left

     tb_ALU_FUN = 4'b1110 ;
    #10000
//print value
     $display("** time = %0t ** , A = %0d , B = %0d , ALU_FUN = %4b , ALU_OUT = %0d , Carry_Flag = %0b , Arith_flag = %0b , Logic_flag = %0b , CMP_flag = %0b , Shift_flag = %0b  " ,
               $time , tb_A ,tb_B ,tb_ALU_FUN ,tb_ALU_OUT,tb_Carry_Flag,tb_Arith_flag,tb_Logic_flag,tb_CMP_flag,tb_Shift_flag );
//test Shift left

     tb_ALU_FUN = 4'b1111;
    #10000
//print value
     $display("** time = %0t ** , A = %0d , B = %0d , ALU_FUN = %4b , ALU_OUT = %0d , Carry_Flag = %0b , Arith_flag = %0b , Logic_flag = %0b , CMP_flag = %0b , Shift_flag = %0b  " ,
               $time , tb_A ,tb_B ,tb_ALU_FUN ,tb_ALU_OUT,tb_Carry_Flag,tb_Arith_flag,tb_Logic_flag,tb_CMP_flag,tb_Shift_flag );

$stop;



  end

endmodule
