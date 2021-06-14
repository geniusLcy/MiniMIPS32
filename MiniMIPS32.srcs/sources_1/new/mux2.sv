`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/14 18:04:56
// Design Name: 
// Module Name: mux2
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


module mux2 #(
    parameter WIDTH = 32
)(
    input logic [WIDTH - 1 : 0] src0,
    input logic [WIDTH - 1 : 0] src1,
    input logic select_signal,
    output logic [WIDTH - 1 : 0] result
    );

    assign result = select_signal ? src1 : src0;
endmodule
