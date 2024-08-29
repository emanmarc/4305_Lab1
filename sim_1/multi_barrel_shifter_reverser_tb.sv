`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2024 09:23:08 PM
// Design Name: 
// Module Name: multi_barrel_shifter_reverser_tb
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


module multi_barrel_shifter_reverser_tb();

    parameter N = 8;
    parameter AMT_WIDTH = $clog2(N);

    // Inputs
    logic [N-1:0] a;
    logic [AMT_WIDTH-1:0] amt;
    logic lr;

    // Output
    logic [N-1:0] y;
    
    // Reverser
    multi_barrel_shifter_reverser #(
        .N(N)
    ) uut (
        .reverser_a(a),
        .reverser_amt(amt),
        .reverser_lr(lr), // 0 for right, 1 for left
        .reverser_y(y)
    );
    
    // Mux 
//    multi_barrel_shifter_mux #(
//    .N(N)
//    ) uut (
//           .mux_a(a), 
//           .mux_amt(amt), 
//           .mux_lr(lr), // 0 for left, 1 for right
//           .mux_y(y)       
//    );
    
    initial begin

        a = 8'b00001100;
        amt = 3'd1;
        lr = 1'b1;
        #10;

        lr = 1'b0;
        #10;
        
        amt = 3'd2;
        lr = 1'b1;
        #10;
        
        lr = 1'b0;
        #10;
        
        amt = 3'd3;
        lr = 1'b1;
        #10;
        
        lr = 1'b0;
        #10;
        
        amt = 3'd4;
        lr = 1'b1;
        #10;
        
        lr = 1'b0;
        #10;
        
        amt = 3'd5;
        lr = 1'b1;
        #10;
        
        lr = 1'b0;
        #10;
        
        amt = 3'd6;
        lr = 1'b1;
        #10;
        
        lr = 1'b0;
        #10;
        
        amt = 3'd7;
        lr = 1'b1;
        #10;
        
        lr = 1'b0;
        #10;
        $finish;
    end

endmodule

