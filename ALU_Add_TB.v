`timescale 1ns/ 1ns

module add_tb;

reg [2:0] A;
reg [2:0] B;
reg clk;
reg rst_n;
reg en;
reg [1:0]op;

wire [5:0] Doutadd;
wire C;

initial	begin
	A = 3'b000;
	B = 3'b000;
	rst_n = 1;
	en = 1;
	op = 2'b10;
	
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
	
add_ALU u_add(
		.op(op),
		.en(en),
		.rst_n(rst_n),
		.clk(clk),
		.A(A),
		.B(B),
		.Doutadd(Doutadd),
		.C(C)
	);
endmodule