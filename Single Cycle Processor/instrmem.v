module instrmem (
   input [31:0] instr_addr,
   output [31:0] instruction );

	reg [255:0] memory [31:0];
	
	assign instruction = memory[instr_addr];

endmodule 