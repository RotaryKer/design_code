module Led(
    input wire          clk.
    input wire          rst,
    input wire  [7:0]   data_in,
    output reg  [7:0]   led
);

always@(posedge clk or negedge rst)begin
    if(rst)begin
        led = 8'd0;
    end else begin
        led = data_in;
    end
end
endmodule
