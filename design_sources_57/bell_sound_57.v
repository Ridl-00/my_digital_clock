//蜂鸣器控制
//输入响什么模式的东西 各种频率 和bell_e_57
module bell_sound_57(
    input 	  clk_50m_57    ,
    input     clk_05_57     ,
    input     rst_57        ,
    input     bell_e_57     ,   //由硬件控制的使能
    input     sound_e_57    , //由程序控制的使能
    input     sound_model_57, //0是闹钟（音乐）1是整点报时
    input     organ_e_57    ,
    input     key0_out_57   ,
    input     key1_out_57   ,
    input     key2_out_57   ,
    input     key3_out_57   ,
    input     key4_out_57   ,
    input     key5_out_57   ,    
    input     key6_out_57   ,
    input     key7_out_57   ,

    input     do_57         ,
    input     re_57         ,
    input     mi_57         ,
    input     fa_57         ,
    input     so_57         ,
    input     la_57         ,
    input     ti_57         ,
    input     doh_57        ,

    output  wire  bell_w_57    

);



reg [6:0] cnt_57     ;
reg [5:0] num_57  =0 ;

reg [6:0] cnt1_57     ;
reg [5:0] num1_57  =0 ;

reg bell_57;
// 状态机逻辑
always @(posedge clk_05_57) begin
    if(rst_57) begin
        cnt_57 <= 0;    
        num_57 <= 0;
    end
    else begin
    // else if(sound_e_57) begin
        if(cnt_57 == 63) begin
            cnt_57 <=0;
            // num_57 <= num_57 +1;
        // end else if(num_57>=4)begin
        //     cnt_57 <= 64;
        end else begin
            cnt_57 <= cnt_57+1;
        end
    end
end

always @(posedge clk_50m_57) begin
    if(rst_57) begin
        bell_57 <= 0;    
    end
    else begin
    // else if(sound_e_57) begin
        case (cnt_57)
            7'd0, 7'd1, 7'd2, 7'd16, 7'd17, 7'd18:bell_57<=doh_57 ;
            7'd3, 7'd19, 7'd48, 7'd49, 7'd50, 7'd51:bell_57<=la_57;
            7'd4, 7'd5, 7'd6, 7'd20, 7'd21, 7'd22, 7'd52, 7'd53, 7'd54, 7'd56, 7'd57, 7'd58, 7'd59, 7'd60, 7'd61:bell_57<=so_57;
            7'd7, 7'd23, 7'd12, 7'd13, 7'd14, 7'd15, 7'd27, 7'd35, 7'd44, 7'd45, 7'd46, 7'd55:bell_57<=fa_57;
            7'd8, 7'd9, 7'd10, 7'd24, 7'd25, 7'd26, 7'd32, 7'd33, 7'd34, 7'd40, 7'd41, 7'd42:bell_57<=re_57;
            7'd11, 7'd43:bell_57<=mi_57;
            7'd28, 7'd29, 7'd30, 7'd31, 7'd36, 7'd37, 7'd38, 7'd39:bell_57<=do_57;
            7'd47:bell_57<=ti_57;
            7'd62, 7'd63:bell_57<=0;
            default: bell_57<=0;
        endcase
    end
end
reg bell1_57;
always @(posedge clk_05_57) begin
    if(rst_57) begin
        cnt1_57 <= 0;    
        num1_57 <= 0;
    end
    else if(sound_e_57) begin
        if(cnt1_57 == 63) begin
            cnt1_57 <=0;
            num1_57 <= num1_57 +1;
        end else if(num1_57>=4)begin
            cnt1_57 <= 64;
        end else begin
            cnt1_57 <= cnt1_57+1;
        end
    end
end
always @(posedge clk_50m_57) begin
    if(rst_57) begin
        bell1_57 <= 0;    
    end
    else if(sound_e_57) begin
        case (cnt1_57)
            7'd0, 7'd2:bell1_57<=re_57 ;
            7'd4, 7'd6:bell1_57<=la_57;
            default: bell1_57<=0;
        endcase
    end
end

reg bell3_57;
always @(posedge clk_50m_57) begin
    if(rst_57) begin
        bell3_57 <= 0;    
    end
    else begin
        if(key7_out_57)      bell3_57 <= do_57 ;
        else if(key6_out_57) bell3_57 <= re_57 ;
        else if(key5_out_57) bell3_57 <= mi_57 ;
        else if(key4_out_57) bell3_57 <= fa_57 ;
        else if(key3_out_57) bell3_57 <= so_57 ;
        else if(key2_out_57) bell3_57 <= la_57 ;
        else if(key1_out_57) bell3_57 <= ti_57 ;   
        else if(key0_out_57) bell3_57 <= doh_57;        
    end
end
// assign bell_w_57 = bell_e_57 ? (
//                     organ_e_57 ? bell3_57 :
//                     sound_e_57 ? (sound_model_57 ? bell1_57 : bell_57):0)
//                     : 0;
assign bell_w_57 = organ_e_57 ? bell3_57 :
                bell_e_57 ? bell_57 : 0;
endmodule