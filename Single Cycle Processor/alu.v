module alu(
	input [31:0] A_in,
	input [31:0] B_in,
	input [3:0] cmd_in,
	input [1:0] sh_in,
	input [4:0] shamt5_in,
	input I_in,
	input S_in,
	output [31:0] Result_out,
	output [3:0] NZCV_out);
	
	reg [32:0] result = 0;
	reg [3:0] NZCV = 0;
	
	assign Result_out[31:0] = result[31:0];
	assign NZCV_out = (S_in == 1'b1)?NZCV:0;
	
	localparam cmd_bitwise_and = 4'b0000;
	localparam cmd_bitwise_xor = 4'b0001;

	localparam cmd_shift = 4'b1101;
	localparam cmd_shift_logical_left = 2'b00;
	localparam cmd_shift_logical_right = 2'b01;
	localparam cmd_shift_arithmetic_right = 2'b10;
	localparam cmd_shift_rotate = 2'b11;
	
	localparam cmd_add = 4'b0100;
	localparam cmd_add_with_carry = 4'b0101;
	localparam cmd_sub_with_carry = 4'b0110;
	localparam cmd_reverse_sub = 4'b0111;				
	
	always@(*) begin
		case(cmd_in) 
			cmd_bitwise_and: result = A_in & B_in;
			cmd_bitwise_xor: result = A_in ^ B_in;
			cmd_add : result = A_in + B_in;
			cmd_sub_with_carry: result = A_in-B_in-NZCV[2];
			cmd_reverse_sub: result = B_in-A_in;
			cmd_add_with_carry: result = A_in+B_in+NZCV[2];
			
			cmd_shift: begin
				case(sh_in)
					cmd_shift_logical_left: result = A_in << B_in;
					cmd_shift_logical_right: result = A_in >> B_in;
					cmd_shift_arithmetic_right: begin
						result[31] = A_in[31];
						result[30:0] = A_in[30:0] >> B_in;
					end
					cmd_shift_rotate: result = {A_in,A_in} >> B_in;
				endcase
			end
			
			default: begin
				NZCV[0] = ~result[31];
				NZCV[1] = (result == 0) ? 1'b1 : 0;
				NZCV[2] = result[32];
				NZCV[3] = (A_in[31] == 1 && B_in[31] == 1 && result[31] == 0) || (A_in[31] == 0 && B_in[31] == 0 && result[31] == 1);
			end
			
		endcase
	end
	
endmodule 