module S16_MC(input clk, reset);

reg [15:0] PC;
reg [15:0] IR, Areg, Breg, ALUOut, MDR;

wire [15:0] instr, memdata;
wire [3:0] opcode;

assign opcode = IR[15:12];

// ------------------ Memories ------------------
imem IM(PC, instr);
dmem DM(clk, MemWrite, ALUOut, Breg, memdata);

// ------------------ Control -------------------
wire IRWrite, PCWrite, RegWrite;
wire [3:0] ALUop;
wire [2:0] state;

mc_control CU(clk, reset, opcode, IRWrite, PCWrite, RegWrite, MemWrite, ALUop, state);

// ------------------ Register File --------------
wire [15:0] rd1, rd2;
regfile RF(
    clk,
    RegWrite,
    IR[8:6],    // Rs
    IR[5:3],    // Rt
    IR[11:9],   // Rd
    MDR,
    rd1,
    rd2
);

// ------------------ ALU -----------------------
wire [15:0] ALUres;
alu ALU(Areg, Breg, ALUop, ALUres);

// ------------------ Datapath Registers --------
always @(posedge clk or posedge reset) begin
    if(reset) begin
        PC <= 0;
        IR <= 0;
        Areg <= 0;
        Breg <= 0;
        ALUOut <= 0;
        MDR <= 0;
    end
    else begin
        if(IRWrite) IR <= instr;
        if(state == 3'd1) begin
            Areg <= rd1;
            Breg <= rd2;
        end
        if(state == 3'd2)
            ALUOut <= ALUres;
        if(state == 3'd3)
            MDR <= memdata;
        if(PCWrite)
            PC <= PC + 1;
    end
end

endmodule
