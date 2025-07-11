`timescale 1ns/1ps
module tb_Top;
reg rst,clk;


RISC_V r(rst,clk);

initial begin
	clk=0;
	
	forever #10 clk=~clk;
end
initial begin
	rst=1;
	
	repeat(2)@(negedge clk); 
	rst=0;
	
end

endmodule