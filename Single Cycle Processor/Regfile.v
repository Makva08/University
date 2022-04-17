module Regfile(
	input clk,	
	input  [3:0]  rA1, rA2, rA3,		
	input wEn1,	
	input [3:0]  wA1,	
	input [31:0] wD1,	
	input [31:0] wDr15,
	output [31:0] rD1, rD2, rD3,	
	output [31:0] rDr15);
	
	reg [31:0] regfile [15:0];
	
	assign rD1 = regfile[rA1];
	assign rD2 = regfile[rA2];
	assign rD3 = regfile[rA3];
	assign rDr15 = regfile[15];

	always @(posedge clk)
		begin
			if (wEn1) regfile[wA1] <= wD1;
			regfile[15] <= wDr15;
		end
	endmodule
	