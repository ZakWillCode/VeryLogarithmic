// EELE 4054: Digital VLSI Design
// Author: Zakary Williams
// Date: Dec 7, 2020
// 
// ALU Add module

module add_ALU(input [1:0]op, input en, input rst_n, input clk, input [2:0]A, input [2:0]B, output [5:0]Doutadd, C);
	
	reg [5:0] Y; //Temp register for output


	initial Y = 6'b0;
	assign Doutadd = Y;
	assign C = Y[3];
	
	always @ (posedge clk) begin
		if (en) begin //ALU must be enabled to receive inputs
			if (~ rst_n) //Global reset 
				Y = 1'b0;
			else begin
				if(op == 2'b10) //Selecting which ALU function is used
					Y = A+B; //Addition function
			end
		end
	end
endmodule