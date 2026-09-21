`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.09.2026 12:10:36
// Design Name: 
// Module Name: branch_adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module branch_adder(
input [31:0]plus4_addr,ImmAddr, //current PC Value and immediated value
output[31:0]mux_in_adder //mux input
    );
assign mux_in_adder = plus4_addr + ImmAddr;
endmodule
