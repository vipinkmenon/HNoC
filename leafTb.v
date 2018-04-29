`timescale 1ns/1ps

module leafTb();

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
        #2;
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


HLeaf hleaf(
    .i_sclk(sclk),
    .i_mclk(mclk),
    .i_reset(rst),
    .i_topLeft_data(o_pe1_data),
    .i_topLeft_data_valid(o_pe1_data_valid),
    .o_topLeft_data_ready(i_pe1_data_ready),
    .o_topLeft_data(i_pe1_data),
    .o_topLeft_data_valid(i_pe1_data_valid),
    .i_topLeft_data_ready(o_pe1_data_ready),
    .i_bottomLeft_data(o_pe0_data),
    .i_bottomLeft_data_valid(o_pe0_data_valid),
    .o_bottomLeft_data_ready(i_pe0_data_ready),
    .o_bottomLeft_data(i_pe0_data),
    .o_bottomLeft_data_valid(i_pe0_data_valid),
    .i_bottomLeft_data_ready(o_pe0_data_ready),
    .i_topRight_data(o_pe3_data),
    .i_topRight_data_valid(o_pe3_data_valid),
    .o_topRight_data_ready(i_pe3_data_ready),
    .o_topRight_data(i_pe3_data),
    .o_topRight_data_valid(i_pe3_data_valid),
    .i_topRight_data_ready(o_pe3_data_ready),
    .i_bottomRight_data(o_pe2_data),
    .i_bottomRight_data_valid(o_pe2_data_valid),
    .o_bottomRight_data_ready(i_pe2_data_ready),
    .o_bottomRight_data(i_pe2_data),
    .o_bottomRight_data_valid(i_pe2_data_valid),
    .i_bottomRight_data_ready(o_pe2_data_ready),
    .i_centre_data(),
    .i_centre_data_valid(1'b0),
    .o_centre_data_ready(),
    .o_centre_data(),
    .o_centre_data_valid(),
    .i_centre_data_ready(1'b1)
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