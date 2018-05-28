module BTree #(parameter DataWidth = 32,numPE = 4,AddrWidth=2)(////
//input   wire    i_clk,
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
input   wire	i_pe_data_ready3
);

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
    .clk_in1(i_clk));      // input clk_in1
*/

CentreH #(.DataWidth(DataWidth+AddrWidth),.sw1bottomMin(0),.sw1bottomMax(0),.sw1topMin(1),.sw1topMax(1),.sw2bottomMin(2),.sw2bottomMax(2),.sw2topMin(3),.sw2topMax(3))
CH (
    .i_sclk(clk_100),
    .i_reset(i_reset),
    .i_topLeft_data(i_pe_data1),
    .i_topLeft_data_valid(i_pe_data_valid1),
    .o_topLeft_data_ready(o_pe_data_ready1),
    .o_topLeft_data(o_pe_data1),
    .o_topLeft_data_valid(o_pe_data_valid1),
    .i_topLeft_data_ready(i_pe_data_ready1),
    //    
    .i_bottomLeft_data(i_pe_data0),
    .i_bottomLeft_data_valid(i_pe_data_valid0),
    .o_bottomLeft_data_ready(o_pe_data_ready0),
    .o_bottomLeft_data(o_pe_data0),
    .o_bottomLeft_data_valid(o_pe_data_valid0),
    .i_bottomLeft_data_ready(i_pe_data_ready0),
    //
    .i_topRight_data(i_pe_data3),
    .i_topRight_data_valid(i_pe_data_valid3),
    .o_topRight_data_ready(o_pe_data_ready3),
    .o_topRight_data(o_pe_data3),
    .o_topRight_data_valid(o_pe_data_valid3),
    .i_topRight_data_ready(i_pe_data_ready3),
    //
    .i_bottomRight_data(i_pe_data2),
    .i_bottomRight_data_valid(i_pe_data_valid2),
    .o_bottomRight_data_ready(o_pe_data_ready2),
    .o_bottomRight_data(o_pe_data2),
    .o_bottomRight_data_valid(o_pe_data_valid2),
    .i_bottomRight_data_ready(i_pe_data_ready2)
);

endmodule