// EELE 4054: Digital VLSI Design
// Author: Zakary Williams
// Date: Dec 7, 2020
// 
// ALU multiplier module 

module multiplier_ALU(input [1:0]op, input en, input rst_n, input clk, input [2:0]A, input [2:0]B, output [5:0]Doutmult);
	
	reg [5:0] Y; //Temp register for output

	initial	Y = 6'b0;	
	assign Doutmult = Y;
	
	always @ (posedge clk) begin
		if (en) begin //ALU must be enabled to receive inputs
			if (~ rst_n) //Global reset 
				Y = 1'b0;
			else begin
				if (op == 2'b11) begin //Selecting which ALU function is used
					Y = 6'b0;
					case(B) // Addition and shift implementation of multiplier 
						3'b000: Y = 6'b0;
						3'b001: Y = {3'b0, A};
						3'b010: Y = {2'b0, A, 1'b0};
						3'b011: Y = {2'b0, A, 1'b0}+{3'b0, A};
						3'b100: Y = {1'b0, A, 2'b0};
						3'b101: Y = {1'b0, A, 2'b0}+{3'b0, A};
						3'b110: Y = {1'b0, A, 2'b0}+{2'b0, A, 1'b0};
						3'b111: Y = {1'b0, A, 2'b0}+{2'b0, A, 1'b0}+{3'b0, A};
						default Y = 6'b0;
					endcase
				end
			end
		end
	end	
endmodule		