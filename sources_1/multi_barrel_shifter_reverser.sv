`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2024 07:16:16 PM
// Design Name: 
// Module Name: multi_barrel_shifter_reverser
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
module multi_barrel_shifter_reverser #(
    parameter N = 8,
    parameter AMT_WIDTH = $clog2(N)
)(
    input logic [N-1:0] reverser_a,       // Input
    input logic [AMT_WIDTH-1:0] reverser_amt, // Amount to shift
    input logic reverser_lr,              // 0 for right, 1 for left
    output logic [N-1:0] reverser_y       // Output
);
    
    // Internal signals
    logic [N-1:0] a_pre_reversed;
    logic [N-1:0] y_post_reversed;
    logic [N-1:0] y_final;

    reverser #(
        .N(N)
    ) rev0 (
        .a(reverser_a),
        .reverse(reverser_lr),
        .y(a_pre_reversed)
    );

    param_right_shifter #(
        .N(N)
    ) right_shifter (
        .a(a_pre_reversed),
        .amt(reverser_amt),
        .y(y_post_reversed)
    );
    
    reverser #(
        .N(N)
    ) rev1 (
        .a(y_post_reversed),
        .reverse(reverser_lr),
        .y(y_final)
    );
    
    assign reverser_y = y_final;

endmodule
