module ALU_TOP 
  #(parameter INDATA_WIDTH=16,
              Arithmatic_width=INDATA_WIDTH+INDATA_WIDTH,
              Logic_Width= INDATA_WIDTH,
              Shift_Width=INDATA_WIDTH,
              CMP_Width=3
  )
(
input wire [INDATA_WIDTH-1:0]           A,
input wire [INDATA_WIDTH-1:0]           B,
input wire [3:0]                        ALU_FUN,
input wire                              CLK,
input wire                              RST,
output wire [Arithmatic_width-1:0]      Arith_OUT,
output wire [Logic_Width-1:0]           Logic_OUT,
output wire [Shift_Width-1:0]           Shift_OUT,
output wire [CMP_Width-1:0]             CMP_OUT,
output wire                             Arith_FLAG,
output wire                             Carry_OUT,
output wire                             Logic_FLAG,
output wire                             Shift_FLAG,
output wire                             CMP_FLAG
);
//interconnection
wire                  Arith_enable ;
wire                  Logic_enable ;
wire                  Shift_enable ;
wire                  CMP_enable ;
//Instintiaion of Decoder unit
Decoder mapping_Decoder(
.IN(ALU_FUN[3:2]),
.OUT({Shift_enable,CMP_enable,Logic_enable,Arith_enable})
);
////Instintiaion of Arithmatic unit
ARITHMATIC_UNIT #(.IN_DATA_WIDTH(INDATA_WIDTH),.OUT_DATA_WIDTH(Arithmatic_width))mapping_Arith
(
.A(A),
.B(B),
.ALU_FUN(ALU_FUN[1:0]),
.Clk(CLK),
.RST(RST),
.Arithmaitc_Enable(Arith_enable),
.Arith_out(Arith_OUT),
.Arith_Flag(Arith_FLAG),
.Carry_out(Carry_OUT)
);
//Instintiaion of logic unit
LOGIC_UNIT #(.IN_DATA_WIDTH(INDATA_WIDTH),.OUT_DATA_WIDTH(Logic_Width))mapping_Logic
(
.A(A),
.B(B),
.ALU_FUN(ALU_FUN[1:0]),
.Clk(CLK),
.RST(RST),
.LOGIC_Enable(Logic_enable),
.LOGICAL_out(Logic_OUT),
.LOGICAL_Flag(Logic_FLAG)
);
//Instintiaion of Shift unit
SHIFT_UNIT  #(.IN_DATA_WIDTH(INDATA_WIDTH),.OUT_DATA_WIDTH(Shift_Width))mapping_Shift
(
.A(A),
.B(B),
.ALU_FUN(ALU_FUN[1:0]),
.Clk(CLK),
.RST(RST),
.SHIFT_Enable(Shift_enable),
.SHIFT_OUT(Shift_OUT),
.SHIFT_FLAG(Shift_FLAG)
);
//Instintiation of CMP unit
CMP_UNIT #(.IN_DATA_WIDTH(INDATA_WIDTH),.OUT_DATA_WIDTH(CMP_Width))mapping_Cmp
(
.A(A),
.B(B),
.ALU_FUN(ALU_FUN[1:0]),
.Clk(CLK),
.RST(RST),
.CMP_Enable(CMP_enable),
.CMP_out(CMP_OUT),
.CMP_Flag(CMP_FLAG)
);

endmodule