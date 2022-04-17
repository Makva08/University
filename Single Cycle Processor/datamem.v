module datamem(
   input clk,
   input dmWEn,
   input [31:0] dmRWAddr,
   input [31:0] dmWData,
   output [31:0] dmRData);

	reg [255:0] mem [31:0];

	assign dmRData = mem[dmRWAddr];
	
	always@(posedge clk) begin
		if(dmWEn) mem[dmRWAddr] <= dmWData;
	end

endmodule 