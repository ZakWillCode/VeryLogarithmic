`timescale 1ns/ 1ns

module ALU_Toplevel_Test_TB;

reg [2:0] A;
reg [2:0] B;
reg clk;
reg rst_n;
reg en;
reg [1:0]op;

wire [7:0]disp0; wire [7:0]disp1; wire [7:0]disp2; wire [7:0]disp3; wire [7:0]disp4; wire [7:0]disp5;

initial	begin
	A = 3'b0;
	B = 3'b0;
	rst_n = 1;
	en = 1;
	op = 2'b10;
	
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;A = 3'b101;B = 3'b101;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1; 
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	
	end
	
ALU_Toplevel_Test u_ALU(
.op(op),
.en(en),
.rst_n(rst_n),
.CLK_50(clk),
.A(A),
.B(B),
.disp0(disp0),
.disp1(disp1),
.disp2(disp2),
.disp3(disp3),
.disp4(disp4),
.disp5(disp5));
endmodule