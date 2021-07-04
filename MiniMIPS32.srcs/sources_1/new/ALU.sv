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
    input [3 : 0]           aluop,
    output logic [31 : 0]    alures
);
    
    localparam ADD = 4'b0001;
    localparam SUB = 4'b0010;
    localparam OR = 4'b0100;
    localparam SLT = 4'b1000;

    logic [31 : 0] B_mux, res;
    logic cin, cout, lower_out;
    
    rca adder(
        .A(srcA),
        .B(B_mux),
        .Cin(cin),
        .S(res),
        .Cout(cout)
    );
    
    assign B_mux = (aluop == SUB || aluop == SLT) ? ~srcB : srcB;
    assign cin = (aluop == SUB || aluop == SLT) ? 1'b1 : 1'b0;
    
    always_comb begin
        case (aluop)
            ADD, SUB: alures = res;
            OR: alures = srcA | srcB;
            SLT: begin
                if({srcA[31], srcB[31]} == 2'b10) alures = 1;
                else if ({srcA[31], srcB[31]} == 2'b01) alures = 0;
                else begin
                    if(res[31]) alures = 1;
                    else alures = 0;
                end
            end
            default: alures = 0;
        endcase
    end

//    assign ZF = !alures;

endmodule
