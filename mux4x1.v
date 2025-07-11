module mux4x1(sel,in0,in1,in2,in3,out);
input  [1:0]sel;
input  [31:0] in0,in1,in2,in3;
output reg [31:0]out;
always@(*)begin
case(sel)
	00:assign out=in0;
	01:assign out=in1;
	10:assign out=in2;
	11:assign out=in3;
	default assign out='bz;
endcase
end
endmodule