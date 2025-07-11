	module IMEM(address,rd);

	input  [9:0] address;
	output [31:0] rd;
	reg[31:0] mem [0:255];

	wire[7:0]modified_add; 
	assign modified_add = address[9:2];
	assign rd = mem[modified_add];
	initial begin
		$readmemh("bonus.mem",mem);
	end

	endmodule

