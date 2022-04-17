`timescale 1ns / 1ps

module adder(input a, b, cin,
				output sum,cout);

assign sum = (a ^ b) ^ cin;
assign cout = (a & b) | ((a ^ b) & cin);

endmodule
