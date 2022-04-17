module tb_udc;

reg clk=0;reg enable; reg up;
wire [15:0] counter;



    upd uut (
        .clk(clk), 
        .enable(enable), 
        .up(up), 
        .counter(counter)
    );

	 always #5 clk <= !clk;
	
    initial begin
	 
	 enable = 0; up=0; #100; up=1; enable=1; #70; enable=0; #50; up=0; enable=1; #40; enable=0;
        
        //enable = 0; up = 0; #300; up = 1; #300; enable = 1; up = 0; #100; enable = 0;
    end
      
endmodule 