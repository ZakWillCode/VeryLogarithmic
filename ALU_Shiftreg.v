// EELE 4054: Digital VLSI Design
// Author: Zakary Williams
// Date: Dec 7, 2020
// 
// ALU shift reg module

module shiftreg_ALU(input [1:0]op, input en, input rst_n, input clk, input [2:0]A, input [2:0]B, output [5:0]Doutshift);

	reg shift0; //Declaration of shift registers 
	reg shift1;
	reg shift2;
	reg shift3;
	reg shift4;
	reg shift5;
	
	reg refresh;
	
	
	assign Doutshift[0] = shift0; //Assign outputs
	assign Doutshift[1] = shift1;
	assign Doutshift[2] = shift2;
	assign Doutshift[3] = shift3;
	assign Doutshift[4] = shift4;
	assign Doutshift[5] = shift5;
	
	
	initial begin //Initializing each registers
		shift5 = 1'b0;
		shift4 = 1'b0;
		shift3 = 1'b0;
		shift2 = 1'b0;
		shift1 = 1'b0;
		shift0 = 1'b0;
		refresh = 1'b0;
	end
	
	always @ (posedge clk) begin
		if (en) begin //ALU must be enabled to receive inputs
			if (~ rst_n) begin //Global reset 
				shift5 = 1'b0;
				shift4 = 1'b0;
				shift3 = 1'b0;
				shift2 = 1'b0;
				shift1 = 1'b0;
				shift0 = 1'b0;
				refresh = 1'b0;
			end
			if (op == 2'b01) begin //Selecting which ALU function is used
				if (refresh == 1'b0) begin //refreshing the shift registers with the given inputs and shifting 1 bit
					shift0 = B[0];
					shift1 = B[1];
					shift2 = B[2];
					shift3 = A[0];
					shift4 = A[1];
					shift5 = A[2];
					shift5 = shift4;
					shift4 = shift3;
					shift3 = shift2;
					shift2 = shift1;
					shift1 = shift0;
					shift0 = 1'b0;
					refresh = 1'b1;
				end
				else begin //Shifting all registers 1 bit
					shift5 = shift4;
					shift4 = shift3;
					shift3 = shift2;
					shift2 = shift1;
					shift1 = shift0;
					shift0 = 1'b0;
				end
			end
		end
	end
endmodule