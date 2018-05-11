`timescale 1ns/1ps

module pe #(address = 0,numPE=16,AddressWidth=4,DataWidth=32,TotalWidth=36,PktLmit=100)(
input clk,
input rst,
input [TotalWidth-1:0] i_data,
input i_data_valid,
output o_data_ready,
output reg [TotalWidth-1:0] o_data,
output reg o_data_valid,
input i_data_ready,
input done
);

integer receivedPkts = 0;
assign o_data_ready = 1'b1;
reg [AddressWidth-1:0] peaddress;
integer seed;
reg [DataWidth-1:0] data;
integer i=0;
integer               receive_log_file;
reg   [100*8:0]       receive_log_file_name = "receive_log.csv";


initial
begin
    receive_log_file = $fopen(receive_log_file_name,"a");
    o_data_valid = 1'b0;
    seed = address;
    wait(~rst);
    repeat(PktLmit)
    begin
        data = PktLmit*address + i;
        i = i+1;
        peaddress = $urandom(seed)%16;
        seed = seed + 1;
        sendData({peaddress,data});
    end
    o_data_valid <= 1'b0;
end

always @(posedge clk)
begin
    if(i_data_valid)
    begin
       $fwrite(receive_log_file,"%0d,%0d,%d\n",address,i_data[DataWidth+:AddressWidth],i_data[DataWidth-1:0]);
       $fflush(receive_log_file);
       receivedPkts = receivedPkts + 1;
    end
end


task sendData;
    input [TotalWidth-1:0] data;
    begin
        o_data_valid <= 1'b1;
        o_data <= data;
        @(posedge clk);
        while(i_data_ready == 1'b0)
            @(posedge clk);
    end
endtask

initial
begin
    @(posedge done);
    $display("PE No: %d\tReceived Packets: %d",address,receivedPkts);
end

endmodule