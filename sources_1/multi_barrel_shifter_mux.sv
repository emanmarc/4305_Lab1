`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2024 07:16:16 PM
// Design Name: 
// Module Name: multi_barrel_shifter_mux
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


module multi_barrel_shifter_mux #(
    parameter N = 8,
    parameter AMT_WIDTH = $clog2(N)
)(
    input logic [N-1:0] mux_a,       // Input
    input logic [AMT_WIDTH-1:0] mux_amt, // Amount to shift
    input logic mux_lr,              // 0 for left, 1 for right
    output logic [N-1:0] mux_y       // Output 
);

    // Internal signals for left and right shifters outputs
    logic [N-1:0] y_left;
    logic [N-1:0] y_right;

    // Right barrel shifter
    param_right_shifter #(
        .N(N)
    ) right_shifter (
        .a(mux_a),
        .amt(mux_amt),
        .y(y_right)
    );

    // Left barrel shifter
    param_left_shifter #(
        .N(N)
    ) left_shifter (
        .a(mux_a),
        .amt(mux_amt),
        .y(y_left)
    );

    // Select output based on control signal lr
    assign mux_y = mux_lr ? y_right : y_left;

endmodule

