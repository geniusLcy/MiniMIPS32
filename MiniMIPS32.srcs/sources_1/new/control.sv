`include "defines.sv"

// 不同指令的op
`define R_op        6'b000000
`define lw_op       6'b100011   // I
`define sw_op       6'b101011   // I
`define lui_op      6'b001111   // I    将 16 位立即数 imm [写入]寄存器 rt 的高 16 位，寄存器 rt 的低 16 位置 0
`define ori_op      6'b001101   // I    寄存器 rs 中的值与 0 扩展至 32 位的立即数 imm 按位[逻辑或]，结果写入寄存器 rt 中
`define addiu_op    6'b001001   // I    将寄存器 rs 的值与有符号扩展至 32 位的立即数 imm [相加]，结果写入 rt 寄存器中
`define beq_op      6'b000100   // I    如果寄存器 rs 的值等于 rt 的值则跳转
`define bne_op      6'b000101   // I    如果寄存器 rs 的值不等于rt的值则跳转
`define j_op        6'b000010   // J
// R型不同指令的func
`define addu_func   6'b100001   //      将寄存器 rs 的值与寄存器 rt 的值[相加]，结果写入 rd 寄存器中
`define slt_func    6'b101010   //      将寄存器 rs 的值与 rt 进行有符号数[比较]，如果rs小，则rd置 1，否则 rd 置 0

// 控制器
module control (
    input  logic [5 : 0]    op, func,

    output  logic           mem2reg, we,    // mem2reg = 1是lw, we = 1是sw
    output  logic           alusrc2,        // alu的src1是RD1, src2是 (alusrc2 == 0) ? RD2 : imm
    output  logic           reg_we,         // 对reg的操作是 (reg_we == 0) ? 读 : 写
    output  logic           reg_dst,        // dest reg, 即A3, 是 (reg_dst == 0) ? rt : rd          R型为rd, I型rt

    output  logic [3 : 0]   alucontrol,
    output  logic [1 : 0]   imm_expand,      // 00符号扩展, 01零扩展, 10是lui
    output  logic [1 : 0]   branch         // 00(beq), 01(bne), 10(j)
    );

    // 根据op区分出是R，还是J/I型指令，并对J/I型指令进行区分
    logic [1 : 0]   aluop;

    assign mem2reg  = (op == `lw_op) ? 1 : 0;
    assign we       = (op == `sw_op) ? 1 : 0;
    assign reg_dst  = (op == `R_op)  ? 1 : 0;

    always_comb begin
        case (op)
            `R_op:       {reg_we, alusrc2, aluop, imm_expand, branch} = {1'b1, 1'b0, 2'b11, 2'b00, 2'b11};
            `lw_op:      {reg_we, alusrc2, aluop, imm_expand, branch} = {1'b1, 1'b1, 2'b00, 2'b00, 2'b11};
            `sw_op:      {reg_we, alusrc2, aluop, imm_expand, branch} = {1'b0, 1'b1, 2'b00, 2'b00, 2'b11};
            `lui_op:     {reg_we, alusrc2, aluop, imm_expand, branch} = {1'b1, 1'b1, 2'b00, 2'b10, 2'b11};
            `ori_op:     {reg_we, alusrc2, aluop, imm_expand, branch} = {1'b1, 1'b1, 2'b10, 2'b01, 2'b11};
            `addiu_op:   {reg_we, alusrc2, aluop, imm_expand, branch} = {1'b1, 1'b1, 2'b00, 2'b00, 2'b11};
            `beq_op:     {reg_we, alusrc2, aluop, imm_expand, branch} = {1'b0, 1'b0, 2'b01, 2'b00, 2'b00};
            `bne_op:     {reg_we, alusrc2, aluop, imm_expand, branch} = {1'b0, 1'b0, 2'b01, 2'b00, 2'b01};
            `j_op:       {reg_we, alusrc2, aluop, imm_expand, branch} = {1'b0, 1'b0, 2'b00, 2'b00, 2'b10};
        endcase
    end

    always_comb
        case(aluop)
            2'b00: alucontrol = 4'b0000; //add
            2'b01: alucontrol = 4'b0001; //sub
            2'b10: alucontrol = 4'b0110; //or
            default:
            case(func)    //R-type
                `addu_func:  alucontrol = 4'b0000; //addu    add
                `slt_func:   alucontrol = 4'b1000; //slt     sub
            endcase
        endcase                                
endmodule
