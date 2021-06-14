// 指令字段分解模块
module inst_distr (
    input logic [31:0] inst,
    output logic [5:0] op,
    output logic [4:0] rs,
    output logic [4:0] rt,
    output logic [4:0] rd,
    output logic [4:0] shamt,
    output logic [5:0] funct,
    output logic [15:0] imm,
    output logic [25:0] addr
    );
    
    assign op = inst[31:26];
    assign rs = inst[25:21];
    assign rt = inst[20:16];
    assign rd = inst[15:11];
    assign shamt = inst[10:6];
    assign funct = inst[5:0];
    assign imm = inst[15:0];
    assign addr = inst[25:0];
    
endmodule