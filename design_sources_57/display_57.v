//数码管显示控制
module display_57 (
    input               clk_57       ,
    input               clk_05_57    ,
    input               rst_57       ,

    input               time_model_57,
    input               shine_e_57   , //需要闪烁
    input  wire [2:0]   select_57    , //闪烁哪2位
    input  wire [6:0]   sec_57       ,
    input  wire [6:0]   min_57       ,
    input  wire [6:0]   hour_57      ,

    input               week_e_57    ,
    input  wire [3:0]   week_day_57  ,

    // input               game_e_57    ,
    // input               point_57     ,


    output wire [6:0]    seg_57      ,
    output wire [7:0]    dig_o_57    
);

reg   shine_57 = 1'b0;
parameter freq05   =  1000/2/2;
reg [31:0] cnt_05_57    ;
always @(posedge clk_57) begin
    if(rst_57) begin
        cnt_05_57 <= 0; shine_57 <= 0;
    end else begin
        if(cnt_05_57 == freq05-1)begin
            cnt_05_57 <= 0; shine_57 <= ~shine_57;
        end else cnt_05_57 <= cnt_05_57+1;
    end
end

reg  [7:0]    dig_scan_57 = 8'b11111110;
wire [7:0]    dig_shine_57;
reg  [7:0]    dig_0_57 = 8'b11111110;
//片选
always @(posedge clk_57) begin
    if(rst_57)begin
        dig_scan_57 <= 8'b11111110;
    end else begin
        dig_scan_57 <= {dig_scan_57[6:0], dig_scan_57[7]};
    end
    
end

wire [7:0] select_two_57;
assign select_two_57 = select_57==3'b001 ? 8'b00000011 : 
                       select_57==3'b010 ? 8'b00011000 :
                       select_57==3'b100 ? 8'b11000000 :
                       8'b00000000 ;

//需要闪 且 是被选中的两位 
// assign dig_o_57 = (shine_e_57 && ((~dig_57) & select_two_57)) ? dig_57 & shine_57 : dig_57;
// assign dig_o_57 = (shine_e_57 & ())

integer  i;
// always @(posedge clk_57) begin
    // if(rst_57) begin
        // dig_shine_57 <= 8'b11111111;
    // end else begin
        // for (i = 0; i < 8; i=i+1) begin
        //     if (select_two_57[i] == 1'b1) begin
        //         assign dig_shine_57[i] = ((~shine_57) | dig_scan_57[i]);
        //     end else begin
        //         assign dig_shine_57[i] = dig_scan_57[i];
            // end
        // end
        // dig_shine_57[1] <= dig_scan_57[0];
    // end
// end
assign dig_shine_57[0] = select_two_57[0] == 1'b1 ? ((~shine_57) | dig_scan_57[0]) : dig_scan_57[0];
assign dig_shine_57[1] = select_two_57[1] == 1'b1 ? ((~shine_57) | dig_scan_57[1]) : dig_scan_57[1];
assign dig_shine_57[2] = select_two_57[2] == 1'b1 ? ((~shine_57) | dig_scan_57[2]) : dig_scan_57[2];
assign dig_shine_57[3] = select_two_57[3] == 1'b1 ? ((~shine_57) | dig_scan_57[3]) : dig_scan_57[3];
assign dig_shine_57[4] = select_two_57[4] == 1'b1 ? ((~shine_57) | dig_scan_57[4]) : dig_scan_57[4];
assign dig_shine_57[5] = select_two_57[5] == 1'b1 ? ((~shine_57) | dig_scan_57[5]) : dig_scan_57[5];
assign dig_shine_57[6] = select_two_57[6] == 1'b1 ? ((~shine_57) | dig_scan_57[6]) : dig_scan_57[6];
assign dig_shine_57[7] = select_two_57[7] == 1'b1 ? ((~shine_57) | dig_scan_57[7]) : dig_scan_57[7];


// 将内部reg类型的信号连接到外部wire类型的端口
assign dig_o_57 =   week_e_57  ? dig_0_57     :
                    shine_e_57 ? dig_shine_57 : 
                    dig_scan_57;
// 段选
wire [3:0] current_num_57;

assign current_num_57 = week_e_57 ? week_day_57:
    time_model_57 ? (
    dig_scan_57 == 8'b11111110 ? sec_57 % 10 : 
    dig_scan_57 == 8'b11111101 ? sec_57 / 10 : 
    dig_scan_57 == 8'b11111011 ? 10 : 
    dig_scan_57 == 8'b11110111 ? min_57 % 10 : 
    dig_scan_57 == 8'b11101111 ? min_57 / 10 : 
    dig_scan_57 == 8'b11011111 ? 10 : 
    dig_scan_57 == 8'b10111111 ? hour_57 % 10 : 
    dig_scan_57 == 8'b01111111 ? hour_57 / 10 : 
    4'b1111                            ) : 
    
    // game_e_57 ? point_57                 :
    4'b1111                              ; //都没选就不亮了


//decoder                                       g a
assign seg_57 = (current_num_57 == 4'b0000) ? 7'b0111111 : // 0
                (current_num_57 == 4'b0001) ? 7'b0000110 : // 1
                (current_num_57 == 4'b0010) ? 7'b1011011 : // 2
                (current_num_57 == 4'b0011) ? 7'b1001111 : // 3
                (current_num_57 == 4'b0100) ? 7'b1100110 : // 4
                (current_num_57 == 4'b0101) ? 7'b1101101 : // 5
                (current_num_57 == 4'b0110) ? 7'b1111101 : // 6
                (current_num_57 == 4'b0111) ? 7'b0000111 : // 7
                (current_num_57 == 4'b1000) ? 7'b1111111 : // 8
                (current_num_57 == 4'b1001) ? 7'b1101111 : // 9
                (current_num_57 == 4'b1010) ? 7'b1000000 : // 杠（10）
                7'b0000000; // 默认值
endmodule