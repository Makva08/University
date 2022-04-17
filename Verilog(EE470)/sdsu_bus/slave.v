module slave(
	input clk,signal, 
	input [4:0] w_adr, r_adr,
	input [31:0] w_data,
	output reg [31:0] r_data,
	output reg ready );

reg [31:0] R [31:0];
reg trig = 0;
wire [31:0] C_out;
wire fin;

multiplier mul(clk, trig, R[1][15:0], R[2][15:0], C_out[31:0], fin);

always @(posedge clk)
	begin
		R[0][0] <= (w_adr == 0) && (w_data [31:0] == 1);
		ready <= fin;
		
		if(fin == 1) begin
				R[r_adr][31:0] <= C_out;
				r_data[31:0] <= R[r_adr][31:0]; end
		if(signal == 0) begin
				if(R[0][0] == 1) begin trig <= 1; end
				else if(R[0][0] == 0 && fin == 1) begin
						trig <= 0; end
				end	
		else begin
				R[w_adr][31:0] <= w_data [31:0];
				ready <= 0; end
	end
	
endmodule
