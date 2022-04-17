module decoder (
   input [31:0] instr_in,
   output [3:0] cond,
   output [1:0] op,
   output [5:0] nIPUBWL,
   output imm,
   output [1:0] bimm, //branch immediate
   output [3:0] cmd,
   output s,
   output [3:0] Rn,
   output [3:0] Rd,
   output [3:0] Rs,
   output [3:0] Rm,
   output [11:0] imm12,
   output [7:0] imm8,
   output [23:0] imm24,
   output [1:0] sh,
   output [4:0] shamt5,
   output [3:0] rot,
   output bit4,
	output bit7 );
	 
	assign cond = instr_in[31:28];
	assign op = instr_in[27:26];
	assign nIPUBWL = instr_in[25:20];
	assign imm = instr_in[25];
	assign bimm = instr_in[25:24];
	assign cmd = instr_in[24:21];
	assign s = instr_in[20];
	assign Rn = instr_in[19:16];
	assign Rd = instr_in[15:12];
	assign Rs = instr_in[11:8];
	assign Rm = instr_in[3:0];
	assign imm12 = instr_in[11:0];
	assign imm8 = instr_in[7:0];
	assign imm24 = instr_in[23:0];
	assign sh = instr_in[6:5];
	assign shamt5 = instr_in[11:7];
	assign rot = instr_in[11:8];
	assign bit4 = instr_in[4];
	assign bit7 = instr_in[7];
	 
endmodule 