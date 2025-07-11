module RISC_V(rst,clk);
input rst,clk;


wire [31:0] instruct;
wire brEq,brLt,  pcSel,regWen,brUnsigned,Asel,Bsel,memRW;
wire [2:0]loadsize,immSel;
wire [1:0]WBsel,storesize;
wire [4:0]ALUsel;

	

control_path cp(instruct,brLt,brEq,pcSel,regWen,immSel,brUnsigned,Bsel,Asel,ALUsel,memRW,WBsel,loadsize,storesize);
datapath dp (rst,clk,pcSel,regWen,immSel,brUnsigned,Bsel,Asel,ALUsel,memRW,WBsel,brEq,brLt,instruct);
endmodule