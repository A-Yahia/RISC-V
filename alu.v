module alu(aluSel,A,B,C);

input [3:0]aluSel;
input signed[31:0] A,B;
output reg signed [31:0] C;

wire [2:0] func3;
wire func7secondbit;


parameter 	add_sub=0,
			l_shft_logic=1,
			slt_sgn=2,
			slt_unsgn=3,
			XOR=4,
			r_shft=5,
			OR=6,
			AND=7;

assign func3= aluSel[3:1];
assign func7secondbit= aluSel[0];			
always @(*)begin
C='bz;
case(func3)
	add_sub:begin
		 C = func7secondbit?A-B:A+B;
	end
	AND: C = A&B;
	OR:  C = A|B;
	XOR: C = A^B;
	l_shft_logic: C = A<<B;
	r_shft:begin
		C = func7secondbit? A>>>B: A>>B;
	end
	slt_sgn:
		C = (A<B);
	slt_unsgn:
		C = ($unsigned(A)<$unsigned(B));
	default  C ='bz;
endcase
end
endmodule