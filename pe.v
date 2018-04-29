module pe #(address = 0)(
input clk,
input rst,
input [31:0] i_data,
input i_data_valid,
output o_data_ready,
output reg [31:0] o_data,
output reg o_data_valid,
input i_data_ready
);

assign o_data_ready = 1'b1;
reg [7:0] peaddress = 3;
integer seed;

initial
begin
    o_data_valid = 1'b0;
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
    repeat(100)
    begin
        @(posedge clk);
        o_data_valid <= 1'b1;
        peaddress = $urandom(seed)%4;
        seed = seed + 1;
        o_data <= {peaddress,24'ha5a5a5};
        wait(i_data_ready);
    end
    @(posedge clk);
    o_data_valid <= 1'b0;
end


endmodule