module Transport(
        input wire          clk,
        input wire          rst,
        input wire  [4:0]   bt,
        output reg [7:0]   data
);



always@(posedge clk or negedge rst)begin
    if(rst)begin
        data = 8'd0;
    end else begin
        case (bt)
         4'd1 : data = {3'b000,bt};         
         default : data = 8'd9;       
        endcase
    end
end

endmodule
