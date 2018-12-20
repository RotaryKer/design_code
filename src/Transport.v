module Transport(
        input wire          clk,
        input wire          rst,
        input wire  [3:0]   bt,
        output reg [7:0]   data
);



always@(posedge clk or negedge rst)begin
    if(rst)begin
        data = 8'd00100001;
    end else begin
        case (bt)
         4'd1 : data = 8'h3f;         
         default : data = 8'd9;       
        endcase
    end
end

endmodule
