`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/14 16:46:01
// Design Name: 
// Module Name: ALU
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


module ALU (
    input [31 : 0]           srcA,
    input [31 : 0]           srcB,
    input [2 : 0]           aluop,
    output logic [31 : 0]    alures,
    output logic            ZF
);
    
    localparam AND = 3'b000;
    localparam OR = 3'b001;
    localparam ADD = 3'b010;
    localparam LUI = 3'b011;
    localparam SUB = 3'b100;
    localparam COMP = 3'b101;

    always_comb begin
        case (aluop)
            AND : alures = srcA & srcB;
            OR : alures = srcA | srcB;
            ADD : alures = $signed(srcA) + $signed(srcB);
            LUI : 
            SUB : alures = $signed(srcA) - $signed(srcB);
            COMP : alures = $signed(srcA) < $signed(srcB) ? 1 : 0;
            default : alures = 0;
        endcase
    end

    assign ZF = !alures;

endmodule
