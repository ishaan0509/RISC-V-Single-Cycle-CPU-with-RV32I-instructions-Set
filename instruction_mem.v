module instruction_mem(
input clk,rst,
input [31:0] read_address,
output [31:0] instruction_out //instruction
);
reg[31:0] mem [0:63]; //64 instructions

//assign instruction based on word-alligned address -- because of pc+4 increment
assign instruction_out = mem[read_address >> 2];

endmodule