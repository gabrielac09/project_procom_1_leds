`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.05.2026 09:34:23
// Design Name: 
// Module Name: count
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


module count
#(
    parameter NB_SW=3 ,
    parameter NB_COUNTER=32
)(
    output       o_valid    , 

    input [NB_SW - 1 : 0]  i_sw       ,   
    input        i_reset    ,   
    input        clock                              
    );

    //localparam
    localparam R0 = (2**(NB_COUNTER-10)-1);
    localparam R1 = (2**(NB_COUNTER-11)-1);
    localparam R2 = (2**(NB_COUNTER-12)-1);
    localparam R3 = (2**(NB_COUNTER-13)-1);


    //frecuencia de reloj de 100MHz,
    //para generar una señal de 1Hz, el contador debe contar hasta 10^8, lo que es aproximadamente 2^27
    //si pongo NV_COUNTER-10 igual a 22, el contador contara hasta 2^22-1
    //calculo la cantidad de Hz: F = F_reloj / (2^NB_COUNTER-10)
    //si F_reloj es 100MHz y NB_COUNTER-10 es 22, F = 100*10^6 / 4.19*10^6 = 23.87Hz
    //T=1/F, entonces T=1/23.87Hz = 0.0419s, lo que es aproximadamente 41.9ms
    //Si R=(2^NB_COUNTER)/32, entonces R=2^32/32=2^27=134217728, lo que es aproximadamente 1.34*10^8
    // En tiempo esto seria T=R/F_reloj, entonces T=1.34*10^8 / 100*10^6 = 1.34s



    // Var
    wire [NB_COUNTER - 1 : 0] limit_counter;
    reg [NB_COUNTER - 1 : 0] counter;
    reg r_valid;


    assign limit_counter = (i_sw[2:1] == 2'b00) ? R0 :
                           (i_sw[2:1] == 2'b01) ? R1 :
                           (i_sw[2:1] == 2'b10) ? R2 : R3;


    always @(posedge clock) begin
        if(i_reset)begin
            counter <= {NB_COUNTER{1'b0}};
        end
        else if(i_sw[0]) begin
            if(counter >= limit_counter)begin
                counter <= {NB_COUNTER{1'b0}};
                r_valid <= 1'b1;
            end
            else begin
                counter <= counter + 1;
                r_valid <= 1'b0;
            end
        end
        else begin
            counter <= counter;
            r_valid <= r_valid;
        end
    end
    
    //el comando para seleccionar filas es SHIFT + FLECHA ABAJO o ARRIBA
    //pero para seleccionar bloques es ALT + FLECHA ABAJO o ARRIBA
    //pero para duplicar el cursor en varias filas es CTRL + ALT + FLECHA ABAJO o ARRIBA




    //Case Example
    // localparam OP1 = 2'b00;
    // localparam OP2 = 2'b01;
    // localparam OP3 = 2'b10;
    // localparam OP4 = 2'b11;
    // reg [NB_COUNTER - 1 : 0] limit_counter;


    // //Bloqueante -> logica combinacional, se ejecuta en el orden que esta escrita
    // //No Bloqueante -> logica secuencial, se ejecuta en paralelo

    // always @(*)begin
    //     case (i_sw[2:1])
    //         OP1: limit_counter = R0;
    //         OP2: limit_counter = R1;
    //         OP3: limit_counter = R2;
    //         OP4: limit_counter = R3;
    //         //default: limit_counter = R0;
    //     endcase
    // end

    // always @(*) begin   
    //     if(i_sw[2:1] == OP1) 
    //         limit_counter = R0;
    //     else if(i_sw[2:1] == OP2) 
    //         limit_counter = R1;
    //     else if(i_sw[2:1] == OP3) 
    //         limit_counter = R2;
    //     else                        
    //         limit_counter = R3;
    // end

    //el comando para comentar es CTRL + K + C
    //el comando para descomentar es CTRL + K + U



endmodule
