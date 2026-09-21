`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.09.2026 12:08:54
// Design Name: 
// Module Name: PC_inc
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


module PC_inc(
input [31:0] fromPC,
output [31:0] toPC //next PC to this adder
    );
    assign toPC = 4 + fromPC;
endmodule
