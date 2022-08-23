module LOGIC_UNIT
   #(parameter IN_DATA_WIDTH= 16,
              OUT_DATA_WIDTH=16
  )
  
  (
  input wire      [IN_DATA_WIDTH-1:0]        A,
  input wire      [IN_DATA_WIDTH-1:0]        B,
  input wire      [1:0]                      ALU_FUN,
  input wire                                 Clk,
  input wire                                 RST,
  input wire                                 LOGIC_Enable,
  output reg     [OUT_DATA_WIDTH-1:0]        LOGICAL_out,
  output reg                                 LOGICAL_Flag
  );
  reg [OUT_DATA_WIDTH-1:0]        LOGICAL_out_signal;
  reg                             LOGICAL_Flag_siganl;
  //always blocking sequntial
  
  always@(posedge Clk or negedge RST)
  begin
    if(!RST)
      begin
      LOGICAL_out<=16'b0;
      LOGICAL_Flag<=1'b0;
      end
    else
      begin
      LOGICAL_out<=LOGICAL_out_signal;
      LOGICAL_Flag<=LOGICAL_Flag_siganl;
      end
  end
  //always blocking combintional
  always@(*)
  begin
    LOGICAL_Flag_siganl=1'b0;
    LOGICAL_out_signal=16'b0;
    if(LOGIC_Enable)
      begin
        case(ALU_FUN)
           2'b00 : begin
              LOGICAL_out_signal = A & B ;
              LOGICAL_Flag_siganl = 1'b1 ;              
		      end
          2'b01 : begin
              LOGICAL_out_signal = A | B ;
              LOGICAL_Flag_siganl = 1'b1 ;           
		      end
         2'b10 : begin
              LOGICAL_out_signal = ~(A & B) ;
              LOGICAL_Flag_siganl = 1'b1 ;           
		      end
         2'b11 : begin
              LOGICAL_out_signal = ~(A | B) ;
              LOGICAL_Flag_siganl = 1'b1 ;           
		      end
		    endcase
		   end
		   else
		     begin
		        LOGICAL_Flag_siganl=1'b0;
            LOGICAL_out_signal=16'b0;
		       end
		end
		endmodule
		
		    