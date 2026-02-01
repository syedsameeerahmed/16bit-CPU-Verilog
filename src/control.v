module control(input [3:0] op,
output reg RegWrite,MemWrite,
output reg [3:0] ALUop);

always @(*) begin
 RegWrite=0; MemWrite=0;
 case(op)
 4'b0000: begin RegWrite=1; ALUop=4'b0000; end
 4'b0001: begin RegWrite=1; ALUop=4'b0001; end
 4'b0010: begin RegWrite=1; ALUop=4'b0010; end
 4'b0111: MemWrite=1;
 endcase
end
endmodule

