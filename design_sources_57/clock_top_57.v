module clock_top_57 (
    input           clk_50m_57,
    // input           clk_100m_57,
    // input           rst_57,

    input   [7:0]   sw_57 ,
    input   [7:0]   key_57 ,

    output  [6:0]    seg_57,
    output  [7:0]    dig_57,
    output  [7:0]    led_57,
    output           bell_57
);

wire   rst_57         ;

wire   clock_e_57     ;
wire   correct_e_57   ;
wire   stopwatch_e_57 ;
wire   alarm_e_57     ;
wire   week_e_57      ;
wire   game_e_57      ;
wire   organ_e_57     ;
wire   bell_e_57      ;

assign  clock_e_57     = sw_57[0];
assign  correct_e_57   = sw_57[1];
assign  stopwatch_e_57 = sw_57[2];
assign  alarm_e_57     = sw_57[3];
assign  week_e_57      = sw_57[4];
assign  game_e_57      = sw_57[5];
assign  organ_e_57     = sw_57[6];
assign  bell_e_57      = sw_57[7];

//按键消抖
wire    key0_in_57 ;
wire    key1_in_57 ;
wire    key2_in_57 ;
wire    key3_in_57 ;
wire    key4_in_57 ;
wire    key5_in_57 ;
wire    key6_in_57 ;
wire    key7_in_57 ;

assign  key0_in_57 = key_57[0];
assign  key1_in_57 = key_57[1]; 
assign  key2_in_57 = key_57[2]; 
assign  key3_in_57 = key_57[3]; 
assign  key4_in_57 = key_57[4]; 
assign  key5_in_57 = key_57[5]; 
assign  key6_in_57 = key_57[6]; 
assign  key7_in_57 = key_57[7]; 

wire    key0_out_57 ;
wire    key1_out_57 ;
wire    key2_out_57 ;
wire    key3_out_57 ;
wire    key4_out_57 ;
wire    key5_out_57 ;
wire    key6_out_57 ;
wire    key7_out_57 ;


deshake1_57 u_deshake0(
    .clk_50m_57     (clk_50m_57     ),
    // .rst_57         (rst_57),

    .key_in_57      (key0_in_57     ),
    .key_out_57     (key0_out_57    )
); 
deshake1_57 u_deshake1(
    .clk_50m_57     (clk_50m_57     ),
    .key_in_57      (key1_in_57     ),
    .key_out_57     (key1_out_57    )
); 
deshake1_57 u_deshake2(
    .clk_50m_57     (clk_50m_57     ),
    .key_in_57      (key2_in_57     ),
    .key_out_57     (key2_out_57    )
); 
deshake1_57 u_deshake3(
    .clk_50m_57     (clk_50m_57     ),
    .key_in_57      (key3_in_57     ),
    .key_out_57     (key3_out_57    )
); 
deshake1_57 u_deshake4(
    .clk_50m_57     (clk_50m_57     ),
    .key_in_57      (key4_in_57     ),
    .key_out_57     (key4_out_57    )
); 
deshake1_57 u_deshake5(
    .clk_50m_57     (clk_50m_57     ),
    .key_in_57      (key5_in_57     ),
    .key_out_57     (key5_out_57    )
); 
deshake1_57 u_deshake6(
    .clk_50m_57     (clk_50m_57     ),
    .key_in_57      (key6_in_57     ),
    .key_out_57     (key6_out_57    )
); 
deshake1_57 u_deshake7(
    .clk_50m_57     (clk_50m_57     ),
    .key_in_57      (key7_in_57     ),
    .key_out_57     (key7_out_57    )
); 

assign rst_57 = key7_out_57;
//分频
wire  clk_1fs_57 ;
wire  clk_1_57   ;
wire  clk_05_57  ;
wire  clk_500_57 ;
wire  clk_1k_57  ;
wire  clk_5k_57  ;

wire  do_57   ;
wire  re_57   ;
wire  mi_57   ;
wire  fa_57   ;
wire  so_57   ;
wire  la_57   ;
wire  ti_57   ;
wire  doh_57  ;

fre_div_57 u_fre_div_57(
    .clk_50m_57  (clk_50m_57 ),
    .rst_57      (rst_57     ),

    .clk_1fs_57  (clk_1fs_57 ),
    .clk_1_57    (clk_1_57   ),
    .clk_05_57   (clk_05_57  ),
    .clk_500_57  (clk_500_57 ),
    .clk_1k_57   (clk_1k_57  ),
    .clk_5k_57   (clk_5k_57  ),

    .clk_523_57  (do_57      ),
    .clk_587_57  (re_57      ),
    .clk_659_57  (mi_57      ),
    .clk_698_57  (fa_57      ),
    .clk_784_57  (so_57      ),
    .clk_880_57  (la_57      ),
    .clk_988_57  (ti_57      ),
    .clk_1047_57 (doh_57     )
);

//通过使能信号选择要显示的数字
wire  is_time_model_57;
wire  is_week_model_57; 
wire  shine_e_57;
wire  [2:0] select_dig_57;
wire  stopwatch_run_model_57;
wire  stopwatch_record_model_57;
wire  alarm_set_model_57;

wire  [2:0] clock_select_dig_57;
wire  [2:0] alarm_select_dig_57;

wire  [6:0] display_sec_57 ;
wire  [6:0] display_min_57 ;
wire  [6:0] display_hour_57;

wire  [2:0] display_weekday_57;

assign is_time_model_57 = clock_e_57 | correct_e_57 | stopwatch_e_57 | alarm_e_57;
assign is_week_model_57 =     ~correct_e_57  
                            & ~stopwatch_e_57
                            & ~alarm_e_57    
                            & week_e_57     
                            & ~game_e_57     
                            & ~organ_e_57    ;
assign shine_e_57 = correct_e_57 | alarm_set_model_57;
assign stopwatch_run_model_57 = stopwatch_e_57 & ~alarm_e_57;
assign stopwatch_record_model_57 = stopwatch_e_57 & alarm_e_57;
assign alarm_set_model_57 = alarm_e_57 & ~stopwatch_e_57;

assign select_dig_57 =  alarm_set_model_57 ?  alarm_select_dig_57 : 
                        correct_e_57       ?  clock_select_dig_57 :
                        3'b000;

wire [6:0] sec_clock_57   ;
wire [6:0] min_clock_57   ;
wire [6:0] hour_clock_57  ;

wire [6:0] sec_stopwatch_run_57    ;
wire [6:0] min_stopwatch_run_57    ;
wire [6:0] hour_stopwatch_run_57   ;

wire [6:0] sec_stopwatch_record_57 ;
wire [6:0] min_stopwatch_record_57 ;
wire [6:0] hour_stopwatch_record_57;

//存闹钟时间
wire [6:0] alarm_sec_clock_57 ;
wire [6:0] alarm_min_clock_57 ;
wire [6:0] alarm_hour_clock_57;

assign display_sec_57 = stopwatch_run_model_57 ? sec_stopwatch_run_57 :
                        stopwatch_record_model_57 ? sec_stopwatch_record_57 :
                        alarm_set_model_57 ? alarm_sec_clock_57 :
                        sec_clock_57 ;
assign display_min_57 = stopwatch_run_model_57 ? min_stopwatch_run_57 :
                        stopwatch_record_model_57 ? min_stopwatch_record_57 :
                        alarm_set_model_57 ? alarm_min_clock_57 :
                        min_clock_57 ;
assign display_hour_57= stopwatch_run_model_57 ? hour_stopwatch_run_57 :
                        stopwatch_record_model_57 ? hour_stopwatch_record_57 :
                        alarm_set_model_57 ? alarm_hour_clock_57 :
                        hour_clock_57 ;

wire write_clock_e_57;
reg [6:0]  sotred_sec_clock_57 ;
reg [6:0]  sotred_min_clock_57 ;
reg [6:0]  sotred_hour_clock_57;
always @(posedge clk_5k_57) begin
    if(write_clock_e_57)begin
        sotred_sec_clock_57  <= alarm_sec_clock_57  ;
        sotred_min_clock_57  <= alarm_min_clock_57  ;
        sotred_hour_clock_57 <= alarm_hour_clock_57 ;
    end
end
//数码管
display_57 u_display_57(
    .clk_57       (clk_1k_57),
//！！
    // .clk_57   (clk_50m_57),
    .clk_05_57    (clk_05_57),
    .rst_57       (rst_57),

    // .clock_e_57   (clock_e_57), //时钟使能信号 高有效；在手动校时以及运行其他系统时无效
    // .correct_e_57 (correct_e_57),

    // .stopwatch_e_57(stopwatch_e_57),

    // .alarm_e_57   (alarm_e_57),


    .time_model_57(is_time_model_57),
    .shine_e_57   (shine_e_57      ),
    .select_57    (select_dig_57),
    .sec_57       (display_sec_57),
    .min_57       (display_min_57),
    .hour_57      (display_hour_57),

    .week_e_57    (is_week_model_57),
    .week_day_57  (display_weekday_57),

    // .game_e_57    (game_e_57),
    // .point_57     (),

    .seg_57       (seg_57),
    .dig_o_57     (dig_57)
);

//led


//读写信号
wire         read_e_57    ;
wire [2:0]   read_addr_57 ;
wire         write_e_57   ;
wire [2:0]   write_addr_57;
wire [6:0]   write_sec_57 ;
wire [6:0]   write_min_57 ;
wire [6:0]   write_hour_57;

wire [6:0]   read_sec_57  ;
wire [6:0]   read_min_57  ;
wire [6:0]   read_hour_57 ;

//寄存器
register_57 u_register_57(
    .clk_57             (clk_50m_57   ),                 
    .rst_57             (rst_57       ),               
    .read_e_57          (read_e_57    ),     
    .read_addr_57       (read_addr_57 ),  
    .write_e_57         (write_e_57   ),    
    .write_addr_57      (write_addr_57), 
    .write_sec_57       (write_sec_57 ),  
    .write_min_57       (write_min_57 ),  
    .write_hour_57      (write_hour_57), 

    .read_sec_57        (read_sec_57  ),   
    .read_min_57        (read_min_57  ),   
    .read_hour_57       (read_hour_57 )
);

reg [1:0] freq_choice_57 = 2'd0;
always @(posedge key6_out_57) begin
    if(freq_choice_57 == 2'd3)begin
        freq_choice_57 <= 2'd0;
    end else begin
        freq_choice_57 <= freq_choice_57+ 1;
    end
end
wire clk_clock_57;
assign clk_clock_57 = freq_choice_57 == 2'd0 ? clk_1_57   :
                      freq_choice_57 == 2'd1 ? clk_500_57 :
                      freq_choice_57 == 2'd2 ? clk_5k_57  :
                      0;

time_clock_correct_57 u_time_clock_correct_57(
    .clk_50m_57     (clk_50m_57),
    .clk_1_57       (clk_clock_57),
//！！！！
    // .clk_1_57       (clk_5k_57),
    .rst_57         (rst_57),
    .clock_e_57     (clock_e_57),
    .correct_e_57   (correct_e_57),
 
    .key_select_57  (key2_out_57),
    .key_add_57     (key0_out_57), 
    .key_sub_57     (key1_out_57),

    
    .select_57      (clock_select_dig_57),
    .sec_57         (sec_clock_57 ),
    .min_57         (min_clock_57 ),
    .hour_57        (hour_clock_57)
);

// 秒表 跑
time_stopwatch_run U_time_stopwatch_run(
   .clk_50m_57                (clk_50m_57),
   .clk_1fs_57                (clk_1fs_57),
   .rst_57                    (rst_57),
   .stopwatch_run_e_57        (stopwatch_run_model_57),

   .key_run_stop_57           (key0_out_57), //起停
   .key_record_57             (key1_out_57), //中间计数
   .key_rst_57                (key2_out_57), //秒表清零

   . write_e_57               (write_e_57),
   . write_addr_57            (write_addr_57),
   . record_stopwatch_sec_57  (write_sec_57 ),
   . record_stopwatch_min_57  (write_min_57 ),
   . record_stopwatch_hour_57 (write_hour_57),

   .fsec_57                   (sec_stopwatch_run_57 ),
   .sec_57                    (min_stopwatch_run_57 ),
   .min_57                    (hour_stopwatch_run_57)
);

//秒表 读
time_stopwatch_record_57 u_time_stopwatch_record_57(
    .clk_50m_57               (clk_50m_57),
    .rst_57                   (rst_57),
    .stopwatch_read_e_57      (stopwatch_record_model_57),

    .key_next_57              (key0_out_57),

    .read_e_57                (read_e_57    ),
    .read_addr_57             (read_addr_57 ),

    
    .record_stopwatch_sec_57  (read_sec_57 ),
    .record_stopwatch_min_57  (read_min_57 ),
    .record_stopwatch_hour_57 (read_hour_57),

    
    .sec_57                   (sec_stopwatch_record_57 ),
    .min_57                   (min_stopwatch_record_57 ),
    .hour_57                  (hour_stopwatch_record_57)
);

//闹钟
time_alarm_set_57 u_time_alarm_set_57(
    .clk_50m_57       (clk_50m_57),
    .clk_1_57         (clk_1_57),
    .rst_57           (rst_57),
    .alarm_e_57       (alarm_set_model_57),
    
    .key_select_57    (key2_out_57), //时分秒切换
    .key_add_57       (key0_out_57), //加法
    .key_sub_57       (key1_out_57), //减法
    .key_confirm_57   (key3_out_57), //确认

    .select_57        (alarm_select_dig_57),
    .sec_57           (alarm_sec_clock_57 ),
    .min_57           (alarm_min_clock_57 ),
    .hour_57          (alarm_hour_clock_57),
    .write_clock_e_57 (write_clock_e_57   )
);

//
week_ctrl_57 u_week_ctrl_57 (
    .clk_50m_57 (clk_1k_57),
    .rst_57     (rst_57),
    .week_e_57  (is_week_model_57),

    .key_add_57 (key0_out_57),
    .key_sub_57 (key1_out_57),

    //输出到display
    .week_day_o_57(display_weekday_57)
);
wire sound_e_57;
wire sound_model_57;

bell_sound_57 u_bell_sound_57(
    .clk_50m_57    (clk_50m_57),
    .clk_05_57     (clk_1_57),
    .rst_57        (rst_57),
    .bell_e_57     (bell_e_57),   //由硬件控制的使能
    .sound_e_57    (sound_e_57), //由程序控制的使能
    .sound_model_57(sound_model_57), //0是闹钟（音乐）1是整点报时
    .organ_e_57    (organ_e_57 ),  
    .key0_out_57   (key0_out_57),  
    .key1_out_57   (key1_out_57),  
    .key2_out_57   (key2_out_57),  
    .key3_out_57   (key3_out_57),  
    .key4_out_57   (key4_out_57),  
    .key5_out_57   (key5_out_57),  
    .key6_out_57   (key6_out_57),  
    .key7_out_57   (key7_out_57),  

    .do_57         (do_57 ),
    .re_57         (re_57 ),
    .mi_57         (mi_57 ),
    .fa_57         (fa_57 ),
    .so_57         (so_57 ),
    .la_57         (la_57 ),
    .ti_57         (ti_57 ),
    .doh_57        (doh_57),

    .bell_w_57     (bell_57)
);

bell_led_ctrl_57 u_bell_led_ctrl_57(
    .clk_50m_57    (clk_50m_57),
    .clk_05_57     (clk_1_57),
    .rst_57        (rst_57),

    .now_sec_57    (sec_clock_57 ),
    .now_min_57    (min_clock_57 ),
    .now_hour_57   (hour_clock_57),

    .clock_sec_57    (sotred_sec_clock_57),
    .clock_min_57    (sotred_min_clock_57),
    .clock_hour_57   (sotred_hour_clock_57),

    .sound_e_57      (sound_e_57),
    .sound_model_57  (sound_model_57)
);

led_light_57 u_led_light_57(
    .clk_50m_57     (clk_50m_57),
    .clk_1_57       (clk_1_57),
    .rst_57         (rst_57),
    .game_e_57      (game_e_57),

    .sound_e_57     (sound_e_57),
    .sound_model_57 (sound_model_57),
    .led_w_57       (led_57)
);
endmodule