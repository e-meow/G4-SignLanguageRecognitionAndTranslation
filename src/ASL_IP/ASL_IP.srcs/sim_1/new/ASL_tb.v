`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2016 11:57:21 PM
// Design Name: 
// Module Name: ASL_tb
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


module ASL_tb();
    //input output ports
    reg clock, resetn; 
    reg start;
    reg [7:0] sensor1, sensor2, sensor3, sensor4, sensor5;
    reg [8:0] x_coord, y_coord;
    wire [5:0] letter; 
    reg [5:0] letter_exp;
    wire letter_valid, letter_unknown;
    parameter horiz = 9'b010000000, vert = 9'd0, inward = 9'd0, down = 9'b010000000;
    
    ASL_IP ASL_inst (clock,resetn,start,sensor1,sensor2,sensor3,sensor4,sensor5,x_coord,y_coord,letter,letter_valid,letter_unknown);

    initial begin
    clock = 0;
    forever #5 clock = ~clock;
    end
    
    initial begin
    resetn = 0;
    #20;
    resetn = 1;
    //exit reset
    end
    
    initial begin
        #100;
        //A
        letter_exp = 6'd65;
        sensor1[7:0] = 8'd236;
        sensor2[7:0] = 8'd163;
        sensor3[7:0] = 8'd177;
        sensor4[7:0] = 8'd174;
        sensor5[7:0] = 8'd174;
        y_coord = vert;
        x_coord = 0;
        start = 1;
        #200;
        start = 0;
        #50;
        //B
        letter_exp = 6'd66;
        sensor1[7:0] = 8'd195;
        sensor2[7:0] = 8'd250;
        sensor3[7:0] = 8'd230;
        sensor4[7:0] = 8'd250;
        sensor5[7:0] = 8'd250;
        y_coord = vert;
        x_coord = 0;
        start = 1;
        #200;
        start = 0;
        #50;
        //C
        letter_exp = 6'd67;
        sensor1[7:0] = 8'd223;
        sensor2[7:0] = 8'd190;
        sensor3[7:0] = 8'd200;
        sensor4[7:0] = 8'd200;
        sensor5[7:0] = 8'd200;
        y_coord = vert;
        x_coord = 0;
        start = 1;
        #200;
        start = 0;
        #50;
        //D
        letter_exp = 6'd68;
        sensor1[7:0] = 8'd230;
        sensor2[7:0] = 8'd238;
        sensor3[7:0] = 8'd184;
        sensor4[7:0] = 8'd183;
        sensor5[7:0] = 8'd183;
        y_coord = vert;
        x_coord = 0;
        start = 1;
        #200;
        start = 0;
        #50;
        //E
        letter_exp = 6'd69;
        sensor1[7:0] = 8'd189;
        sensor2[7:0] = 8'd170;
        sensor3[7:0] = 8'd180;
        sensor4[7:0] = 8'd176;
        sensor5[7:0] = 8'd176;
        y_coord = vert;
        x_coord = 0;
        start = 1;
        #200;
        start = 0;
        #50;
        //F
        letter_exp = 6'd70;
        sensor1[7:0] = 8'd240;
        sensor2[7:0] = 8'd178;
        sensor3[7:0] = 8'd240;
        sensor4[7:0] = 8'd255;
        sensor5[7:0] = 8'd255;
        y_coord = vert;
        x_coord = 0;
        start = 1;
        #200;
        start = 0;
        #50;
        //G
        letter_exp = 6'd71;
        sensor1[7:0] = 8'd225;
        sensor2[7:0] = 8'd232;
        sensor3[7:0] = 8'd186;
        sensor4[7:0] = 8'd183;
        sensor5[7:0] = 8'd183;
        y_coord = horiz;
        x_coord = inward;
        start = 1;
        #200;
        start = 0;
        #50;
        //H
        letter_exp = 6'd72;
        sensor1[7:0] = 8'd220;
        sensor2[7:0] = 8'd245;
        sensor3[7:0] = 8'd188;
        sensor4[7:0] = 8'd187;
        sensor5[7:0] = 8'd187;
        y_coord = horiz;
        x_coord = inward;
        start = 1;
        #200;
        start = 0;
        #50;
        //I,J
        letter_exp = 6'd73;
        sensor1[7:0] = 8'd203;
        sensor2[7:0] = 8'd188;
        sensor3[7:0] = 8'd188;
        sensor4[7:0] = 8'd186;
        sensor5[7:0] = 8'd250;
        y_coord = vert;
        x_coord = 0;
        start = 1;
        #200;
        start = 0;
        #50;
        //K
        letter_exp = 6'd75;
        sensor1[7:0] = 8'd240;
        sensor2[7:0] = 8'd239;
        sensor3[7:0] = 8'd190;
        sensor4[7:0] = 8'd190;
        sensor5[7:0] = 8'd190;
        y_coord = horiz;
        x_coord = inward;
        start = 1;
        #200;
        start = 0;
        #50;
        //L
        letter_exp = 6'd76;
        sensor1[7:0] = 8'd238;
        sensor2[7:0] = 8'd227;
        sensor3[7:0] = 8'd184;
        sensor4[7:0] = 8'd180;
        sensor5[7:0] = 8'd180;
        y_coord = vert;
        x_coord = 0;
        start = 1;
        #200;
        start = 0;
        #50;
        //M
        letter_exp = 6'd77;
        sensor1[7:0] = 8'd200;
        sensor2[7:0] = 8'd168;
        sensor3[7:0] = 8'd188;
        sensor4[7:0] = 8'd193;
        sensor5[7:0] = 8'd187;
        start = 1;
        #200;
        start = 0;
        #50;
        //N
        letter_exp = 6'd78;
        sensor1[7:0] = 8'd203;
        sensor2[7:0] = 8'd176;
        sensor3[7:0] = 8'd195;
        sensor4[7:0] = 8'd187;
        sensor5[7:0] = 8'd187;
        start = 1;
        #200;
        start = 0;
        #50;
        //O
        letter_exp = 6'd79;
        sensor1[7:0] = 8'd228;
        sensor2[7:0] = 8'd186;
        sensor3[7:0] = 8'd201;
        sensor4[7:0] = 8'd199;
        sensor5[7:0] = 8'd199;
        y_coord = vert;
        x_coord = 0;
        start = 1;
        #200;
        start = 0;
        #50;
        //P
        letter_exp = 6'd80;
        sensor1[7:0] = 8'd240;
        sensor2[7:0] = 8'd240;
        sensor3[7:0] = 8'd205;
        sensor4[7:0] = 8'd217;
        sensor5[7:0] = 8'd217;
        y_coord = horiz;
        x_coord = down;
        start = 1;
        #200;
        start = 0;
        #50;
        //Q
        letter_exp = 6'd81;
        sensor1[7:0] = 8'd238;
        sensor2[7:0] = 8'd212;
        sensor3[7:0] = 8'd181;
        sensor4[7:0] = 8'd176;
        sensor5[7:0] = 8'd176;
        y_coord = horiz;
        x_coord = down;
        start = 1;
        #200;
        start = 0;
        #50;
        //R
        letter_exp = 6'd82;
        sensor1[7:0] = 8'd218;
        sensor2[7:0] = 8'd245;
        sensor3[7:0] = 8'd187;
        sensor4[7:0] = 8'd184;
        sensor5[7:0] = 8'd184;
        y_coord = vert;
        x_coord = 0;
        start = 1;
        #200;
        start = 0;
        #50;
        //S
        letter_exp = 6'd83;
        sensor1[7:0] = 8'd206;
        sensor2[7:0] = 8'd156;
        sensor3[7:0] = 8'd187;
        sensor4[7:0] = 8'd181;
        sensor5[7:0] = 8'd181;
        y_coord = vert;
        x_coord = 0;
        start = 1;
        #200;
        start = 0;
        #50;
        //T
        letter_exp = 6'd84;
        sensor1[7:0] = 8'd213;
        sensor2[7:0] = 8'd190;
        sensor3[7:0] = 8'd183;
        sensor4[7:0] = 8'd181;
        sensor5[7:0] = 8'd181;
        y_coord = vert;
        x_coord = 0;
        start = 1;
        #200;
        start = 0;
        #50;
        //U,V
        letter_exp = 6'd85;
        sensor1[7:0] = 8'd206;
        sensor2[7:0] = 8'd236;
        sensor3[7:0] = 8'd198;
        sensor4[7:0] = 8'd195;
        sensor5[7:0] = 8'd195;
        y_coord = vert;
        x_coord = 0;
        start = 1;
        #200;
        start = 0;
        #50;
        //W
        letter_exp = 6'd87;
        sensor1[7:0] = 8'd209;
        sensor2[7:0] = 8'd247;
        sensor3[7:0] = 8'd238;
        sensor4[7:0] = 8'd255;
        sensor5[7:0] = 8'd190;
        y_coord = vert;
        x_coord = 0;
        start = 1;
        #200;
        start = 0;
        #50;
        //X
        letter_exp = 6'd88;
        sensor1[7:0] = 8'd198;
        sensor2[7:0] = 8'd200;
        sensor3[7:0] = 8'd182;
        sensor4[7:0] = 8'd177;
        sensor5[7:0] = 8'd177;
        y_coord = vert;
        x_coord = 0;
        start = 1;
        #200;
        start = 0;
        #50;
        //Y
        letter_exp = 6'd89;
        sensor1[7:0] = 8'd242;
        sensor2[7:0] = 8'd183;
        sensor3[7:0] = 8'd191;
        sensor4[7:0] = 8'd190;
        sensor5[7:0] = 8'd250;
        y_coord = vert;
        x_coord = 0;
        start = 1;
        #200;
        start = 0;
        #50;
        //Z
        letter_exp = 6'd90;
        sensor1[7:0] = 8'd220;
        sensor2[7:0] = 8'd240;
        sensor3[7:0] = 8'd186;
        sensor4[7:0] = 8'd180;
        sensor5[7:0] = 8'd180;
        y_coord = horiz;
        x_coord = down;
        start = 1;
        #200;
        start = 0;
        #50;
        //space
        letter_exp = 6'd10;
        sensor1[7:0] = 8'd208;
        sensor2[7:0] = 8'd155;
        sensor3[7:0] = 8'd180;
        sensor4[7:0] = 8'd175;
        sensor5[7:0] = 8'd175;
        y_coord = horiz;
        x_coord = down;
        start = 1;
        #200;
        start = 0;
        #50;
        //clear
        letter_exp = 6'd1;
        sensor1[7:0] = 8'd238;
        sensor2[7:0] = 8'd240;
        sensor3[7:0] = 8'd238;
        sensor4[7:0] = 8'd255;
        sensor5[7:0] = 8'd255;
        y_coord = horiz;
        x_coord = down;
        start = 1;
        #200;
        start = 0;
        #50;
    end
    
endmodule
