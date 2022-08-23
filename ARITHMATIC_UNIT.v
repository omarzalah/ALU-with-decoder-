module ARITHMATIC_UNIT
  #(parameter IN_DATA_WIDTH= 16,
              OUT_DATA_WIDTH=16
  )
  
  (
  input wire      [IN_DATA_WIDTH-1:0]        A,
  input wire      [IN_DATA_WIDTH-1:0]        B,
  input wire      [1:0]                      ALU_FUN,
  input wire                                 Clk,
  input wire                                 RST,
  input wire                                 Arithmaitc_Enable,
  output reg     [OUT_DATA_WIDTH-1:0]       Arith_out,
  output reg                                Arith_Flag,
  output reg                                Carry_out
  );
  //internal signals
  
   reg     [OUT_DATA_WIDTH-1:0]       Arith_out_signal;
   reg     [1:0]                      Arith_Flag_signal;
   wire                              Carry_out_signal;
  //always blocking sequential
always@(posedge Clk or negedge RST)
begin
  if(!RST)
    begin
      Arith_out<=0;
      Arith_Flag<=0;
      Carry_out<=0;
    end
  else 
    begin
     Arith_out<=Arith_out_signal;
     Arith_Flag<=Arith_Flag_signal;
     Carry_out<=Carry_out_signal;
    end
end
//always blocking for combinational 
always@(*)
begin
  Arith_out_signal=16'b0;
  Arith_Flag_signal=1'b0;
  if(Arithmaitc_Enable)
    begin
      case(ALU_FUN)
        2'b00:begin
          Arith_out_signal=A+B;
            Arith_Flag_signal=1'b1;
        end
        2'b01:begin
          Arith_out_signal=A-B;
            Arith_Flag_signal=1'b1;
        end
        2'b10:begin
          Arith_out_signal=A*B;
            Arith_Flag_signal=1'b1;
        end
        2'b11:begin
          Arith_out_signal=A/B;
            Arith_Flag_signal=1'b1;
        end   
    endcase
    end
    else
      begin
        Arith_out_signal=16'b0;
        Arith_Flag_signal=1'b0;
      end
end
//for carry bit
assign  Carry_out_signal= Arith_out_signal[IN_DATA_WIDTH];

endmodule