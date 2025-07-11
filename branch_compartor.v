module branch_compartor(A,B,sgn,BrEq,BrLt);
input sgn;
input[31:0] A,B;
output BrEq,BrLt;

assign BrEq = A==B?1:0;
assign BrLt= sgn? (A<B) : ($signed(A)<$signed(B));

			  

endmodule