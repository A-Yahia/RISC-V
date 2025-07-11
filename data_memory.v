module ram(clk,wr,address,wdata,rdata);
input clk,wr;
input [9:0] address;
input [31:0] wdata;
output [31:0] rdata;

reg [31:0] datmem [0:255];

assign rdata=datmem[address];
always @(posedge clk)begin
	if(wr)begin
		datmem[address]<=wdata;
	end
end


endmodule