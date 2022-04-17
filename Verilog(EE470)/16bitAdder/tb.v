`timescale 1ns / 1ps

module tb;


	reg signed [15:0]a;
	reg signed [15:0]b;
	wire signed [15:0]s;

	// Instantiate the Unit Under Test (UUT)
	adder16 uut (.a(a), .b(b), .sum(s));

	initial begin
	
		a = 17; b = 54; #100 $display("a =%d, b =%d, sum =%d", a, b, s);
		a = 11; b = 37; #100 $display("a =%d, b =%d, sum =%d", a, b, s);
		a = 27; b = -14; #100 $display("a =%d, b =%d, sum =%d", a, b, s);

	end
      
endmodule

