`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2024 07:20:53 PM
// Design Name: 
// Module Name: param_right_shifter
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
// Explanation of the shifting operation:
// {stage[i][(1 << i)-1:0], stage[i][N-1:(1 << i)]}
// (1 << i): Equivalent to 2^i, shift amount doubles each stage
// stage[i][(1 << i)-1:0]: Rightmost 2^i bits from stage[i].
// stage[i][N-1:(1 << i)]: Leftmost N - 2^i bits from stage[i].
// Using concatenation {}, the rightmost bits wrap around to the left, the remaining bits are shifted to the right.
//////////////////////////////////////////////////////////////////////////////////

module param_right_shifter #(
    parameter N = 8,
    parameter AMT_WIDTH = $clog2(N)
    ) (
    input logic [N-1:0] a,
    input logic [AMT_WIDTH-1:0] amt,
    output logic [N-1:0] y
    );

    logic [N-1:0] stage[AMT_WIDTH:0]; // 2D Array to store log2(n) # of stages, N bits wide
    
    assign stage[0] = a; // Initial input a is first stage
    
    genvar i;
    generate
        for (i = 0; i < AMT_WIDTH; i = i + 1) begin : gen_stages
            assign stage[i+1] = amt[i] ? {stage[i][(1 << i)-1:0], stage[i][N-1:(1 << i)]} : stage[i];
        end
    endgenerate
    
    assign y = stage[AMT_WIDTH]; // Assigns result of final stage to output y
    
endmodule
