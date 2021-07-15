`include "defines.sv"

// ��ָͬ���op
`define R_op        6'b000000
`define lw_op       6'b100011   // I
`define sw_op       6'b101011   // I
`define lui_op      6'b001111   // I    �� 16 λ������ imm [д��]�Ĵ��� rt �ĸ� 16 λ���Ĵ��� rt �ĵ� 16 λ�� 0
`define ori_op      6'b001101   // I    �Ĵ��� rs �е�ֵ�� 0 ��չ�� 32 λ�������� imm ��λ[�߼���]�����д��Ĵ��� rt ��
`define addiu_op    6'b001001   // I    ���Ĵ��� rs ��ֵ���з�����չ�� 32 λ�������� imm [���]�����д�� rt �Ĵ�����
`define beq_op      6'b000100   // I    ����Ĵ��� rs ��ֵ���� rt ��ֵ����ת
`define bne_op      6'b000101   // I    ����Ĵ��� rs ��ֵ������rt��ֵ����ת
`define j_op        6'b000010   // J
// R�Ͳ�ָͬ���func
`define addu_func   6'b100001   //      ���Ĵ��� rs ��ֵ��Ĵ��� rt ��ֵ[���]�����д�� rd �Ĵ�����
`define slt_func    6'b101010   //      ���Ĵ��� rs ��ֵ�� rt �����з�����[�Ƚ�]�����rsС����rd�� 1������ rd �� 0

// ������
module control (
    input  logic [5 : 0]    op, func,

    output  logic           mem2reg, we,    // mem2reg = 1��lw, we = 1��sw
    output  logic           alusrc2,        // alu��src1��RD1, src2�� (alusrc2 == 0) ? RD2 : imm
    output  logic           reg_we,         // ��reg�Ĳ����� (reg_we == 0) ? �� : д
    output  logic           reg_dst,        // dest reg, ��A3, �� (reg_dst == 0) ? rt : rd          R��Ϊrd, I��rt

    output  logic [3 : 0]   alucontrol,
    output  logic [1 : 0]   imm_expand,      // 00������չ, 01����չ, 10��lui
    output  logic [1 : 0]   branch         // 00(beq), 01(bne), 10(j)
    );

    // ����op���ֳ���R������J/I��ָ�����J/I��ָ���������
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
