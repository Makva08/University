module controlUnit(
	input clk
);
	wire [31:0] instruction,PC;
	reg  [3:0]  rA1, rA2, rA3;
	wire [31:0] rD1, rD2, rD3;
	reg        wEn1;
	reg [3:0]  wA1;
	reg [31:0] wD1;
	reg        dmWEn;
   reg [31:0] dmRWAddr;
   reg [31:0] dmWData;
   wire [31:0] dmRData;
	reg [23:0] imm_in;
	reg [1:0] op_in;
	wire [31:0] immediate_out;
	wire [3:0] cond;
   wire [1:0] op;
   wire [5:0] nIPUBWL;
   wire imm;
   wire [1:0] bimm;
   wire [3:0] cmd;
   wire s;
   wire [3:0] Rn;
   wire [3:0] Rd;
   wire [3:0] Rs;
   wire [3:0] Rm;
   wire [11:0] imm12;
   wire [7:0] imm8;
   wire [23:0] imm24;
   wire [1:0] sh;
   wire [4:0] shamt5;
   wire [3:0] rot;
   wire bit4;
   wire bit7;
	reg [31:0] A_in,B_in;
	wire [31:0] aluResult,aluFlags,shifterResult;
	reg [31:0] Rm_in,Rs_in;

	instrmem i(instr_addr,instruction);
	Regfile r(clk,rA1,rA2,rA3,wEn1,wA1,wD1,rD1,rD2,rD3,rDr15);
	datamem d(clk,dmWEn,dmRWAddr,dmWData,dmRData);
	zero z(imm_in,op_in,immediate_out);
	decoder d(instr_in,cond,op,nIPUBWL,imm,bimm,cmd,s,Rn,Rd,Rs,Rm,imm12,imm8,imm24,sh,shamt5,rot,bit4,bit7);
	alu a(A_in,B_in,cmd_in,sh_in,shamt5_in,I_in,S_in,Result_out,NZCV_out);
	shifter s(shifter_shamt5_in,shifter_sh_in,imm8extended,Rm_in,Rs_in,shifter_rot_in,instrbit4,instrbit25,src2_shifted);
	
	always@(posedge clk) begin
		wEn1 <= 0;
		dmWEn <= 0;
		// data processing operation
		if(op == 2'b00) begin
			if(cmd == 4'b1101) begin
				rA1 <= Rm;
				rA2 <= Rs;
				Rm_in <= rD1;
				Rs_in <= rD2;
				wA1 <= Rd;
				wD1 <= shifterResult;
				wEn1 <= 1;
			end
			else begin
				if(imm) begin
					rA1 <= Rn;
					A_in <= rD1;
					B_in <= immediate_out;
					wA1 <= Rd;
					wD1 <= aluResult;
					wEn1 <= 1;
				end
				else begin
					rA1 <= Rn;
					rA2 <= Rm;
					A_in <= rD1;
					B_in <= rD2;
					wA1 <= Rd;
					wD1 <= aluResult;
					wEn1 <= 1;
				end
			end
		end
		// memory processing operation
		if(op == 2'b01) begin
			if(~imm) begin
				//load
				if(nIPUBWL[5] == 1) begin
					rA1 <= Rn;
					dmRWAddr <= rD1 + immediate_out;
					wA1 <= Rd;
					wD1 <= dmRData;
					wEn1 <= 1;
				end
				//store
				else begin
					rA1 <= Rn;
					rA2 <= Rd;
					dmRWAddr <= rD1 + immediate_out;
					dmWData <= rD2;
					dmWEn <= 1;
				end
			end
			else begin
				//load
				if(nIPUBWL[5] == 1) begin
					rA1 <= Rn;
					rA2 <= Rm;
					dmRWAddr <= rD1 + rD2;
					wA1 <= Rd;
					wD1 <= dmRData;
					wEn1 <= 1;
				end
				//store
				else begin
					rA1 <= Rn;
					rA2 <= Rd;
					rA3 <= Rm;
					dmRWAddr <= rD1 + rD3;
					dmWData <= rD2;
					dmWEn <= 1;
				end
				
			end
		end
	end

endmodule 