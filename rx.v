module rx(
    input clk,
    input rst,
    input rx,
    output reg [7:0] dataout,
    output reg rxdone
);

localparam idle  = 2'd0, start = 2'd1, data  = 2'd2, stop  = 2'd3;

reg [1:0]state;
reg [2:0]bitcount;
reg [3:0]sample;
reg [7:0]temp2;
wire rxtick;

baudgen dut2(clk,rst,,rxtick);

always @(posedge clk or posedge rst)
begin
    if (rst)
    begin
        state <= idle;
        rxdone <= 0;
        dataout <= 0;
        temp2 <= 0;
        bitcount <= 0;
        sample <= 0;
    end
   
    else
    begin
        rxdone <= 0;  
        case (state)
        idle: begin
            if (~rx)
            begin
                sample <= 0;  
                state <= start;
            end
            else state <= idle;
        end

        start: begin
            if (rxtick)
            begin
                if (sample == 4'd8)
                begin
                    if (~rx)
                    begin
                        sample <= 0;
                        bitcount <= 0;
                        state  <= data;
                    end
 
                end
                else sample <= sample + 1;
            end
        end
       
        data: begin
            if (rxtick)
            begin
                if (sample == 4'd15)
                begin
                    temp2 <= {rx, temp2[7:1]};
                    sample  <= 0;
                    if (bitcount == 3'd7) state <= stop;
                    else bitcount <= bitcount + 1;
                end
                else
                    sample <= sample + 1;
            end
        end

        stop: begin
            if (rxtick)
            begin
                if (sample == 4'd7)
                begin
                    if (rx)
                    begin
                        dataout <= temp2;
                        rxdone   <= 1;
                    end
                    state  <= idle;
                    sample <= 0;
                end
                else
                    sample <= sample + 1;
            end
        end

        default: state <= idle;

        endcase
    end
end
endmodule