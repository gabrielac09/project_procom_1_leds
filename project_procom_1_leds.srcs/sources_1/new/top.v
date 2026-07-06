`timescale 1ns / 100ps
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
     parameter NB_COUNTER = 16, //es 32 para que sea visible en la placa pero lo cambio para verlo en el ILA
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


// Creo cable de mux para i_sw de vio o del top

wire selmux;

wire [NB_SW-1:0] w_sw_mux;
wire [NB_SW-1:0] w_sw;
assign w_sw_mux = (selmux) ? w_sw : i_sw;

wire w_reset_mux;
wire w_reset;
assign w_reset_mux = (selmux) ? w_reset : i_reset;


//cable de salida de los modulos count y shiftreg  
wire [NB_LEDS-1:0] connect_leds;
wire               connect_valid;

//cables de salida de los leds para el ILA y VI
wire [NB_LEDS-1:0] w_led;
wire [NB_LEDS-1:0] w_led_b;
wire [NB_LEDS-1:0] w_led_g;


count
#(
    .NB_SW       (NB_SW - 1),
    .NB_COUNTER  (NB_COUNTER)
)
ucount
(
    .o_valid (connect_valid),
    .i_sw    (w_sw_mux[2:0]),
    .i_reset (~w_reset_mux),
    .clock   (clock)                         
);

shiftreg
#(
    .NB_LEDS (NB_LEDS)
)
ushiftreg
(
    .o_led  (connect_leds),
    .i_valid(connect_valid),
    .i_reset(~w_reset_mux),
    .clock   (clock)                         
);

ila
u_ila(
   .clk_0    (clock)   ,
   .probe0_0 (w_led   ),
   .probe1_0 (w_led_b ),
   .probe2_0 (w_led_g )
);

vio
u_vio
(  .clk_0        (clock) ,
   .probe_in0_0  (w_led   ) ,
   .probe_in1_0  (w_led_b ) ,
   .probe_in2_0  (w_led_g ) ,
   .probe_out0_0 (selmux) ,
   .probe_out1_0 (w_reset) ,
   .probe_out2_0 (w_sw)
   );



//con esto es azul o verde dependiendo del valor de i_sw[3]
assign w_led = connect_leds;
assign w_led_b = (w_sw_mux[3]==2'b00) ? connect_leds : {NB_LEDS{1'b0}};
assign w_led_g = (w_sw_mux[3]==2'b00) ? {NB_LEDS{1'b0}} : connect_leds; //este es Not del azul

assign o_led  = w_led  ;
assign o_led_b= w_led_b;
assign o_led_g= w_led_g;





endmodule
