// 程序计数器模块
module pcreg(
    input  logic cpu_clk, // 系统时钟
    input  logic cpu_rst_n, // 系统复位信号
    input logic [31:0] naddr, // 下一条指令的地址
    output logic [31:0] caddr // 当前指令地址
    );
        
    always_ff @(posedge cpu_clk) begin
        if(!cpu_rst_n) caddr <= 0;
        else caddr <= naddr;
    end
    
    
endmodule