`timescale 1ns/1ps

module tb();

reg clk;
reg rst;

reg[31:0] receivedPkts=0;

integer               receive_log_file;
reg   [100*8:0]       receive_log_file_name = "receive_log.csv";

wire [31:0] o_pe0_data;
wire [31:0] o_pe1_data;
wire [31:0] o_pe2_data;
wire [31:0] o_pe3_data;
wire [31:0] o_pe4_data;
wire [31:0] o_pe5_data;
wire [31:0] o_pe6_data;
wire [31:0] o_pe7_data;
wire [31:0] o_pe8_data;
wire [31:0] o_pe9_data;
wire [31:0] o_pe10_data;
wire [31:0] o_pe11_data;
wire [31:0] o_pe12_data;
wire [31:0] o_pe13_data;
wire [31:0] o_pe14_data;
wire [31:0] o_pe15_data;


wire [31:0] i_pe0_data;
wire [31:0] i_pe1_data;
wire [31:0] i_pe2_data;
wire [31:0] i_pe3_data;
wire [31:0] i_pe4_data;
wire [31:0] i_pe5_data;
wire [31:0] i_pe6_data;
wire [31:0] i_pe7_data;
wire [31:0] i_pe8_data;
wire [31:0] i_pe9_data;
wire [31:0] i_pe10_data;
wire [31:0] i_pe11_data;
wire [31:0] i_pe12_data;
wire [31:0] i_pe13_data;
wire [31:0] i_pe14_data;
wire [31:0] i_pe15_data;

initial
begin
    clk = 0;
    receive_log_file = $fopen(receive_log_file_name,"w");
    forever
    begin
        clk = ~clk;
        #5;
    end
end

initial
begin
    rst = 1;
    #100;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    rst = 0;
end

HNoC HNoC(
    .i_clk(clk),
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
    .i_pe_data_ready15(o_pe15_data_ready)
);



pe #(.address(0))pe0(
    .clk(clk),
    .rst(rst),
    .i_data(i_pe0_data),
    .i_data_valid(i_pe0_data_valid),
    .o_data_ready(o_pe0_data_ready),
    .o_data(o_pe0_data),
    .o_data_valid(o_pe0_data_valid),
    .i_data_ready(i_pe0_data_ready)
);

pe #(.address(1))pe1(
    .clk(clk),
    .rst(rst),
    .i_data(i_pe1_data),
    .i_data_valid(i_pe1_data_valid),
    .o_data_ready(o_pe1_data_ready),
    .o_data(o_pe1_data),
    .o_data_valid(o_pe1_data_valid),
    .i_data_ready(i_pe1_data_ready)
);

pe #(.address(2))pe2(
    .clk(clk),
    .rst(rst),
    .i_data(i_pe2_data),
    .i_data_valid(i_pe2_data_valid),
    .o_data_ready(o_pe2_data_ready),
    .o_data(o_pe2_data),
    .o_data_valid(o_pe2_data_valid),
    .i_data_ready(i_pe2_data_ready)
);

pe #(.address(3))pe3(
    .clk(clk),
    .rst(rst),
    .i_data(i_pe3_data),
    .i_data_valid(i_pe3_data_valid),
    .o_data_ready(o_pe3_data_ready),
    .o_data(o_pe3_data),
    .o_data_valid(o_pe3_data_valid),
    .i_data_ready(i_pe3_data_ready)
);

pe #(.address(4))pe4(
    .clk(clk),
    .rst(rst),
    .i_data(i_pe4_data),
    .i_data_valid(i_pe4_data_valid),
    .o_data_ready(o_pe4_data_ready),
    .o_data(o_pe4_data),
    .o_data_valid(o_pe4_data_valid),
    .i_data_ready(i_pe4_data_ready)
);

pe #(.address(5))pe5(
    .clk(clk),
    .rst(rst),
    .i_data(i_pe5_data),
    .i_data_valid(i_pe5_data_valid),
    .o_data_ready(o_pe5_data_ready),
    .o_data(o_pe5_data),
    .o_data_valid(o_pe5_data_valid),
    .i_data_ready(i_pe5_data_ready)
);

pe #(.address(6))pe6(
    .clk(clk),
    .rst(rst),
    .i_data(i_pe6_data),
    .i_data_valid(i_pe6_data_valid),
    .o_data_ready(o_pe6_data_ready),
    .o_data(o_pe6_data),
    .o_data_valid(o_pe6_data_valid),
    .i_data_ready(i_pe6_data_ready)
);

pe #(.address(7))pe7(
    .clk(clk),
    .rst(rst),
    .i_data(i_pe7_data),
    .i_data_valid(i_pe7_data_valid),
    .o_data_ready(o_pe7_data_ready),
    .o_data(o_pe7_data),
    .o_data_valid(o_pe7_data_valid),
    .i_data_ready(i_pe7_data_ready)
);

pe #(.address(8))pe8(
    .clk(clk),
    .rst(rst),
    .i_data(i_pe8_data),
    .i_data_valid(i_pe8_data_valid),
    .o_data_ready(o_pe8_data_ready),
    .o_data(o_pe8_data),
    .o_data_valid(o_pe8_data_valid),
    .i_data_ready(i_pe8_data_ready)
);

pe #(.address(9))pe9(
    .clk(clk),
    .rst(rst),
    .i_data(i_pe9_data),
    .i_data_valid(i_pe9_data_valid),
    .o_data_ready(o_pe9_data_ready),
    .o_data(o_pe9_data),
    .o_data_valid(o_pe9_data_valid),
    .i_data_ready(i_pe9_data_ready)
);

pe #(.address(10))pe10(
    .clk(clk),
    .rst(rst),
    .i_data(i_pe10_data),
    .i_data_valid(i_pe10_data_valid),
    .o_data_ready(o_pe10_data_ready),
    .o_data(o_pe10_data),
    .o_data_valid(o_pe10_data_valid),
    .i_data_ready(i_pe10_data_ready)
);

pe #(.address(11))pe11(
    .clk(clk),
    .rst(rst),
    .i_data(i_pe11_data),
    .i_data_valid(i_pe11_data_valid),
    .o_data_ready(o_pe11_data_ready),
    .o_data(o_pe11_data),
    .o_data_valid(o_pe11_data_valid),
    .i_data_ready(i_pe11_data_ready)
);

pe #(.address(12))pe12(
    .clk(clk),
    .rst(rst),
    .i_data(i_pe12_data),
    .i_data_valid(i_pe12_data_valid),
    .o_data_ready(o_pe12_data_ready),
    .o_data(o_pe12_data),
    .o_data_valid(o_pe12_data_valid),
    .i_data_ready(i_pe12_data_ready)
);

pe #(.address(13))pe13(
    .clk(clk),
    .rst(rst),
    .i_data(i_pe13_data),
    .i_data_valid(i_pe13_data_valid),
    .o_data_ready(o_pe13_data_ready),
    .o_data(o_pe13_data),
    .o_data_valid(o_pe13_data_valid),
    .i_data_ready(i_pe13_data_ready)
);

pe #(.address(14))pe14(
    .clk(clk),
    .rst(rst),
    .i_data(i_pe14_data),
    .i_data_valid(i_pe14_data_valid),
    .o_data_ready(o_pe14_data_ready),
    .o_data(o_pe14_data),
    .o_data_valid(o_pe14_data_valid),
    .i_data_ready(i_pe14_data_ready)
);

pe #(.address(15))pe15(
    .clk(clk),
    .rst(rst),
    .i_data(i_pe15_data),
    .i_data_valid(i_pe15_data_valid),
    .o_data_ready(o_pe15_data_ready),
    .o_data(o_pe15_data),
    .o_data_valid(o_pe15_data_valid),
    .i_data_ready(i_pe15_data_ready)
);

always @(posedge clk)
begin
    if(rst)
        receivedPkts = 0;
    else
        receivedPkts = receivedPkts + i_pe0_data_valid + i_pe1_data_valid + i_pe2_data_valid + i_pe3_data_valid +
        i_pe4_data_valid + i_pe5_data_valid + i_pe6_data_valid + i_pe7_data_valid + i_pe8_data_valid + i_pe9_data_valid +
        i_pe10_data_valid + i_pe11_data_valid + i_pe12_data_valid + i_pe13_data_valid + i_pe14_data_valid + i_pe15_data_valid;
end

endmodule