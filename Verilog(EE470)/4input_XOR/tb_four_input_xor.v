module tb_four_input_xor();
    
    reg A, B, C, D;
    wire Q;
    
    four_input_xor four_input_xor_instance (
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