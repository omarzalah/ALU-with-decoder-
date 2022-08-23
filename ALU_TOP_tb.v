`timescale 1us/1us
module ALU_TOP_tb();
/*Clock period  parameter*/
parameter  CLK_Period=10,
           High_Period=0.6*CLK_Period,
           Low_period=0.4*CLK_Period;
           
/*Test bench parameters*/
parameter    OP_DATA_WIDTH_TB   = 16 ;
parameter    Arith_OUT_WIDTH_TB = OP_DATA_WIDTH_TB + OP_DATA_WIDTH_TB ;          
parameter    Logic_OUT_WIDTH_TB = OP_DATA_WIDTH_TB ;
parameter    Shift_OUT_WIDTH_TB = OP_DATA_WIDTH_TB ;
parameter    CMP_OUT_WIDTH_TB   = 3 ;

/*Test bench signals*/
reg [OP_DATA_WIDTH_TB-1:0]    A_TB;
reg [OP_DATA_WIDTH_TB-1:0]    B_TB;
reg [3:0]                     ALU_FUNC_TB;
reg                           CLK_TB;
wire [Arith_OUT_WIDTH_TB-1:0] Arith_OUT_TB;
wire [Logic_OUT_WIDTH_TB-1:0] Logic_OUT_TB;
wire [Shift_OUT_WIDTH_TB-1:0] Shift_OUT_TB;
wire [CMP_OUT_WIDTH_TB-1:0]   CMP_OUT_TB;
wire                          Carry_OUT_TB;
wire                          Arith_Flag_TB;
wire                          Logic_Flag_TB;
wire                          Shift_Flag_TB;
wire                          CMP_Flag_TB;
reg                           REST_TB;

//concatenate flags
  wire [4:0] Flags ;

assign Flags = {Carry_OUT_TB , Arith_Flag_TB , Logic_Flag_TB , CMP_Flag_TB , Shift_Flag_TB};


/*start*/
initial
  begin
    $dumpfile("ALU.vcd");
    $dumpvars ;

//initial values
CLK_TB = 1'b0;
REST_TB=1'b1;
$display("*****TEST CASE 1 *** REST");
A_TB = 'd15;
B_TB = 'd10;
ALU_FUNC_TB = 4'b0000; 
REST_TB=1'b0;
#CLK_Period
if (Arith_OUT_TB == 'd0 && Flags == 5'd0)
       $display ("REST IS PASSED") ;
   else
      begin
       $display ("REST IS FAILED") ;
      end  
#CLK_Period
$display ("*** TEST CASE 2 ***");
REST_TB=1'b1;
A_TB = 'd15;
B_TB = 'd10;
ALU_FUNC_TB = 4'b0000; 

#CLK_Period
    
   if (Arith_OUT_TB == 'd25 && Flags == 5'd8)
       $display ("Addition IS PASSED") ;
   else
      begin
       $display ("Addition IS FAILED") ;
      end
#CLK_Period
$display ("*** TEST CASE 3 ***");
REST_TB=1'b1;
A_TB = 'd15;
B_TB = 'd10;
ALU_FUNC_TB = 4'b0001; 

#CLK_Period
    
   if (Arith_OUT_TB == 'd5 && Flags == 5'd8)
       $display ("Subtraction IS PASSED ") ;
   else
      begin
       $display ("Subtracion IS FAILED") ;
      end    
#CLK_Period
$display ("*** TEST CASE 4 ***");
REST_TB=1'b1;
A_TB = 'd2;
B_TB = 'd2;
ALU_FUNC_TB = 4'b0010; 

#CLK_Period
    
   if (Arith_OUT_TB == 'd4 && Flags == 5'd8)
       $display ("Multiplication IS PASSED ") ;
   else
      begin
       $display ("Multiplication IS FAILED") ;
      end       
 #CLK_Period
$display ("*** TEST CASE 5 ***");
REST_TB=1'b1;
A_TB = 'd2;
B_TB = 'd2;
ALU_FUNC_TB = 4'b0011; 

#CLK_Period
    
   if (Arith_OUT_TB == 'd1 && Flags == 5'd8)
       $display ("Division IS PASSED ") ;
   else
      begin
       $display ("Divison IS FAILED") ;
      end      
#CLK_Period
$display ("*** TEST CASE 6 ***");
REST_TB=1'b1;
A_TB = 'd2;
B_TB = 'd2;
ALU_FUNC_TB = 4'b0100; 

#CLK_Period
    
   if (Logic_OUT_TB == 'd2 && Flags == 5'd4)
       $display ("And IS PASSED ") ;
   else
      begin
       $display ("And IS FAILED") ;
      end       
#CLK_Period
$display ("*** TEST CASE 7 ***");
REST_TB=1'b1;
A_TB = 'd3;
B_TB = 'd2;
ALU_FUNC_TB = 4'b0101; 

#CLK_Period
    
   if (Logic_OUT_TB == 'd3 && Flags == 5'd4)
       $display ("OR IS PASSED ") ;
   else
      begin
       $display ("OR IS FAILED") ;
      end     
#CLK_Period
$display ("*** TEST CASE 8 ***");
REST_TB=1'b1;
A_TB = 'd1;
B_TB = 'd1;
ALU_FUNC_TB = 4'b0110; 

#CLK_Period
    
   if (Logic_OUT_TB == 'b1111111111111110 && Flags == 5'd4)
       $display ("NAND IS PASSED ") ;
   else
      begin
       $display ("NAND IS FAILED") ;
      end         
#CLK_Period
$display ("*** TEST CASE 9 ***");
REST_TB=1'b1;
A_TB = 'd1;
B_TB = 'd1;
ALU_FUNC_TB = 4'b0111; 

#CLK_Period
    
   if (Logic_OUT_TB == 'b1111111111111110 && Flags == 5'd4)
       $display ("NOR IS PASSED ") ;
   else
      begin
       $display ("NOR IS FAILED") ;
      end    
#CLK_Period
$display ("*** TEST CASE 10 ***");
REST_TB=1'b1;
A_TB = 'd1;
B_TB = 'd1;
ALU_FUNC_TB = 4'b1000; 

#CLK_Period
    
   if (CMP_OUT_TB == 'd0 && Flags == 5'd2)
       $display ("NOP CMP IS PASSED ") ;
   else
      begin
       $display ("NOP CMP IS FAILED") ;
      end  
#CLK_Period
$display ("*** TEST CASE 11 ***");
REST_TB=1'b1;
A_TB = 'd1;
B_TB = 'd1;
ALU_FUNC_TB = 4'b1001; 

#CLK_Period
    
   if (CMP_OUT_TB == 'd1 && Flags == 5'd2)
       $display ("= CMP IS PASSED ") ;
   else
      begin
       $display ("= CMP IS FAILED") ;
      end    
#CLK_Period
$display ("*** TEST CASE 12 ***");
REST_TB=1'b1;
A_TB = 'd3;
B_TB = 'd2;
ALU_FUNC_TB = 4'b1010; 

#CLK_Period
    
   if (CMP_OUT_TB == 'd2 && Flags == 5'd2)
       $display ("A>B CMP IS PASSED ") ;
   else
      begin
       $display ("A>B CMP IS FAILED") ;
      end   
#CLK_Period
$display ("*** TEST CASE 13 ***");
REST_TB=1'b1;
A_TB = 'd2;
B_TB = 'd3;
ALU_FUNC_TB = 4'b1011; 

#CLK_Period
    
   if (CMP_OUT_TB == 'd3 && Flags == 5'd2)
       $display ("A<B CMP IS PASSED ") ;
   else
      begin
       $display ("A<B CMP IS FAILED") ;
      end   
       
#CLK_Period
$display ("*** TEST CASE 14 ***");
REST_TB=1'b1;
A_TB = 'd2;
B_TB = 'd3;
ALU_FUNC_TB = 4'b1100; 

#CLK_Period
    
   if (Shift_OUT_TB == 'd1 && Flags == 5'd1)
       $display ("A>>1 Shift IS PASSED ") ;
   else
      begin
       $display ("A>>1 Shift IS FAILED") ;
      end   
      
#CLK_Period
$display ("*** TEST CASE 15 ***");
REST_TB=1'b1;
A_TB = 'd2;
B_TB = 'd3;
ALU_FUNC_TB = 4'b1101; 

#CLK_Period
    
   if (Shift_OUT_TB == 'd4 && Flags == 5'd1)
       $display ("A<<1 Shift IS PASSED ") ;
   else
      begin
       $display ("A<<1 Shift IS FAILED") ;
      end   
      
      
#CLK_Period
$display ("*** TEST CASE 16 ***");
REST_TB=1'b1;
A_TB = 'd3;
B_TB = 'd2;
ALU_FUNC_TB = 4'b1110; 

#CLK_Period
    
   if (Shift_OUT_TB == 'd1 && Flags == 5'd1)
       $display ("B>>1 Shift IS PASSED ") ;
   else
      begin
       $display ("B>>1 Shift IS FAILED") ;
      end  
      
      #CLK_Period
$display ("*** TEST CASE 17 ***");
REST_TB=1'b1;
A_TB = 'd3;
B_TB = 'd2;
ALU_FUNC_TB = 4'b1111; 

#CLK_Period
    
   if (Shift_OUT_TB == 'd4 && Flags == 5'd1)
       $display ("B<<1 Shift IS PASSED ") ;
   else
      begin
       $display ("B<<1 Shift IS FAILED") ;
      end  
      
      #100 $finish;
    end
    
    // Clock Generator with 100 KHz (10 us)
  always  
   begin
    #Low_period  CLK_TB = ~ CLK_TB ;
    #High_Period CLK_TB = ~ CLK_TB ;
   end

   // instantiate Design Unit
ALU_TOP # (.INDATA_WIDTH(OP_DATA_WIDTH_TB)) DUT (
.A(A_TB), 
.B(B_TB),
.RST(REST_TB),
.ALU_FUN(ALU_FUNC_TB),
.CLK(CLK_TB),
.Arith_OUT(Arith_OUT_TB),
.Carry_OUT(Carry_OUT_TB),
.Arith_FLAG(Arith_Flag_TB),
.Logic_OUT(Logic_OUT_TB),
.Logic_FLAG(Logic_Flag_TB),
.Shift_OUT(Shift_OUT_TB),
.Shift_FLAG(Shift_Flag_TB),
.CMP_OUT(CMP_OUT_TB),
.CMP_FLAG(CMP_Flag_TB)
);

endmodule