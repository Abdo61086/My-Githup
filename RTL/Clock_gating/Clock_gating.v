
/////////////////////////////////////////////////////////////
/////////////////////// Clock Gating ////////////////////////
/////////////////////////////////////////////////////////////

module Clock_gating
                (
                 input wire CLK,
                 input wire CLK_EN,
                 output wire GATED_CLK
                );
//interconnection    


TLATNCAX12M U0_TLATNCAX12M (
.E(CLK_EN),
.CK(CLK),
.ECK(GATED_CLK)
);

endmodule
