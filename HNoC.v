module HNoC #(parameter DataWidth = 32)(
input   wire    i_clk,
input   wire    i_reset,
//pe 0
input	wire	[DataWidth-1:0] i_pe_data0,
input	wire	i_pe_data_valid0,
output	wire	o_pe_data_ready0,
output	wire	[DataWidth-1:0] o_pe_data0,
output	wire	o_pe_data_valid0,
input   wire	i_pe_data_ready0,
//pe 1
input	wire	[DataWidth-1:0] i_pe_data1,
input	wire	i_pe_data_valid1,
output	wire	o_pe_data_ready1,
output	wire	[DataWidth-1:0] o_pe_data1,
output	wire	o_pe_data_valid1,
input   wire	i_pe_data_ready1,
//pe 2
input	wire	[DataWidth-1:0] i_pe_data2,
input	wire	i_pe_data_valid2,
output	wire	o_pe_data_ready2,
output	wire	[DataWidth-1:0] o_pe_data2,
output	wire	o_pe_data_valid2,
input   wire	i_pe_data_ready2,
//pe 3
input	wire	[DataWidth-1:0] i_pe_data3,
input	wire	i_pe_data_valid3,
output	wire	o_pe_data_ready3,
output	wire	[DataWidth-1:0] o_pe_data3,
output	wire	o_pe_data_valid3,
input   wire	i_pe_data_ready3
);

wire [31:0] switch1to2data;
wire        switch1to2dataValid;
wire        switch1to2dataReady;
wire [31:0] switch2to1data;
wire        switch2to1dataValid;
wire        switch2to1dataReady;

switch #(
.DataWidth(32),
.bottomMin(0),
.bottomMax(0),
.topMin(1),
.topMax(1)
)sw1(
    .i_clk(i_clk),
    .i_reset(i_reset),
    //top
    .i_data1(i_pe_data2),
    .i_data_valid1(i_pe_data_valid2),
    .o_data_ready1(o_pe_data_ready2),
    .o_data1(o_pe_data2),
    .o_data_valid1(o_pe_data_valid2),
    .i_data_ready1(i_pe_data_ready2),
    //bottom
    .i_data2(i_pe_data0),
    .i_data_valid2(i_pe_data_valid0),
    .o_data_ready2(o_pe_data_ready0),
    .o_data2(o_pe_data0),
    .o_data_valid2(o_pe_data_valid0),
    .i_data_ready2(i_pe_data_ready0),
    //right
    .i_data3(switch2to1data),
    .i_data_valid3(switch2to1dataValid),
    .o_data_ready3(switch2to1dataReady),
    .o_data3(switch1to2data),
    .o_data_valid3(switch1to2dataValid),
    .i_data_ready3(switch1to2dataReady)
);

switch #(
.DataWidth(32),
.bottomMin(2),
.bottomMax(2),
.topMin(3),
.topMax(3)
)sw2(
    .i_clk(i_clk),
    .i_reset(i_reset),
    //top
    .i_data1(i_pe_data3),
    .i_data_valid1(i_pe_data_valid3),
    .o_data_ready1(o_pe_data_ready3),
    .o_data1(o_pe_data3),
    .o_data_valid1(o_pe_data_valid3),
    .i_data_ready1(i_pe_data_ready3),
    //bottom
    .i_data2(i_pe_data1),
    .i_data_valid2(i_pe_data_valid1),
    .o_data_ready2(o_pe_data_ready1),
    .o_data2(o_pe_data1),
    .o_data_valid2(o_pe_data_valid1),
    .i_data_ready2(i_pe_data_ready1),
    //right
    .i_data3(switch1to2data),
    .i_data_valid3(switch1to2dataValid),
    .o_data_ready3(switch1to2dataReady),
    .o_data3(switch2to1data),
    .o_data_valid3(switch2to1dataValid),
    .i_data_ready3(switch2to1dataReady)
);

endmodule