`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2024 09:21:09 PM
// Design Name: 
// Module Name: reverser
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


module reverser #(
    parameter N = 8 // Width of the input vector
)(
    input logic [N-1:0] a,    // Input vector
    input logic reverse,      // 0 for no reversal, 1 for reversal
    output logic [N-1:0] y    // Output vector
);

    // Reverse
    assign y = reverse ? {a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7]} : a;

endmodule

