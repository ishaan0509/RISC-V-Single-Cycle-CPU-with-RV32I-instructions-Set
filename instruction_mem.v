module instruction_mem(
input clk,rst,
input [31:0] read_address,
output [31:0] instruction_out //instruction
);
reg[31:0] mem [0:63]; //64 instructions
initial begin
    $readmemh("beq_updated.hex", mem);
    $display("MEM[0] = %h", mem[0]);
    $display("MEM[1] = %h", mem[1]);
    $display("MEM[2] = %h", mem[2]);
    $display("MEM[3] = %h", mem[3]);
    $display("MEM[4] = %h", mem[4]);
end
//assign instruction based on word-alligned address -- because of pc+4 increment
assign instruction_out = mem[read_address >> 2];

endmodule