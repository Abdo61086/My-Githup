module FSM_UART_TX (
    input wire CLK, RST,
    input wire PAR_EN,
    input wire DATA_VALID,
    input wire ser_done,
    output reg ser_en,
    output reg [1:0] Mux_Sel,
    output reg Busy
);

  // State encoding
  localparam [2:0]
    IDLE   = 3'b000,
    START  = 3'b001,
    DATA   = 3'b010,
    PARITY = 3'b011,
    STOP   = 3'b100;

  // Internal registers
  reg [2:0] current_state, next_state;

  // State register (sequential)
  always @(posedge CLK or negedge RST) begin
    if (!RST) begin
      current_state <= IDLE;
    end else begin
       current_state <= next_state;
    end
     
  end
  // Next-state logic and outputs (combinational)
  always @(*) begin
    // Default outputs
    ser_en  = 1'b0;
    Mux_Sel = 2'b01;
    Busy    = 1'b0;
    next_state = current_state;
   case (current_state)
      IDLE: begin
        Busy = 1'b0;
        if (DATA_VALID )
         begin
          next_state = START;
          ser_en = 1'b1;
         end  
      end

      START: begin
        Busy = 1'b1;
        Mux_Sel = 2'b00;  // Start bit
        next_state = DATA;
        ser_en = 1'b1;
      end

      DATA: begin
        Busy = 1'b1;
        Mux_Sel = 2'b10;  // Serial data
        ser_en = 1'b1;
        if (ser_done) begin
          if (PAR_EN)
            next_state = PARITY;
          else
            next_state = STOP;
        end
      end

      PARITY: begin
         Busy = 1'b1;
         Mux_Sel = 2'b11;  // Parity bit
         next_state = STOP;
      end

      STOP: begin
        Busy = 1'b1;
        Mux_Sel = 2'b01;  // Stop bit
          next_state = IDLE;
      end

      default: next_state = IDLE;
    endcase
  end

endmodule
