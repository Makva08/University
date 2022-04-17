module tb_fin();
	reg clk = 0;
	
	controlUnit cu(clk);
	
	always #10 clk = ~clk;
	
endmodule 