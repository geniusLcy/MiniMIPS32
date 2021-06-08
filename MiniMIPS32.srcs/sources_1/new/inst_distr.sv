// 指令字段分解模块 纯组合逻辑
module inst_distr (
    input logic [31:0] iaddr,
    output logic [5:0] op,
    output logic [4:0] rs,
    output logic [4:0] rt,
    output logic [4:0] rd,
    output logic [4:0] shamt,
    output logic [5:0] funct,
    output logic [15:0] imm,
    output logic [25:0] addr
    );
    
    
endmodule