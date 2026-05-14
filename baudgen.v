module baudgen(
    input clk,
    input rst,
    output ticktx,
    output tickrx
);
    localparam txfinval = 10416;  
    localparam rxfinval = 651;    
    reg [14:0]txcount;
    reg [9:0]rxcount;

    always @ (posedge clk or posedge rst)
    begin
        if(rst)
        begin
        txcount <= 0;
        rxcount <= 0;
        end

        else
        begin
            if(txcount == txfinval - 1) txcount <= 0;
            else txcount <= txcount + 1;
           
            if(rxcount == rxfinval - 1) rxcount <= 0;
            else rxcount <= rxcount +1;
        end
    end

    assign ticktx = (txcount == txfinval - 1);
    assign tickrx = (rxcount == rxfinval - 1);
endmodule