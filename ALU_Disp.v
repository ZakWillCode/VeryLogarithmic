// EELE 4054: Digital VLSI Design
// Author: Zakary Williams
// Date: Dec 7, 2020
// 
// ALU display module

module disp_ALU(input [1:0]op, input en, input rst_n, input clk, input [5:0]Doutxnor, input [5:0]Doutshift, input [5:0]Doutadd,input [5:0]Doutmult, output [7:0]disp0, output [7:0]disp1, output [7:0]disp2, output [7:0]disp3, output [7:0]disp4, output [7:0]disp5);
	
	reg [7:0] Hex0; //Initializing output registers
	reg [7:0] Hex1;
	reg [7:0] Hex2;
	reg [7:0] Hex3;
	reg [7:0] Hex4;
	reg [7:0] Hex5;
	
	assign disp0 = Hex0; //Assigning displays to those registers
	assign disp1 = Hex1;
	assign disp2 = Hex2;
	assign disp3 = Hex3;
	assign disp4 = Hex4;
	assign disp5 = Hex5;
	
	
	always @ (posedge clk) begin //Synched clock
	if (~rst_n) begin //Global reset 
		Hex0 = 7'b0;
		Hex1 = 7'b0;
		Hex2 = 7'b0;
		Hex3 = 7'b0;
		Hex4 = 7'b0;
		Hex5 = 7'b0;
	end
	else begin
			Hex0 = 7'b0;//Clear 
			Hex1 = 7'b0;
			Hex2 = 7'b0;
			Hex3 = 7'b0;
			Hex4 = 7'b0;
			Hex5 = 7'b0;
			case (op)
			2'b00: begin //3 bit output of Xnor displayed (binary)
				case (Doutxnor[0])
					1'b0:Hex0=7'b1111110;
					1'b1:Hex0=7'b0110000;
					default: Hex0 = 7'b0;
				endcase
				case (Doutxnor[1])
					1'b0:Hex1=7'b1111110;
					1'b1:Hex1=7'b0110000;
					default: Hex1 = 7'b0;
				endcase
				case (Doutxnor[2])
					1'b0:Hex2=7'b1111110;
					1'b1:Hex2=7'b0110000;
					default: Hex2 = 7'b0;
				endcase
			end
			
			2'b01: begin // Shift register output displayed (binary)
				case (Doutshift[0])
					1'b0:Hex0=7'b1111110;
					1'b1:Hex0=7'b0110000;
					default: Hex0 = 7'b0;
				endcase
				case (Doutshift[1])
					1'b0:Hex1=7'b1111110;
					1'b1:Hex1=7'b0110000;
					default: Hex1 = 7'b0;
				endcase
				case (Doutshift[2])
					1'b0:Hex2=7'b1111110;
					1'b1:Hex2=7'b0110000;
					default: Hex2 = 7'b0;
				endcase
				case (Doutshift[3])
					1'b0:Hex3=7'b1111110;
					1'b1:Hex3=7'b0110000;
					default: Hex3 = 7'b0;
				endcase
				case (Doutshift[4])
					1'b0:Hex4=7'b1111110;
					1'b1:Hex4=7'b0110000;
					default: Hex4 = 7'b0;
				endcase
				case (Doutshift[5])
					1'b0:Hex5=7'b1111110;
					1'b1:Hex5=7'b0110000;
					default: Hex5 = 7'b0;
				endcase
			end
			2'b10: begin //Addition output display (integer)
				case (Doutadd) //dual 7 segment display lookup table
					//0-9
					6'b000000:begin Hex1=7'b1111110;Hex0=7'b1111110; end
					6'b000001:begin Hex1=7'b1111110;Hex0=7'b0110000; end
					6'b000010:begin Hex1=7'b1111110;Hex0=7'b1101101; end
					6'b000011:begin Hex1=7'b1111110;Hex0=7'b1111001; end
					6'b000100:begin Hex1=7'b1111110;Hex0=7'b0110011; end
					6'b000101:begin Hex1=7'b1111110;Hex0=7'b1011011; end
					6'b000110:begin Hex1=7'b1111110;Hex0=7'b1011111; end
					6'b000111:begin Hex1=7'b1111110;Hex0=7'b1110000; end
					6'b001000:begin Hex1=7'b1111110;Hex0=7'b1111111; end
					6'b001001:begin Hex1=7'b1111110;Hex0=7'b1110011; end
					//10-19
					6'b001010:begin Hex1=7'b0110000;Hex0=7'b1111110; end
					6'b001011:begin Hex1=7'b0110000;Hex0=7'b0110000; end
					6'b001100:begin Hex1=7'b0110000;Hex0=7'b1101101; end
					6'b001101:begin Hex1=7'b0110000;Hex0=7'b1111001; end
					6'b001110:begin Hex1=7'b0110000;Hex0=7'b0110011; end
					6'b001111:begin Hex1=7'b0110000;Hex0=7'b1011011; end
					6'b010000:begin Hex1=7'b0110000;Hex0=7'b1011111; end
					6'b010001:begin Hex1=7'b0110000;Hex0=7'b1110000; end
					6'b010010:begin Hex1=7'b0110000;Hex0=7'b1111111; end
					6'b010011:begin Hex1=7'b0110000;Hex0=7'b1110011; end
					//20-29
					6'b010100:begin Hex1=7'b1101101;Hex0=7'b1111110; end
					6'b010101:begin Hex1=7'b1101101;Hex0=7'b0110000; end
					6'b010110:begin Hex1=7'b1101101;Hex0=7'b1101101; end
					6'b010111:begin Hex1=7'b1101101;Hex0=7'b1111001; end
					6'b011000:begin Hex1=7'b1101101;Hex0=7'b0110011; end
					6'b011001:begin Hex1=7'b1101101;Hex0=7'b1011011; end
					6'b011010:begin Hex1=7'b1101101;Hex0=7'b1011111; end
					6'b011011:begin Hex1=7'b1101101;Hex0=7'b1110000; end
					6'b011100:begin Hex1=7'b1101101;Hex0=7'b1111111; end
					6'b011101:begin Hex1=7'b1101101;Hex0=7'b1110011; end
					//30-39
					6'b011111:begin Hex1=7'b1111001;Hex0=7'b1111110; end
					6'b100000:begin Hex1=7'b1111001;Hex0=7'b0110000; end
					6'b100001:begin Hex1=7'b1111001;Hex0=7'b1101101; end
					6'b100010:begin Hex1=7'b1111001;Hex0=7'b1111001; end
					6'b100011:begin Hex1=7'b1111001;Hex0=7'b0110011; end
					6'b100100:begin Hex1=7'b1111001;Hex0=7'b1011011; end
					6'b100101:begin Hex1=7'b1111001;Hex0=7'b1011111; end
					6'b100110:begin Hex1=7'b1111001;Hex0=7'b1110000; end
					6'b100111:begin Hex1=7'b1111001;Hex0=7'b1111111; end
					6'b101000:begin Hex1=7'b1111001;Hex0=7'b1110011; end
					//40-49
					6'b101001:begin Hex1=7'b0110011;Hex0=7'b1111110; end
					6'b101010:begin Hex1=7'b0110011;Hex0=7'b0110000; end
					6'b101011:begin Hex1=7'b0110011;Hex0=7'b1101101; end
					6'b101100:begin Hex1=7'b0110011;Hex0=7'b1111001; end
					6'b101101:begin Hex1=7'b0110011;Hex0=7'b0110011; end
					6'b101110:begin Hex1=7'b0110011;Hex0=7'b1011011; end
					6'b101111:begin Hex1=7'b0110011;Hex0=7'b1011111; end
					6'b110000:begin Hex1=7'b0110011;Hex0=7'b1110000; end
					6'b110001:begin Hex1=7'b0110011;Hex0=7'b1111111; end
					6'b110010:begin Hex1=7'b0110011;Hex0=7'b1110011; end
					//50-59
					6'b110011:begin Hex1=7'b1011011;Hex0=7'b1111110; end
					6'b110100:begin Hex1=7'b1011011;Hex0=7'b0110000; end
					6'b110101:begin Hex1=7'b1011011;Hex0=7'b1101101; end
					6'b110110:begin Hex1=7'b1011011;Hex0=7'b1111001; end
					6'b110111:begin Hex1=7'b1011011;Hex0=7'b0110011; end
					6'b111000:begin Hex1=7'b1011011;Hex0=7'b1011011; end
					6'b111001:begin Hex1=7'b1011011;Hex0=7'b1011111; end
					6'b111010:begin Hex1=7'b1011011;Hex0=7'b1110000; end
					6'b111011:begin Hex1=7'b1011011;Hex0=7'b1111111; end
					6'b111100:begin Hex1=7'b1011011;Hex0=7'b1110011; end
					//60-63
					6'b111101:begin Hex1=7'b1011111;Hex0=7'b1111110; end
					6'b111110:begin Hex1=7'b1011111;Hex0=7'b0110000; end
					6'b111111:begin Hex1=7'b1011111;Hex0=7'b1101101; end
					default: Hex0 = 7'b0;
				endcase
			end
			2'b11: begin //Multiplication output display (integer)
					case (Doutmult) //dual 7 segment Hexlay lookup table
					//0-9
					6'b000000:begin Hex1=7'b1111110;Hex0=7'b1111110; end
					6'b000001:begin Hex1=7'b1111110;Hex0=7'b0110000; end
					6'b000010:begin Hex1=7'b1111110;Hex0=7'b1101101; end
					6'b000011:begin Hex1=7'b1111110;Hex0=7'b1111001; end
					6'b000100:begin Hex1=7'b1111110;Hex0=7'b0110011; end
					6'b000101:begin Hex1=7'b1111110;Hex0=7'b1011011; end
					6'b000110:begin Hex1=7'b1111110;Hex0=7'b1011111; end
					6'b000111:begin Hex1=7'b1111110;Hex0=7'b1110000; end
					6'b001000:begin Hex1=7'b1111110;Hex0=7'b1111111; end
					6'b001001:begin Hex1=7'b1111110;Hex0=7'b1110011; end
					//10-19
					6'b001010:begin Hex1=7'b0110000;Hex0=7'b1111110; end
					6'b001011:begin Hex1=7'b0110000;Hex0=7'b0110000; end
					6'b001100:begin Hex1=7'b0110000;Hex0=7'b1101101; end
					6'b001101:begin Hex1=7'b0110000;Hex0=7'b1111001; end
					6'b001110:begin Hex1=7'b0110000;Hex0=7'b0110011; end
					6'b001111:begin Hex1=7'b0110000;Hex0=7'b1011011; end
					6'b010000:begin Hex1=7'b0110000;Hex0=7'b1011111; end
					6'b010001:begin Hex1=7'b0110000;Hex0=7'b1110000; end
					6'b010010:begin Hex1=7'b0110000;Hex0=7'b1111111; end
					6'b010011:begin Hex1=7'b0110000;Hex0=7'b1110011; end
					//20-29
					6'b010100:begin Hex1=7'b1101101;Hex0=7'b1111110; end
					6'b010101:begin Hex1=7'b1101101;Hex0=7'b0110000; end
					6'b010110:begin Hex1=7'b1101101;Hex0=7'b1101101; end
					6'b010111:begin Hex1=7'b1101101;Hex0=7'b1111001; end
					6'b011000:begin Hex1=7'b1101101;Hex0=7'b0110011; end
					6'b011001:begin Hex1=7'b1101101;Hex0=7'b1011011; end
					6'b011010:begin Hex1=7'b1101101;Hex0=7'b1011111; end
					6'b011011:begin Hex1=7'b1101101;Hex0=7'b1110000; end
					6'b011100:begin Hex1=7'b1101101;Hex0=7'b1111111; end
					6'b011101:begin Hex1=7'b1101101;Hex0=7'b1110011; end
					//30-39
					6'b011111:begin Hex1=7'b1111001;Hex0=7'b1111110; end
					6'b100000:begin Hex1=7'b1111001;Hex0=7'b0110000; end
					6'b100001:begin Hex1=7'b1111001;Hex0=7'b1101101; end
					6'b100010:begin Hex1=7'b1111001;Hex0=7'b1111001; end
					6'b100011:begin Hex1=7'b1111001;Hex0=7'b0110011; end
					6'b100100:begin Hex1=7'b1111001;Hex0=7'b1011011; end
					6'b100101:begin Hex1=7'b1111001;Hex0=7'b1011111; end
					6'b100110:begin Hex1=7'b1111001;Hex0=7'b1110000; end
					6'b100111:begin Hex1=7'b1111001;Hex0=7'b1111111; end
					6'b101000:begin Hex1=7'b1111001;Hex0=7'b1110011; end
					//40-49
					6'b101001:begin Hex1=7'b0110011;Hex0=7'b1111110; end
					6'b101010:begin Hex1=7'b0110011;Hex0=7'b0110000; end
					6'b101011:begin Hex1=7'b0110011;Hex0=7'b1101101; end
					6'b101100:begin Hex1=7'b0110011;Hex0=7'b1111001; end
					6'b101101:begin Hex1=7'b0110011;Hex0=7'b0110011; end
					6'b101110:begin Hex1=7'b0110011;Hex0=7'b1011011; end
					6'b101111:begin Hex1=7'b0110011;Hex0=7'b1011111; end
					6'b110000:begin Hex1=7'b0110011;Hex0=7'b1110000; end
					6'b110001:begin Hex1=7'b0110011;Hex0=7'b1111111; end
					6'b110010:begin Hex1=7'b0110011;Hex0=7'b1110011; end
					//50-59
					6'b110011:begin Hex1=7'b1011011;Hex0=7'b1111110; end
					6'b110100:begin Hex1=7'b1011011;Hex0=7'b0110000; end
					6'b110101:begin Hex1=7'b1011011;Hex0=7'b1101101; end
					6'b110110:begin Hex1=7'b1011011;Hex0=7'b1111001; end
					6'b110111:begin Hex1=7'b1011011;Hex0=7'b0110011; end
					6'b111000:begin Hex1=7'b1011011;Hex0=7'b1011011; end
					6'b111001:begin Hex1=7'b1011011;Hex0=7'b1011111; end
					6'b111010:begin Hex1=7'b1011011;Hex0=7'b1110000; end
					6'b111011:begin Hex1=7'b1011011;Hex0=7'b1111111; end
					6'b111100:begin Hex1=7'b1011011;Hex0=7'b1110011; end
					//60-63
					6'b111101:begin Hex1=7'b1011111;Hex0=7'b1111110; end
					6'b111110:begin Hex1=7'b1011111;Hex0=7'b0110000; end
					6'b111111:begin Hex1=7'b1011111;Hex0=7'b1101101; end
					default: Hex0 = 7'b0;
				endcase
				end
			default: Hex0 = 7'b0;	
			endcase
		end
	end
endmodule