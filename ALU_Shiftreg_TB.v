`timescale 1ns/ 1ns

module shift_tb;

reg [2:0] A;
reg [2:0] B;
reg clk;
reg rst_n;
reg en;
reg [1:0]op;

wire [5:0] Doutshift;

initial	begin
	A = 3'b001;
	B = 3'b001;
	rst_n = 1;
	en = 1;
	op = 2'b01;
	
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
	#5 clk = 1; rst_n = 0;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0; rst_n = 1;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1; en = 0;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0; en = 1;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	
	end
	shiftreg_ALU u_shift(
		.op(op),
		.en(en),
		.rst_n(rst_n),
		.clk(clk),
		.A(A),
		.B(B),
		.Doutshift(Doutshift)
	);
endmodule