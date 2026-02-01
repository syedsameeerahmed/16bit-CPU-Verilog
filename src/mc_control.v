module mc_control(
    input clk, reset,
    input [3:0] opcode,
    output reg IRWrite, PCWrite,
    output reg RegWrite, MemWrite,
    output reg [3:0] ALUop,
    output reg [2:0] state
);

always @(posedge clk or posedge reset) begin
    if(reset) state <= 0;
    else begin
        case(state)
            0: state <= 1;          // Fetch
            1: state <= 2;          // Decode
            2: state <= (opcode==4'b0110 || opcode==4'b0111) ? 3 : 4;
            3: state <= 4;          // Memory
            4: state <= 0;          // Writeback → Fetch
        endcase
    end
end

always @(*) begin
    IRWrite=0; PCWrite=0; RegWrite=0; MemWrite=0; ALUop=0;
    case(state)
        0: begin IRWrite=1; PCWrite=1; ALUop=4'b0000; end
        2: begin ALUop = opcode; end
        3: if(opcode==4'b0111) MemWrite=1;
        4: if(opcode!=4'b0111) RegWrite=1;
    endcase
end
endmodule

