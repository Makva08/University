module flags (
   input clk,
   input s_in,
   output reg [3:0] flagz);
	 
	wire [3:0] NZCV; 
	
	aluu alu(NZCV);

	always@(posedge clk) begin
		if(s_in == 1) flagz <= NZCV;
	end

endmodule 