`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2024 07:37:55 PM
// Design Name: 
// Module Name: barrel_shifter_TB
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

module barrel_shifter_TB();
    // Parameters
    parameter N = 32;
    parameter AMT_WIDTH = $clog2(N);
    
    // Inputs
    logic [N-1:0] a;
    logic [AMT_WIDTH-1:0] amt;
    
    // Outputs
    logic [N-1:0] y_right, y_left;
    
    param_right_shifter #(
        .N(N)
    ) uut_right (
        .a(a),
        .amt(amt),
        .y(y_right)
    );
    
    param_left_shifter #(
        .N(N)
    ) uut_left (
        .a(a),
        .amt(amt),
        .y(y_left)
    );
    
    initial begin

        a = 32'b00000000000000000000000000011010;
        amt = 3'd0;
        #10;
        
        amt = 3'd1;
        #10;
        
        amt = 3'd2;
        #10;
        
        amt = 3'd3;
        #10;
        
        amt = 3'd4;
        #10;
        
        amt = 3'd5;
        #10;
        
        amt = 3'd6;
        #10;
        
        amt = 3'd7;
        #10;
        
        a = 8'b11110000;
        amt = 3'd3;
        #10;

        $finish;
    end
    
endmodule

