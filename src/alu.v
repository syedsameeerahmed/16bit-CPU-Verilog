module alu(input [15:0] A,B, input [3:0] op, output reg [15:0] Y);
always @(*) begin
 case(op)
 4'b0000: Y=A+B;
 4'b0001: Y=A-B;
 4'b0010: Y=A&B;
 4'b0011: Y=A|B;
 4'b0100: Y=A^B;
 4'b0101: Y=(A<B)?16'd1:16'd0;
 default: Y=0;
 endcase
end
endmodule

