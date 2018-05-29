`timescale 1ps/1ps

`define NUMPE 32
`define PktLimit 100
`define expectedPkts `NUMPE*`PktLimit
`define DataWidth 32
`define AddressWidth $clog2(`NUMPE)
`define TotalWidth `DataWidth+`AddressWidth
`define PATTERN "REVERSE"
`define Period1 10000
`define Period2 5000
`define Period3 2500

module tb();

reg clk_100;
reg clk_200;
reg clk_400;
reg rst;

reg[31:0] receivedPkts=0;

integer               receive_log_file;
reg   [100*8:0]       receive_log_file_name = "receive_log.csv";

wire [`TotalWidth-1:0] o_pe0_data;
wire [`TotalWidth-1:0] o_pe1_data;
wire [`TotalWidth-1:0] o_pe2_data;
wire [`TotalWidth-1:0] o_pe3_data;
wire [`TotalWidth-1:0] o_pe4_data;
wire [`TotalWidth-1:0] o_pe5_data;
wire [`TotalWidth-1:0] o_pe6_data;
wire [`TotalWidth-1:0] o_pe7_data;
wire [`TotalWidth-1:0] o_pe8_data;
wire [`TotalWidth-1:0] o_pe9_data;
wire [`TotalWidth-1:0] o_pe10_data;
wire [`TotalWidth-1:0] o_pe11_data;
wire [`TotalWidth-1:0] o_pe12_data;
wire [`TotalWidth-1:0] o_pe13_data;
wire [`TotalWidth-1:0] o_pe14_data;
wire [`TotalWidth-1:0] o_pe15_data;
wire [`TotalWidth-1:0] o_pe16_data;
wire [`TotalWidth-1:0] o_pe17_data;
wire [`TotalWidth-1:0] o_pe18_data;
wire [`TotalWidth-1:0] o_pe19_data;
wire [`TotalWidth-1:0] o_pe20_data;
wire [`TotalWidth-1:0] o_pe21_data;
wire [`TotalWidth-1:0] o_pe22_data;
wire [`TotalWidth-1:0] o_pe23_data;
wire [`TotalWidth-1:0] o_pe24_data;
wire [`TotalWidth-1:0] o_pe25_data;
wire [`TotalWidth-1:0] o_pe26_data;
wire [`TotalWidth-1:0] o_pe27_data;
wire [`TotalWidth-1:0] o_pe28_data;
wire [`TotalWidth-1:0] o_pe29_data;
wire [`TotalWidth-1:0] o_pe30_data;
wire [`TotalWidth-1:0] o_pe31_data;

wire [`TotalWidth-1:0] i_pe0_data;
wire [`TotalWidth-1:0] i_pe1_data;
wire [`TotalWidth-1:0] i_pe2_data;
wire [`TotalWidth-1:0] i_pe3_data;
wire [`TotalWidth-1:0] i_pe4_data;
wire [`TotalWidth-1:0] i_pe5_data;
wire [`TotalWidth-1:0] i_pe6_data;
wire [`TotalWidth-1:0] i_pe7_data;
wire [`TotalWidth-1:0] i_pe8_data;
wire [`TotalWidth-1:0] i_pe9_data;
wire [`TotalWidth-1:0] i_pe10_data;
wire [`TotalWidth-1:0] i_pe11_data;
wire [`TotalWidth-1:0] i_pe12_data;
wire [`TotalWidth-1:0] i_pe13_data;
wire [`TotalWidth-1:0] i_pe14_data;
wire [`TotalWidth-1:0] i_pe15_data;
wire [`TotalWidth-1:0] i_pe16_data;
wire [`TotalWidth-1:0] i_pe17_data;
wire [`TotalWidth-1:0] i_pe18_data;
wire [`TotalWidth-1:0] i_pe19_data;
wire [`TotalWidth-1:0] i_pe20_data;
wire [`TotalWidth-1:0] i_pe21_data;
wire [`TotalWidth-1:0] i_pe22_data;
wire [`TotalWidth-1:0] i_pe23_data;
wire [`TotalWidth-1:0] i_pe24_data;
wire [`TotalWidth-1:0] i_pe25_data;
wire [`TotalWidth-1:0] i_pe26_data;
wire [`TotalWidth-1:0] i_pe27_data;
wire [`TotalWidth-1:0] i_pe28_data;
wire [`TotalWidth-1:0] i_pe29_data;
wire [`TotalWidth-1:0] i_pe30_data;
wire [`TotalWidth-1:0] i_pe31_data;

integer start,stop,delay;

reg done;

initial
begin
    clk_100 = 0;
    receive_log_file = $fopen(receive_log_file_name,"w");
    $fwrite(receive_log_file,"PE Address,Pkt Address,Inject Time,Latency\n");
    forever
    begin
        clk_100 = ~clk_100;
        #(`Period1/2);
    end
end

initial
begin
    clk_200 = 0;
    forever
    begin
        clk_200 = ~clk_200;
        #(`Period2/2);
    end
end

initial
begin
    clk_400 = 0;
    forever
    begin
        clk_400 = ~clk_400;
        #(`Period3/2);
    end
end

initial
begin
    rst = 1;
    #100;
    @(posedge clk_100);
    @(posedge clk_100);
    @(posedge clk_100);
    @(posedge clk_100);
    @(posedge clk_100);
    @(posedge clk_100);
    @(posedge clk_100);
    rst = 0;
    wait(i_pe0_data_ready);
    start = $time;
end

HNoC #(.DataWidth(`DataWidth),.numPE(`NUMPE),.AddrWidth(`AddressWidth))
    HNoC(
    .clk_100(clk_100),
    .clk_200(clk_200),
    .clk_400(clk_400),
    .i_reset(rst),
    
    .i_pe_data0(o_pe0_data),
    .i_pe_data_valid0(o_pe0_data_valid),
    .o_pe_data_ready0(i_pe0_data_ready),
    .o_pe_data0(i_pe0_data),
    .o_pe_data_valid0(i_pe0_data_valid),
    .i_pe_data_ready0(o_pe0_data_ready),
    .i_pe_data1(o_pe1_data),
    
    .i_pe_data_valid1(o_pe1_data_valid),
    .o_pe_data_ready1(i_pe1_data_ready),
    .o_pe_data1(i_pe1_data),
    .o_pe_data_valid1(i_pe1_data_valid),
    .i_pe_data_ready1(o_pe1_data_ready),
    
    .i_pe_data2(o_pe2_data),
    .i_pe_data_valid2(o_pe2_data_valid),
    .o_pe_data_ready2(i_pe2_data_ready),
    .o_pe_data2(i_pe2_data),
    .o_pe_data_valid2(i_pe2_data_valid),
    .i_pe_data_ready2(o_pe2_data_ready),
    
    .i_pe_data3(o_pe3_data),
    .i_pe_data_valid3(o_pe3_data_valid),
    .o_pe_data_ready3(i_pe3_data_ready),
    .o_pe_data3(i_pe3_data),
    .o_pe_data_valid3(i_pe3_data_valid),
    .i_pe_data_ready3(o_pe3_data_ready),
    
    .i_pe_data4(o_pe4_data),
    .i_pe_data_valid4(o_pe4_data_valid),
    .o_pe_data_ready4(i_pe4_data_ready),
    .o_pe_data4(i_pe4_data),
    .o_pe_data_valid4(i_pe4_data_valid),
    .i_pe_data_ready4(o_pe4_data_ready),
    
    .i_pe_data5(o_pe5_data),
    .i_pe_data_valid5(o_pe5_data_valid),
    .o_pe_data_ready5(i_pe5_data_ready),
    .o_pe_data5(i_pe5_data),
    .o_pe_data_valid5(i_pe5_data_valid),
    .i_pe_data_ready5(o_pe5_data_ready),
    
    .i_pe_data6(o_pe6_data),
    .i_pe_data_valid6(o_pe6_data_valid),
    .o_pe_data_ready6(i_pe6_data_ready),
    .o_pe_data6(i_pe6_data),
    .o_pe_data_valid6(i_pe6_data_valid),
    .i_pe_data_ready6(o_pe6_data_ready),
    
    .i_pe_data7(o_pe7_data),
    .i_pe_data_valid7(o_pe7_data_valid),
    .o_pe_data_ready7(i_pe7_data_ready),
    .o_pe_data7(i_pe7_data),
    .o_pe_data_valid7(i_pe7_data_valid),
    .i_pe_data_ready7(o_pe7_data_ready),
    
    .i_pe_data8(o_pe8_data),
    .i_pe_data_valid8(o_pe8_data_valid),
    .o_pe_data_ready8(i_pe8_data_ready),
    .o_pe_data8(i_pe8_data),
    .o_pe_data_valid8(i_pe8_data_valid),
    .i_pe_data_ready8(o_pe8_data_ready),
    
    .i_pe_data9(o_pe9_data),
    .i_pe_data_valid9(o_pe9_data_valid),
    .o_pe_data_ready9(i_pe9_data_ready),
    .o_pe_data9(i_pe9_data),
    .o_pe_data_valid9(i_pe9_data_valid),
    .i_pe_data_ready9(o_pe9_data_ready),
    
    .i_pe_data10(o_pe10_data),
    .i_pe_data_valid10(o_pe10_data_valid),
    .o_pe_data_ready10(i_pe10_data_ready),
    .o_pe_data10(i_pe10_data),
    .o_pe_data_valid10(i_pe10_data_valid),
    .i_pe_data_ready10(o_pe10_data_ready),
    
    .i_pe_data11(o_pe11_data),
    .i_pe_data_valid11(o_pe11_data_valid),
    .o_pe_data_ready11(i_pe11_data_ready),
    .o_pe_data11(i_pe11_data),
    .o_pe_data_valid11(i_pe11_data_valid),
    .i_pe_data_ready11(o_pe11_data_ready),
    
    .i_pe_data12(o_pe12_data),
    .i_pe_data_valid12(o_pe12_data_valid),
    .o_pe_data_ready12(i_pe12_data_ready),
    .o_pe_data12(i_pe12_data),
    .o_pe_data_valid12(i_pe12_data_valid),
    .i_pe_data_ready12(o_pe12_data_ready),
    
    .i_pe_data13(o_pe13_data),
    .i_pe_data_valid13(o_pe13_data_valid),
    .o_pe_data_ready13(i_pe13_data_ready),
    .o_pe_data13(i_pe13_data),
    .o_pe_data_valid13(i_pe13_data_valid),
    .i_pe_data_ready13(o_pe13_data_ready),
    
    .i_pe_data14(o_pe14_data),
    .i_pe_data_valid14(o_pe14_data_valid),
    .o_pe_data_ready14(i_pe14_data_ready),
    .o_pe_data14(i_pe14_data),
    .o_pe_data_valid14(i_pe14_data_valid),
    .i_pe_data_ready14(o_pe14_data_ready),
    
    .i_pe_data15(o_pe15_data),
    .i_pe_data_valid15(o_pe15_data_valid),
    .o_pe_data_ready15(i_pe15_data_ready),
    .o_pe_data15(i_pe15_data),
    .o_pe_data_valid15(i_pe15_data_valid),
    .i_pe_data_ready15(o_pe15_data_ready),
    
    .i_pe_data16(o_pe16_data),
    .i_pe_data_valid16(o_pe16_data_valid),
    .o_pe_data_ready16(i_pe16_data_ready),
    .o_pe_data16(i_pe16_data),
    .o_pe_data_valid16(i_pe16_data_valid),
    .i_pe_data_ready16(o_pe16_data_ready),
    
    .i_pe_data17(o_pe17_data),
    .i_pe_data_valid17(o_pe17_data_valid),
    .o_pe_data_ready17(i_pe17_data_ready),
    .o_pe_data17(i_pe17_data),
    .o_pe_data_valid17(i_pe17_data_valid),
    .i_pe_data_ready17(o_pe17_data_ready),
    
    .i_pe_data18(o_pe18_data),
    .i_pe_data_valid18(o_pe18_data_valid),
    .o_pe_data_ready18(i_pe18_data_ready),
    .o_pe_data18(i_pe18_data),
    .o_pe_data_valid18(i_pe18_data_valid),
    .i_pe_data_ready18(o_pe18_data_ready),
    
    .i_pe_data19(o_pe19_data),
    .i_pe_data_valid19(o_pe19_data_valid),
    .o_pe_data_ready19(i_pe19_data_ready),
    .o_pe_data19(i_pe19_data),
    .o_pe_data_valid19(i_pe19_data_valid),
    .i_pe_data_ready19(o_pe19_data_ready),
    
    .i_pe_data20(o_pe20_data),
    .i_pe_data_valid20(o_pe20_data_valid),
    .o_pe_data_ready20(i_pe20_data_ready),
    .o_pe_data20(i_pe20_data),
    .o_pe_data_valid20(i_pe20_data_valid),
    .i_pe_data_ready20(o_pe20_data_ready),
    
    .i_pe_data21(o_pe21_data),
    .i_pe_data_valid21(o_pe21_data_valid),
    .o_pe_data_ready21(i_pe21_data_ready),
    .o_pe_data21(i_pe21_data),
    .o_pe_data_valid21(i_pe21_data_valid),
    .i_pe_data_ready21(o_pe21_data_ready),
    
    .i_pe_data22(o_pe22_data),
    .i_pe_data_valid22(o_pe22_data_valid),
    .o_pe_data_ready22(i_pe22_data_ready),
    .o_pe_data22(i_pe22_data),
    .o_pe_data_valid22(i_pe22_data_valid),
    .i_pe_data_ready22(o_pe22_data_ready),
    
    .i_pe_data23(o_pe23_data),
    .i_pe_data_valid23(o_pe23_data_valid),
    .o_pe_data_ready23(i_pe23_data_ready),
    .o_pe_data23(i_pe23_data),
    .o_pe_data_valid23(i_pe23_data_valid),
    .i_pe_data_ready23(o_pe23_data_ready),
    
    .i_pe_data24(o_pe24_data),
    .i_pe_data_valid24(o_pe24_data_valid),
    .o_pe_data_ready24(i_pe24_data_ready),
    .o_pe_data24(i_pe24_data),
    .o_pe_data_valid24(i_pe24_data_valid),
    .i_pe_data_ready24(o_pe24_data_ready),
    
    .i_pe_data25(o_pe25_data),
    .i_pe_data_valid25(o_pe25_data_valid),
    .o_pe_data_ready25(i_pe25_data_ready),
    .o_pe_data25(i_pe25_data),
    .o_pe_data_valid25(i_pe25_data_valid),
    .i_pe_data_ready25(o_pe25_data_ready),
    
    .i_pe_data26(o_pe26_data),
    .i_pe_data_valid26(o_pe26_data_valid),
    .o_pe_data_ready26(i_pe26_data_ready),
    .o_pe_data26(i_pe26_data),
    .o_pe_data_valid26(i_pe26_data_valid),
    .i_pe_data_ready26(o_pe26_data_ready),
    
    .i_pe_data27(o_pe27_data),
    .i_pe_data_valid27(o_pe27_data_valid),
    .o_pe_data_ready27(i_pe27_data_ready),
    .o_pe_data27(i_pe27_data),
    .o_pe_data_valid27(i_pe27_data_valid),
    .i_pe_data_ready27(o_pe27_data_ready),
    
    .i_pe_data28(o_pe28_data),
    .i_pe_data_valid28(o_pe28_data_valid),
    .o_pe_data_ready28(i_pe28_data_ready),
    .o_pe_data28(i_pe28_data),
    .o_pe_data_valid28(i_pe28_data_valid),
    .i_pe_data_ready28(o_pe28_data_ready),
    
    .i_pe_data29(o_pe29_data),
    .i_pe_data_valid29(o_pe29_data_valid),
    .o_pe_data_ready29(i_pe29_data_ready),
    .o_pe_data29(i_pe29_data),
    .o_pe_data_valid29(i_pe29_data_valid),
    .i_pe_data_ready29(o_pe29_data_ready),
    
    .i_pe_data30(o_pe30_data),
    .i_pe_data_valid30(o_pe30_data_valid),
    .o_pe_data_ready30(i_pe30_data_ready),
    .o_pe_data30(i_pe30_data),
    .o_pe_data_valid30(i_pe30_data_valid),
    .i_pe_data_ready30(o_pe30_data_ready),
    
    .i_pe_data31(o_pe31_data),
    .i_pe_data_valid31(o_pe31_data_valid),
    .o_pe_data_ready31(i_pe31_data_ready),
    .o_pe_data31(i_pe31_data),
    .o_pe_data_valid31(i_pe31_data_valid),
    .i_pe_data_ready31(o_pe31_data_ready)
);



pe #(.address(0),.numPE(`NUMPE),.AddressWidth(`AddressWidth),.DataWidth(`DataWidth),.TotalWidth(`TotalWidth),.PktLmit(`PktLimit),.Pattern(`PATTERN))pe0(
    .clk(clk_100),
    .rst(rst),
    .i_data(i_pe0_data),
    .i_data_valid(i_pe0_data_valid),
    .o_data_ready(o_pe0_data_ready),
    .o_data(o_pe0_data),
    .o_data_valid(o_pe0_data_valid),
    .i_data_ready(i_pe0_data_ready),
    .done(done)
);

pe #(.address(1),.numPE(`NUMPE),.AddressWidth(`AddressWidth),.DataWidth(`DataWidth),.TotalWidth(`TotalWidth),.PktLmit(`PktLimit),.Pattern(`PATTERN))pe1(
    .clk(clk_100),
    .rst(rst),
    .i_data(i_pe1_data),
    .i_data_valid(i_pe1_data_valid),
    .o_data_ready(o_pe1_data_ready),
    .o_data(o_pe1_data),
    .o_data_valid(o_pe1_data_valid),
    .i_data_ready(i_pe1_data_ready),
    .done(done)
);

pe #(.address(2),.numPE(`NUMPE),.AddressWidth(`AddressWidth),.DataWidth(`DataWidth),.TotalWidth(`TotalWidth),.PktLmit(`PktLimit),.Pattern(`PATTERN))pe2(
    .clk(clk_100),
    .rst(rst),
    .i_data(i_pe2_data),
    .i_data_valid(i_pe2_data_valid),
    .o_data_ready(o_pe2_data_ready),
    .o_data(o_pe2_data),
    .o_data_valid(o_pe2_data_valid),
    .i_data_ready(i_pe2_data_ready),
    .done(done)
);

pe #(.address(3),.numPE(`NUMPE),.AddressWidth(`AddressWidth),.DataWidth(`DataWidth),.TotalWidth(`TotalWidth),.PktLmit(`PktLimit),.Pattern(`PATTERN))pe3(
    .clk(clk_100),
    .rst(rst),
    .i_data(i_pe3_data),
    .i_data_valid(i_pe3_data_valid),
    .o_data_ready(o_pe3_data_ready),
    .o_data(o_pe3_data),
    .o_data_valid(o_pe3_data_valid),
    .i_data_ready(i_pe3_data_ready),
    .done(done)
);

pe #(.address(4),.numPE(`NUMPE),.AddressWidth(`AddressWidth),.DataWidth(`DataWidth),.TotalWidth(`TotalWidth),.PktLmit(`PktLimit),.Pattern(`PATTERN))pe4(
    .clk(clk_100),
    .rst(rst),
    .i_data(i_pe4_data),
    .i_data_valid(i_pe4_data_valid),
    .o_data_ready(o_pe4_data_ready),
    .o_data(o_pe4_data),
    .o_data_valid(o_pe4_data_valid),
    .i_data_ready(i_pe4_data_ready),
    .done(done)
);

pe #(.address(5),.numPE(`NUMPE),.AddressWidth(`AddressWidth),.DataWidth(`DataWidth),.TotalWidth(`TotalWidth),.PktLmit(`PktLimit),.Pattern(`PATTERN))pe5(
    .clk(clk_100),
    .rst(rst),
    .i_data(i_pe5_data),
    .i_data_valid(i_pe5_data_valid),
    .o_data_ready(o_pe5_data_ready),
    .o_data(o_pe5_data),
    .o_data_valid(o_pe5_data_valid),
    .i_data_ready(i_pe5_data_ready),
    .done(done)
);

pe #(.address(6),.numPE(`NUMPE),.AddressWidth(`AddressWidth),.DataWidth(`DataWidth),.TotalWidth(`TotalWidth),.PktLmit(`PktLimit),.Pattern(`PATTERN))pe6(
    .clk(clk_100),
    .rst(rst),
    .i_data(i_pe6_data),
    .i_data_valid(i_pe6_data_valid),
    .o_data_ready(o_pe6_data_ready),
    .o_data(o_pe6_data),
    .o_data_valid(o_pe6_data_valid),
    .i_data_ready(i_pe6_data_ready),
    .done(done)
);

pe #(.address(7),.numPE(`NUMPE),.AddressWidth(`AddressWidth),.DataWidth(`DataWidth),.TotalWidth(`TotalWidth),.PktLmit(`PktLimit),.Pattern(`PATTERN))pe7(
    .clk(clk_100),
    .rst(rst),
    .i_data(i_pe7_data),
    .i_data_valid(i_pe7_data_valid),
    .o_data_ready(o_pe7_data_ready),
    .o_data(o_pe7_data),
    .o_data_valid(o_pe7_data_valid),
    .i_data_ready(i_pe7_data_ready),
    .done(done)
);

pe #(.address(8),.numPE(`NUMPE),.AddressWidth(`AddressWidth),.DataWidth(`DataWidth),.TotalWidth(`TotalWidth),.PktLmit(`PktLimit),.Pattern(`PATTERN))pe8(
    .clk(clk_100),
    .rst(rst),
    .i_data(i_pe8_data),
    .i_data_valid(i_pe8_data_valid),
    .o_data_ready(o_pe8_data_ready),
    .o_data(o_pe8_data),
    .o_data_valid(o_pe8_data_valid),
    .i_data_ready(i_pe8_data_ready),
    .done(done)
);

pe #(.address(9),.numPE(`NUMPE),.AddressWidth(`AddressWidth),.DataWidth(`DataWidth),.TotalWidth(`TotalWidth),.PktLmit(`PktLimit),.Pattern(`PATTERN))pe9(
    .clk(clk_100),
    .rst(rst),
    .i_data(i_pe9_data),
    .i_data_valid(i_pe9_data_valid),
    .o_data_ready(o_pe9_data_ready),
    .o_data(o_pe9_data),
    .o_data_valid(o_pe9_data_valid),
    .i_data_ready(i_pe9_data_ready),
    .done(done)
);

pe #(.address(10),.numPE(`NUMPE),.AddressWidth(`AddressWidth),.DataWidth(`DataWidth),.TotalWidth(`TotalWidth),.PktLmit(`PktLimit),.Pattern(`PATTERN))pe10(
    .clk(clk_100),
    .rst(rst),
    .i_data(i_pe10_data),
    .i_data_valid(i_pe10_data_valid),
    .o_data_ready(o_pe10_data_ready),
    .o_data(o_pe10_data),
    .o_data_valid(o_pe10_data_valid),
    .i_data_ready(i_pe10_data_ready),
    .done(done)
);

pe #(.address(11),.numPE(`NUMPE),.AddressWidth(`AddressWidth),.DataWidth(`DataWidth),.TotalWidth(`TotalWidth),.PktLmit(`PktLimit),.Pattern(`PATTERN))pe11(
    .clk(clk_100),
    .rst(rst),
    .i_data(i_pe11_data),
    .i_data_valid(i_pe11_data_valid),
    .o_data_ready(o_pe11_data_ready),
    .o_data(o_pe11_data),
    .o_data_valid(o_pe11_data_valid),
    .i_data_ready(i_pe11_data_ready),
    .done(done)
);

pe #(.address(12),.numPE(`NUMPE),.AddressWidth(`AddressWidth),.DataWidth(`DataWidth),.TotalWidth(`TotalWidth),.PktLmit(`PktLimit),.Pattern(`PATTERN))pe12(
    .clk(clk_100),
    .rst(rst),
    .i_data(i_pe12_data),
    .i_data_valid(i_pe12_data_valid),
    .o_data_ready(o_pe12_data_ready),
    .o_data(o_pe12_data),
    .o_data_valid(o_pe12_data_valid),
    .i_data_ready(i_pe12_data_ready),
    .done(done)
);

pe #(.address(13),.numPE(`NUMPE),.AddressWidth(`AddressWidth),.DataWidth(`DataWidth),.TotalWidth(`TotalWidth),.PktLmit(`PktLimit),.Pattern(`PATTERN))pe13(
    .clk(clk_100),
    .rst(rst),
    .i_data(i_pe13_data),
    .i_data_valid(i_pe13_data_valid),
    .o_data_ready(o_pe13_data_ready),
    .o_data(o_pe13_data),
    .o_data_valid(o_pe13_data_valid),
    .i_data_ready(i_pe13_data_ready),
    .done(done)
);

pe #(.address(14),.numPE(`NUMPE),.AddressWidth(`AddressWidth),.DataWidth(`DataWidth),.TotalWidth(`TotalWidth),.PktLmit(`PktLimit),.Pattern(`PATTERN))pe14(
    .clk(clk_100),
    .rst(rst),
    .i_data(i_pe14_data),
    .i_data_valid(i_pe14_data_valid),
    .o_data_ready(o_pe14_data_ready),
    .o_data(o_pe14_data),
    .o_data_valid(o_pe14_data_valid),
    .i_data_ready(i_pe14_data_ready),
    .done(done)
);

pe #(.address(15),.numPE(`NUMPE),.AddressWidth(`AddressWidth),.DataWidth(`DataWidth),.TotalWidth(`TotalWidth),.PktLmit(`PktLimit),.Pattern(`PATTERN))pe15(
    .clk(clk_100),
    .rst(rst),
    .i_data(i_pe15_data),
    .i_data_valid(i_pe15_data_valid),
    .o_data_ready(o_pe15_data_ready),
    .o_data(o_pe15_data),
    .o_data_valid(o_pe15_data_valid),
    .i_data_ready(i_pe15_data_ready),
    .done(done)
);



pe #(.address(16),.numPE(`NUMPE),.AddressWidth(`AddressWidth),.DataWidth(`DataWidth),.TotalWidth(`TotalWidth),.PktLmit(`PktLimit),.Pattern(`PATTERN))pe16(
    .clk(clk_100),
    .rst(rst),
    .i_data(i_pe16_data),
    .i_data_valid(i_pe16_data_valid),
    .o_data_ready(o_pe16_data_ready),
    .o_data(o_pe16_data),
    .o_data_valid(o_pe16_data_valid),
    .i_data_ready(i_pe16_data_ready),
    .done(done)
);

pe #(.address(17),.numPE(`NUMPE),.AddressWidth(`AddressWidth),.DataWidth(`DataWidth),.TotalWidth(`TotalWidth),.PktLmit(`PktLimit),.Pattern(`PATTERN))pe17(
    .clk(clk_100),
    .rst(rst),
    .i_data(i_pe17_data),
    .i_data_valid(i_pe17_data_valid),
    .o_data_ready(o_pe17_data_ready),
    .o_data(o_pe17_data),
    .o_data_valid(o_pe17_data_valid),
    .i_data_ready(i_pe17_data_ready),
    .done(done)
);

pe #(.address(18),.numPE(`NUMPE),.AddressWidth(`AddressWidth),.DataWidth(`DataWidth),.TotalWidth(`TotalWidth),.PktLmit(`PktLimit),.Pattern(`PATTERN))pe18(
    .clk(clk_100),
    .rst(rst),
    .i_data(i_pe18_data),
    .i_data_valid(i_pe18_data_valid),
    .o_data_ready(o_pe18_data_ready),
    .o_data(o_pe18_data),
    .o_data_valid(o_pe18_data_valid),
    .i_data_ready(i_pe18_data_ready),
    .done(done)
);

pe #(.address(19),.numPE(`NUMPE),.AddressWidth(`AddressWidth),.DataWidth(`DataWidth),.TotalWidth(`TotalWidth),.PktLmit(`PktLimit),.Pattern(`PATTERN))pe19(
    .clk(clk_100),
    .rst(rst),
    .i_data(i_pe19_data),
    .i_data_valid(i_pe19_data_valid),
    .o_data_ready(o_pe19_data_ready),
    .o_data(o_pe19_data),
    .o_data_valid(o_pe19_data_valid),
    .i_data_ready(i_pe19_data_ready),
    .done(done)
);

pe #(.address(20),.numPE(`NUMPE),.AddressWidth(`AddressWidth),.DataWidth(`DataWidth),.TotalWidth(`TotalWidth),.PktLmit(`PktLimit),.Pattern(`PATTERN))pe20(
    .clk(clk_100),
    .rst(rst),
    .i_data(i_pe20_data),
    .i_data_valid(i_pe20_data_valid),
    .o_data_ready(o_pe20_data_ready),
    .o_data(o_pe20_data),
    .o_data_valid(o_pe20_data_valid),
    .i_data_ready(i_pe20_data_ready),
    .done(done)
);

pe #(.address(21),.numPE(`NUMPE),.AddressWidth(`AddressWidth),.DataWidth(`DataWidth),.TotalWidth(`TotalWidth),.PktLmit(`PktLimit),.Pattern(`PATTERN))pe21(
    .clk(clk_100),
    .rst(rst),
    .i_data(i_pe21_data),
    .i_data_valid(i_pe21_data_valid),
    .o_data_ready(o_pe21_data_ready),
    .o_data(o_pe21_data),
    .o_data_valid(o_pe21_data_valid),
    .i_data_ready(i_pe21_data_ready),
    .done(done)
);

pe #(.address(22),.numPE(`NUMPE),.AddressWidth(`AddressWidth),.DataWidth(`DataWidth),.TotalWidth(`TotalWidth),.PktLmit(`PktLimit),.Pattern(`PATTERN))pe22(
    .clk(clk_100),
    .rst(rst),
    .i_data(i_pe22_data),
    .i_data_valid(i_pe22_data_valid),
    .o_data_ready(o_pe22_data_ready),
    .o_data(o_pe22_data),
    .o_data_valid(o_pe22_data_valid),
    .i_data_ready(i_pe22_data_ready),
    .done(done)
);

pe #(.address(23),.numPE(`NUMPE),.AddressWidth(`AddressWidth),.DataWidth(`DataWidth),.TotalWidth(`TotalWidth),.PktLmit(`PktLimit),.Pattern(`PATTERN))pe23(
    .clk(clk_100),
    .rst(rst),
    .i_data(i_pe23_data),
    .i_data_valid(i_pe23_data_valid),
    .o_data_ready(o_pe23_data_ready),
    .o_data(o_pe23_data),
    .o_data_valid(o_pe23_data_valid),
    .i_data_ready(i_pe23_data_ready),
    .done(done)
);

pe #(.address(24),.numPE(`NUMPE),.AddressWidth(`AddressWidth),.DataWidth(`DataWidth),.TotalWidth(`TotalWidth),.PktLmit(`PktLimit),.Pattern(`PATTERN))pe24(
    .clk(clk_100),
    .rst(rst),
    .i_data(i_pe24_data),
    .i_data_valid(i_pe24_data_valid),
    .o_data_ready(o_pe24_data_ready),
    .o_data(o_pe24_data),
    .o_data_valid(o_pe24_data_valid),
    .i_data_ready(i_pe24_data_ready),
    .done(done)
);

pe #(.address(25),.numPE(`NUMPE),.AddressWidth(`AddressWidth),.DataWidth(`DataWidth),.TotalWidth(`TotalWidth),.PktLmit(`PktLimit),.Pattern(`PATTERN))pe25(
    .clk(clk_100),
    .rst(rst),
    .i_data(i_pe25_data),
    .i_data_valid(i_pe25_data_valid),
    .o_data_ready(o_pe25_data_ready),
    .o_data(o_pe25_data),
    .o_data_valid(o_pe25_data_valid),
    .i_data_ready(i_pe25_data_ready),
    .done(done)
);

pe #(.address(26),.numPE(`NUMPE),.AddressWidth(`AddressWidth),.DataWidth(`DataWidth),.TotalWidth(`TotalWidth),.PktLmit(`PktLimit),.Pattern(`PATTERN))pe26(
    .clk(clk_100),
    .rst(rst),
    .i_data(i_pe26_data),
    .i_data_valid(i_pe26_data_valid),
    .o_data_ready(o_pe26_data_ready),
    .o_data(o_pe26_data),
    .o_data_valid(o_pe26_data_valid),
    .i_data_ready(i_pe26_data_ready),
    .done(done)
);

pe #(.address(27),.numPE(`NUMPE),.AddressWidth(`AddressWidth),.DataWidth(`DataWidth),.TotalWidth(`TotalWidth),.PktLmit(`PktLimit),.Pattern(`PATTERN))pe27(
    .clk(clk_100),
    .rst(rst),
    .i_data(i_pe27_data),
    .i_data_valid(i_pe27_data_valid),
    .o_data_ready(o_pe27_data_ready),
    .o_data(o_pe27_data),
    .o_data_valid(o_pe27_data_valid),
    .i_data_ready(i_pe27_data_ready),
    .done(done)
);

pe #(.address(28),.numPE(`NUMPE),.AddressWidth(`AddressWidth),.DataWidth(`DataWidth),.TotalWidth(`TotalWidth),.PktLmit(`PktLimit),.Pattern(`PATTERN))pe28(
    .clk(clk_100),
    .rst(rst),
    .i_data(i_pe28_data),
    .i_data_valid(i_pe28_data_valid),
    .o_data_ready(o_pe28_data_ready),
    .o_data(o_pe28_data),
    .o_data_valid(o_pe28_data_valid),
    .i_data_ready(i_pe28_data_ready),
    .done(done)
);

pe #(.address(29),.numPE(`NUMPE),.AddressWidth(`AddressWidth),.DataWidth(`DataWidth),.TotalWidth(`TotalWidth),.PktLmit(`PktLimit),.Pattern(`PATTERN))pe29(
    .clk(clk_100),
    .rst(rst),
    .i_data(i_pe29_data),
    .i_data_valid(i_pe29_data_valid),
    .o_data_ready(o_pe29_data_ready),
    .o_data(o_pe29_data),
    .o_data_valid(o_pe29_data_valid),
    .i_data_ready(i_pe29_data_ready),
    .done(done)
);

pe #(.address(30),.numPE(`NUMPE),.AddressWidth(`AddressWidth),.DataWidth(`DataWidth),.TotalWidth(`TotalWidth),.PktLmit(`PktLimit),.Pattern(`PATTERN))pe30(
    .clk(clk_100),
    .rst(rst),
    .i_data(i_pe30_data),
    .i_data_valid(i_pe30_data_valid),
    .o_data_ready(o_pe30_data_ready),
    .o_data(o_pe30_data),
    .o_data_valid(o_pe30_data_valid),
    .i_data_ready(i_pe30_data_ready),
    .done(done)
);

pe #(.address(31),.numPE(`NUMPE),.AddressWidth(`AddressWidth),.DataWidth(`DataWidth),.TotalWidth(`TotalWidth),.PktLmit(`PktLimit),.Pattern(`PATTERN))pe31(
    .clk(clk_100),
    .rst(rst),
    .i_data(i_pe31_data),
    .i_data_valid(i_pe31_data_valid),
    .o_data_ready(o_pe31_data_ready),
    .o_data(o_pe31_data),
    .o_data_valid(o_pe31_data_valid),
    .i_data_ready(i_pe31_data_ready),
    .done(done)
);

always @(posedge clk_100)
begin
    if(rst)
        receivedPkts = 0;
    else
    begin
        receivedPkts = receivedPkts + i_pe0_data_valid + i_pe1_data_valid + i_pe2_data_valid + i_pe3_data_valid +
        i_pe4_data_valid + i_pe5_data_valid + i_pe6_data_valid + i_pe7_data_valid + i_pe8_data_valid + i_pe9_data_valid +
        i_pe10_data_valid + i_pe11_data_valid + i_pe12_data_valid + i_pe13_data_valid + i_pe14_data_valid + i_pe15_data_valid + 
        i_pe16_data_valid + i_pe17_data_valid + i_pe18_data_valid + i_pe19_data_valid + i_pe20_data_valid + i_pe21_data_valid + 
        i_pe22_data_valid + i_pe23_data_valid + i_pe24_data_valid + i_pe25_data_valid + i_pe26_data_valid + i_pe27_data_valid + 
        i_pe28_data_valid + i_pe29_data_valid + i_pe30_data_valid + i_pe31_data_valid;
        
        if(receivedPkts == `expectedPkts)
        begin
            done = 1;
            stop = $time;
            $display("Start time %d Stop time %d",start,stop);
            $display("Throughput : %f",`expectedPkts*1.0/((stop-start)/`Period1));
            #1000;
            $fclose(receive_log_file_name);
            $stop;
        end
    end
end

endmodule