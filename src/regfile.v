module regfile(input clk,we,
input [2:0] ra1,ra2,wa,
input [15:0] wd,
output [15:0] rd1,rd2);

reg [15:0] R[7:0];
assign rd1 = R[ra1];
assign rd2 = R[ra2];

always @(posedge clk)
 if(we && wa!=0) R[wa] <= wd;
endmodule

