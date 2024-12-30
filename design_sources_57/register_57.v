//寄存器 用于存储时钟的计数  秒表的计数
module register_57(
    input wire clk_57,                 
    input wire rst_57,               

    input wire read_e_57,             // 读使能信号
    input wire [2:0] read_addr_57,      // 读地址

    input wire write_e_57,            // 写使能信号
    input wire [2:0] write_addr_57,     // 写地址
    input wire [6:0] write_sec_57,      // 写数据（秒）
    input wire [6:0] write_min_57,      // 写数据（分）
    input wire [6:0] write_hour_57,     // 写数据（时）

    output reg [6:0] read_sec_57,       // 读出的数据（秒）
    output reg [6:0] read_min_57,       // 读出的数据（分）
    output reg [6:0] read_hour_57      // 读出的数据（时）
);


reg [6:0] second [6:0];
reg [6:0] minute [6:0];
reg [6:0] hour   [6:0];
integer i;

// 写操作
always @(posedge clk_57) begin
    if (rst_57) begin
        for (i = 0; i < 6; i = i + 1) begin
            second[i] <= 0;
            minute[i] <= 0;
            hour[i] <= 0;
        end
    end else if (write_e_57) begin
        second[write_addr_57] <= write_sec_57;
        minute[write_addr_57] <= write_min_57;
        hour[write_addr_57] <= write_hour_57;
    end
end

// 读操作
always @(posedge clk_57) begin
    if (read_e_57) begin
        read_sec_57 <= second[read_addr_57];
        read_min_57 <= minute[read_addr_57];
        read_hour_57 <= hour[read_addr_57];
    end
end

endmodule