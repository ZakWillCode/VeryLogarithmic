`timescale 10ns/ 10ns

module ALU_Toplevel_TB;

reg [2:0] A;
reg [2:0] B;
reg clk;
reg rst_n;
reg en;
reg [1:0]op;

wire [7:0]disp0; wire [7:0]disp1; wire [7:0]disp2; wire [7:0]disp3; wire [7:0]disp4; wire [7:0]disp5;

initial	begin
	A = 3'b010;
	B = 3'b101;
	rst_n = 1;
	en = 1;
	op = 2'b00;
	
	#2 clk = 1;
	#2 clk = 0;
	#2 clk = 1;
	#2 clk = 0;
	#2 clk = 1; op = 2'b00;
	#2 clk = 0;
	#2 clk = 1;
	#2 clk = 0;
	#2 clk = 1;
	#2 clk = 0;
	#2 clk = 1; op = 2'b01;
	#2 clk = 0;
	#2 clk = 1;
	#2 clk = 0;
	#2 clk = 1;
	#2 clk = 0;
	#2 clk = 1; rst_n = 1'b0;
	#2 clk = 0;
	#2 clk = 1;
	#2 clk = 0; rst_n = 1'b1;
	#2 clk = 1;
	#2 clk = 0;
	#2 clk = 1; op = 2'b10;
	#2 clk = 0;
	#2 clk = 1;
	#2 clk = 0;
	#2 clk = 1;
	#2 clk = 0;
	#2 clk = 1; 
	#2 clk = 0;
	#2 clk = 1;
	#2 clk = 0;
	#2 clk = 1;
	#2 clk = 0;
	#2 clk = 1; op = 2'b11;
	#2 clk = 0;
	#2 clk = 1;
	#2 clk = 0;
	#2 clk = 1;
	#2 clk = 0;
	#2 clk = 1;
	#2 clk = 0;
	#2 clk = 1;
	#2 clk = 0;
	#2 clk = 1;
	#2 clk = 0;
	
	
	
	end
	
ALU_Toplevel u_ALU(
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