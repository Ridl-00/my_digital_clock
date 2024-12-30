//时间控制 自动计数和手动校时
//输入校时等控制信号 输出8位时间
module time_alarm_set_57 (
    input               clk_50m_57   ,
    input               clk_1_57     ,
    input               rst_57       ,
    input               alarm_e_57   ,

    input               key_select_57, //时分秒切换
    input               key_add_57   , //加法
    input               key_sub_57   , //减法
    input               key_confirm_57, //确认

    //输出到display
    output  wire[2:0]   select_57    ,
    output  reg [6:0]   sec_57       ,
    output  reg [6:0]   min_57       ,
    output  reg [6:0]   hour_57      ,
    output  reg         write_clock_e_57
);

reg [2:0]    select_reg_57 = 3'b001;

assign select_57 = select_reg_57;


//检测上升沿
reg key_confirm_57_prev;
always @(posedge clk_50m_57) begin
    if(rst_57) begin
        key_confirm_57_prev <= 1'b0;
    end else begin
        key_confirm_57_prev <= key_confirm_57;
    end
end

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
        sec_57  <= 0;
        min_57  <= 0;
        hour_57 <= 0;
    end
    else if(alarm_e_57) begin
        if(key_add_57 && !key_add_57_prev) begin
            case (select_57)
                3'b001: begin
                    if(sec_57==59) begin
                        sec_57<=0;
                    end 
                    else begin
                        sec_57<=sec_57+1;
                    end
                end
                3'b010: begin
                    if(min_57==59) begin
                        min_57<=0;
                    end 
                    else begin
                        min_57<=min_57+1;
                    end
                end
                3'b100: begin
                    if(hour_57==23) begin
                        hour_57<=0;
                    end 
                    else begin
                        hour_57<=hour_57+1;
                    end
                end                
                default: ;
            endcase
        end
        else if(key_sub_57 && !key_sub_57_prev) begin
            case (select_57)
                3'b001: begin
                    if(sec_57==0) begin
                        sec_57<=59;
                    end 
                    else begin
                        sec_57<=sec_57-1;
                    end
                end
                3'b010: begin
                    if(min_57==0) begin
                        min_57<=59;
                    end 
                    else begin
                        min_57<=min_57-1;
                    end
                end
                3'b100: begin
                    if(hour_57==0) begin
                        hour_57<=23;
                    end 
                    else begin
                        hour_57<=hour_57-1;
                    end
                end                
                default: ;
            endcase
        end
        
    end
end

//控制加减时/分/秒
always @(posedge key_select_57) begin
    if(alarm_e_57)
        select_reg_57  <= {select_reg_57[1:0], select_reg_57[2]};
end

always @(posedge clk_50m_57) begin
    if(alarm_e_57) begin
        if(key_add_57 && !key_add_57_prev) begin
            write_clock_e_57 <= 1;
        end
        else write_clock_e_57 <= 0;
    end
end
endmodule