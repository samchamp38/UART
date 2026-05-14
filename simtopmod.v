`include "baudgen.v"
`include "rx.v"
`include "tx.v"

module uarttop (
    input clk,
    input rst,
    input txstart,
    input [7:0] datain,
    output [7:0] dataout,
    output rxdone,
    output busy
);

tx dut1 (
    .clk(clk),
    .rst(rst),
    .txstart(txstart),
    .datain(datain),
    .tx(txline),
    .busy(busy)
);

rx dut2 (
    .clk(clk),
    .rst(rst),
    .rx(txline),      
    .dataout(dataout),
    .rxdone(rxdone)
);
endmodule
