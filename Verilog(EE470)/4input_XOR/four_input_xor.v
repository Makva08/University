module four_input_xor(
	input A, B, C, D,
	output Q
);

wire ABxor, CDxor;

two_input_xor two_input_xor_instanceAB (
    .A(A),
    .B(B),
    .Q(ABxor)
);	

two_input_xor two_input_xor_instanceCD (
    .A(C),
    .B(D),
    .Q(CDxor)
);  

two_input_xor two_input_xor_instance (
    .A(ABxor),
    .B(CDxor),
    .Q(Q)
);  

endmodule
