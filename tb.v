`timescale 1ns/1ps

module tb();

reg sclk;
reg mclk;
reg rst;

reg[31:0] receivedPkts=0;

wire [31:0] o_pe0_data;
wire [31:0] o_pe1_data;
wire [31:0] o_pe2_data;
wire [31:0] o_pe3_data;
wire [31:0] i_pe0_data;
wire [31:0] i_pe1_data;
wire [31:0] i_pe2_data;
wire [31:0] i_pe3_data;

initial
begin
    sclk = 0;
    forever
    begin
        sclk = ~sclk;
        #5;
    end
end

initial
begin
    mclk = 0;
    forever
    begin
        mclk = ~mclk;
        #4;
    end
end

initial
begin
    rst = 1;
    #100;
    @(posedge sclk);
    @(posedge sclk);
    @(posedge sclk);
    @(posedge sclk);
    @(posedge sclk);
    @(posedge sclk);
    @(posedge sclk);
    rst = 0;
end

HNoC hnoc(
    .i_sclk(sclk),
    .i_mclk(mclk),
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
    .i_pe_data_ready3(o_pe3_data_ready)
);


pe #(.address(0))pe0(
    .clk(sclk),
    .rst(rst),
    .i_data(i_pe0_data),
    .i_data_valid(i_pe0_data_valid),
    .o_data_ready(o_pe0_data_ready),
    .o_data(o_pe0_data),
    .o_data_valid(o_pe0_data_valid),
    .i_data_ready(i_pe0_data_ready)
);

pe #(.address(1))pe1(
    .clk(sclk),
    .rst(rst),
    .i_data(i_pe1_data),
    .i_data_valid(i_pe1_data_valid),
    .o_data_ready(o_pe1_data_ready),
    .o_data(o_pe1_data),
    .o_data_valid(o_pe1_data_valid),
    .i_data_ready(i_pe1_data_ready)
);

pe #(.address(2))pe2(
    .clk(sclk),
    .rst(rst),
    .i_data(i_pe2_data),
    .i_data_valid(i_pe2_data_valid),
    .o_data_ready(o_pe2_data_ready),
    .o_data(o_pe2_data),
    .o_data_valid(o_pe2_data_valid),
    .i_data_ready(i_pe2_data_ready)
);

pe #(.address(3))pe3(
    .clk(sclk),
    .rst(rst),
    .i_data(i_pe3_data),
    .i_data_valid(i_pe3_data_valid),
    .o_data_ready(o_pe3_data_ready),
    .o_data(o_pe3_data),
    .o_data_valid(o_pe3_data_valid),
    .i_data_ready(i_pe3_data_ready)
);

always @(posedge sclk)
begin
    if(rst)
        receivedPkts = 0;
    else
        receivedPkts = receivedPkts + i_pe0_data_valid + i_pe1_data_valid + i_pe2_data_valid + i_pe3_data_valid;
end

endmodule