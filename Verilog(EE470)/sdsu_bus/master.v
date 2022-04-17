module master;

reg clk = 0;
reg signal = 0;
reg [4:0] w_adr = 0;
reg [4:0] r_adr = 0;
reg [31:0] w_data = 0;
wire [31:0] r_data;
wire ready;

slave sl(clk, signal, w_adr, r_adr, w_data, r_data, ready);

always #5 clk <= ~clk;
initial begin
	signal = 0; w_adr = 1; w_data = 7; signal = 1;
  
	#10; w_adr = 2; #10;  w_data = 3; #10; r_adr = 16; #10; signal = 0;

	#10; w_adr = 0; #10; w_data = 1; #10; signal = 0; #10; signal = 0;

	#10; w_adr = 0; #10;  w_data = 0; #10; signal = 1; #10; signal = 0;
end

endmodule
