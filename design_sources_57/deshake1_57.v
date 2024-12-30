//消抖
module deshake1_57(
    input  clk_50m_57 ,

    input  key_in_57  ,
    output key_out_57
); 

//dff
reg     key_in_57_1;
reg     key_in_57_2;
reg     key_in_57_3;
reg     key_in_57_4;
reg     key_in_57_5;
reg     key_in_57_6;
reg     key_in_57_7;
reg     key_in_57_8;

always@(posedge clk_50m_57)begin
    // if(rst_57)
    //     begin
    //         key_in_1 <= 1'b0;
    //         key_in_2 <= 1'b0;
    //         key_in_3 <= 1'b0;
    //         key_in_4 <= 1'b0;
    //         key_in_5 <= 1'b0;
    //     end
    // else 
        begin
            key_in_57_1 <= key_in_57;
            key_in_57_2 <= key_in_57_1;
            key_in_57_3 <= key_in_57_2;
            key_in_57_4 <= key_in_57_3;
            key_in_57_5 <= key_in_57_4;
            key_in_57_6 <= key_in_57_5;
            key_in_57_7 <= key_in_57_6;
            key_in_57_8 <= key_in_57_7;
        end
end

assign key_out_57 = key_in_57_1 &
                    key_in_57_2 &
                    key_in_57_3 &
                    key_in_57_4 &
                    key_in_57_5 &
                    key_in_57_6 &
                    key_in_57_7 &
                    key_in_57_8 ;
endmodule