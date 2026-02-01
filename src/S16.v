module S16(input clk);
reg [15:0] PC=0;
wire [15:0] instr;
imem IM(PC,instr);

wire [3:0] op = instr[15:12];
wire [2:0] rd=instr[11:9], rs=instr[8:6], rt=instr[5:3];

wire RW,MW; wire [3:0] aluop;
control CU(op,RW,MW,aluop);

wire [15:0] A,B,Y;
regfile RF(clk,RW,rs,rt,rd,Y,A,B);
alu ALU(A,B,aluop,Y);

always @(posedge clk) PC<=PC+1;
endmodule

