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


module top
#(
     parameter NB_SW = 4 ,          
     parameter NB_COUNTER = 32,
     parameter NB_LEDS = 4
)
(                                                                             
     output [NB_LEDS-1:0] o_led  ,                             
     output [NB_LEDS-1:0] o_led_b  ,                           
     output [NB_LEDS-1:0] o_led_g  ,   

     input  [NB_SW-1:0]  i_sw   ,                             
     input       i_reset,                             
     input       clock                                                                             
);

count
#(
    .NB_SW       (NB_SW - 1),
    .NB_COUNTER  (NB_COUNTER)
)
     ucount(
     .o_valid (connect_valid),
     .i_sw    (i_sw[2:0]),
     .i_reset (~i_reset),
     .clock   (clock)                         
    );

shiftreg
#(
    .NB_LEDS (NB_LEDS)
)
     ushiftreg(
     .o_led  (connect_leds),
     .i_valid(connect_valid),
     .i_reset(~i_reset),
     .clock   (clock)                         
    );

wire [NB_LEDS-1:0] connect_leds;
wire               connect_valid;

//hola comentario prueba matos



//con esto es azul o verde dependiendo del valor de i_sw[3]
assign o_led = connect_led;
assign o_led_b = (i_sw[3]==2'b00) ? connect_leds : {NB_LEDS{1'b0}};
assign o_led_g = (i_sw[3]==2'b00) ? {NB_LEDS{1'b0}} : connect_leds; //este es Not del azul

endmodule
