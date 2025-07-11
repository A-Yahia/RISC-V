module datapath(rst,clk,pcSel,regWen,immSel,brUnsigned,bSel,aSel,aluSel,memRW,wbSel,brEq,brLt,instruct);
	input rst,clk,pcSel,regWen,brUnsigned,bSel,aSel,memRW;

	input [1:0]wbSel;
	input [3:0]aluSel;
	input [2:0]immSel;
	
	output brEq,brLt;
	output[31:0]instruct;
	
	wire [9:0]pc_add4,pc_input,pc_out;
	wire [31:0]instruction,reg_in,reg_a,reg_b,A,B,extended,alu_out,mem_out;
	
	assign instruct= instruction;
	assign pc_add4= pc_out+4;	
	assign pc_input= pcSel? alu_out:pc_add4;
	PC programCounter(rst,clk,pc_input,pc_out);
	
	IMEM instructionMemory(pc_out,instruction);
	
	regfile registerFile(clk,instruction[19:15],instruction[24:20],instruction[11:7],
			reg_in,regWen,reg_a,reg_b);
	
	branch_compartor Branch(reg_a,reg_b,brUnsigned,brEq,brLt);
	
	imm_generator extendor(instruction,immSel,extended);
	assign A= aSel? pc_out:reg_a;
	assign B= bSel?extended:reg_b;
	alu ALU(aluSel,A,B,alu_out);
	ram dataMemory(clk,memRW,alu_out,reg_b,mem_out);
	mux4x1 regWriteData(wbSel,mem_out,alu_out,pc_add4,'bz,reg_in);
endmodule