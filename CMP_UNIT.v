module CMP_UNIT 
  #(parameter IN_DATA_WIDTH= 16,
              OUT_DATA_WIDTH=16
  )
    (
  input wire      [IN_DATA_WIDTH-1:0]        A,
  input wire      [IN_DATA_WIDTH-1:0]        B,
  input wire      [1:0]                      ALU_FUN,
  input wire                                 Clk,
  input wire                                 RST,
  input wire                                 CMP_Enable,
  output reg     [OUT_DATA_WIDTH-1:0]        CMP_out,
  output reg                                 CMP_Flag
  );
  reg [OUT_DATA_WIDTH-1:0]        CMP_out_signal;
  reg                             CMP_Flag_siganl;
  //always blocking sequntial
  
  always@(posedge Clk or negedge RST)
  begin
    if(!RST)
      begin
        CMP_out<=16'b0;
        CMP_Flag<=1'b0; 
      end
    else
      begin
      CMP_out<=CMP_out_signal;
      CMP_Flag<=CMP_Flag_siganl;
      end
  end
  //always blocking combintional
  always@(*)
  begin
    CMP_Flag_siganl=1'b0;
    CMP_out_signal=16'b0;
    if(CMP_Enable)
      begin
        case(ALU_FUN)
           2'b00 : begin
              CMP_out_signal = 16'b0  ;
              CMP_Flag_siganl = 1'b1 ;              
		               end
           2'b01 : begin
              CMP_Flag_siganl = 1'b1 ;  
              if (A==B)
                CMP_out_signal = 16'b1;
              else
                CMP_out_signal = 16'b0;			  
		               end
          2'b10 : begin
              CMP_Flag_siganl = 1'b1 ;  
              if (A>B)
                CMP_out_signal = 16'b10;
              else
                CMP_out_signal = 16'b0;			  
		              end
          2'b11 : begin
              CMP_Flag_siganl = 1'b1 ; 
              if (A<B)
                CMP_out_signal = 16'b11;
              else
                CMP_out_signal = 16'b0;			  
		              end
		         endcase
		     end
		   else
		     begin
		        CMP_Flag_siganl=1'b0;
            CMP_out_signal=16'b0;
		       end
		end
		endmodule
  
