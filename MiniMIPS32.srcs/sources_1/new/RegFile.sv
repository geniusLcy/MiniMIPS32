`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/10 16:42:04
// Design Name: 
// Module Name: RegFile
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

// 32 x 32的寄存器文件, 采用同步写/异步读
module RegFile(
    input logic cpu_clk, // 系统时钟
    input logic [4:0] addr1, //  5位地址输入, 对应读端口readData1
    input logic [4:0] addr2, // 5位地址输入, 对应读端口readData2
    input logic [4:0] addr3, // 5位地址输入, 对应写端口writeData3
    input logic [31:0] writeData3, // 写端口要写的数据
    input logic writeEnable, // 写使能: 高位代表可写
    output logic [31:0] readData1, // addr1读出的数据
    output logic [31:0] readData2 // addr2读出的数据
    );
    
    logic [31:0] regmem [31:0]; // 寄存器由32个32位寄存器组成
    
    always_ff @ (posedge cpu_clk) begin
        if(writeEnable) regmem[addr3] <= writeData3;
    end
    
    assign readData1 = regmem[addr1];
    assign readData2 = regmem[addr2];
    
endmodule
