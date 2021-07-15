`timescale 1ns / 1ps

module alu #(parameter data_len = 32)(

    input           [data_len - 1 : 0]  A,
    input           [data_len - 1 : 0]  B,
    input           [3 : 0]             aluop,
    output  logic   [data_len - 1 : 0]  alures

    );

    /****** Begin ******/
    localparam OR   = 4'b0110;
    localparam ADD  = 4'b0000;
    localparam SUB  = 4'b0001;
    localparam SLT  = 4'b1000;

    logic [data_len - 1 : 0] x, y, res;
    logic cin, cout, Cout;

    rca add(.A(x), .B(y), .Cin(cin), .S(res), .Cout(cout));
    assign x = A;
    assign y = (aluop == SUB || aluop == SLT) ? ~B : B;
    assign cin = (aluop == SUB || aluop == SLT) ? 1'b1 : 1'b0;

    always_comb begin
        case (aluop)
            OR          :   alures = A | B;
            ADD, SUB    :   alures = res;
            SLT         :   begin
                if ({A[data_len - 1], B[data_len - 1]} == 2'b10)  alures = 1;
                else if ({A[data_len - 1], B[data_len - 1]} == 2'b01) alures = 0;
                else begin
                    if (res[data_len - 1]) alures = 1;
                    else alures = 0;
                end
            end
            default: begin
                alures = 0;
            end
        endcase
    end

    /****** End ******/	

endmodule