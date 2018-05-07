`timescale 1ns/1ps

module pe #(address = 0,numPe=8,PktLmit=20)(
input clk,
input rst,
input [37:0] i_data,
input i_data_valid,
output o_data_ready,
output [37:0] o_data,
output wire o_data_valid,
input i_data_ready,
input done
);

integer receivedPkts = 0;
assign o_data_ready = 1'b1;
reg [2:0] peaddress = 3;
integer seed;
reg [31:0] data;
integer i=0;
integer               receive_log_file;
reg   [100*8:0]       receive_log_file_name = "receive_log.csv";
reg start=0;

initial
begin
    receive_log_file = $fopen(receive_log_file_name,"a");
    seed = address;
    wait(~rst);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    start = 1;
    #1;
    repeat(PktLmit)
    begin
        data = PktLmit*address + i;
        i = i+1;
        peaddress = $urandom(seed)%numPe;
        seed = seed + 1;
        sendData();
    end
    start = 0;
end

always @(posedge clk)
begin
    if(i_data_valid)
    begin
       $fwrite(receive_log_file,"%0d,%0d,%d\n",address,i_data[31:24],i_data[23:0]);
       $fflush(receive_log_file);
       receivedPkts = receivedPkts + 1;
    end
end

reg data_valid=0;
assign o_data_valid = i_data_ready&start;
assign o_data = {1'b1,1'b1,peaddress,1'b0,data};

task sendData;
    begin
        while(o_data_valid == 1'b0)
            @(posedge clk);
        @(posedge clk);
    end
endtask

initial
begin
    @(posedge done);
    $display("PE No: %d\tReceived Packets: %d",address,receivedPkts);
end

endmodule