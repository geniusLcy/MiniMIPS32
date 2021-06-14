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

// 32 x 32�ļĴ����ļ�, ����ͬ��д/�첽��
module RegFile(
    input logic cpu_clk, // ϵͳʱ��
    input logic [4:0] addr1, //  5λ��ַ����, ��Ӧ���˿�readData1
    input logic [4:0] addr2, // 5λ��ַ����, ��Ӧ���˿�readData2
    input logic [4:0] addr3, // 5λ��ַ����, ��Ӧд�˿�writeData3
    input logic [31:0] writeData3, // д�˿�Ҫд������
    input logic writeEnable, // дʹ��: ��λ�����д
    output logic [31:0] readData1, // addr1����������
    output logic [31:0] readData2 // addr2����������
    );
    
    logic [31:0] regmem [31:0]; // �Ĵ�����32��32λ�Ĵ������
    
    always_ff @ (posedge cpu_clk) begin
        if(writeEnable) regmem[addr3] <= writeData3;
    end
    
    assign readData1 = regmem[addr1];
    assign readData2 = regmem[addr2];
    
endmodule
