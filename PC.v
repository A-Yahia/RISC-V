module PC(rst,clk,PCNXT,pc);
input rst,clk;
input [9:0] PCNXT;
output reg[9:0] pc;

always @(posedge clk)begin
	if(rst) 
	pc<='b0;
	else
	pc<=PCNXT;
end
endmodule