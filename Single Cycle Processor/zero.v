module zero(
	input [23:0] imm24_in,
	input [1:0] op_in,
	output [31:0] immediate_out);
	
	reg [31:0] result = 0;
	
	parameter data = 2'b00;
   parameter mem = 2'b01;
   parameter branch = 2'b10;
	 
	assign immediate_out = result;
	
	always@(*) begin
	
		case(op_in)
		
			data : begin
				result[7:0] <= imm24_in[7:0];
				if (imm24_in[7]==1'b1) result [31:8] <= 24'b111111111111111111111111;
				else result [31:8] <=0;
			end
			
			mem : begin
				result[11:0] <= imm24_in[11:0];
				if (imm24_in[11]==1'b1) result [31:12] <= 20'b111111111111111111111111;
				else result [31:12] <=0;
			end
			
			branch : begin
				result[23:0] <= imm24_in[23:0];
				if (imm24_in[23]==1'b1) result [31:24] <= 24'b111111111111111111111111;
				else result [31:24] <=0;
			end
		
		endcase
	
	end
	
endmodule 