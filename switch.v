module switch #(parameter DataWidth = 32,
bottomMin = 0,
bottomMax = 0,
topMin = 2,
topMax = 2
)(
input	wire	i_clk,
input	wire	i_reset,
//top
input	wire	[DataWidth-1:0] i_data1,
input	wire	i_data_valid1,
output	wire	o_data_ready1,
output	wire	[DataWidth-1:0] o_data1,
output	wire	o_data_valid1,
input   wire	i_data_ready1,
//bottom
input	wire	[DataWidth-1:0] i_data2,
input	wire	i_data_valid2,
output	wire	o_data_ready3,
output	wire	[DataWidth-1:0] o_data2,
output	wire	o_data_valid2,
input	wire	i_data_ready2,
//right
input	wire	[DataWidth-1:0] i_data3,
input	wire	i_data_valid3,
output	wire	o_data_ready4,
output	wire	[DataWidth-1:0] o_data3,
output	wire	o_data_valid3,
input	wire	i_data_ready3
);


wire [31:0] bufferData[1:3];

wire [1:3] bufferDataAvail;
wire buffer1Top;
wire buffer2Top;
wire buffer3Top;
wire buffer1Bottom;
wire buffer2Bottom;
wire buffer3Bottom;
wire buffer1Right;
wire buffer2Right;
wire buffer3Right;

reg buffer1Rdy;
reg buffer2Rdy;
reg buffer3Rdy;

reg [1:0] currTopBuffer;
reg [1:0] currBottomBuffer;
reg [1:0] currRightBuffer;

assign buffer1Top = bufferDataAvail[1] & (bufferData[1][31:24] >= topMin) & (bufferData[1][31:24] <= topMax);
assign buffer2Top = bufferDataAvail[2] & (bufferData[2][31:24] >= topMin) & (bufferData[2][31:24] <= topMax); 
assign buffer3Top = bufferDataAvail[3] & (bufferData[3][31:24] >= topMin) & (bufferData[3][31:24] <= topMax);  

assign buffer1Bottom = bufferDataAvail[1] & (bufferData[1][31:24] >= bottomMin) & (bufferData[1][31:24] <= bottomMax);
assign buffer2Bottom = bufferDataAvail[2] & (bufferData[2][31:24] >= bottomMin) & (bufferData[2][31:24] <= bottomMax); 
assign buffer3Bottom = bufferDataAvail[3] & (bufferData[3][31:24] >= bottomMin) & (bufferData[3][31:24] <= bottomMax);


assign buffer1Right = bufferDataAvail[1] & ~buffer1Top & ~buffer1Bottom;
assign buffer2Right = bufferDataAvail[2] & ~buffer2Top & ~buffer2Bottom;
assign buffer3Right = bufferDataAvail[3] & ~buffer3Top & ~buffer3Bottom;


always @(*)
begin
    if(currTopBuffer==1)
        buffer1Rdy = i_data_ready1;
    else if(currBottomBuffer==1)
        buffer1Rdy = i_data_ready2;
    else
        buffer1Rdy = i_data_ready3;
end


always @(*)
begin
    if(currTopBuffer==2)
        buffer2Rdy = i_data_ready1;
    else if(currBottomBuffer==2)
        buffer2Rdy = i_data_ready2;
    else
        buffer2Rdy = i_data_ready3;
end


always @(*)
begin
    if(currRightBuffer==3)
        buffer3Rdy = i_data_ready1;
    else if(currRightBuffer==3)
        buffer3Rdy = i_data_ready2;
    else
        buffer3Rdy = i_data_ready3;
end

assign o_data_valid1 = bufferDataAvail[currTopBuffer];
assign o_data1 = bufferData[currTopBuffer];

assign o_data_valid2 = bufferDataAvail[currBottomBuffer];
assign o_data2 = bufferData[currBottomBuffer];

assign o_data_valid3 = bufferDataAvail[currRightBuffer];
assign o_data3 = bufferData[currRightBuffer];


always @(posedge i_clk)
begin
    case(currTopBuffer)
        1:begin
            if(buffer2Top)
                currTopBuffer   <= 2;
            else if(buffer3Top)
                currTopBuffer   <= 3;
            else
                currTopBuffer   <= 1;
        end
        2:begin
            if(buffer3Top)
                currTopBuffer   <= 3;
            else if(buffer1Top)
                currTopBuffer   <= 1;
            else
                currTopBuffer   <= 2;
        end
        3:begin
            if(buffer1Top)
                currTopBuffer   <= 1;
            else if(buffer2Top)
                currTopBuffer   <= 2;
            else
                currTopBuffer   <= 3;
        end
        default:begin
            currTopBuffer   <= 1;
        end
    endcase
end



always @(posedge i_clk)
begin
    case(currBottomBuffer)
        1:begin
            if(buffer2Bottom)
                currBottomBuffer   <= 2;
            else if(buffer3Bottom)
                currBottomBuffer   <= 3;
            else
                currBottomBuffer   <= 1;
        end
        2:begin
            if(buffer3Bottom)
                currBottomBuffer   <= 3;
            else if(buffer1Bottom)
                currBottomBuffer   <= 1;
            else
                currBottomBuffer   <= 2;
        end
        3:begin
            if(buffer1Bottom)
                currBottomBuffer   <= 1;
            else if(buffer2Bottom)
                currBottomBuffer   <= 2;
            else
                currBottomBuffer   <= 3;
        end
        default:begin
            currBottomBuffer   <= 1;
        end
    endcase
end


always @(posedge i_clk)
begin
    case(currRightBuffer)
        1:begin
            if(buffer2Right)
                currRightBuffer   <= 2;
            else if(buffer3Right)
                currRightBuffer   <= 3;
            else
                currRightBuffer   <= 1;
        end
        2:begin
            if(buffer3Right)
                currRightBuffer   <= 3;
            else if(buffer1Right)
                currRightBuffer   <= 1;
            else
                currRightBuffer   <= 2;
        end
        3:begin
            if(buffer1Right)
                currRightBuffer   <= 1;
            else if(buffer2Right)
                currRightBuffer   <= 2;
            else
                currRightBuffer   <= 3;
        end
        default:begin
            currRightBuffer   <= 1;
        end
    endcase
end


packetBuffer buff1 (
  .wr_rst_busy(),      // output wire wr_rst_busy
  .rd_rst_busy(),      // output wire rd_rst_busy
  .s_aclk(i_clk),                // input wire s_aclk
  .s_aresetn(!i_reset),          // input wire s_aresetn
  .s_axis_tvalid(i_data_valid1),  // input wire s_axis_tvalid
  .s_axis_tready(o_data_ready1),  // output wire s_axis_tready
  .s_axis_tdata(i_data1),    // input wire [31 : 0] s_axis_tdata
  .m_axis_tvalid(bufferDataAvail[1]),  // output wire m_axis_tvalid
  .m_axis_tready(buffer1Rdy),  // input wire m_axis_tready
  .m_axis_tdata(bufferData[1])    // output wire [31 : 0] m_axis_tdata
);

packetBuffer buff2 (
  .wr_rst_busy(),      // output wire wr_rst_busy
  .rd_rst_busy(),      // output wire rd_rst_busy
  .s_aclk(i_clk),                // input wire s_aclk
  .s_aresetn(!i_reset),          // input wire s_aresetn
  .s_axis_tvalid(i_data_valid2),  // input wire s_axis_tvalid
  .s_axis_tready(o_data_ready2),  // output wire s_axis_tready
  .s_axis_tdata(i_data2),    // input wire [31 : 0] s_axis_tdata
  .m_axis_tvalid(bufferDataAvail[2]),  // output wire m_axis_tvalid
  .m_axis_tready(buffer2Rdy),  // input wire m_axis_tready
  .m_axis_tdata(bufferData[2])    // output wire [31 : 0] m_axis_tdata
);

packetBuffer buff3 (
  .wr_rst_busy(),      // output wire wr_rst_busy
  .rd_rst_busy(),      // output wire rd_rst_busy
  .s_aclk(i_clk),                // input wire s_aclk
  .s_aresetn(!i_reset),          // input wire s_aresetn
  .s_axis_tvalid(i_data_valid3),  // input wire s_axis_tvalid
  .s_axis_tready(o_data_ready3),  // output wire s_axis_tready
  .s_axis_tdata(i_data3),    // input wire [31 : 0] s_axis_tdata
  .m_axis_tvalid(bufferDataAvail[3]),  // output wire m_axis_tvalid
  .m_axis_tready(buffer3Rdy),  // input wire m_axis_tready
  .m_axis_tdata(bufferData[3])    // output wire [31 : 0] m_axis_tdata
);

endmodule

