// EELE 4054: Digital VLSI Design
// Author: Zakary Williams
// Date: Dec 7, 2020
// 
// ALU sync

module sync_ss (input real_clk, en, rst_n, output reg clk);

reg meta;

always @(posedge real_clk)

	if (~rst_n) begin
		meta <= 1'b0;
		clk <= 1'b0;
	end
	else begin
		meta <= en;
		clk <= meta;
	end
	
endmodule