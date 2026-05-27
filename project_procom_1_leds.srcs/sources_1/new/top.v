`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.05.2026 09:33:21
// Design Name: 
// Module Name: top
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


module top(                                                                             
     output [3 :0] o_led  ,                             
     output [3 :0] o_led_b  ,                           
     output [3 :0] o_led_g  ,                             
     input  [3 :0]  i_sw   ,                             
     input        i_reset,                             
     input       clock                                                                             
);

count
     ucount(
     .o_valid (w_valid),
     .i_sw    (i_sw[2:0]),
     .i_reset (i_reset),
     .clock   (clock)                         
    );

shiftreg
     ushiftreg(
     .o_led  (w_led),
     .i_valid(w_valid),
     .i_reset(i_reset),
     .clock   (clock)                         
    );



endmodule
