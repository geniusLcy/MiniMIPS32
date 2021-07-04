`include "defines.sv"

module MiniMIPS32(
    input  logic cpu_clk,
    input  logic cpu_rst_n,
    output logic [31:0] iaddr,
    input  logic [31:0] inst,
    output logic [31:0] daddr,
    output logic we,
    output logic [31:0] din,
    input  logic [31:0] dout
    );
    
    // 要求实现的MIPS为小端序
    logic [31 : 0] inst_big2little;
    assign inst_big2little = {inst[7 : 0], inst[15 : 8], inst[23 : 16], inst[31 : 24]};
    
    logic [31 : 0] dout_big2little;
    assign dout_big2little = {dout[7 : 0], dout[15 : 8], dout[23 : 16], dout[31 : 24]};
    
    // 指令各个字段的分解
    logic [5:0] op, funct;
    logic [4:0] rs, rt, rd, shamt;
    logic [15:0] imm;
    logic [25:0] addr;
    
    inst_distr inst_translate(
        .inst(inst_big2little),
        .op(op),
        .rs(rs),
        .rt(rt),
        .rd(rd),
        .shamt(shamt),
        .funct(funct),
        .imm(imm),
        .addr(addr)
    );
    
    logic [31 : 0] alu_res;
    logic [1 : 0] branch_sig;
    logic [31 : 0] jmp_ins;
    
    // 跳转信号处理
    always_comb begin
        if(!cpu_rst_n) jmp_ins = 0;
        else begin
            case(branch_sig)
                2'b00: begin
                    if(alu_res == 0) jmp_ins = {{14{inst_big2little[15]}}, inst_big2little[15 : 0], 2'b00};
                    else jmp_ins = 0;
                end
                2'b01: begin
                    if(alu_res != 0) jmp_ins = {{14{inst_big2little[15]}}, inst_big2little[15 : 0], 2'b00};
                    else jmp_ins = 0;   
                end
                default: jmp_ins = 0;
            endcase;
        end
    end
    
    // PC实现部分
    always_ff @(posedge cpu_clk) begin
        if(!cpu_rst_n) iaddr <= 0;
        else if(branch_sig) iaddr <= {iaddr[31 : 28], addr, 2'b00};
        else iaddr <= iaddr + jmp_ins + 4;
    end
    
    // 寄存器实现部分
    logic [4 : 0] addr1, addr2, addr3;
    logic [31 : 0] readData1, readData2, writeData3;
    logic writeEnable;
    
    RegFile mipsRegisters(
        .cpu_clk(cpu_clk),
        .addr1(addr1),
        .addr2(addr2),
        .addr3(addr3),
        .writeData3(writeData3),
        .writeEnable(writeEnable),
        .readData1(readData1),
        .readData2(readData2)
    );
    
    // ALU实现部分
    logic [31 : 0] srcA, srcB;
    logic [3 : 0] alu_op;
    
    ALU mipsALU(
        .srcA(srcA),
        .srcB(srcB),
        .aluop(alu_op),
        .alures(alu_res)
    );
    
    // 控制逻辑
    
    
endmodule
