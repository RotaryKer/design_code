module Transport(
        input wire          clk,
        input wire          rst,
        input wire  [3:0]   sw,
        output reg [7:0]   data
);



always@(posedge clk or negedge rst)begin
    if(rst)begin
        data = 8'd0;
    end else begin
        case (sw)
         4'd1 : data = {4'b0000,sw};         
         4'd2 : data = {4'b0000,sw};         
         4'd3 : data = {4'b0000,sw};         
         4'd4 : data = {4'b0000,sw};         
         4'd5 : data = {4'b0000,sw};         
         4'd6 : data = {4'b0000,sw};         
         4'd7 : data = {4'b0000,sw};         
         4'd8 : data = {4'b0000,sw};         
        endcase
    end
end

endmodule
