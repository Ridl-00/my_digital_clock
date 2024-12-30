//时间控制 自动计数和手动校时
//输入校时等控制信号 输出8位时间
module time_clock_correct_57 (
    input               clk_50m_57   ,
    input               clk_1_57     ,
    input               rst_57       ,
    input               clock_e_57   , //时钟使能信号 高有效；在手动校时以及运行其他系统时无效
    input               correct_e_57 ,

    input               key_select_57, //时分秒切换
    input               key_add_57   , //加法
    input               key_sub_57   , //减法

    //输出到display
    output  wire[2:0]  select_57    ,
    output  reg [6:0]   sec_57       ,
    output  reg [6:0]   min_57       ,
    output  reg [6:0]   hour_57      
);

//时钟计数
// reg [5:0] sec_57  ;
// reg [5:0] min_57  ;
// reg [5:0] hour_57 ;

reg [2:0]    select_reg_57 = 3'b001;

assign select_57 = select_reg_57;


//检测上升沿
reg clk_1_57_prev;
always @(posedge clk_50m_57) begin
    if(rst_57) begin
        clk_1_57_prev <= 1'b0;
    end else begin
        clk_1_57_prev <= clk_1_57;
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
    else if(clock_e_57) begin
        if(clk_1_57 && !clk_1_57_prev) begin
            if(sec_57==59) begin
                sec_57<=0;
                if(min_57==59) begin
                    min_57<=0;
                    if(hour_57==23) begin
                        hour_57<=0;
                    end else begin
                        hour_57<=hour_57+1;
                    end
                end else begin
                    min_57<=min_57+1;
                end
            end 
            else begin
                sec_57<=sec_57+1;
            end
        end
    end 
    else if(correct_e_57) begin
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
    if(correct_e_57)
        select_reg_57  <= {select_reg_57[1:0], select_reg_57[2]};
end

endmodule