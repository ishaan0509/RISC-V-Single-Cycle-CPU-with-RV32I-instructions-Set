//this specifies the operation based on the opcode
//mainly determines the ALUop

module control_unit (
    input [6:0]opcode,
    output reg Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, LUI_en, AUIPC_en, JAL_en, JALr_en,
    output reg [1:0]ALUop
);
//
    always @(*) begin
        case(opcode)
            7'b0110011: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, LUI_en, AUIPC_en, JAL_en, JALr_en, ALUop} <= 12'b001000000000;
            7'b0010011: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, LUI_en, AUIPC_en, JAL_en, JALr_en, ALUop} <= 12'b101000000000;
            7'b0000011: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, LUI_en, AUIPC_en, JAL_en, JALr_en, ALUop} <= 12'b111100000000;
            7'b0100011: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, LUI_en, AUIPC_en, JAL_en, JALr_en, ALUop} <= 12'b100010000000;
            7'b1100011: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, LUI_en, AUIPC_en, JAL_en, JALr_en, ALUop} <= 12'b000001000000;

            7'b0110111: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, LUI_en, AUIPC_en, JAL_en, JALr_en, ALUop} <= 12'b001000010000;
            7'b0010111: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, LUI_en, AUIPC_en, JAL_en, JALr_en, ALUop} <= 12'b001000001000;

            7'b1101111: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, LUI_en, AUIPC_en, JAL_en, JALr_en, ALUop} <= 12'b10000000110;
            7'b1100111: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, LUI_en, AUIPC_en, JAL_en, JALr_en, ALUop} <= 12'b10000000001;

            default: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, LUI_en, AUIPC_en, JAL_en, JALr_en, ALUop} <= 12'b000000000000_00;
        endcase
    end

endmodule