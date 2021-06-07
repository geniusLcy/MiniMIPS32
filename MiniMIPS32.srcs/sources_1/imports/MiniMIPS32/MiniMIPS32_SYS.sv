`include "defines.sv"

module MiniMIPS32_SYS(
    input logic             sys_clk,
    input logic             sys_rst_n,
    output logic [2 : 0]    led_rgb
    );
    
    logic sys_clk_50MHz;
    logic [31:0] iaddr;
    logic [31:0] inst;
    logic [31:0] daddr;
    logic we;
    logic [31:0] din;
    logic [31:0] dout;
    
    //��ַ0x80000000��Ӧ��ɫLED�ƣ���������Ӧled_rgb[2], led_rgb[1]��led_rgb[0]������ַ0x10000000��ʼ�������
    logic [2 : 0]   led_rgb_reg;
    always_ff @(posedge sys_clk_50MHz) begin
        if (!sys_rst_n) led_rgb_reg <= 3'b000;
        else if (daddr[31:16] == 16'h8000) led_rgb_reg <= din[2 : 0];
        else led_rgb_reg <= led_rgb_reg;
    end
    assign led_rgb = led_rgb_reg;

    MiniMIPS32 CPU (
        .cpu_clk(sys_clk_50MHz),
        .cpu_rst_n(sys_rst_n),
        .iaddr(iaddr),
        .inst(inst),
        .daddr(daddr),
        .we(we),
        .din(din),
        .dout(dout)
    );
    
    inst_rom inst_rom (
        .a(iaddr[9:2]),      // input wire [9 : 2] a
        .spo(inst)  // output wire [31 : 0] spo
    );
    
    data_ram data_ram (
        .a(daddr[9:2]),      // input wire [9 : 2] a
        .d(din),      // input wire [31 : 0] d
        .clk(sys_clk_50MHz),  // input wire clk
        .we(we),    // input wire we
        .spo(dout)  // output wire [31 : 0] spo
    );
    
    clkdiv clkdiv (
        .clk_50MHz(sys_clk_50MHz),     // output clk_50MHz
        .clk_100MHz(sys_clk)
    ); 


endmodule
