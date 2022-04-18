`timescale 1ns / 1ps

module adder16(input [15:0]a, b,
					output [15:0]sum);
					
					wire [15:0] c;

	 adder adder0(.a(a[0]), .b(b[0]), .cin(1'b0), .sum(sum[0]), .cout(c[0]));
	 adder adder13(.a(a[13]), .b(b[13]), .cin(c[12]), .sum(sum[13]), .cout(c[13]));
	 adder adder14(.a(a[14]), .b(b[14]), .cin(c[13]), .sum(sum[14]), .cout(c[14]));



endmodule