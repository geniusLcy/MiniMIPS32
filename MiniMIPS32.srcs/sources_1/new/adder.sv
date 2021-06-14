`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/14 18:04:09
// Design Name: 
// Module Name: adder
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


module adder #(parameter WIDTH = 32;) (
    input logic [WIDTH - 1 : 0] srcA,
    input logic [WIDTH - 1 : 0] srcB,
    output logic [WIDTH - 1 : 0] result
    );

    assign result = srcA + srcB;
endmodule
