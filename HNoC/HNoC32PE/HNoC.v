module HNoC #(parameter DataWidth = 32,numPE = 16,AddrWidth=4)(
input   wire    clk_100,
input   wire    clk_200,
input   wire    clk_400,
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
input   wire	i_pe_data_ready15,
//pe 16
input	wire	[DataWidth+AddrWidth-1:0] i_pe_data16,
input	wire	i_pe_data_valid16,
output	wire	o_pe_data_ready16,
output	wire	[DataWidth+AddrWidth-1:0] o_pe_data16,
output	wire	o_pe_data_valid16,
input   wire	i_pe_data_ready16,
//pe 17
input	wire	[DataWidth+AddrWidth-1:0] i_pe_data17,
input	wire	i_pe_data_valid17,
output	wire	o_pe_data_ready17,
output	wire	[DataWidth+AddrWidth-1:0] o_pe_data17,
output	wire	o_pe_data_valid17,
input   wire	i_pe_data_ready17,
//pe 18
input	wire	[DataWidth+AddrWidth-1:0] i_pe_data18,
input	wire	i_pe_data_valid18,
output	wire	o_pe_data_ready18,
output	wire	[DataWidth+AddrWidth-1:0] o_pe_data18,
output	wire	o_pe_data_valid18,
input   wire	i_pe_data_ready18,
//pe 19
input	wire	[DataWidth+AddrWidth-1:0] i_pe_data19,
input	wire	i_pe_data_valid19,
output	wire	o_pe_data_ready19,
output	wire	[DataWidth+AddrWidth-1:0] o_pe_data19,
output	wire	o_pe_data_valid19,
input   wire	i_pe_data_ready19,
//pe 20
input	wire	[DataWidth+AddrWidth-1:0] i_pe_data20,
input	wire	i_pe_data_valid20,
output	wire	o_pe_data_ready20,
output	wire	[DataWidth+AddrWidth-1:0] o_pe_data20,
output	wire	o_pe_data_valid20,
input   wire	i_pe_data_ready20,
//pe 21
input	wire	[DataWidth+AddrWidth-1:0] i_pe_data21,
input	wire	i_pe_data_valid21,
output	wire	o_pe_data_ready21,
output	wire	[DataWidth+AddrWidth-1:0] o_pe_data21,
output	wire	o_pe_data_valid21,
input   wire	i_pe_data_ready21,
//pe 22
input	wire	[DataWidth+AddrWidth-1:0] i_pe_data22,
input	wire	i_pe_data_valid22,
output	wire	o_pe_data_ready22,
output	wire	[DataWidth+AddrWidth-1:0] o_pe_data22,
output	wire	o_pe_data_valid22,
input   wire	i_pe_data_ready22,
//pe 23
input	wire	[DataWidth+AddrWidth-1:0] i_pe_data23,
input	wire	i_pe_data_valid23,
output	wire	o_pe_data_ready23,
output	wire	[DataWidth+AddrWidth-1:0] o_pe_data23,
output	wire	o_pe_data_valid23,
input   wire	i_pe_data_ready23,
//pe 24
input	wire	[DataWidth+AddrWidth-1:0] i_pe_data24,
input	wire	i_pe_data_valid24,
output	wire	o_pe_data_ready24,
output	wire	[DataWidth+AddrWidth-1:0] o_pe_data24,
output	wire	o_pe_data_valid24,
input   wire	i_pe_data_ready24,
//pe 25
input	wire	[DataWidth+AddrWidth-1:0] i_pe_data25,
input	wire	i_pe_data_valid25,
output	wire	o_pe_data_ready25,
output	wire	[DataWidth+AddrWidth-1:0] o_pe_data25,
output	wire	o_pe_data_valid25,
input   wire	i_pe_data_ready25,
//pe 26
input	wire	[DataWidth+AddrWidth-1:0] i_pe_data26,
input	wire	i_pe_data_valid26,
output	wire	o_pe_data_ready26,
output	wire	[DataWidth+AddrWidth-1:0] o_pe_data26,
output	wire	o_pe_data_valid26,
input   wire	i_pe_data_ready26,
//pe 27
input	wire	[DataWidth+AddrWidth-1:0] i_pe_data27,
input	wire	i_pe_data_valid27,
output	wire	o_pe_data_ready27,
output	wire	[DataWidth+AddrWidth-1:0] o_pe_data27,
output	wire	o_pe_data_valid27,
input   wire	i_pe_data_ready27,
//pe 28
input	wire	[DataWidth+AddrWidth-1:0] i_pe_data28,
input	wire	i_pe_data_valid28,
output	wire	o_pe_data_ready28,
output	wire	[DataWidth+AddrWidth-1:0] o_pe_data28,
output	wire	o_pe_data_valid28,
input   wire	i_pe_data_ready28,
//pe 29
input	wire	[DataWidth+AddrWidth-1:0] i_pe_data29,
input	wire	i_pe_data_valid29,
output	wire	o_pe_data_ready29,
output	wire	[DataWidth+AddrWidth-1:0] o_pe_data29,
output	wire	o_pe_data_valid29,
input   wire	i_pe_data_ready29,
//pe 30
input	wire	[DataWidth+AddrWidth-1:0] i_pe_data30,
input	wire	i_pe_data_valid30,
output	wire	o_pe_data_ready30,
output	wire	[DataWidth+AddrWidth-1:0] o_pe_data30,
output	wire	o_pe_data_valid30,
input   wire	i_pe_data_ready30,
//pe 31
input	wire	[DataWidth+AddrWidth-1:0] i_pe_data31,
input	wire	i_pe_data_valid31,
output	wire	o_pe_data_ready31,
output	wire	[DataWidth+AddrWidth-1:0] o_pe_data31,
output	wire	o_pe_data_valid31,
input   wire	i_pe_data_ready31
);

wire [DataWidth+AddrWidth-1:0] centreH1toLeaf1Data;
wire        centreH1toLeaf1DataValid;
wire        centreH1toLeaf1DataReady;
wire [DataWidth+AddrWidth-1:0] Leaf1toCentreH1Data;
wire        Leaf1toCentreH1DataValid;
wire        Leaf1toCentreH1DataReady;

wire [DataWidth+AddrWidth-1:0] centreH2toLeaf1Data;
wire        centreH2toLeaf1DataValid;
wire        centreH2toLeaf1DataReady;
wire [DataWidth+AddrWidth-1:0] Leaf1toCentreH2Data;
wire        Leaf1toCentreH2DataValid;
wire        Leaf1toCentreH2DataReady;

wire [DataWidth+AddrWidth-1:0] centreH1toLeaf2Data;
wire        centreH1toLeaf2DataValid;
wire        centreH1toLeaf2DataReady;
wire [DataWidth+AddrWidth-1:0] Leaf2toCentreH1Data;
wire        Leaf2toCentreH1DataValid;
wire        Leaf2toCentreH1DataReady;

wire [DataWidth+AddrWidth-1:0] centreH2toLeaf2Data;
wire        centreH2toLeaf2DataValid;
wire        centreH2toLeaf2DataReady;
wire [DataWidth+AddrWidth-1:0] Leaf2toCentreH2Data;
wire        Leaf2toCentreH2DataValid;
wire        Leaf2toCentreH2DataReady;


wire [DataWidth+AddrWidth-1:0] centreH1toLeaf3Data;
wire        centreH1toLeaf3DataValid;
wire        centreH1toLeaf3DataReady;
wire [DataWidth+AddrWidth-1:0] Leaf3toCentreH1Data;
wire        Leaf3toCentreH1DataValid;
wire        Leaf3toCentreH1DataReady;

wire [DataWidth+AddrWidth-1:0] centreH2toLeaf3Data;
wire        centreH2toLeaf3DataValid;
wire        centreH2toLeaf3DataReady;
wire [DataWidth+AddrWidth-1:0] Leaf3toCentreH2Data;
wire        Leaf3toCentreH2DataValid;
wire        Leaf3toCentreH2DataReady;

wire [DataWidth+AddrWidth-1:0] centreH1toLeaf4Data;
wire        centreH1toLeaf4DataValid;
wire        centreH1toLeaf4DataReady;
wire [DataWidth+AddrWidth-1:0] Leaf4toCentreH1Data;
wire        Leaf4toCentreH1DataValid;
wire        Leaf4toCentreH1DataReady;

wire [DataWidth+AddrWidth-1:0] centreH2toLeaf4Data;
wire        centreH2toLeaf4DataValid;
wire        centreH2toLeaf4DataReady;
wire [DataWidth+AddrWidth-1:0] Leaf4toCentreH2Data;
wire        Leaf4toCentreH2DataValid;
wire        Leaf4toCentreH2DataReady;


wire [DataWidth+AddrWidth-1:0] centreH1toH2Data;
wire        centreH1toH2DataValid;
wire        centreH1toH2DataReady;
wire [DataWidth+AddrWidth-1:0] centreH2toeH1Data;
wire        centreH2toeH1DataValid;
wire        centreH2toeH1DataReady;


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
    .i_centre_data(centreH1toLeaf1Data),
    .i_centre_data_valid(centreH1toLeaf1DataValid),
    .o_centre_data_ready(centreH1toLeaf1DataReady),
    .o_centre_data(Leaf1toCentreH1Data),
    .o_centre_data_valid(Leaf1toCentreH1DataValid),
    .i_centre_data_ready(Leaf1toCentreH1DataReady)
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
    .i_centre_data(centreH1toLeaf2Data),
    .i_centre_data_valid(centreH1toLeaf2DataValid),
    .o_centre_data_ready(centreH1toLeaf2DataReady),
    .o_centre_data(Leaf2toCentreH1Data),
    .o_centre_data_valid(Leaf2toCentreH1DataValid),
    .i_centre_data_ready(Leaf2toCentreH1DataReady)
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
    .i_centre_data(centreH1toLeaf3Data),
    .i_centre_data_valid(centreH1toLeaf3DataValid),
    .o_centre_data_ready(centreH1toLeaf3DataReady),
    .o_centre_data(Leaf3toCentreH1Data),
    .o_centre_data_valid(Leaf3toCentreH1DataValid),
    .i_centre_data_ready(Leaf3toCentreH1DataReady)
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
    .i_centre_data(centreH1toLeaf4Data),
    .i_centre_data_valid(centreH1toLeaf4DataValid),
    .o_centre_data_ready(centreH1toLeaf4DataReady),
    .o_centre_data(Leaf4toCentreH1Data),
    .o_centre_data_valid(Leaf4toCentreH1DataValid),
    .i_centre_data_ready(Leaf4toCentreH1DataReady)
);



HLeaf #(.DataWidth(DataWidth+AddrWidth),.AddrWidth(AddrWidth),.sw1bottomMin(4),.sw1bottomMax(7),.sw1topMin(0),.sw1topMax(3),.sw2bottomMin(0),
.sw2bottomMax(7),.sw2topMin(8),.sw2topMax(15),.sw3bottomMin(12),.sw3bottomMax(15),.sw3topMin(8),.sw3topMax(11))
CH1 (
    .i_sclk(clk_200),
    .i_mclk(clk_400),
    .i_reset(i_reset),
    .i_topLeft_data(Leaf1toCentreH1Data),
    .i_topLeft_data_valid(Leaf1toCentreH1DataValid),
    .o_topLeft_data_ready(Leaf1toCentreH1DataReady),
    .o_topLeft_data(centreH1toLeaf1Data),
    .o_topLeft_data_valid(centreH1toLeaf1DataValid),
    .i_topLeft_data_ready(centreH1toLeaf1DataReady),
    .i_bottomLeft_data(Leaf2toCentreH1Data),
    .i_bottomLeft_data_valid(Leaf2toCentreH1DataValid),
    .o_bottomLeft_data_ready(Leaf2toCentreH1DataReady),
    .o_bottomLeft_data(centreH1toLeaf2Data),
    .o_bottomLeft_data_valid(centreH1toLeaf2DataValid),
    .i_bottomLeft_data_ready(centreH1toLeaf2DataReady),
    .i_topRight_data(Leaf3toCentreH1Data),
    .i_topRight_data_valid(Leaf3toCentreH1DataValid),
    .o_topRight_data_ready(Leaf3toCentreH1DataReady),
    .o_topRight_data(centreH1toLeaf3Data),
    .o_topRight_data_valid(centreH1toLeaf3DataValid),
    .i_topRight_data_ready(centreH1toLeaf3DataReady),
    .i_bottomRight_data(Leaf4toCentreH1Data),
    .i_bottomRight_data_valid(Leaf4toCentreH1DataValid),
    .o_bottomRight_data_ready(Leaf4toCentreH1DataReady),
    .o_bottomRight_data(centreH1toLeaf4Data),
    .o_bottomRight_data_valid(centreH1toLeaf4DataValid),
    .i_bottomRight_data_ready(centreH1toLeaf4DataReady),
    .i_centre_data(centreH2toeH1Data),
    .i_centre_data_valid(centreH2toeH1DataValid),
    .o_centre_data_ready(centreH2toeH1DataReady),
    .o_centre_data(centreH1toH2Data),
    .o_centre_data_valid(centreH1toH2DataValid),
    .i_centre_data_ready(centreH1toH2DataReady)
);


HLeaf #(.DataWidth(DataWidth+AddrWidth),.AddrWidth(AddrWidth),.sw1bottomMin(16),.sw1bottomMax(16),.sw1topMin(17),.sw1topMax(17),.sw2bottomMin(16),
.sw2bottomMax(17),.sw2topMin(18),.sw2topMax(19),.sw3bottomMin(18),.sw3bottomMax(18),.sw3topMin(19),.sw3topMax(19))
L5 (
    .i_sclk(clk_100),
    .i_mclk(clk_200),
    .i_reset(i_reset),
    .i_topLeft_data(i_pe_data17),
    .i_topLeft_data_valid(i_pe_data_valid17),
    .o_topLeft_data_ready(o_pe_data_ready17),
    .o_topLeft_data(o_pe_data17),
    .o_topLeft_data_valid(o_pe_data_valid17),
    .i_topLeft_data_ready(i_pe_data_ready17),
    .i_bottomLeft_data(i_pe_data16),
    .i_bottomLeft_data_valid(i_pe_data_valid16),
    .o_bottomLeft_data_ready(o_pe_data_ready16),
    .o_bottomLeft_data(o_pe_data16),
    .o_bottomLeft_data_valid(o_pe_data_valid16),
    .i_bottomLeft_data_ready(i_pe_data_ready16),
    .i_topRight_data(i_pe_data19),
    .i_topRight_data_valid(i_pe_data_valid19),
    .o_topRight_data_ready(o_pe_data_ready19),
    .o_topRight_data(o_pe_data19),
    .o_topRight_data_valid(o_pe_data_valid19),
    .i_topRight_data_ready(i_pe_data_ready19),
    .i_bottomRight_data(i_pe_data18),
    .i_bottomRight_data_valid(i_pe_data_valid18),
    .o_bottomRight_data_ready(o_pe_data_ready18),
    .o_bottomRight_data(o_pe_data18),
    .o_bottomRight_data_valid(o_pe_data_valid18),
    .i_bottomRight_data_ready(i_pe_data_ready18),
    .i_centre_data(centreH2toLeaf1Data),
    .i_centre_data_valid(centreH2toLeaf1DataValid),
    .o_centre_data_ready(centreH2toLeaf1DataReady),
    .o_centre_data(Leaf1toCentreH2Data),
    .o_centre_data_valid(Leaf1toCentreH2DataValid),
    .i_centre_data_ready(Leaf1toCentreH2DataReady)
);



HLeaf #(.DataWidth(DataWidth+AddrWidth),.AddrWidth(AddrWidth),.sw1bottomMin(20),.sw1bottomMax(20),.sw1topMin(21),.sw1topMax(21),.sw2bottomMin(20),
.sw2bottomMax(21),.sw2topMin(22),.sw2topMax(23),.sw3bottomMin(22),.sw3bottomMax(22),.sw3topMin(23),.sw3topMax(23))
L6 (
    .i_sclk(clk_100),
    .i_mclk(clk_200),
    .i_reset(i_reset),
    .i_topLeft_data(i_pe_data21),
    .i_topLeft_data_valid(i_pe_data_valid21),
    .o_topLeft_data_ready(o_pe_data_ready21),
    .o_topLeft_data(o_pe_data21),
    .o_topLeft_data_valid(o_pe_data_valid21),
    .i_topLeft_data_ready(i_pe_data_ready21),
    .i_bottomLeft_data(i_pe_data20),
    .i_bottomLeft_data_valid(i_pe_data_valid20),
    .o_bottomLeft_data_ready(o_pe_data_ready20),
    .o_bottomLeft_data(o_pe_data20),
    .o_bottomLeft_data_valid(o_pe_data_valid20),
    .i_bottomLeft_data_ready(i_pe_data_ready20),
    .i_topRight_data(i_pe_data23),
    .i_topRight_data_valid(i_pe_data_valid23),
    .o_topRight_data_ready(o_pe_data_ready23),
    .o_topRight_data(o_pe_data23),
    .o_topRight_data_valid(o_pe_data_valid23),
    .i_topRight_data_ready(i_pe_data_ready23),
    .i_bottomRight_data(i_pe_data22),
    .i_bottomRight_data_valid(i_pe_data_valid22),
    .o_bottomRight_data_ready(o_pe_data_ready22),
    .o_bottomRight_data(o_pe_data22),
    .o_bottomRight_data_valid(o_pe_data_valid22),
    .i_bottomRight_data_ready(i_pe_data_ready22),
    .i_centre_data(centreH2toLeaf2Data),
    .i_centre_data_valid(centreH2toLeaf2DataValid),
    .o_centre_data_ready(centreH2toLeaf2DataReady),
    .o_centre_data(Leaf2toCentreH2Data),
    .o_centre_data_valid(Leaf2toCentreH2DataValid),
    .i_centre_data_ready(Leaf2toCentreH2DataReady)
);


HLeaf #(.DataWidth(DataWidth+AddrWidth),.AddrWidth(AddrWidth),.sw1bottomMin(24),.sw1bottomMax(24),.sw1topMin(25),.sw1topMax(25),.sw2bottomMin(24),
.sw2bottomMax(25),.sw2topMin(26),.sw2topMax(27),.sw3bottomMin(26),.sw3bottomMax(26),.sw3topMin(27),.sw3topMax(27))
L7 (
    .i_sclk(clk_100),
    .i_mclk(clk_200),
    .i_reset(i_reset),
    .i_topLeft_data(i_pe_data25),
    .i_topLeft_data_valid(i_pe_data_valid25),
    .o_topLeft_data_ready(o_pe_data_ready25),
    .o_topLeft_data(o_pe_data25),
    .o_topLeft_data_valid(o_pe_data_valid25),
    .i_topLeft_data_ready(i_pe_data_ready25),
    .i_bottomLeft_data(i_pe_data24),
    .i_bottomLeft_data_valid(i_pe_data_valid24),
    .o_bottomLeft_data_ready(o_pe_data_ready24),
    .o_bottomLeft_data(o_pe_data24),
    .o_bottomLeft_data_valid(o_pe_data_valid24),
    .i_bottomLeft_data_ready(i_pe_data_ready24),
    .i_topRight_data(i_pe_data27),
    .i_topRight_data_valid(i_pe_data_valid27),
    .o_topRight_data_ready(o_pe_data_ready27),
    .o_topRight_data(o_pe_data27),
    .o_topRight_data_valid(o_pe_data_valid27),
    .i_topRight_data_ready(i_pe_data_ready27),
    .i_bottomRight_data(i_pe_data26),
    .i_bottomRight_data_valid(i_pe_data_valid26),
    .o_bottomRight_data_ready(o_pe_data_ready26),
    .o_bottomRight_data(o_pe_data26),
    .o_bottomRight_data_valid(o_pe_data_valid26),
    .i_bottomRight_data_ready(i_pe_data_ready26),
    .i_centre_data(centreH2toLeaf3Data),
    .i_centre_data_valid(centreH2toLeaf3DataValid),
    .o_centre_data_ready(centreH2toLeaf3DataReady),
    .o_centre_data(Leaf3toCentreH2Data),
    .o_centre_data_valid(Leaf3toCentreH2DataValid),
    .i_centre_data_ready(Leaf3toCentreH2DataReady)
);


HLeaf #(.DataWidth(DataWidth+AddrWidth),.AddrWidth(AddrWidth),.sw1bottomMin(28),.sw1bottomMax(28),.sw1topMin(29),.sw1topMax(29),.sw2bottomMin(28),
.sw2bottomMax(29),.sw2topMin(30),.sw2topMax(31),.sw3bottomMin(30),.sw3bottomMax(30),.sw3topMin(31),.sw3topMax(31))
L8 (
    .i_sclk(clk_100),
    .i_mclk(clk_200),
    .i_reset(i_reset),
    .i_topLeft_data(i_pe_data29),
    .i_topLeft_data_valid(i_pe_data_valid29),
    .o_topLeft_data_ready(o_pe_data_ready29),
    .o_topLeft_data(o_pe_data29),
    .o_topLeft_data_valid(o_pe_data_valid29),
    .i_topLeft_data_ready(i_pe_data_ready29),
    .i_bottomLeft_data(i_pe_data28),
    .i_bottomLeft_data_valid(i_pe_data_valid28),
    .o_bottomLeft_data_ready(o_pe_data_ready28),
    .o_bottomLeft_data(o_pe_data28),
    .o_bottomLeft_data_valid(o_pe_data_valid28),
    .i_bottomLeft_data_ready(i_pe_data_ready28),
    .i_topRight_data(i_pe_data31),
    .i_topRight_data_valid(i_pe_data_valid31),
    .o_topRight_data_ready(o_pe_data_ready31),
    .o_topRight_data(o_pe_data31),
    .o_topRight_data_valid(o_pe_data_valid31),
    .i_topRight_data_ready(i_pe_data_ready31),
    .i_bottomRight_data(i_pe_data30),
    .i_bottomRight_data_valid(i_pe_data_valid30),
    .o_bottomRight_data_ready(o_pe_data_ready30),
    .o_bottomRight_data(o_pe_data30),
    .o_bottomRight_data_valid(o_pe_data_valid30),
    .i_bottomRight_data_ready(i_pe_data_ready30),
    .i_centre_data(centreH2toLeaf4Data),
    .i_centre_data_valid(centreH2toLeaf4DataValid),
    .o_centre_data_ready(centreH2toLeaf4DataReady),
    .o_centre_data(Leaf4toCentreH2Data),
    .o_centre_data_valid(Leaf4toCentreH2DataValid),
    .i_centre_data_ready(Leaf4toCentreH2DataReady)
);


HLeaf #(.DataWidth(DataWidth+AddrWidth),.AddrWidth(AddrWidth),.sw1bottomMin(20),.sw1bottomMax(23),.sw1topMin(16),.sw1topMax(19),.sw2bottomMin(16),
.sw2bottomMax(23),.sw2topMin(24),.sw2topMax(31),.sw3bottomMin(28),.sw3bottomMax(31),.sw3topMin(24),.sw3topMax(27))
CH2 (
    .i_sclk(clk_200),
    .i_mclk(clk_400),
    .i_reset(i_reset),
    .i_topLeft_data(Leaf1toCentreH2Data),
    .i_topLeft_data_valid(Leaf1toCentreH2DataValid),
    .o_topLeft_data_ready(Leaf1toCentreH2DataReady),
    .o_topLeft_data(centreH2toLeaf1Data),
    .o_topLeft_data_valid(centreH2toLeaf1DataValid),
    .i_topLeft_data_ready(centreH2toLeaf1DataReady),
    .i_bottomLeft_data(Leaf2toCentreH2Data),
    .i_bottomLeft_data_valid(Leaf2toCentreH2DataValid),
    .o_bottomLeft_data_ready(Leaf2toCentreH2DataReady),
    .o_bottomLeft_data(centreH2toLeaf2Data),
    .o_bottomLeft_data_valid(centreH2toLeaf2DataValid),
    .i_bottomLeft_data_ready(centreH2toLeaf2DataReady),
    .i_topRight_data(Leaf3toCentreH2Data),
    .i_topRight_data_valid(Leaf3toCentreH2DataValid),
    .o_topRight_data_ready(Leaf3toCentreH2DataReady),
    .o_topRight_data(centreH2toLeaf3Data),
    .o_topRight_data_valid(centreH2toLeaf3DataValid),
    .i_topRight_data_ready(centreH2toLeaf3DataReady),
    .i_bottomRight_data(Leaf4toCentreH2Data),
    .i_bottomRight_data_valid(Leaf4toCentreH2DataValid),
    .o_bottomRight_data_ready(Leaf4toCentreH2DataReady),
    .o_bottomRight_data(centreH2toLeaf4Data),
    .o_bottomRight_data_valid(centreH2toLeaf4DataValid),
    .i_bottomRight_data_ready(centreH2toLeaf4DataReady),
    .i_centre_data(centreH1toH2Data),
    .i_centre_data_valid(centreH1toH2DataValid),
    .o_centre_data_ready(centreH1toH2DataReady),
    .o_centre_data(centreH2toeH1Data),
    .o_centre_data_valid(centreH2toeH1DataValid),
    .i_centre_data_ready(centreH2toeH1DataReady)
);

endmodule