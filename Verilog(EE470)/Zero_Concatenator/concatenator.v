module concatenator(
	input [23:0] imm_in,
	input [1:0] op_in,
	output [31:0] immediate_out);
	
	reg [31:0] result = 0;
	
	assign immediate_out = result;
	
	always@(*) begin
	
		case(op_in)
		
			2'b00 : begin
				result[31] <= imm_in[7];
				result[6:0] <= imm_in[6:0];
				result[30:7] <= (imm_in[7] == 1'b1)?24'b111111111111111111111111:0;
			end
			
			2'b01 : begin
				result[31] <= imm_in[11];
				result[10:0] <= imm_in[10:0];
				result[30:11] <= (imm_in[11] == 1'b1)?20'b11111111111111111111:0;
			end
			
			2'b10 : begin
				result[31] <= imm_in[23];
				result[22:0] <= imm_in[22:0];
				result[30:23] <= (imm_in[23] == 1'b1)?8'b11111111:0;
			end
		
		endcase
	
	end
	
endmodule 