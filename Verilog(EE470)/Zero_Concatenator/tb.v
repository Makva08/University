module tb;

	reg [23:0] imm_in = 0;
	reg [1:0] op = 0;
	
	wire [31:0] imm_out;

	concatenator ct(imm_in,op,imm_out);
	
	initial begin
		#10;
		imm_in = 50;
		#10;
		op = 1;
		imm_in = -50;
		#10;
	end

endmodule 