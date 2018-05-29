`timescale 1ps/1ps

`define NUMPE 4
`define PktLimit 100
`define expectedPkts `NUMPE*`PktLimit
`define DataWidth 32
`define AddressWidth $clog2(`NUMPE)
`define TotalWidth `DataWidth+`AddressWidth
`define PATTERN "Tornado"
`define Period1 10000
`define Period2 2500


module tb();

reg clk100;
reg clk200;
reg rst;

reg[31:0] receivedPkts=0;

integer               receive_log_file;
reg   [100*8:0]       receive_log_file_name = "receive_log.csv";

wire [`TotalWidth-1:0] o_pe0_data;
wire [`TotalWidth-1:0] o_pe1_data;
wire [`TotalWidth-1:0] o_pe2_data;
wire [`TotalWidth-1:0] o_pe3_data;


wire [`TotalWidth-1:0] i_pe0_data;
wire [`TotalWidth-1:0] i_pe1_data;
wire [`TotalWidth-1:0] i_pe2_data;
wire [`TotalWidth-1:0] i_pe3_data;
integer start,stop,delay;

reg done;

initial
begin
    clk100 = 0;
    receive_log_file = $fopen(receive_log_file_name,"w");
    forever
    begin
        clk100 = ~clk100;
        #(`Period1/2);
    end
end

initial
begin
    clk200 = 0;
    forever
    begin
        clk200 = ~clk200;
        #(`Period2/2);
    end
end


initial
begin
    rst = 1;
    #100000;
    @(posedge clk100);
    @(posedge clk100);
    @(posedge clk100);
    @(posedge clk100);
    @(posedge clk100);
    @(posedge clk100);
    @(posedge clk100);
    rst = 0;
    wait(i_pe0_data_ready);
    start = $time;
end

BTree #(.DataWidth(`DataWidth),.numPE(`NUMPE),.AddrWidth(`AddressWidth))
    BTree(
    .clk_100(clk100),
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



pe #(.address(0),.numPE(`NUMPE),.AddressWidth(`AddressWidth),.DataWidth(`DataWidth),.TotalWidth(`TotalWidth),.PktLmit(`PktLimit),.Pattern(`PATTERN))pe0(
    .clk(clk100),
    .rst(rst),
    .i_data(i_pe0_data),
    .i_data_valid(i_pe0_data_valid),
    .o_data_ready(o_pe0_data_ready),
    .o_data(o_pe0_data),
    .o_data_valid(o_pe0_data_valid),
    .i_data_ready(i_pe0_data_ready),
    .done(done)
);

pe #(.address(1),.numPE(`NUMPE),.AddressWidth(`AddressWidth),.DataWidth(`DataWidth),.TotalWidth(`TotalWidth),.PktLmit(`PktLimit),.Pattern(`PATTERN))pe1(
    .clk(clk100),
    .rst(rst),
    .i_data(i_pe1_data),
    .i_data_valid(i_pe1_data_valid),
    .o_data_ready(o_pe1_data_ready),
    .o_data(o_pe1_data),
    .o_data_valid(o_pe1_data_valid),
    .i_data_ready(i_pe1_data_ready),
    .done(done)
);

pe #(.address(2),.numPE(`NUMPE),.AddressWidth(`AddressWidth),.DataWidth(`DataWidth),.TotalWidth(`TotalWidth),.PktLmit(`PktLimit),.Pattern(`PATTERN))pe2(
    .clk(clk100),
    .rst(rst),
    .i_data(i_pe2_data),
    .i_data_valid(i_pe2_data_valid),
    .o_data_ready(o_pe2_data_ready),
    .o_data(o_pe2_data),
    .o_data_valid(o_pe2_data_valid),
    .i_data_ready(i_pe2_data_ready),
    .done(done)
);

pe #(.address(3),.numPE(`NUMPE),.AddressWidth(`AddressWidth),.DataWidth(`DataWidth),.TotalWidth(`TotalWidth),.PktLmit(`PktLimit),.Pattern(`PATTERN))pe3(
    .clk(clk100),
    .rst(rst),
    .i_data(i_pe3_data),
    .i_data_valid(i_pe3_data_valid),
    .o_data_ready(o_pe3_data_ready),
    .o_data(o_pe3_data),
    .o_data_valid(o_pe3_data_valid),
    .i_data_ready(i_pe3_data_ready),
    .done(done)
);


always @(posedge clk100)
begin
    if(rst)
        receivedPkts = 0;
    else
    begin
        receivedPkts = receivedPkts + i_pe0_data_valid + i_pe1_data_valid + i_pe2_data_valid + i_pe3_data_valid;
        
        if(receivedPkts == `expectedPkts)
        begin
            done = 1;
            stop = $time;
            $display("Start time %d Stop time %d",start,stop);
            $display("Throughput : %f",`expectedPkts*1.0/((stop-start)/`Period1));
            #100000;
            $fclose(receive_log_file_name);
            $stop;
        end
    end
end

endmodule