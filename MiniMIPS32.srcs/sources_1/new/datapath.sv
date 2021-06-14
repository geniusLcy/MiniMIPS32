`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/14 18:02:42
// Design Name: 
// Module Name: datapath
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module datapath(
    input  logic cpu_clk, cpu_rst_n,
    input logic memtoreg, pcsrc,
    input logic alusrc, regdst,
    input logic regwrite, jump,
    input logic [2:0] alucontrol,
    input  logic [31:0] inst,
    input logic [31:0] readdata 
    output  logic [31:0] aluout, writedata,
    output logic zero,
    output logic [31:0] pc,
    );

    logic [5:0] op, funct;
    logic [4:0] rs, rt, rd, shamt;
    logic [15:0] imm, imm_expan;
    logic [25:0] addr;
    logic [31:0] readdata1;



    pcreg pcreg(
        .cpu_clk(cpu_clk),
        .cpu_rst_n(cpu_rst_n),
        .naddr(),
        .caddr()
    );

    inst_distr inst_distr(
        .inst(inst),
        .op(op),
        .rs(rs),
        .rt(rt),
        .rd(rd),
        .shamt(shamt),
        .funct(funct),
        .imm(imm),
        .addr(addr)
    );

    sig_expan sig_expan(
        .imm_to_expan(imm),
        .sign_imm(imm_expan)
    );

    RegFile RegFile(
        .cpu_clk(cpu_clk),
        .addr1(rs),
        .addr2(),
        .addr3(),
        .writeData3(),
        .writeEnable(),
        .readData1(readdata1),
        .readData2()
    );

    ALU ALU(
        .srcA(readdata1),
        .srcB(imm_expan),
        .aluop(alucontrol),
        .alures(writedata),
        .ZF(zero)
    );


endmodule
