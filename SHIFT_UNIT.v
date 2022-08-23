module SHIFT_UNIT  
   #(parameter IN_DATA_WIDTH= 16,
              OUT_DATA_WIDTH=16
  )
  (
  input wire      [IN_DATA_WIDTH-1:0]        A,
  input wire      [IN_DATA_WIDTH-1:0]        B,
  input wire      [1:0]                      ALU_FUN,
  input wire                                 Clk,
  input wire                                 RST,
  input wire                                 SHIFT_Enable,
  output reg     [OUT_DATA_WIDTH-1:0]        SHIFT_OUT,
  output reg                                 SHIFT_FLAG
  );
  reg [OUT_DATA_WIDTH-1:0]        SHIFT_OUT_SIGNAL;
  reg                             SHIFT_FLAG_SIGNAL;
  //sequntial always block
  always@(posedge Clk or negedge RST)
  begin
    if(!RST)
      begin
        SHIFT_OUT<=16'b0;
        SHIFT_FLAG<=1'b0;
      end
    else
      begin
      SHIFT_OUT<=SHIFT_OUT_SIGNAL;
      SHIFT_FLAG<=SHIFT_FLAG_SIGNAL;
      end
  end
  always@(*)
  begin 
    SHIFT_OUT_SIGNAL = 1'b0 ;
    SHIFT_FLAG_SIGNAL = 1'b0 ;
	if(SHIFT_Enable)
      case (ALU_FUN)
      2'b00 : begin
              SHIFT_OUT_SIGNAL = A >> 1  ;
              SHIFT_FLAG_SIGNAL = 1'b1 ;              
		      end
      2'b01 : begin
              SHIFT_OUT_SIGNAL = A << 1 ;
              SHIFT_FLAG_SIGNAL = 1'b1 ;           
		      end
      2'b10 : begin
              SHIFT_OUT_SIGNAL = B >> 1 ;
              SHIFT_FLAG_SIGNAL = 1'b1 ;           
		      end
      2'b11 : begin
              SHIFT_OUT_SIGNAL = B << 1 ;
              SHIFT_FLAG_SIGNAL = 1'b1 ;           
		      end
      endcase
	else
	 begin
      SHIFT_OUT_SIGNAL = 1'b0 ;
      SHIFT_FLAG_SIGNAL = 1'b0 ;
     end
 end
 
 endmodule