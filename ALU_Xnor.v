// EELE 4054: Digital VLSI Design
// Author: Zakary Williams
// Date: Dec 7, 2020
// 
// ALU xnor module 

module xnor_ALU(input [1:0]op, input en, input rst_n, input clk, input [2:0]A, input [2:0]B, output [5:0]Doutxnor);
	
	reg [2:0] Y; //Temp register for output

	initial	Y = 3'b0;	
	assign Doutxnor = Y;
	
	always @ (posedge clk) begin
		if (en) begin //ALU must be enabled to receive inputs
			if (~ rst_n) //Global reset 
				Y = 1'b0;
			else begin
				if (op == 2'b00) //Selecting which ALU function is used
					Y = A^~B; //Bitwise XNOR function
			end
		end
	end
endmodule