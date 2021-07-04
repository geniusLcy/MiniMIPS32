`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/04 09:37:20
// Design Name: 
// Module Name: rca
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


module rca(
    input [31 : 0] A, B,
    input Cin,
    output logic [31 : 0] S,
    output logic Cout
    );
    
    logic [30 : 0] mid;
    fulladder add0    (    .A(A[0]),    .B(B[0]),    .Cin( Cin  ),    .S(S[0]),    .Cout(mid[0])    );
    fulladder add1    (    .A(A[1]),    .B(B[1]),    .Cin(mid[0]),    .S(S[1]),    .Cout(mid[1])    );
    fulladder add2    (    .A(A[2]),    .B(B[2]),    .Cin(mid[1]),    .S(S[2]),    .Cout(mid[2])    );
    fulladder add3    (    .A(A[3]),    .B(B[3]),    .Cin(mid[2]),    .S(S[3]),    .Cout(mid[3])    );
    fulladder add4    (    .A(A[4]),    .B(B[4]),    .Cin(mid[3]),    .S(S[4]),    .Cout(mid[4])    );
    fulladder add5    (    .A(A[5]),    .B(B[5]),    .Cin(mid[4]),    .S(S[5]),    .Cout(mid[5])    );
    fulladder add6    (    .A(A[6]),    .B(B[6]),    .Cin(mid[5]),    .S(S[6]),    .Cout(mid[6])    );
    fulladder add7    (    .A(A[7]),    .B(B[7]),    .Cin(mid[6]),    .S(S[7]),    .Cout(mid[7])    );

    fulladder add8    (    .A(A[8]),    .B(B[8]),    .Cin(mid[7]),    .S(S[8]),    .Cout(mid[8])    );
    fulladder add9    (    .A(A[9]),    .B(B[9]),    .Cin(mid[8]),    .S(S[9]),    .Cout(mid[9])    );
    fulladder add10    (    .A(A[10]),    .B(B[10]),    .Cin(mid[9]),    .S(S[10]),    .Cout(mid[10])    );
    fulladder add11    (    .A(A[11]),    .B(B[11]),    .Cin(mid[10]),    .S(S[11]),    .Cout(mid[11])    );
    fulladder add12    (    .A(A[12]),    .B(B[12]),    .Cin(mid[11]),    .S(S[12]),    .Cout(mid[12])    );
    fulladder add13    (    .A(A[13]),    .B(B[13]),    .Cin(mid[12]),    .S(S[13]),    .Cout(mid[13])    );
    fulladder add14    (    .A(A[14]),    .B(B[14]),    .Cin(mid[13]),    .S(S[14]),    .Cout(mid[14])    );
    fulladder add15    (    .A(A[15]),    .B(B[15]),    .Cin(mid[14]),    .S(S[15]),    .Cout(mid[15])    );

    fulladder add16    (    .A(A[16]),    .B(B[16]),    .Cin(mid[15]),    .S(S[16]),    .Cout(mid[16])    );
    fulladder add17    (    .A(A[17]),    .B(B[17]),    .Cin(mid[16]),    .S(S[17]),    .Cout(mid[17])    );
    fulladder add18    (    .A(A[18]),    .B(B[18]),    .Cin(mid[17]),    .S(S[18]),    .Cout(mid[18])    );
    fulladder add19    (    .A(A[19]),    .B(B[19]),    .Cin(mid[18]),    .S(S[19]),    .Cout(mid[19])    );
    fulladder add20    (    .A(A[20]),    .B(B[20]),    .Cin(mid[19]),    .S(S[20]),    .Cout(mid[20])    );
    fulladder add21    (    .A(A[21]),    .B(B[21]),    .Cin(mid[20]),    .S(S[21]),    .Cout(mid[21])    );
    fulladder add22    (    .A(A[22]),    .B(B[22]),    .Cin(mid[21]),    .S(S[22]),    .Cout(mid[22])    );
    fulladder add23    (    .A(A[23]),    .B(B[23]),    .Cin(mid[22]),    .S(S[23]),    .Cout(mid[23])    );

    fulladder add24    (    .A(A[24]),    .B(B[24]),    .Cin(mid[23]),    .S(S[24]),    .Cout(mid[24])    );
    fulladder add25    (    .A(A[25]),    .B(B[25]),    .Cin(mid[24]),    .S(S[25]),    .Cout(mid[25])    );
    fulladder add26    (    .A(A[26]),    .B(B[26]),    .Cin(mid[25]),    .S(S[26]),    .Cout(mid[26])    );
    fulladder add27    (    .A(A[27]),    .B(B[27]),    .Cin(mid[26]),    .S(S[27]),    .Cout(mid[27])    );
    fulladder add28    (    .A(A[28]),    .B(B[28]),    .Cin(mid[27]),    .S(S[28]),    .Cout(mid[28])    );
    fulladder add29    (    .A(A[29]),    .B(B[29]),    .Cin(mid[28]),    .S(S[29]),    .Cout(mid[29])    );
    fulladder add30    (    .A(A[30]),    .B(B[30]),    .Cin(mid[29]),    .S(S[30]),    .Cout(mid[30])    );
    fulladder add31    (    .A(A[31]),    .B(B[31]),    .Cin(mid[30]),    .S(S[31]),    .Cout(  Cout )    );
    
endmodule
