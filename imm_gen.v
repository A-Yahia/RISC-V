module imm_generator(instruct,immsel,extended);
input [31:0]instruct;
output reg [31:0]extended;
input [2:0]immsel;

localparam  I_type= 0,
			s_type= 1,
			b_type=3,
			j_type=4,
			u_type=5;
always @(*)begin
extended=0;
case(immsel)
	I_type:begin 
		extended={{21{instruct[31]}},instruct[30:20]};
	end
	s_type:begin
		extended={{21{instruct[31]}},instruct[30:25],instruct[11:7]};	
	end
	b_type:begin 	
		extended={{20{instruct[31]}},instruct[7],instruct[30:25],instruct[11:8],{1'b0}};
	end
	j_type:begin
		extended={{11{instruct[31]}},instruct[19:12],instruct[20],instruct[30:21],{1'b0}};
	end
	u_type:begin
		extended={instruct[31:12],12'b0};
	end
endcase
end
endmodule