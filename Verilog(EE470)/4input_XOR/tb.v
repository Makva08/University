`timescale 1ns / 1ps


module testbench;

    // Inputs
    reg A;
    reg B;
    reg C;
    reg D;

    // Outputs
    wire Q;

    // Instantiate the Unit Under Test (UUT)
    four_input_xor uut (
        .A(A), 
        .B(B), 
        .C(C), 
        .D(D), 
        .Q(Q)
    );

    initial
    begin
        A=0;
        B=0;
        C=0;
        D=0;
      #100;  
      #100; A=1;
      #100; B=1;
      #100; C=1;
    end
      
endmodule

