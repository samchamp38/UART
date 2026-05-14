module tx(
    input clk,
    input rst,
    input txstart,
    input [7:0] datain,
    output reg tx,
    output reg busy
);

localparam idle  = 2'b00, start = 2'b01, data  = 2'b10, stop  = 2'b11;

reg [1:0] state;
reg [2:0] dex;
reg [7:0] temp;
wire txtick;

baudgen dut1 (clk,rst,txtick,);

always @(posedge clk or posedge rst)
begin
    if (rst) state <= idle;
    
    else
    begin
        case (state)

        idle: begin
            tx   <= 1'b1;
            busy <= 1'b0;  
            dex  <= 3'd0;
            if (txstart)
            begin
                temp <= datain;
                busy <= 1'b1;
                state <= start;
            end
        end

        start: begin
            if (txtick)
            begin
                tx    <= 1'b0;
                state <= data;
            end
            else state <= start;
        end

        data: begin
            if (txtick)
            begin
                tx <= temp[dex];
                if (dex == 3'd7) state <= stop;
                else dex <= dex + 1;
            end
        end

        stop: begin
            if (txtick)
            begin
            tx <= 1'b1;
                busy  <= 1'b0;   
                state <= idle;
            end
        end

        default: begin
            tx    <= 1'b1;
            busy  <= 1'b0;
            state <= idle;
        end
        endcase
    end
end
endmodule