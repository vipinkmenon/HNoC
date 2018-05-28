module switch2 #(parameter DataWidth = 36,
AddrWidth = 4,
bottomMin = 0,
bottomMax = 0,
topMin = 1,
topMax = 1
)(
input	wire	i_sclk,
input	wire	i_reset,
//top
input	wire	[DataWidth-1:0] i_data1,
input	wire	i_data_valid1,
output	wire	o_data_ready1,
output	wire	[DataWidth-1:0] o_data1,
output	wire 	o_data_valid1,
input   wire	i_data_ready1,
//bottom
input	wire	[DataWidth-1:0] i_data2,
input	wire	i_data_valid2,
output	wire	o_data_ready2,
output	wire	[DataWidth-1:0] o_data2,
output	wire 	o_data_valid2,
input	wire	i_data_ready2,
//right
input	wire	[DataWidth-1:0] i_data3,
input	wire	i_data_valid3,
output	wire	o_data_ready3,
output	wire	[DataWidth-1:0] o_data3,
output	reg 	o_data_valid3,
input	wire	i_data_ready3
);


wire [DataWidth-1:0] bufferData[1:3];

wire [1:3] bufferDataAvail;
wire buffer2Top;
wire buffer3Top;
wire buffer1Bottom;
wire buffer3Bottom;
wire buffer1Right;
wire buffer2Right;

reg buffer1Rdy;
reg buffer2Rdy;
reg buffer3Rdy;

reg [1:0] currTopBuffer;
reg [1:0] currBottomBuffer;
reg [1:0] currRightBuffer;

wire [DataWidth-1:0] outBuffer1Data;
reg  outBuffer1DataValid;
wire outBuffer1DataReady;

wire [DataWidth-1:0] outBuffer2Data;
reg  outBuffer2DataValid;
wire outBuffer2DataReady;

assign buffer2Top = bufferDataAvail[2] & (bufferData[2][DataWidth-1-:AddrWidth] >= topMin) & (bufferData[2][DataWidth-1-:AddrWidth] <= topMax); 
assign buffer3Top = bufferDataAvail[3] & (bufferData[3][DataWidth-1-:AddrWidth] >= topMin) & (bufferData[3][DataWidth-1-:AddrWidth] <= topMax);  

assign buffer1Bottom = bufferDataAvail[1] & (bufferData[1][DataWidth-1-:AddrWidth] >= bottomMin) & (bufferData[1][DataWidth-1-:AddrWidth] <= bottomMax);
assign buffer3Bottom = bufferDataAvail[3] & (bufferData[3][DataWidth-1-:AddrWidth] >= bottomMin) & (bufferData[3][DataWidth-1-:AddrWidth] <= bottomMax);


assign buffer1Right = bufferDataAvail[1] & ~buffer1Bottom;
assign buffer2Right = bufferDataAvail[2] & ~buffer2Top ;

always @(*)
begin
    if(currBottomBuffer == 1 & buffer1Bottom)
        buffer1Rdy = outBuffer2DataReady;
    else if(currRightBuffer == 1 & buffer1Right)
        buffer1Rdy = i_data_ready3;
    else
        buffer1Rdy = 0;
end


always @(*)
begin
    if(currTopBuffer == 2 & buffer2Top)
        buffer2Rdy = outBuffer1DataReady;
    else if(currRightBuffer == 2 & buffer2Right)
        buffer2Rdy = i_data_ready3;
    else
        buffer2Rdy = 0;
end


always @(*)
begin
    if(currTopBuffer == 3 & buffer3Top)
        buffer3Rdy = outBuffer1DataReady;
    else if(currBottomBuffer == 3 & buffer3Bottom)
        buffer3Rdy = outBuffer2DataReady;
    else
        buffer3Rdy = 0;
end

always @(*)
begin
    case(currTopBuffer)
        2:begin
            outBuffer1DataValid = buffer2Top;
        end
        3:begin
            outBuffer1DataValid = buffer3Top;
        end
        default:begin
            outBuffer1DataValid = 0;
        end
    endcase
end

always @(*)
begin
    case(currBottomBuffer)
        1:begin
            outBuffer2DataValid = buffer1Bottom;
        end
        3:begin
            outBuffer2DataValid = buffer3Bottom;
        end
        default:begin
            outBuffer2DataValid = 0;
        end
    endcase
end

always @(*)
begin
    case(currRightBuffer)
        1:begin
            o_data_valid3 = buffer1Right;
        end
        2:begin
            o_data_valid3 = buffer2Right;
        end
        default:begin
            o_data_valid3 = 0;
        end
    endcase
end


assign outBuffer1Data = bufferData[currTopBuffer];
assign outBuffer2Data = bufferData[currBottomBuffer];
assign o_data3 = bufferData[currRightBuffer];


always @(posedge i_sclk)
begin
    case(currTopBuffer)
        2:begin
            if(buffer3Top)
                currTopBuffer   <= 3;
            else
                currTopBuffer   <= 2;
        end
        3:begin
            if(buffer2Top)
                currTopBuffer   <= 2;
            else
                currTopBuffer   <= 3;
        end
        default:begin
            currTopBuffer   <= 2;
        end
    endcase
end



always @(posedge i_sclk)
begin
    case(currBottomBuffer)
        1:begin
            if(buffer3Bottom)
                currBottomBuffer   <= 3;
            else
                currBottomBuffer   <= 1;
        end
        3:begin
            if(buffer1Bottom)
                currBottomBuffer   <= 1;
            else
                currBottomBuffer   <= 3;
        end
        default:begin
            currBottomBuffer   <= 1;
        end
    endcase
end


always @(posedge i_sclk)
begin
    case(currRightBuffer)
        1:begin
            if(buffer2Right)
                currRightBuffer   <= 2;
            else
                currRightBuffer   <= 1;
        end
        2:begin
            if(buffer1Right)
                currRightBuffer   <= 1;
            else
                currRightBuffer   <= 2;
        end
        default:begin
            currRightBuffer   <= 2;
        end
    endcase
end

//Interface to Top input
packetBuffer topIn (
  .wr_rst_busy(),      // output wire wr_rst_busy
  .rd_rst_busy(),      // output wire rd_rst_busy
  .s_aclk(i_sclk),                // input wire s_aclk
  .s_aresetn(!i_reset),          // input wire s_aresetn
  .s_axis_tvalid(i_data_valid1),  // input wire s_axis_tvalid
  .s_axis_tready(o_data_ready1),  // output wire s_axis_tready
  .s_axis_tdata(i_data1),    // input wire [31 : 0] s_axis_tdata
  .m_axis_tvalid(bufferDataAvail[1]),  // output wire m_axis_tvalid
  .m_axis_tready(buffer1Rdy),  // input wire m_axis_tready
  .m_axis_tdata(bufferData[1])    // output wire [31 : 0] m_axis_tdata
);

//Interface to Bottom input
packetBuffer BottomIn (
  .wr_rst_busy(),      // output wire wr_rst_busy
  .rd_rst_busy(),      // output wire rd_rst_busy
  .s_aclk(i_sclk),                // input wire s_aclk
  .s_aresetn(!i_reset),          // input wire s_aresetn
  .s_axis_tvalid(i_data_valid2),  // input wire s_axis_tvalid
  .s_axis_tready(o_data_ready2),  // output wire s_axis_tready
  .s_axis_tdata(i_data2),    // input wire [31 : 0] s_axis_tdata
  .m_axis_tvalid(bufferDataAvail[2]),  // output wire m_axis_tvalid
  .m_axis_tready(buffer2Rdy),  // input wire m_axis_tready
  .m_axis_tdata(bufferData[2])    // output wire [31 : 0] m_axis_tdata
);

//Interface to Right input
SyncFifo RightIn (
  .wr_rst_busy(),      // output wire wr_rst_busy
  .rd_rst_busy(),      // output wire rd_rst_busy
  .s_aclk(i_sclk),                // input wire s_aclk
  .s_aresetn(!i_reset),          // input wire s_aresetn
  .s_axis_tvalid(i_data_valid3),  // input wire s_axis_tvalid
  .s_axis_tready(o_data_ready3),  // output wire s_axis_tready
  .s_axis_tdata(i_data3),    // input wire [31 : 0] s_axis_tdata
  .m_axis_tvalid(bufferDataAvail[3]),  // output wire m_axis_tvalid
  .m_axis_tready(buffer3Rdy),  // input wire m_axis_tready
  .m_axis_tdata(bufferData[3])    // output wire [31 : 0] m_axis_tdata
);

//Interface to Top output
packetBuffer TopOut (
  .wr_rst_busy(),      // output wire wr_rst_busy
  .rd_rst_busy(),      // output wire rd_rst_busy
  .s_aclk(i_sclk),                // input wire s_aclk
  .s_aresetn(!i_reset),          // input wire s_aresetn
  .s_axis_tvalid(outBuffer1DataValid),  // input wire s_axis_tvalid
  .s_axis_tready(outBuffer1DataReady),  // output wire s_axis_tready
  .s_axis_tdata(outBuffer1Data),    // input wire [31 : 0] s_axis_tdata
  .m_axis_tvalid(o_data_valid1),  // output wire m_axis_tvalid
  .m_axis_tready(i_data_ready1),  // input wire m_axis_tready
  .m_axis_tdata(o_data1)    // output wire [31 : 0] m_axis_tdata
);


//Interface to Bottom output
packetBuffer BottomOut (
  .wr_rst_busy(),      // output wire wr_rst_busy
  .rd_rst_busy(),      // output wire rd_rst_busy
  .s_aclk(i_sclk),                // input wire s_aclk
  .s_aresetn(!i_reset),          // input wire s_aresetn
  .s_axis_tvalid(outBuffer2DataValid),  // input wire s_axis_tvalid
  .s_axis_tready(outBuffer2DataReady),  // output wire s_axis_tready
  .s_axis_tdata(outBuffer2Data),    // input wire [31 : 0] s_axis_tdata
  .m_axis_tvalid(o_data_valid2),  // output wire m_axis_tvalid
  .m_axis_tready(i_data_ready2),  // input wire m_axis_tready
  .m_axis_tdata(o_data2)    // output wire [31 : 0] m_axis_tdata
);



endmodule
