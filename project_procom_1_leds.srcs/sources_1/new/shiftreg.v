`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.05.2026 18:07:56
// Design Name: 
// Module Name: shiftreg
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


module shiftreg
#(
        parameter NB_LEDS = 3
)
(
     output [NB_LEDS-1:0]   o_led  ,  

    input                   i_valid  ,      
    input                   i_reset  ,        
    input                   clock
);


    // Var 
    reg [NB_LEDS-1:0] shiftreg;
    integer ptr;


    always @(posedge clock) begin
        if(i_reset)begin
            shiftreg <= {1'b1, {NB_LEDS-1{1'b0}}}; //OP_ 4'b1000;
        end
        else if(i_valid)begin
            shiftreg <= {shiftreg[NB_LEDS-2 -:NB_LEDS-1], shiftreg[NB_LEDS-1]}; 
        end
        else begin
            shiftreg <= shiftreg;
        end
    end


            //OP_x -> La diferencia de shiftreg[NB_LEDS-2:0] y shiftreg[NB_LEDS-2 -:NB_LEDS-1] es que el primero es un rango de bits y el segundo es una operacion de bits, el resultado es el mismo
            // shiftreg <= {shiftreg[NB_LEDS-2:0],shiftreg[NB_LEDS-1]};
            //es el mismo que shiftreg[NB_LEDS-2:0], pero con la ventaja de que si cambio el valor de NB_LEDS, no tengo que cambiar el rango de bits, ya que se ajusta automaticamente

            // //OP1 -> For
            // for(ptr=0; ptr<NB_LEDS-1; ptr=ptr+1)begin
            //     shiftreg[ptr+1] <= shiftreg[ptr];
            // end
            // shiftreg[0] <= shiftreg[NB_LEDS-1];

            // //OP2 -> Fuerza bruta
            // shiftreg[1] <= shiftreg[0];
            // shiftreg[2] <= shiftreg[1];
            // shiftreg[3] <= shiftreg[2];
            // shiftreg[0] <= shiftreg[3];

            // //Op3 -> Operacion de bits
            // shiftreg <= shiftreg << 1;
            // shiftreg[0] <= shiftreg[NB_LEDS-1];


    
endmodule
