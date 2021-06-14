`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/14 16:15:18
// Design Name: 
// Module Name: sig_expan
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

// 符号扩展模块: 将16位立即数符号扩展位32位
module sig_expan(
    input logic [15:0] imm_to_expan,
    output logic [31:0] sign_imm
    );
    
    assign sign_imm = {{16{imm_to_expan[15]}}, imm_to_expan};
endmodule
