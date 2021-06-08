// ���������ģ�� ʱ���߼�
module pc(
    input  logic cpu_clk,
    input  logic cpu_rst_n,
    output logic [31:0] iaddr
    );
    
    // pc�洢��ָ���ַ
    logic [31:0] current_addr;
    
    always_ff @(posedge cpu_clk) begin
        if(!cpu_rst_n) current_addr <= 0;
        else current_addr <= current_addr + 4;
    end
    
    assign iaddr = current_addr;
    
endmodule