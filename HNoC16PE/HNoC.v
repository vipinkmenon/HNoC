module HNoC #(parameter DataWidth = 32,numPE = 16,AddrWidth=4)(
input   wire    i_clk,
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
input   wire	i_pe_data_ready7,
//pe 8
input	wire	[DataWidth+AddrWidth-1:0] i_pe_data8,
input	wire	i_pe_data_valid8,
output	wire	o_pe_data_ready8,
output	wire	[DataWidth+AddrWidth-1:0] o_pe_data8,
output	wire	o_pe_data_valid8,
input   wire	i_pe_data_ready8,
//pe 9
input	wire	[DataWidth+AddrWidth-1:0] i_pe_data9,
input	wire	i_pe_data_valid9,
output	wire	o_pe_data_ready9,
output	wire	[DataWidth+AddrWidth-1:0] o_pe_data9,
output	wire	o_pe_data_valid9,
input   wire	i_pe_data_ready9,
//pe 10
input	wire	[DataWidth+AddrWidth-1:0] i_pe_data10,
input	wire	i_pe_data_valid10,
output	wire	o_pe_data_ready10,
output	wire	[DataWidth+AddrWidth-1:0] o_pe_data10,
output	wire	o_pe_data_valid10,
input   wire	i_pe_data_ready10,
//pe 11
input	wire	[DataWidth+AddrWidth-1:0] i_pe_data11,
input	wire	i_pe_data_valid11,
output	wire	o_pe_data_ready11,
output	wire	[DataWidth+AddrWidth-1:0] o_pe_data11,
output	wire	o_pe_data_valid11,
input   wire	i_pe_data_ready11,
//pe 12
input	wire	[DataWidth+AddrWidth-1:0] i_pe_data12,
input	wire	i_pe_data_valid12,
output	wire	o_pe_data_ready12,
output	wire	[DataWidth+AddrWidth-1:0] o_pe_data12,
output	wire	o_pe_data_valid12,
input   wire	i_pe_data_ready12,
//pe 13
input	wire	[DataWidth+AddrWidth-1:0] i_pe_data13,
input	wire	i_pe_data_valid13,
output	wire	o_pe_data_ready13,
output	wire	[DataWidth+AddrWidth-1:0] o_pe_data13,
output	wire	o_pe_data_valid13,
input   wire	i_pe_data_ready13,
//pe 14
input	wire	[DataWidth+AddrWidth-1:0] i_pe_data14,
input	wire	i_pe_data_valid14,
output	wire	o_pe_data_ready14,
output	wire	[DataWidth+AddrWidth-1:0] o_pe_data14,
output	wire	o_pe_data_valid14,
input   wire	i_pe_data_ready14,
//pe 15
input	wire	[DataWidth+AddrWidth-1:0] i_pe_data15,
input	wire	i_pe_data_valid15,
output	wire	o_pe_data_ready15,
output	wire	[DataWidth+AddrWidth-1:0] o_pe_data15,
output	wire	o_pe_data_valid15,
input   wire	i_pe_data_ready15
);

wire [DataWidth+AddrWidth-1:0] centreHtoLeaf1Data;
wire        centreHtoLeaf1DataValid;
wire        centreHtoLeaf1DataReady;
wire [DataWidth+AddrWidth-1:0] Leaf1toCentreHData;
wire        Leaf1toCentreHDataValid;
wire        Leaf1toCentreHDataReady;

wire [DataWidth+AddrWidth-1:0] centreHtoLeaf2Data;
wire        centreHtoLeaf2DataValid;
wire        centreHtoLeaf2DataReady;
wire [DataWidth+AddrWidth-1:0] Leaf2toCentreHData;
wire        Leaf2toCentreHDataValid;
wire        Leaf2toCentreHDataReady;

wire [DataWidth+AddrWidth-1:0] centreHtoLeaf3Data;
wire        centreHtoLeaf3DataValid;
wire        centreHtoLeaf3DataReady;
wire [DataWidth+AddrWidth-1:0] Leaf3toCentreHData;
wire        Leaf3toCentreHDataValid;
wire        Leaf3toCentreHDataReady;

wire [DataWidth+AddrWidth-1:0] centreHtoLeaf4Data;
wire        centreHtoLeaf4DataValid;
wire        centreHtoLeaf4DataReady;
wire [DataWidth+AddrWidth-1:0] Leaf4toCentreHData;
wire        Leaf4toCentreHDataValid;
wire        Leaf4toCentreHDataReady;

wire        clk_100;
wire        clk_200;
wire        clk_400;


clockGen clockGen
   (
    // Clock out ports
    .clk_out1(clk_100),     // output clk_out1
    .clk_out2(clk_200),     // output clk_out2
    .clk_out3(clk_400),     // output clk_out3
   // Clock in ports
    .clk_in1(i_clk));      // input clk_in1



HLeaf #(.DataWidth(DataWidth+AddrWidth),.AddrWidth(AddrWidth),.sw1bottomMin(0),.sw1bottomMax(0),.sw1topMin(1),.sw1topMax(1),.sw2bottomMin(0),
.sw2bottomMax(1),.sw2topMin(2),.sw2topMax(3),.sw3bottomMin(2),.sw3bottomMax(2),.sw3topMin(3),.sw3topMax(3))
L1 (
    .i_sclk(clk_100),
    .i_mclk(clk_200),
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
    .i_mclk(clk_200),
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
    .i_centre_data(centreHtoLeaf2Data),
    .i_centre_data_valid(centreHtoLeaf2DataValid),
    .o_centre_data_ready(centreHtoLeaf2DataReady),
    .o_centre_data(Leaf2toCentreHData),
    .o_centre_data_valid(Leaf2toCentreHDataValid),
    .i_centre_data_ready(Leaf2toCentreHDataReady)
);


HLeaf #(.DataWidth(DataWidth+AddrWidth),.AddrWidth(AddrWidth),.sw1bottomMin(8),.sw1bottomMax(8),.sw1topMin(9),.sw1topMax(9),.sw2bottomMin(8),
.sw2bottomMax(9),.sw2topMin(10),.sw2topMax(11),.sw3bottomMin(10),.sw3bottomMax(10),.sw3topMin(11),.sw3topMax(11))
L3 (
    .i_sclk(clk_100),
    .i_mclk(clk_200),
    .i_reset(i_reset),
    .i_topLeft_data(i_pe_data9),
    .i_topLeft_data_valid(i_pe_data_valid9),
    .o_topLeft_data_ready(o_pe_data_ready9),
    .o_topLeft_data(o_pe_data9),
    .o_topLeft_data_valid(o_pe_data_valid9),
    .i_topLeft_data_ready(i_pe_data_ready9),
    .i_bottomLeft_data(i_pe_data8),
    .i_bottomLeft_data_valid(i_pe_data_valid8),
    .o_bottomLeft_data_ready(o_pe_data_ready8),
    .o_bottomLeft_data(o_pe_data8),
    .o_bottomLeft_data_valid(o_pe_data_valid8),
    .i_bottomLeft_data_ready(i_pe_data_ready8),
    .i_topRight_data(i_pe_data11),
    .i_topRight_data_valid(i_pe_data_valid11),
    .o_topRight_data_ready(o_pe_data_ready11),
    .o_topRight_data(o_pe_data11),
    .o_topRight_data_valid(o_pe_data_valid11),
    .i_topRight_data_ready(i_pe_data_ready11),
    .i_bottomRight_data(i_pe_data10),
    .i_bottomRight_data_valid(i_pe_data_valid10),
    .o_bottomRight_data_ready(o_pe_data_ready10),
    .o_bottomRight_data(o_pe_data10),
    .o_bottomRight_data_valid(o_pe_data_valid10),
    .i_bottomRight_data_ready(i_pe_data_ready10),
    .i_centre_data(centreHtoLeaf3Data),
    .i_centre_data_valid(centreHtoLeaf3DataValid),
    .o_centre_data_ready(centreHtoLeaf3DataReady),
    .o_centre_data(Leaf3toCentreHData),
    .o_centre_data_valid(Leaf3toCentreHDataValid),
    .i_centre_data_ready(Leaf3toCentreHDataReady)
);


HLeaf #(.DataWidth(DataWidth+AddrWidth),.AddrWidth(AddrWidth),.sw1bottomMin(12),.sw1bottomMax(12),.sw1topMin(13),.sw1topMax(13),.sw2bottomMin(12),
.sw2bottomMax(13),.sw2topMin(14),.sw2topMax(15),.sw3bottomMin(14),.sw3bottomMax(14),.sw3topMin(15),.sw3topMax(15))
L4 (
    .i_sclk(clk_100),
    .i_mclk(clk_200),
    .i_reset(i_reset),
    .i_topLeft_data(i_pe_data13),
    .i_topLeft_data_valid(i_pe_data_valid13),
    .o_topLeft_data_ready(o_pe_data_ready13),
    .o_topLeft_data(o_pe_data13),
    .o_topLeft_data_valid(o_pe_data_valid13),
    .i_topLeft_data_ready(i_pe_data_ready13),
    .i_bottomLeft_data(i_pe_data12),
    .i_bottomLeft_data_valid(i_pe_data_valid12),
    .o_bottomLeft_data_ready(o_pe_data_ready12),
    .o_bottomLeft_data(o_pe_data12),
    .o_bottomLeft_data_valid(o_pe_data_valid12),
    .i_bottomLeft_data_ready(i_pe_data_ready12),
    .i_topRight_data(i_pe_data15),
    .i_topRight_data_valid(i_pe_data_valid15),
    .o_topRight_data_ready(o_pe_data_ready15),
    .o_topRight_data(o_pe_data15),
    .o_topRight_data_valid(o_pe_data_valid15),
    .i_topRight_data_ready(i_pe_data_ready15),
    .i_bottomRight_data(i_pe_data14),
    .i_bottomRight_data_valid(i_pe_data_valid14),
    .o_bottomRight_data_ready(o_pe_data_ready14),
    .o_bottomRight_data(o_pe_data14),
    .o_bottomRight_data_valid(o_pe_data_valid14),
    .i_bottomRight_data_ready(i_pe_data_ready14),
    .i_centre_data(centreHtoLeaf4Data),
    .i_centre_data_valid(centreHtoLeaf4DataValid),
    .o_centre_data_ready(centreHtoLeaf4DataReady),
    .o_centre_data(Leaf4toCentreHData),
    .o_centre_data_valid(Leaf4toCentreHDataValid),
    .i_centre_data_ready(Leaf4toCentreHDataReady)
);



CentreH #(.DataWidth(DataWidth+AddrWidth),.AddrWidth(AddrWidth),.sw1bottomMin(4),.sw1bottomMax(7),.sw1topMin(0),.sw1topMax(3),.sw2bottomMin(12),.sw2bottomMax(15),.sw2topMin(8),.sw2topMax(11))
CH (
    .i_sclk(clk_200),
    .i_mclk(clk_400),
    .i_reset(i_reset),
    .i_topLeft_data(Leaf1toCentreHData),
    .i_topLeft_data_valid(Leaf1toCentreHDataValid),
    .o_topLeft_data_ready(Leaf1toCentreHDataReady),
    .o_topLeft_data(centreHtoLeaf1Data),
    .o_topLeft_data_valid(centreHtoLeaf1DataValid),
    .i_topLeft_data_ready(centreHtoLeaf1DataReady),
    .i_bottomLeft_data(Leaf2toCentreHData),
    .i_bottomLeft_data_valid(Leaf2toCentreHDataValid),
    .o_bottomLeft_data_ready(Leaf2toCentreHDataReady),
    .o_bottomLeft_data(centreHtoLeaf2Data),
    .o_bottomLeft_data_valid(centreHtoLeaf2DataValid),
    .i_bottomLeft_data_ready(centreHtoLeaf2DataReady),
    .i_topRight_data(Leaf3toCentreHData),
    .i_topRight_data_valid(Leaf3toCentreHDataValid),
    .o_topRight_data_ready(Leaf3toCentreHDataReady),
    .o_topRight_data(centreHtoLeaf3Data),
    .o_topRight_data_valid(centreHtoLeaf3DataValid),
    .i_topRight_data_ready(centreHtoLeaf3DataReady),
    .i_bottomRight_data(Leaf4toCentreHData),
    .i_bottomRight_data_valid(Leaf4toCentreHDataValid),
    .o_bottomRight_data_ready(Leaf4toCentreHDataReady),
    .o_bottomRight_data(centreHtoLeaf4Data),
    .o_bottomRight_data_valid(centreHtoLeaf4DataValid),
    .i_bottomRight_data_ready(centreHtoLeaf4DataReady)
);

endmodule