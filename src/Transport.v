module Transport(
        input wire          clk,
        input wire          rst,
//        input wire          start_flag,
        output reg [7:0]   data
);


always@(posedge clk or negedge rst)begin
    if(rst)begin
        data = 8'h0;     //a
    end else begin
        if(data == 8'b11111111)begin
        data = 8'h0;
        end 
        else begin
        data = data + 1'b1;
        end
    end
end

endmodule
