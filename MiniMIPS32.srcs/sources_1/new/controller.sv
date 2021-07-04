`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/14 17:59:53
// Design Name: 
// Module Name: controller
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


module controller(
    input logic [5 : 0] op, func,
    output logic mem2reg, we,
    output logic alusrc2,
    output logic reg_we,
    output logic reg_dst,
    output logic [3 : 0] alu_ctrl,
    output logic [1 : 0] imm_exp_ctrl,
    output logic [1 : 0] branch_sig
    );
    
    localparam op_Rtype = 6'b000000;
    localparam op_lw = 6'b100011;
    localparam op_sw = 6'b101011;
    localparam op_lui = 6'b001111;
    localparam op_ori = 6'b001101;
    localparam op_addiu = 6'b001001;
    
endmodule
