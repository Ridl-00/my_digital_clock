module fre_div_57 (
    input               clk_50m_57  ,
    input               rst_57      ,

    output   reg        clk_1fs_57  ,
    output   reg        clk_1_57    ,
    output   reg        clk_05_57   , //写的05其实是2hz（周期0.5）
    output   reg        clk_500_57  ,
    output   reg        clk_1k_57   ,
    output   reg        clk_5k_57   ,

    output   reg        clk_523_57  ,
    output   reg        clk_587_57  ,
    output   reg        clk_659_57  ,
    output   reg        clk_698_57  ,
    output   reg        clk_784_57  ,
    output   reg        clk_880_57  ,
    output   reg        clk_988_57  ,
    output   reg        clk_1047_57 
);

parameter freqfs1    =  50000000/1/100/2;
parameter freq1    =  50000000/1/2;
parameter freq05   =  50000000/2/2;
parameter freq500  =  50000000/500/2;
parameter freq1k   =  50000000/1000/2;
parameter freq5k   =  50000000/5000/2;
//523 587 659 698 784 880 988 1047
parameter freq523  =  50000000/523/2;
parameter freq587  =  50000000/587/2;
parameter freq659  =  50000000/659/2;
parameter freq698  =  50000000/698/2;
parameter freq784  =  50000000/784/2;
parameter freq880  =  50000000/880/2;
parameter freq988  =  50000000/988/2;
parameter freq1047 =  50000000/2/1047;

reg [31:0] cnt_fs1_57   ;
reg [31:0] cnt_1_57     ;
reg [31:0] cnt_05_57    ;
reg [31:0] cnt_500_57   ;
reg [31:0] cnt_1k_57    ;
reg [31:0] cnt_5k_57    ;

reg [31:0] cnt_523_57   ;
reg [31:0] cnt_587_57   ;
reg [31:0] cnt_659_57   ;
reg [31:0] cnt_698_57   ;
reg [31:0] cnt_784_57   ;
reg [31:0] cnt_880_57   ;
reg [31:0] cnt_988_57   ;
reg [31:0] cnt_1047_57  ;

// reg    clk_1_57   ;
// reg    clk_05_57   ;
// reg    clk_500_57 ;
// reg    clk_1k_57  ;
// reg    clk_5k_57  ;

// reg    clk_523_57 ;
// reg    clk_587_57 ;
// reg    clk_659_57 ;
// reg    clk_698_57 ;
// reg    clk_784_57 ;
// reg    clk_880_57 ;
// reg    clk_988_57 ;
// reg    clk_1047_57;

always @(posedge clk_50m_57) begin
    if(rst_57) begin
        cnt_fs1_57 <= 0;clk_1fs_57 <= 0;
        cnt_1_57 <= 0; clk_1_57 <= 0;
        cnt_05_57 <= 0; clk_05_57 <= 0;
        cnt_500_57 <= 0; clk_500_57 <= 0;
        cnt_1k_57 <= 0; clk_1k_57 <= 0;
        cnt_5k_57 <= 0; clk_5k_57 <= 0;
    end else begin
        if(cnt_fs1_57 == freqfs1-1)begin
            cnt_fs1_57 <= 0; clk_1fs_57 <= ~clk_1fs_57;
        end else cnt_fs1_57 <= cnt_fs1_57+1;

        if(cnt_1_57 == freq1-1)begin
            cnt_1_57 <= 0; clk_1_57 <= ~clk_1_57;
        end else cnt_1_57 <= cnt_1_57+1;

        if(cnt_05_57 == freq05-1)begin
            cnt_05_57 <= 0; clk_05_57 <= ~clk_05_57;
        end else cnt_05_57 <= cnt_05_57+1;

        if (cnt_500_57 == freq500 - 1) begin 
            cnt_500_57 <= 0; clk_500_57 <= ~clk_500_57; 
        end else cnt_500_57 <= cnt_500_57 + 1;

        if (cnt_1k_57 == freq1k - 1) begin 
            cnt_1k_57 <= 0; clk_1k_57 <= ~clk_1k_57; 
        end else cnt_1k_57 <= cnt_1k_57 + 1;

        if (cnt_5k_57 == freq5k - 1) begin 
            cnt_5k_57 <= 0; clk_5k_57 <= ~clk_5k_57; 
        end else cnt_5k_57 <= cnt_5k_57 + 1;
    end
end
always @(posedge clk_50m_57) begin
    if (rst_57) begin
        cnt_523_57  <= 0; clk_523_57  <= 0;
        cnt_587_57  <= 0; clk_587_57  <= 0;
        cnt_659_57  <= 0; clk_659_57  <= 0;
        cnt_698_57  <= 0; clk_698_57  <= 0;
        cnt_784_57  <= 0; clk_784_57  <= 0;
        cnt_880_57  <= 0; clk_880_57  <= 0;
        cnt_988_57  <= 0; clk_988_57  <= 0;
        cnt_1047_57 <= 0; clk_1047_57 <= 0;
    end else begin
        if (cnt_523_57 == freq523 - 1) begin 
            cnt_523_57 <= 0; clk_523_57 <= ~clk_523_57; 
        end else cnt_523_57 <= cnt_523_57 + 1;

        if (cnt_587_57 == freq587 - 1) begin 
            cnt_587_57 <= 0; clk_587_57 <= ~clk_587_57; 
        end else cnt_587_57 <= cnt_587_57 + 1;

        if (cnt_659_57 == freq659 - 1) begin 
            cnt_659_57 <= 0; clk_659_57 <= ~clk_659_57; 
        end else cnt_659_57 <= cnt_659_57 + 1;

        if (cnt_698_57 == freq698 - 1) begin 
            cnt_698_57 <= 0; clk_698_57 <= ~clk_698_57; 
        end else cnt_698_57 <= cnt_698_57 + 1;

        if (cnt_784_57 == freq784 - 1) begin 
            cnt_784_57 <= 0; clk_784_57 <= ~clk_784_57; 
        end else cnt_784_57 <= cnt_784_57 + 1;

        if (cnt_880_57 == freq880 - 1) begin 
            cnt_880_57 <= 0; clk_880_57 <= ~clk_880_57; 
        end else cnt_880_57 <= cnt_880_57 + 1;

        if (cnt_988_57 == freq988 - 1) begin 
            cnt_988_57 <= 0; clk_988_57 <= ~clk_988_57; 
        end else cnt_988_57 <= cnt_988_57 + 1;

        if (cnt_1047_57 == freq1047 - 1) begin 
            cnt_1047_57 <= 0; clk_1047_57 <= ~clk_1047_57; 
        end else cnt_1047_57 <= cnt_1047_57 + 1;
    end
end

// assign clk_1_w_57    = clk_1_57   ;
// assign clk_05_w_57   = clk_05_57  ;
// assign clk_500_w_57  = clk_500_57 ;
// assign clk_1k_w_57   = clk_1k_57  ;
// assign clk_5k_w_57   = clk_5k_57  ;

// assign clk_523_w_57  = clk_523_57 ;
// assign clk_587_w_57  = clk_587_57 ;
// assign clk_659_w_57  = clk_659_57 ;
// assign clk_698_w_57  = clk_698_57 ;
// assign clk_784_w_57  = clk_784_57 ;
// assign clk_880_w_57  = clk_880_57 ;
// assign clk_988_w_57  = clk_988_57 ;
// assign clk_1047_w_57 = clk_1047_57;

endmodule