// EELE 4054: Digital VLSI Design
// Author: Zakary Williams
// Date: Nov. 21, 2020
// 
// ALU Test

module ALU(output [5:0]Dout, input [1:0]ALU_OP,[2:0]A,[2:0]B);

	reg bit0;
	reg bit1;
	reg bit2;
	reg bit3;
	reg bit4;
	reg bit5;
	reg [5:0]tempreg;
	
	assign bit0 = A[0];
	assign bit1 = A[1];
	assign bit2 = A[2];
	assign bit3 = B[0];
	assign bit4 = B[1];
	assign bit5 = B[2];
	
	always @ (*) begin
		case(ALU_OP)
			2'b00: xnor(tempreg,A,B);
			2'b01: begin
				bit5 <= bit4;
				bit4 <= bit3;
				bit3 <= bit2;
				bit2 <= bit1;
				bit1 <= bit0;
				tempreg[0] = bit0;
				tempreg[1] = bit1;
				tempreg[2] = bit2;
				tempreg[3] = bit3;
				tempreg[4] = bit4;
				tempreg[5] = bit5;
			end
			2'b10: tempreg = A+B;
			2'b11: tempreg = A*B;
		endcase
		
		assign Dout = tempreg;
		
	endmodule 