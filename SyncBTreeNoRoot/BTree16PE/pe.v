`timescale 1ps/1ps

module pe #(address = 0,numPE=4,AddressWidth=2,DataWidth=32,TotalWidth=35,PktLmit=100,Pattern="Random")(
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
integer counter=0;
assign o_data_ready = 1'b1;
reg [AddressWidth-1:0] peaddress;
integer seed;
reg [DataWidth-1:0] data;
integer i=0;
integer               receive_log_file;
reg   [100*8:0]       receive_log_file_name = "receive_log.csv";
integer j;
integer latency;

always @(posedge clk)
    counter <= counter + 1;

initial
begin
    receive_log_file = $fopen(receive_log_file_name,"a");
    o_data_valid = 1'b0;
    seed = address;
    wait(~rst);
    repeat(PktLmit)
    begin
        data = counter;
        i = i+1;
        if(Pattern == "RANDOM")
           peaddress = $urandom(seed)%16;
	    else if(Pattern == "COMPLEMENT")
        begin
           for(j=0;j<AddressWidth;j=j+1)
               peaddress[j] = !address[j];
        end
        else if(Pattern == "REVERSE")
        begin
           for(j=0;j<AddressWidth;j=j+1)
               peaddress[j] = address[AddressWidth-1-j]; 
        end
        else if(Pattern == "Rotation")
        begin
           for(j=0;j<AddressWidth;j=j+1)
               peaddress[j] = address[(j+1)%AddressWidth]; 
        end
        else if(Pattern == "Transpose")
        begin
           for(j=0;j<AddressWidth;j=j+1)
               peaddress[j] = address[(j+(AddressWidth/2))%AddressWidth]; 
        end
        else if(Pattern == "Tornado")
        begin
               peaddress = (address + (numPE+1)/2)%numPE; 
        end
        else if(Pattern == "Neighbour")
        begin
               peaddress = (address + 1)%numPE; 
        end    
        seed = seed + 1;
        sendData({peaddress,data});
    end
    #150 o_data_valid <= 1'b0;
end

always @(posedge clk)
begin
    if(i_data_valid)
    begin
       latency = counter - i_data[DataWidth-1:0];
       $fwrite(receive_log_file,"%0d,%0d,%d,%d\n",address,i_data[DataWidth+:AddressWidth],i_data[DataWidth-1:0],latency);
       $fflush(receive_log_file);
       receivedPkts = receivedPkts + 1;
    end
end


task sendData;
    input [TotalWidth-1:0] data;
    begin
        #150 o_data_valid <= 1'b1;
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