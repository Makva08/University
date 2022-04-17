interface YOURBUS();
    logic [31:0] data;
    logic [7:0] data_addr;

    modport pSL (input  data, data_addr );
    modport pTB (output data, data_addr );
    
endinterface