`timescale 1ns/ 1ns

module mult_tb;

reg [2:0] A;
reg [2:0] B;
reg clk;
reg rst_n;
reg en;
reg [1:0]op;

wire [5:0] Doutmult;

initial	begin
	A = 3'b0;
	B = 3'b0;
	rst_n = 1;
	en = 1;
	op = 2'b11;
	
	#5 clk = 1; A = 3'b001;
	#5 clk = 0;
	#5 clk = 1; B = 3'b001;
	#5 clk = 0;
	#5 clk = 1; A = 3'b011;
	#5 clk = 0;
	#5 clk = 1; B = 3'b011;
	#5 clk = 0;
	#5 clk = 1; A = 3'b110;
	#5 clk = 0;
	#5 clk = 1; B = 3'b110;
	#5 clk = 0;
	#5 clk = 1; A = 3'b111;
	#5 clk = 0;
	#5 clk = 1; B = 3'b111;
	#5 clk = 0;
	
	end
	
multiplier_ALU u_mult(
		.op(op),
		.en(en),
		.rst_n(rst_n),
		.clk(clk),
		.A(A),
		.B(B),
		.Doutmult(Doutmult)
	);
endmodule