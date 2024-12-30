//当前时间整点验证 与闹钟存储器对比
//输出不同响应模式
//输入当前时间与需对比时间
module bell_led_ctrl_57(
    input 	  clk_50m_57    ,
    input     clk_05_57     ,
    input     rst_57        ,

    input [6:0]    now_sec_57    ,
    input [6:0]    now_min_57    ,
    input [6:0]    now_hour_57    ,

    input [6:0]    clock_sec_57    ,
    input [6:0]    clock_min_57    ,
    input [6:0]    clock_hour_57   ,

    output       sound_e_57      ,
    output reg   sound_model_57 
);

reg sound0_57;
reg sound1_57;

always @(posedge clk_50m_57) begin
    if(rst_57) begin
        sound0_57 <= 0;
        sound1_57 <= 0;
    end
    else if(now_sec_57 == clock_sec_57 && now_min_57 == clock_min_57 && now_hour_57 == clock_hour_57 ) begin
        sound0_57 <= 1;
        sound_model_57 <= 0;
    end
    else if(now_sec_57 == 0 && now_min_57 == 0) begin
        sound1_57 <= 1;
        sound_model_57 <= 1;
    end
    // else begin
    //     sound0_57 <= 0;
    //     sound1_57 <= 0;
    // end
end
assign sound_e_57 = sound0_57 | sound1_57;
endmodule