//星期控制
//输入校时等控制信号 输出6位时间
module week_ctrl_57 (
    input               clk_50m_57   ,
    input               rst_57      ,
    input               week_e_57   ,

    input               key_add_57  ,
    input               key_sub_57  ,

    //输出到display
    output   [2:0]      week_day_o_57
);

reg [2:0]   week_day_57 = 1;
assign week_day_o_57 = week_day_57;

reg key_add_57_prev;
always @(posedge clk_50m_57) begin
    if(rst_57) begin
        key_add_57_prev <= 1'b0;
    end else begin
        key_add_57_prev <= key_add_57;
    end
end

reg key_sub_57_prev;
always @(posedge clk_50m_57) begin
    if(rst_57) begin
        key_sub_57_prev <= 1'b0;
    end else begin
        key_sub_57_prev <= key_sub_57;
    end
end

always @(posedge clk_50m_57) begin
    if(rst_57) begin
        week_day_57  <= 0;
    end
    else if(week_e_57) begin
        if(key_add_57 && !key_add_57_prev) begin
            week_day_57 <= week_day_57+1;
            if (week_day_57 == 7) begin
                week_day_57 <= 1;
            end
        end
        else if(key_sub_57 && !key_sub_57_prev) begin
            week_day_57 <= week_day_57-1;
            if (week_day_57 == 1) begin
                week_day_57 <= 7;
            end
        end
        
    end


end

endmodule