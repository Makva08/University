module multiplier(
	input clk, trig,
	input [15:0] A_in,B_in,
	output reg [31:0] C_out,
	output reg fin);

reg [5:0] index = 0;
reg [31:0] sum = 0;

always @(posedge clk)
	begin
		if(trig == 0) begin
				sum <= 0;
				C_out <= 0;
				fin <= 0; end
		else begin
				if(index < 16) begin
						if(B_in[index] == 1) begin
								sum <= sum + (A_in << index); end
						index <= index + 1; end
				else begin
						fin <= 1;
						C_out <= sum; end
		end
	end
 
endmodule
