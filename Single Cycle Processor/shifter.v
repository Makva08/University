module shifter(
    input [4:0] shifter_shamt5_in,
    input [1:0] shifter_sh_in,
    input [31:0] imm8extended,
    input [31:0] Rm_in,
    input [31:0] Rs_in,
    input [3:0] shifter_rot_in,
    input instrbit4,
    input instrbit25, //immediate bit
    output reg [31:0] src2_shifted );

    always @(*)
    begin
	 
        if (instrbit25) src2_shifted = {imm8extended,imm8extended} >> shifter_rot_in*2;

        else
            if (instrbit4) begin
                    case (shifter_sh_in)
                        0: src2_shifted = Rm_in << Rs_in;
                        1:	src2_shifted = Rm_in >> Rs_in;
								2: src2_shifted = {Rm_in[31],Rm_in[30:0] >> Rs_in};
								3: src2_shifted = {Rm_in,Rm_in} >> Rs_in;
                        default : src2_shifted = Rm_in;
                    endcase
                end
            else begin
                    case (shifter_sh_in)
                        0: src2_shifted = Rm_in << shifter_shamt5_in;
                        1: src2_shifted = Rm_in >> shifter_shamt5_in;
                        2: src2_shifted = {Rm_in[31],Rm_in[30:0] >> shifter_shamt5_in};
                        3:	src2_shifted = {Rm_in,Rm_in} >> shifter_shamt5_in;
                        default : src2_shifted = Rm_in;
                    endcase

                end

    end

endmodule
