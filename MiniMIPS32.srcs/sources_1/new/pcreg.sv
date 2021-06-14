// ���������ģ��
module pcreg(
    input  logic cpu_clk, // ϵͳʱ��
    input  logic cpu_rst_n, // ϵͳ��λ�ź�
    input logic [31:0] naddr, // ��һ��ָ��ĵ�ַ
    output logic [31:0] caddr // ��ǰָ���ַ
    );
        
    always_ff @(posedge cpu_clk) begin
        if(!cpu_rst_n) caddr <= 0;
        else caddr <= naddr;
    end
    
    
endmodule