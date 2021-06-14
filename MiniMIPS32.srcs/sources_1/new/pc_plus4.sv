`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/14 17:20:04
// Design Name: 
// Module Name: pc_plus4
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


module pc_plus4(
    input logic [31:0] in,
    output logic [31:0] out
    );

    adder plus4(
        .srcA(in),
        .srcB(4),
        .result(out)
    );
endmodule
