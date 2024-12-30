module time_stopwatch_record_57 (
    input               clk_50m_57                ,
    input               rst_57                    ,
    input               stopwatch_read_e_57       ,

    input               key_next_57               , //下一个

    //输出到寄存器，读使能 读地址
    output   reg        read_e_57               ,
    output   reg  [2:0] read_addr_57            ,

    //从register输入
    input     [6:0]     record_stopwatch_sec_57  ,
    input     [6:0]     record_stopwatch_min_57  ,
    input     [6:0]     record_stopwatch_hour_57 ,

    //输出到display
    output  reg [6:0]   sec_57                   ,
    output  reg [6:0]   min_57                   ,
    output  reg [6:0]   hour_57    
);


//检测上升沿
reg key_next_57_prev;
always @(posedge clk_50m_57) begin
    if(rst_57) begin
        key_next_57_prev <= 1'b0;
    end else begin
        key_next_57_prev <= key_next_57;
    end
end

always @(posedge clk_50m_57) begin
    if(rst_57)begin
        read_addr_57 = 0;
        read_e_57 = 0;
    end
    if(stopwatch_read_e_57)begin
        if(key_next_57 && !key_next_57_prev)begin
            read_e_57 = 1;
            if(read_addr_57==4) begin
                read_addr_57 = 0;
            end
            else begin
                read_addr_57 = read_addr_57+1;
            end
        end
        else read_e_57 = 0;
    end
    else read_e_57 = 0;
end

always @(posedge clk_50m_57) begin
    if(rst_57)begin
        sec_57  <= 0;
        min_57  <= 0;
        hour_57 <= 0;
    end
    // else if(key_next_57 && !key_next_57_prev)begin
    else begin
        if(stopwatch_read_e_57) begin
            sec_57  <= record_stopwatch_sec_57  ;
            min_57  <= record_stopwatch_min_57  ; 
            hour_57 <= record_stopwatch_hour_57 ;
        end
    end
end
endmodule