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
            7'b0110011: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, LUI_en, AUIPC_en, JAL_en, JALr_en, ALUop} <= 12'b001000000010; //R-type
            7'b0010011: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, LUI_en, AUIPC_en, JAL_en, JALr_en, ALUop} <= 12'b101000000000; //I-type
            7'b0000011: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, LUI_en, AUIPC_en, JAL_en, JALr_en, ALUop} <= 12'b111100000000; //load
            7'b0100011: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, LUI_en, AUIPC_en, JAL_en, JALr_en, ALUop} <= 12'b100010000000; //store
            7'b1100011: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, LUI_en, AUIPC_en, JAL_en, JALr_en, ALUop} <= 12'b000001000001; //beq

            7'b0110111: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, LUI_en, AUIPC_en, JAL_en, JALr_en, ALUop} <= 12'b010000100000; //U-type lui -- rd = imm(bigger value)
            7'b0010111: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, LUI_en, AUIPC_en, JAL_en, JALr_en, ALUop} <= 12'b001000010000; //U-type AUIPC -- rd = PC + imm

            7'b1101111: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, LUI_en, AUIPC_en, JAL_en, JALr_en, ALUop} <= 12'b101000011000; //J-type JAL -- pc = pc +imm 
            7'b1100111: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, LUI_en, AUIPC_en, JAL_en, JALr_en, ALUop} <= 12'b101000000100; //J-type JALr == pc = rs1 + imm

            default: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, LUI_en, AUIPC_en, JAL_en, JALr_en, ALUop} <= 12'b000000000000; //default with r-type
        endcase
    end

endmodule