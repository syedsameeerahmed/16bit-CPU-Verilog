module imem(input [15:0] addr, output [15:0] instr);
reg [15:0] mem[255:0];
initial begin
 mem[0]=16'b0000_001_010_011_000; // ADD R1,R2,R3
 mem[1]=16'b0001_100_001_010_000; // SUB R4,R1,R2
end
assign instr = mem[addr];
endmodule

