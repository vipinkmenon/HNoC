module BTree #(parameter DataWidth = 32,numPE = 8,AddrWidth=3)(
input   wire    clk_100,
input   wire    i_reset,
//pe 0
input	wire	[DataWidth+AddrWidth-1:0] i_pe_data0,
input	wire	i_pe_data_valid0,
output	wire	o_pe_data_ready0,
output	wire	[DataWidth+AddrWidth-1:0] o_pe_data0,
output	wire	o_pe_data_valid0,
input   wire	i_pe_data_ready0,
//pe 1
input	wire	[DataWidth+AddrWidth-1:0] i_pe_data1,
input	wire	i_pe_data_valid1,
output	wire	o_pe_data_ready1,
output	wire	[DataWidth+AddrWidth-1:0] o_pe_data1,
output	wire	o_pe_data_valid1,
input   wire	i_pe_data_ready1,
//pe 2
input	wire	[DataWidth+AddrWidth-1:0] i_pe_data2,
input	wire	i_pe_data_valid2,
output	wire	o_pe_data_ready2,
output	wire	[DataWidth+AddrWidth-1:0] o_pe_data2,
output	wire	o_pe_data_valid2,
input   wire	i_pe_data_ready2,
//pe 3
input	wire	[DataWidth+AddrWidth-1:0] i_pe_data3,
input	wire	i_pe_data_valid3,
output	wire	o_pe_data_ready3,
output	wire	[DataWidth+AddrWidth-1:0] o_pe_data3,
output	wire	o_pe_data_valid3,
input   wire	i_pe_data_ready3,
//pe 4
input	wire	[DataWidth+AddrWidth-1:0] i_pe_data4,
input	wire	i_pe_data_valid4,
output	wire	o_pe_data_ready4,
output	wire	[DataWidth+AddrWidth-1:0] o_pe_data4,
output	wire	o_pe_data_valid4,
input   wire	i_pe_data_ready4,
//pe 5
input	wire	[DataWidth+AddrWidth-1:0] i_pe_data5,
input	wire	i_pe_data_valid5,
output	wire	o_pe_data_ready5,
output	wire	[DataWidth+AddrWidth-1:0] o_pe_data5,
output	wire	o_pe_data_valid5,
input   wire	i_pe_data_ready5,
//pe 6
input	wire	[DataWidth+AddrWidth-1:0] i_pe_data6,
input	wire	i_pe_data_valid6,
output	wire	o_pe_data_ready6,
output	wire	[DataWidth+AddrWidth-1:0] o_pe_data6,
output	wire	o_pe_data_valid6,
input   wire	i_pe_data_ready6,
//pe 7
input	wire	[DataWidth+AddrWidth-1:0] i_pe_data7,
input	wire	i_pe_data_valid7,
output	wire	o_pe_data_ready7,
output	wire	[DataWidth+AddrWidth-1:0] o_pe_data7,
output	wire	o_pe_data_valid7,
input   wire	i_pe_data_ready7
);

wire [DataWidth+AddrWidth-1:0] centreHtoLeaf1Data;
wire        centreHtoLeaf1DataValid;
wire        centreHtoLeaf1DataReady;
wire [DataWidth+AddrWidth-1:0] Leaf1toCentreHData;
wire        Leaf1toCentreHDataValid;
wire        Leaf1toCentreHDataReady;

/*wire        clk_100;
wire        clk_200;
wire        clk_400;*/


/*clockGen clockGen
   (
    // Clock out ports
    .clk_out1(clk_100),     // output clk_out1
    .clk_out2(clk_200),     // output clk_out2
    .clk_out3(clk_400),     // output clk_out3
   // Clock in ports
    .clk_in1(i_clk));      // input clk_in1*/



HLeaf #(.DataWidth(DataWidth+AddrWidth),.AddrWidth(AddrWidth),.sw1bottomMin(0),.sw1bottomMax(0),.sw1topMin(1),.sw1topMax(1),.sw2bottomMin(0),
.sw2bottomMax(1),.sw2topMin(2),.sw2topMax(3),.sw3bottomMin(2),.sw3bottomMax(2),.sw3topMin(3),.sw3topMax(3))
L1 (
    .i_sclk(clk_100),
    .i_reset(i_reset),
    .i_topLeft_data(i_pe_data1),
    .i_topLeft_data_valid(i_pe_data_valid1),
    .o_topLeft_data_ready(o_pe_data_ready1),
    .o_topLeft_data(o_pe_data1),
    .o_topLeft_data_valid(o_pe_data_valid1),
    .i_topLeft_data_ready(i_pe_data_ready1),
    .i_bottomLeft_data(i_pe_data0),
    .i_bottomLeft_data_valid(i_pe_data_valid0),
    .o_bottomLeft_data_ready(o_pe_data_ready0),
    .o_bottomLeft_data(o_pe_data0),
    .o_bottomLeft_data_valid(o_pe_data_valid0),
    .i_bottomLeft_data_ready(i_pe_data_ready0),
    .i_topRight_data(i_pe_data3),
    .i_topRight_data_valid(i_pe_data_valid3),
    .o_topRight_data_ready(o_pe_data_ready3),
    .o_topRight_data(o_pe_data3),
    .o_topRight_data_valid(o_pe_data_valid3),
    .i_topRight_data_ready(i_pe_data_ready3),
    .i_bottomRight_data(i_pe_data2),
    .i_bottomRight_data_valid(i_pe_data_valid2),
    .o_bottomRight_data_ready(o_pe_data_ready2),
    .o_bottomRight_data(o_pe_data2),
    .o_bottomRight_data_valid(o_pe_data_valid2),
    .i_bottomRight_data_ready(i_pe_data_ready2),
    .i_centre_data(centreHtoLeaf1Data),
    .i_centre_data_valid(centreHtoLeaf1DataValid),
    .o_centre_data_ready(centreHtoLeaf1DataReady),
    .o_centre_data(Leaf1toCentreHData),
    .o_centre_data_valid(Leaf1toCentreHDataValid),
    .i_centre_data_ready(Leaf1toCentreHDataReady)
);



HLeaf #(.DataWidth(DataWidth+AddrWidth),.AddrWidth(AddrWidth),.sw1bottomMin(4),.sw1bottomMax(4),.sw1topMin(5),.sw1topMax(5),.sw2bottomMin(4),
.sw2bottomMax(5),.sw2topMin(6),.sw2topMax(7),.sw3bottomMin(6),.sw3bottomMax(6),.sw3topMin(7),.sw3topMax(7))
L2 (
    .i_sclk(clk_100),
    .i_reset(i_reset),
    .i_topLeft_data(i_pe_data5),
    .i_topLeft_data_valid(i_pe_data_valid5),
    .o_topLeft_data_ready(o_pe_data_ready5),
    .o_topLeft_data(o_pe_data5),
    .o_topLeft_data_valid(o_pe_data_valid5),
    .i_topLeft_data_ready(i_pe_data_ready5),
    .i_bottomLeft_data(i_pe_data4),
    .i_bottomLeft_data_valid(i_pe_data_valid4),
    .o_bottomLeft_data_ready(o_pe_data_ready4),
    .o_bottomLeft_data(o_pe_data4),
    .o_bottomLeft_data_valid(o_pe_data_valid4),
    .i_bottomLeft_data_ready(i_pe_data_ready4),
    .i_topRight_data(i_pe_data7),
    .i_topRight_data_valid(i_pe_data_valid7),
    .o_topRight_data_ready(o_pe_data_ready7),
    .o_topRight_data(o_pe_data7),
    .o_topRight_data_valid(o_pe_data_valid7),
    .i_topRight_data_ready(i_pe_data_ready7),
    .i_bottomRight_data(i_pe_data6),
    .i_bottomRight_data_valid(i_pe_data_valid6),
    .o_bottomRight_data_ready(o_pe_data_ready6),
    .o_bottomRight_data(o_pe_data6),
    .o_bottomRight_data_valid(o_pe_data_valid6),
    .i_bottomRight_data_ready(i_pe_data_ready6),
    .i_centre_data(Leaf1toCentreHData),
    .i_centre_data_valid(Leaf1toCentreHDataValid),
    .o_centre_data_ready(Leaf1toCentreHDataReady),
    .o_centre_data(centreHtoLeaf1Data),
    .o_centre_data_valid(centreHtoLeaf1DataValid),
    .i_centre_data_ready(centreHtoLeaf1DataReady)
);

endmodule