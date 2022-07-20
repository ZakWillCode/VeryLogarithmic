`timescale 1ns/ 1ns

module disp_tb;

reg [2:0] A;
reg [2:0] B;
reg clk;
reg rst_n;
reg en;
reg [1:0]op;
reg [5:0]Doutxnor;
reg [5:0]Doutshift;
reg [5:0]Doutadd;
reg [5:0]Doutmult;


wire [7:0]disp0; wire [7:0]disp1; wire [7:0]disp2; wire [7:0]disp3; wire [7:0]disp4; wire [7:0]disp5;

initial	begin
	A = 3'b0;
	B = 3'b0;
	rst_n = 1;
	en = 1;
	Doutxnor = 6'b010101;
	Doutshift = 6'b010101;
	Doutadd = 6'b010101;
	Doutmult = 6'b010101;
	op = 2'b00;
	
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1; op = 2'b00;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1; op = 2'b01;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1; op = 2'b10;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1; op = 2'b11;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1; op = 2'b00;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1; op = 2'b01;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1; op = 2'b10;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1; op = 2'b11;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	
	end
	
	disp_ALU u_disp(
		.op(op),
		.en(en),
		.rst_n(rst_n),
		.clk(clk),
		.Doutxnor(Doutxnor),
		.Doutshift(Doutshift),
		.Doutadd(Doutadd),
		.Doutmult(Doutmult),
		.disp0(disp0),
		.disp1(disp1),
		.disp2(disp2),
		.disp3(disp3),
		.disp4(disp4),
		.disp5(disp5)
	);
endmodule