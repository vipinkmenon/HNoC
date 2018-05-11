module HLeaf #(parameter DataWidth = 36,AddrWidth = 4,sw1bottomMin=0,sw1bottomMax=0,sw1topMin=1,sw1topMax=1,sw2bottomMin=0,
sw2bottomMax=1,sw2topMin=2,sw2topMax=3,sw3bottomMin=2,sw3bottomMax=2,sw3topMin=3,sw3topMax=3)(
input   wire    i_sclk,
input   wire    i_mclk,
input   wire    i_reset,
//topLeft
input	wire	[DataWidth-1:0] i_topLeft_data,
input	wire	i_topLeft_data_valid,
output	wire	o_topLeft_data_ready,
output	wire	[DataWidth-1:0] o_topLeft_data,
output	wire	o_topLeft_data_valid,
input   wire	i_topLeft_data_ready,
//bottomLeft
input	wire	[DataWidth-1:0] i_bottomLeft_data,
input	wire	i_bottomLeft_data_valid,
output	wire	o_bottomLeft_data_ready,
output	wire	[DataWidth-1:0] o_bottomLeft_data,
output	wire	o_bottomLeft_data_valid,
input   wire	i_bottomLeft_data_ready,
//topRight
input	wire	[DataWidth-1:0] i_topRight_data,
input	wire	i_topRight_data_valid,
output	wire	o_topRight_data_ready,
output	wire	[DataWidth-1:0] o_topRight_data,
output	wire	o_topRight_data_valid,
input   wire	i_topRight_data_ready,
//bottomRight
input	wire	[DataWidth-1:0] i_bottomRight_data,
input	wire	i_bottomRight_data_valid,
output	wire	o_bottomRight_data_ready,
output	wire	[DataWidth-1:0] o_bottomRight_data,
output	wire	o_bottomRight_data_valid,
input   wire	i_bottomRight_data_ready,
//Centre
input	wire	[DataWidth-1:0] i_centre_data,
input	wire	i_centre_data_valid,
output	wire	o_centre_data_ready,
output	wire	[DataWidth-1:0] o_centre_data,
output	wire	o_centre_data_valid,
input   wire	i_centre_data_ready
);

wire [DataWidth-1:0] switch1to2data;
wire        switch1to2dataValid;
wire        switch1to2dataReady;
wire [DataWidth-1:0] switch2to1data;
wire        switch2to1dataValid;
wire        switch2to1dataReady;
wire [DataWidth-1:0] switch2to3data;
wire        switch2to3dataValid;
wire        switch2to3dataReady;
wire [DataWidth-1:0] switch3to2data;
wire        switch3to2dataValid;
wire        switch3to2dataReady;

switch1 #(
.DataWidth(DataWidth),
.AddrWidth(AddrWidth),
.bottomMin(sw1bottomMin),
.bottomMax(sw1bottomMax),
.topMin(sw1topMin),
.topMax(sw1topMax)
)sw1(
    .i_sclk(i_sclk),
    .i_mclk(i_mclk),
    .i_reset(i_reset),
    //top
    .i_data1(i_topLeft_data),
    .i_data_valid1(i_topLeft_data_valid),
    .o_data_ready1(o_topLeft_data_ready),
    .o_data1(o_topLeft_data),
    .o_data_valid1(o_topLeft_data_valid),
    .i_data_ready1(i_topLeft_data_ready),
    //bottom
    .i_data2(i_bottomLeft_data),
    .i_data_valid2(i_bottomLeft_data_valid),
    .o_data_ready2(o_bottomLeft_data_ready),
    .o_data2(o_bottomLeft_data),
    .o_data_valid2(o_bottomLeft_data_valid),
    .i_data_ready2(i_bottomLeft_data_ready),
    //right
    .i_data3(switch2to1data),
    .i_data_valid3(switch2to1dataValid),
    .o_data_ready3(switch2to1dataReady),
    .o_data3(switch1to2data),
    .o_data_valid3(switch1to2dataValid),
    .i_data_ready3(switch1to2dataReady)
);

switchSingleClock #(
.DataWidth(DataWidth),
.AddrWidth(AddrWidth),
.bottomMin(sw2bottomMin),
.bottomMax(sw2bottomMax),
.topMin(sw2topMin),
.topMax(sw2topMax)
)sw2(
    .i_clk(i_mclk),
    .i_reset(i_reset),
    //top
    .i_data1(switch3to2data),
    .i_data_valid1(switch3to2dataValid),
    .o_data_ready1(switch3to2dataReady),
    .o_data1(switch2to3data),
    .o_data_valid1(switch2to3dataValid),
    .i_data_ready1(switch2to3dataReady),
    //bottom
    .i_data2(switch1to2data),
    .i_data_valid2(switch1to2dataValid),
    .o_data_ready2(switch1to2dataReady),
    .o_data2(switch2to1data),
    .o_data_valid2(switch2to1dataValid),
    .i_data_ready2(switch2to1dataReady),
    //right
    .i_data3(i_centre_data),
    .i_data_valid3(i_centre_data_valid),
    .o_data_ready3(o_centre_data_ready),
    .o_data3(o_centre_data),
    .o_data_valid3(o_centre_data_valid),
    .i_data_ready3(i_centre_data_ready)
);

switch1 #(
.DataWidth(DataWidth),
.AddrWidth(AddrWidth),
.bottomMin(sw3bottomMin),
.bottomMax(sw3bottomMax),
.topMin(sw3topMin),
.topMax(sw3topMax)
)sw3(
    .i_sclk(i_sclk),
    .i_mclk(i_mclk),
    .i_reset(i_reset),
    //top
    .i_data1(i_topRight_data),
    .i_data_valid1(i_topRight_data_valid),
    .o_data_ready1(o_topRight_data_ready),
    .o_data1(o_topRight_data),
    .o_data_valid1(o_topRight_data_valid),
    .i_data_ready1(i_topRight_data_ready),
    //bottom
    .i_data2(i_bottomRight_data),
    .i_data_valid2(i_bottomRight_data_valid),
    .o_data_ready2(o_bottomRight_data_ready),
    .o_data2(o_bottomRight_data),
    .o_data_valid2(o_bottomRight_data_valid),
    .i_data_ready2(i_bottomRight_data_ready),
    //right
    .i_data3(switch2to3data),
    .i_data_valid3(switch2to3dataValid),
    .o_data_ready3(switch2to3dataReady),
    .o_data3(switch3to2data),
    .o_data_valid3(switch3to2dataValid),
    .i_data_ready3(switch3to2dataReady)
);


endmodule