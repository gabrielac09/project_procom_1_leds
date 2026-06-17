`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.06.2026 20:33:22
// Design Name: 
// Module Name: tb_top
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


module tb_top();
     parameter NB_SW = 4        ;         
     parameter NB_COUNTER = 16  ;
     parameter NB_LEDS = 4      ;
     
     wire [NB_LEDS-1:0] o_led   ;                            
     wire [NB_LEDS-1:0] o_led_b ;                           
     wire [NB_LEDS-1:0] o_led_g ;   
                                
     reg  [NB_SW-1:0]  i_sw     ;                            
     reg       i_reset          ;                  
     reg       clock            ;
     
 top
#(
     .NB_SW      (NB_SW     ),  
     .NB_COUNTER (NB_COUNTER),
     .NB_LEDS    (NB_LEDS   )
)utop
(                                                                             
     .o_led   (o_led   ),                         
     .o_led_b (o_led_b ),                         
     .o_led_g (o_led_g ), 
     .i_sw   (i_sw   ),                            
     .i_reset(i_reset),                            
     .clock  (clock  )                                                                        
);

// Clock   
       always begin    
           clock = 1'b0; #5;    
           clock = 1'b1; #5;    
       end 
       // always #5 clock=~clock;
            
    // Estimulos    
    initial begin 
        i_sw = 4'b0000;
        i_reset = 1'b0;
        clock = 1'b0;
        #100;
        
        @(posedge clock)     
        i_reset = 1'b1; 
        #100;
        
        @(posedge clock)    //vel1
        i_sw = 4'b0001;
        #1000;
        
        @(posedge clock)    //vel2
        i_sw = 4'b0011; 
        #1000;           
        
        @(posedge clock)    //vel3
        i_sw = 4'b0101;  
        #1000;            
        
        @(posedge clock)    //vel4
        i_sw = 4'b0111; 
        #1000;           
           
        @(posedge clock)    //vel4 y otro color  
        i_sw = 4'b 1111;                                    
        #1000;

        @(posedge clock)    //vel3 y otro color  
        i_sw = 4'b 1101;                                    
        #1000;

        @(posedge clock)    //vel2 y otro color  
        i_sw = 4'b 1011;                                    
        #1000;

        @(posedge clock)    //vel1 y otro color  
        i_sw = 4'b 1001;                                    
        #1000;

        @(posedge clock)    //vel1 y pararlo  
        i_sw = 4'b 1000;                                    
        #1000;
        
                                  
                          
        $finish;
    end     



 



endmodule
