module Receiver(
    input clk,
    YOURBUS iface
);

    logic [31:0] mem [7:0];


    always @(posedge clk)
    mem[iface.data_addr] = iface.data;

endmodule
