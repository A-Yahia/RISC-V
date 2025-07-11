module regfile(clk,rAddress1,rAddress2,wAddress,wdata,wen,rdata1,rdata2);
input clk,wen;
input [4:0] rAddress1,rAddress2,wAddress;
input [31:0]wdata;
output [31:0] rdata1,rdata2;


reg [31:0] reg_file [0:31];

assign rdata1 = rAddress1?reg_file[rAddress1]:'b0;
assign rdata2 = rAddress2?reg_file[rAddress2]:'b0;
always @(posedge clk)begin
	if(wen==1)begin
		if(wAddress)
		reg_file[wAddress] = wdata;
	end
end

endmodule