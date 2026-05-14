module top(
    input clk,
    input rst,
    input rx,
    output tx,
    input [7:0] boardip,     
    input btn,    
    output wire [7:0] led,
    output reg [6:0] seg,
    output reg [3:0] an
);

    wire [7:0] rxdata;
    wire rxdone;
    wire txbusy;

    reg txstart;
    reg [7:0] txdata;
    reg [7:0] leddata;
    
    assign led = leddata;

    reg btn_d;
    wire btn_pulse;

    always @(posedge clk) btn_d <= btn;
    assign btn_pulse = btn & ~btn_d;    

    tx TX (
        .clk(clk),
        .rst(rst),
        .txstart(txstart),
        .datain(txdata),
        .tx(tx),
        .busy(txbusy)
    );

    rx RX (
        .clk(clk),
        .rst(rst),
        .rx(rx),
        .dataout(rxdata),
        .rxdone(rxdone)
    );

    always @(posedge clk or posedge rst)
    begin
        if (rst)
        begin
            leddata <= 8'b0;
            txstart <= 1'b0;
            txdata  <= 8'b0;
        end
        
        else
        begin
            txstart <= 1'b0;
            if (rxdone)
            begin
                leddata <= rxdata;  
            end

            else if (btn_pulse && !txbusy)
            begin
                txdata  <= boardip;
                txstart <= 1'b1;    
            end
    end
    end


    reg [3:0] hundreds, tens, ones;
    always @(*)
    begin
        hundreds = leddata / 100;
        tens     = (leddata % 100) / 10;
        ones     = leddata % 10;
    end

    reg [16:0] refresh;
    always @(posedge clk or posedge rst)
    begin
        if (rst) refresh <= 0;
        else     refresh <= refresh + 1;
    end

    reg [3:0] digit_val;
    always @(*)
    begin
        case (refresh[16:15])
            2'd0: begin an = 4'b1110; digit_val = ones; end
            2'd1: begin an = 4'b1101; digit_val = tens; end
            2'd2: begin an = 4'b1011; digit_val = hundreds; end
            2'd3: begin an = 4'b1111; digit_val = 4'd0; end
        endcase
    end

    always @(*)
    begin
        case (digit_val)
            4'd0 : seg = 7'b1000000;
            4'd1 : seg = 7'b1111001;
            4'd2 : seg = 7'b0100100;
            4'd3 : seg = 7'b0110000;
            4'd4 : seg = 7'b0011001;
            4'd5 : seg = 7'b0010010;
            4'd6 : seg = 7'b0000010;
            4'd7 : seg = 7'b1111000;
            4'd8 : seg = 7'b0000000;
            4'd9 : seg = 7'b0011000;
            default: seg = 7'b1111111;
        endcase
    end
endmodule