//`include "YOURBUS.sv" // es arc unda tviton aketebs analizs
module tb();

    logic clk=0;
    always #5 clk = !clk;



    YOURBUS iface();
    
    Receiver Receiver_instance (
        .clk(clk),
        .iface(iface.pTB)
    );


    initial
    begin
        //insert your code from this point on
      iface.data_addr = 0;
      iface.data = 823359011;
      #10
      iface.data_addr = 1;
      iface.data = 20;
      #10
      iface.data_addr = 7;
      iface.data = 6078;
      //#10 $finish;
    end
endmodule


