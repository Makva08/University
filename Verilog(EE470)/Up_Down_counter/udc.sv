module upd(
    input clk,enable, up,
	 output reg [15:0] counter=0);
	 
    
     always @(posedge(clk)) begin
	  
        if(enable == 1)   
		  
            if(up == 1) //count up
                    counter <= counter + 1;
						  
            else  //countdown
                    counter <= counter - 1;
			
     end    
    
endmodule 