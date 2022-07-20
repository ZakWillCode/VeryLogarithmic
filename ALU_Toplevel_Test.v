// EELE 4054: Digital VLSI Design
// Author: Zakary Williams
// Date: Dec 7, 2020
// 
// ALU wrapper module

module ALU_Toplevel_Test(

	//Clock
	input 		          		CLK_50,

	//7 Seg
	output		     [7:0]		disp0,
	output		     [7:0]		disp1,
	output		     [7:0]		disp2,
	output		     [7:0]		disp3,
	output		     [7:0]		disp4,
	output		     [7:0]		disp5,

	//Operation select
	input 		     [1:0]		op,

	//En/Rst_n
	input 		     en, rst_n,
	
	//Inputs
	input            [2:0]A, 
	input            [2:0]B
);

	//Wire 
	wire             [5:0]      Doutxnor;
	wire             [5:0]      Doutshift;
	wire             [5:0]      Doutadd;
	wire             [5:0]      Doutmult;

//  Structural coding

	add_ALU u_add(
		.op(op),
		.en(en),
		.rst_n(rst_n),
		.clk(CLK_50),
		.A(A),
		.B(B),
		.Doutadd(Doutadd)
	);
	disp_ALU u_disp(
		.op(op),
		.en(en),
		.rst_n(rst_n),
		.clk(CLK_50),
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