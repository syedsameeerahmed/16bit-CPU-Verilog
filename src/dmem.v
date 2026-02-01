module dmem(input clk,we, input [15:0] addr,wd, output [15:0] rd);
reg [15:0] mem[255:0];
assign rd = mem[addr];
always @(posedge clk)
 if(we) mem[addr]<=wd;
endmodule

