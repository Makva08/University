module two_input_xor(
    input A,B,
    output Q
);

assign Q = (~A & B) | (A & ~B);

endmodule