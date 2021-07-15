`timescale 1ns / 1ps

module rca #(parameter data_len = 32)(

    input	[data_len - 1 : 0]	A,
	input	[data_len - 1 : 0]	B,
	input 		    			Cin,
	output	[data_len - 1 : 0] 	S,
	output 		    			Cout
	);

	/****** Begin ******/

    logic [30 : 0] tmp;
    fulladder add0	(	.A(A[0]),	.B(B[0]),	.Cin( Cin  ),	.S(S[0]),	.Cout(tmp[0])	);
    fulladder add1	(	.A(A[1]),	.B(B[1]),	.Cin(tmp[0]),	.S(S[1]),	.Cout(tmp[1])	);
	fulladder add2	(	.A(A[2]),	.B(B[2]),	.Cin(tmp[1]),	.S(S[2]),	.Cout(tmp[2])	);
	fulladder add3	(	.A(A[3]),	.B(B[3]),	.Cin(tmp[2]),	.S(S[3]),	.Cout(tmp[3])	);
	fulladder add4	(	.A(A[4]),	.B(B[4]),	.Cin(tmp[3]),	.S(S[4]),	.Cout(tmp[4])	);
    fulladder add5	(	.A(A[5]),	.B(B[5]),	.Cin(tmp[4]),	.S(S[5]),	.Cout(tmp[5])	);
	fulladder add6	(	.A(A[6]),	.B(B[6]),	.Cin(tmp[5]),	.S(S[6]),	.Cout(tmp[6])	);
	fulladder add7	(	.A(A[7]),	.B(B[7]),	.Cin(tmp[6]),	.S(S[7]),	.Cout(tmp[7])	);

	fulladder add8	(	.A(A[8]),	.B(B[8]),	.Cin(tmp[7]),	.S(S[8]),	.Cout(tmp[8])	);
	fulladder add9	(	.A(A[9]),	.B(B[9]),	.Cin(tmp[8]),	.S(S[9]),	.Cout(tmp[9])	);
	fulladder add10	(	.A(A[10]),	.B(B[10]),	.Cin(tmp[9]),	.S(S[10]),	.Cout(tmp[10])	);
	fulladder add11	(	.A(A[11]),	.B(B[11]),	.Cin(tmp[10]),	.S(S[11]),	.Cout(tmp[11])	);
    fulladder add12	(	.A(A[12]),	.B(B[12]),	.Cin(tmp[11]),	.S(S[12]),	.Cout(tmp[12])	);
	fulladder add13	(	.A(A[13]),	.B(B[13]),	.Cin(tmp[12]),	.S(S[13]),	.Cout(tmp[13])	);
	fulladder add14	(	.A(A[14]),	.B(B[14]),	.Cin(tmp[13]),	.S(S[14]),	.Cout(tmp[14])	);
	fulladder add15	(	.A(A[15]),	.B(B[15]),	.Cin(tmp[14]),	.S(S[15]),	.Cout(tmp[15])	);

	fulladder add16	(	.A(A[16]),	.B(B[16]),	.Cin(tmp[15]),	.S(S[16]),	.Cout(tmp[16])	);
	fulladder add17	(	.A(A[17]),	.B(B[17]),	.Cin(tmp[16]),	.S(S[17]),	.Cout(tmp[17])	);
	fulladder add18	(	.A(A[18]),	.B(B[18]),	.Cin(tmp[17]),	.S(S[18]),	.Cout(tmp[18])	);
	fulladder add19	(	.A(A[19]),	.B(B[19]),	.Cin(tmp[18]),	.S(S[19]),	.Cout(tmp[19])	);
    fulladder add20	(	.A(A[20]),	.B(B[20]),	.Cin(tmp[19]),	.S(S[20]),	.Cout(tmp[20])	);
	fulladder add21	(	.A(A[21]),	.B(B[21]),	.Cin(tmp[20]),	.S(S[21]),	.Cout(tmp[21])	);
	fulladder add22	(	.A(A[22]),	.B(B[22]),	.Cin(tmp[21]),	.S(S[22]),	.Cout(tmp[22])	);
	fulladder add23	(	.A(A[23]),	.B(B[23]),	.Cin(tmp[22]),	.S(S[23]),	.Cout(tmp[23])	);

	fulladder add24	(	.A(A[24]),	.B(B[24]),	.Cin(tmp[23]),	.S(S[24]),	.Cout(tmp[24])	);
	fulladder add25	(	.A(A[25]),	.B(B[25]),	.Cin(tmp[24]),	.S(S[25]),	.Cout(tmp[25])	);
	fulladder add26	(	.A(A[26]),	.B(B[26]),	.Cin(tmp[25]),	.S(S[26]),	.Cout(tmp[26])	);
	fulladder add27	(	.A(A[27]),	.B(B[27]),	.Cin(tmp[26]),	.S(S[27]),	.Cout(tmp[27])	);
    fulladder add28	(	.A(A[28]),	.B(B[28]),	.Cin(tmp[27]),	.S(S[28]),	.Cout(tmp[28])	);
	fulladder add29	(	.A(A[29]),	.B(B[29]),	.Cin(tmp[28]),	.S(S[29]),	.Cout(tmp[29])	);
	fulladder add30	(	.A(A[30]),	.B(B[30]),	.Cin(tmp[29]),	.S(S[30]),	.Cout(tmp[30])	);
	fulladder add31	(	.A(A[31]),	.B(B[31]),	.Cin(tmp[30]),	.S(S[31]),	.Cout(  Cout )	);
    /****** End ******/	

endmodule
