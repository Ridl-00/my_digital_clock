//蜂鸣器控制
//输入响什么模式的东西 各种频率 和bell_e_57
module led_light_57(
    input 	  clk_50m_57    ,
    input     clk_1_57     ,
    input     rst_57        ,
    input     game_e_57     ,

    input     sound_e_57    , //由程序控制的使能
    input     sound_model_57, //0是闹钟（音乐）1是整点报时

    output  wire [7:0]  led_w_57 

);


reg clk_1_57_prev;
always @(posedge clk_50m_57) begin
    if(rst_57) begin
        clk_1_57_prev <= 1'b0;
    end else begin
        clk_1_57_prev <= clk_1_57;
    end
end


reg [7:0] led2_57;
always @(posedge clk_50m_57) begin
    if(rst_57) begin
        led2_57 <= 8'b00000001;
    end
    else if(game_e_57) begin
        if(clk_1_57 && !clk_1_57_prev) begin
            led2_57 <= {led2_57[6:0], led2_57[7]};
        end
    end
end

reg [6:0] cnt_57     ;
reg [5:0] num_57  =0 ;

reg [6:0] cnt1_57     ;
reg [5:0] num1_57  =0 ;

reg [7:0] led_57;
always @(posedge clk_1_57) begin
    if(rst_57) begin
        cnt_57 <= 0;    
        num_57 <= 0;
    end
    else if(sound_e_57) begin
        if(cnt_57 == 63) begin
            cnt_57 <=0;
            num_57 <= num_57 +1;
        end else if(num_57>=4)begin
            cnt_57 <= 64;
        end else begin
            cnt_57 <= cnt_57+1;
        end
    end
end

always @(posedge clk_1_57) begin
    if(rst_57) begin
        led_57 <= 8'b00000001;    
    end
    else if(cnt_57!=64) begin
        led_57 <= {led_57[6:0], led_57[7]};
    end else begin
        led_57 <= 8'b00000000;
    end
end

reg [7:0] led1_57;
always @(posedge clk_1_57) begin
    if(rst_57) begin
        cnt1_57 <= 0;    
        num1_57 <= 0;
    end
    else if(sound_e_57) begin
        if(cnt1_57 == 7) begin
            cnt1_57 <=0;
            num1_57 <= num1_57 +1;
        end else if(num1_57>=4)begin
            cnt1_57 <= 64;
        end else begin
            cnt1_57 <= cnt1_57+1;
        end
    end
end

always @(posedge clk_1_57) begin
    if(rst_57) begin
        led1_57 <= 8'b00000000;    
    end
    else if(sound_e_57) begin
        case (cnt1_57)
            7'd0, 7'd2:led1_57<=8'b01010101 ;
            7'd4, 7'd6:led1_57<=8'b10101010;
            default: led1_57<=8'b00000000;
        endcase
    end
end

assign led_w_57 = game_e_57 ? led2_57 :
                    sound_e_57 ? 
                   (sound_model_57 ? led1_57 : led_57) : 8'b00000000;
endmodule