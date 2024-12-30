//秒表运行
module time_stopwatch_run (
    input               clk_50m_57                ,
    input               clk_1fs_57                ,
    input               rst_57                    ,
    input               stopwatch_run_e_57            ,

    input               key_run_stop_57           , //起停
    input               key_record_57             , //中间计数
    input               key_rst_57                , //秒表清零

    //输出到寄存器，写地址 写数据
    output   reg         write_e_57               ,
    output   reg  [2:0]  write_addr_57            ,
    output   reg  [6:0]  record_stopwatch_sec_57  ,
    output   reg  [6:0]  record_stopwatch_min_57  ,
    output   reg  [6:0]  record_stopwatch_hour_57 ,

    //输出到display
    output  reg [6:0]    fsec_57                  ,
    output  reg [6:0]    sec_57                   ,
    output  reg [6:0]    min_57     
);

reg     run_57 = 0;
// reg [2:0]    write_addr_reg_57 = 0;

// assign write_addr_57 = write_addr_reg_57;

//检测上升沿
reg key_record_57_prev;
always @(posedge clk_50m_57) begin
    if(rst_57) begin
        key_record_57_prev <= 1'b0;
    end else begin
        key_record_57_prev <= key_record_57;
    end
end

always @(posedge clk_1fs_57) begin
    if(key_rst_57) begin
        fsec_57 <= 0;
        sec_57  <= 0;
        min_57  <= 0;
    end
    else if(run_57 & stopwatch_run_e_57) begin
        if(fsec_57==99) begin
            fsec_57<=0;
            if(sec_57==59) begin
                sec_57<=0;
                if(min_57==59) begin
                    min_57<=0;
                end else begin
                    min_57<=min_57+1;
                end
            end else begin
                sec_57<=sec_57+1;
            end
        end 
        else begin
            fsec_57<=fsec_57+1;
        end
    end
end

//控制起停
always @(posedge key_run_stop_57) begin
    if(stopwatch_run_e_57)begin
        run_57  <= ~run_57;
    end
end

//！用了阻塞赋值 不知道效果如何
//写寄存器
always @(posedge key_record_57) begin
    if(stopwatch_run_e_57)begin
        record_stopwatch_sec_57 = fsec_57;
        record_stopwatch_min_57 = sec_57 ;
        record_stopwatch_hour_57= min_57 ;
    end
end
// initial begin
//     write_addr_57 = 0;
    // write_e_57 = 0;
// end
always @(posedge clk_50m_57) begin
// always @(posedge key_record_57) begin
    if(rst_57)begin
        write_addr_57 = 0;
        write_e_57 = 0;
    end
    else if(stopwatch_run_e_57)begin
        if(key_record_57 && !key_record_57_prev)begin
            write_e_57 = 1;
            if(write_addr_57==4) begin
                write_addr_57 = 0;
            end
            else begin
                write_addr_57 = write_addr_57+1;
            end
        end
        else write_e_57 = 0;
    end
    else write_e_57 = 0;

end

endmodule