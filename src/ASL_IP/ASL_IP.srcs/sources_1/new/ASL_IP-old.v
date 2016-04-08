`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2016 10:37:00 PM
// Design Name: 
// Module Name: ASL_IP
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


module ASL_IP(
    clock,
    resetn,
    start,
    sensor1,
    sensor2,
    sensor3,
    sensor4,
    sensor5,
    letter,
    letter_valid,
    letter_unknown
    );
    //input output ports
    input clock, resetn, start;
    input [11:0] sensor1, sensor2, sensor3, sensor4, sensor5;
    output reg [5:0] letter;
    output reg letter_valid, letter_unknown;

    //parameters
    //0.98V, 0.9V, 0.84V
    parameter RES1_SLIGHT_CURVE_THRESHOLD = 12'hFAE, RES1_MED_CURVE_THRESHOLD = 12'hE66, RES1_VERY_CURVE_THRESHOLD = 12'hD70;
    parameter RES2_SLIGHT_CURVE_THRESHOLD = 12'hFAE, RES2_MED_CURVE_THRESHOLD = 12'hE66, RES2_VERY_CURVE_THRESHOLD = 12'hD70;
    //0.98,0.93,0.85
    parameter RES3_SLIGHT_CURVE_THRESHOLD = 12'hFAE, RES3_MED_CURVE_THRESHOLD = 12'hEE1, RES3_VERY_CURVE_THRESHOLD = 12'hD99;
    
    parameter RES_STRAIGHT = 4'b1000, RES_SLIGHT_CURVE = 4'b0100, RES_MED_CURVE = 4'b0010, RES_VERY_CURVE = 4'b0001;
    //output parameters
    parameter LETTER_1 = 6'd1, LETTER_2 = 6'd2, LETTER_3 = 6'd3, LETTER_4 = 6'd4, LETTER_5 = 6'd5, LETTER_6 = 6'd6, LETTER_7 = 6'd7, LETTER_8 = 6'd8, LETTER_9 = 6'd9;
    parameter LETTER_A = 6'd10, LETTER_B = 6'd11, LETTER_C = 6'd12, LETTER_D = 6'd13, LETTER_E = 6'd14, LETTER_F = 6'd15, LETTER_G = 6'd16;
    parameter LETTER_H = 6'd17, LETTER_I = 6'd18, LETTER_J = 6'd19, LETTER_K = 6'd20, LETTER_L = 6'd21, LETTER_M = 6'd22, LETTER_N = 6'd23;
    parameter LETTER_O = 6'd24, LETTER_P = 6'd25, LETTER_Q = 6'd26, LETTER_R = 6'd27, LETTER_S = 6'd28, LETTER_T = 6'd29;
    parameter LETTER_U = 6'd30, LETTER_V = 6'd31, LETTER_W = 6'd32, LETTER_X = 6'd33, LETTER_Y = 6'd34, LETTER_Z = 6'd35;
    //state parameters
    parameter S_RESET = 4'd0, S_INIT = 4'd6, S_THUMB = 4'd1, S_INDEX = 4'd2, S_MIDDLE = 4'd3, S_RING = 4'd4, S_PINKY = 4'd5, S_DONE = 4'd7;
    //wires
    wire [3:0] res1, res2, res3, res4, res5;
    reg [26:1] a_letter;
    reg [9:0] a_number;
    reg [3:0] state, next_state;
    
    //direct assignments
    assign res1 = (sensor1 > RES1_SLIGHT_CURVE_THRESHOLD) ? RES_STRAIGHT : ((sensor1 > RES1_MED_CURVE_THRESHOLD) ? RES_SLIGHT_CURVE : ((sensor1 > RES1_VERY_CURVE_THRESHOLD) ? RES_MED_CURVE : RES_VERY_CURVE));
    assign res2 = (sensor2 > RES1_SLIGHT_CURVE_THRESHOLD) ? RES_STRAIGHT : ((sensor2 > RES1_MED_CURVE_THRESHOLD) ? RES_SLIGHT_CURVE : ((sensor2 > RES1_VERY_CURVE_THRESHOLD) ? RES_MED_CURVE : RES_VERY_CURVE));
    assign res3 = (sensor3 > RES1_SLIGHT_CURVE_THRESHOLD) ? RES_STRAIGHT : ((sensor3 > RES1_MED_CURVE_THRESHOLD) ? RES_SLIGHT_CURVE : ((sensor3 > RES1_VERY_CURVE_THRESHOLD) ? RES_MED_CURVE : RES_VERY_CURVE));
    assign res4 = (sensor4 > RES1_SLIGHT_CURVE_THRESHOLD) ? RES_STRAIGHT : ((sensor4 > RES1_MED_CURVE_THRESHOLD) ? RES_SLIGHT_CURVE : ((sensor4 > RES1_VERY_CURVE_THRESHOLD) ? RES_MED_CURVE : RES_VERY_CURVE));
    assign res5 = (sensor5 > RES1_SLIGHT_CURVE_THRESHOLD) ? RES_STRAIGHT : ((sensor5 > RES1_MED_CURVE_THRESHOLD) ? RES_SLIGHT_CURVE : ((sensor5 > RES1_VERY_CURVE_THRESHOLD) ? RES_MED_CURVE : RES_VERY_CURVE));
    
    //******************************************* COMBINATIONAL LOGIC ********************************************
    // a 1; b 2; c 3; d 4; e 5; f 6; g 7
    // h 8; i 9; j 10; k 11; l 12; m 13; n 14
    // o 15; p 16; q 17; r 18; s 19; t 20
    // u 21; v 22; w 23; x 24; y 25; z 26

    always @ (posedge clock) begin
      case (state)
        S_INIT: begin
               a_letter[26:1] <= 26'h3FFFFFF;
               a_number[9:0] <= 10'h3FF;
               end
        S_RESET: begin
                a_letter[26:1] <= 26'h3FFFFFF;
                a_number[9:0] <= 10'h3FF;
                end
        S_THUMB: begin
                if (res1 == RES_STRAIGHT) begin
                  a_letter[4] <= 0; a_letter[5] <= 0; a_letter[6] <= 0; a_letter[9] <= 0; //d,e,f,i,j,m,s,u,v,x,z
                  a_letter[10] <= 0; a_letter[13] <= 0;
                  a_letter[19] <= 0; a_letter[21] <= 0; a_letter[22] <= 0; a_letter[23] <= 0; a_letter[26] <= 0;
                  a_number[0] <= 0; a_number[6] <= 0; a_number[7] <= 0; a_number[8] <= 0; a_number[9] <= 0; //0,6,7,8,9
                end else if (res1 == RES_SLIGHT_CURVE) begin
                  a_letter[5] <= 0; a_letter[7] <= 0; //e,g,k,l,m,o,p,q,t,y
                  a_letter[11] <= 0; a_letter[12] <= 0; a_letter[13] <= 0; a_letter[15] <= 0; a_letter[16] <= 0;
                  a_letter[17] <= 0; a_letter[20] <= 0; a_letter[25] <= 0;
                  a_number[3] <= 0; a_number[4] <= 0; a_number[5] <= 0; //3,4,5
                end else if (res1 == RES_MED_CURVE) begin
                  a_letter[1] <= 0; a_letter[7] <= 0; a_letter[11] <= 0; //a,g,k,l,n,o,p,q,r,t,y
                  a_letter[12] <= 0; a_letter[14] <= 0; a_letter[15] <= 0; a_letter[16] <= 0; a_letter[17] <= 0;
                  a_letter[18] <= 0; a_letter[20] <= 0; a_letter[25] <= 0;
                  a_number[2] <= 0; a_number[3] <= 0; a_number[4] <= 0; a_number[5] <= 0; //2,3,4,5
                end else begin // res1 very curve
                  a_letter[1] <= 0; a_letter[2] <= 0; a_letter[3] <= 0; a_letter[4] <= 0; a_letter[6] <= 0; a_letter[7] <= 0; //a,b,c,d,f,g,h,i,j,k,l,n,o,p,q,r,s,u,v,w,y,z
                  a_letter[8] <= 0; a_letter[9] <= 0; a_letter[10] <= 0; a_letter[11] <= 0; a_letter[12] <= 0; a_letter[14] <= 0; a_letter[15] <= 0; a_letter[16] <= 0; a_letter[17] <= 0;
                  a_letter[18] <= 0; a_letter[19] <= 0; a_letter[21] <= 0; a_letter[22] <= 0; a_letter[23] <= 0; a_letter[25] <= 0; a_letter[26] <= 0;
                  a_number[0:0] <= 0; //0-9
                end //if res1
                end //case thumb
        S_INDEX: begin
                if (res2 == RES_STRAIGHT) begin
                  a_letter[1] <= 0; a_letter[3] <= 0; a_letter[5] <= 0; a_letter[6] <= 0; //a,c,e,f,i,j,m,n,o,s,t,x,y
                  a_letter[9] <= 0; a_letter[10] <= 0; a_letter[13] <= 0; a_letter[14] <= 0;
                  a_letter[15] <= 0; a_letter[19] <= 0; a_letter[20] <= 0; a_letter[24] <= 0; a_letter[25] <= 0;
                  a_number[0] <= 0; a_number[9] <= 0; //0,9
                end else if (res2 == RES_SLIGHT_CURVE) begin
                  a_letter[1] <= 0; a_letter[2] <= 0; a_letter[4] <= 0; a_letter[5] <= 0; a_letter[7] <= 0; //a,b,d,e,g,h,i,j,k,l,m,n,p,q,r,s,t,u,v,w,y,z
                  a_letter[8] <= 0; a_letter[9] <= 0; a_letter[10] <= 0; a_letter[11] <= 0; a_letter[12] <= 0; a_letter[13] <= 0; a_letter[14] <= 0;
                  a_letter[16] <= 0; a_letter[17] <= 0; a_letter[18] <= 0; a_letter[19] <= 0; a_letter[20] <= 0;
                  a_letter[21] <= 0; a_letter[22] <= 0; a_letter[23] <= 0; a_letter[25] <= 0; a_letter[26] <= 0;
                  a_number[8:1] <= 0; //1-8
                end else if (res2 == RES_MED_CURVE) begin
                  a_letter[1] <= 0; a_letter[2] <= 0; a_letter[3] <= 0; a_letter[4] <= 0; a_letter[7] <= 0; //a,b,c,d,g,h,i,j,k,l,p,q,r,s,u,v,w,x,z
                  a_letter[8] <= 0; a_letter[9] <= 0; a_letter[10] <= 0; a_letter[11] <= 0; a_letter[12] <= 0;
                  a_letter[16] <= 0; a_letter[17] <= 0; a_letter[18] <= 0; a_letter[19] <= 0;
                  a_letter[21] <= 0; a_letter[22] <= 0; a_letter[23] <= 0; a_letter[24] <= 0; a_letter[26] <= 0;
                  a_number[8:1] <= 0; //1-8
                end else begin // res2 very curve
                  a_letter[2] <= 0; a_letter[3] <= 0; a_letter[4] <= 0; a_letter[7] <= 0; //b,c,d,g,h,k,l,n,o,p,q,r,t,u,v,w,x,z
                  a_letter[8] <= 0; a_letter[11] <= 0; a_letter[12] <= 0;
                  a_letter[15] <= 0; a_letter[16] <= 0; a_letter[17] <= 0; a_letter[18] <= 0;a_letter[20] <= 0;
                  a_letter[21] <= 0; a_letter[22] <= 0; a_letter[23] <= 0; a_letter[24] <= 0; a_letter[26] <= 0;
                  a_number[9:0] <= 0; //0-9
                end //if res2
                end //case index
        S_MIDDLE: begin
                if (res3 == RES_STRAIGHT) begin
                  a_letter[1] <= 0; a_letter[3]= 0; a_letter[4] <= 0; a_letter[5] <= 0; a_letter[7] <= 0; //a,c,d,e,g,i,j,l,m,n,o,p,q,s,t,x,y,z
                  a_letter[9] <= 0; a_letter[10] <= 0; a_letter[12] <= 0; a_letter[13] <= 0; a_letter[14] <= 0; a_letter[15] <= 0; a_letter[16] <= 0; a_letter[17] <= 0;
                  a_letter[19] <= 0; a_letter[20] <= 0; a_letter[24] <= 0; a_letter[25] <= 0; a_letter[26] <= 0;
                  a_number[0] <=0; a_number[8:1] <= 0; //0,1,8
                end else if (res3 == RES_SLIGHT_CURVE) begin
                  a_letter[1] <= 0; a_letter[2] <= 0; a_letter[6] <= 0; a_letter[7] <= 0; //a,b,f,g,h,i,j,k,l,m,n,o,q,r,s,t,u,v,w,x,y,z
                  a_letter[8] <= 0; a_letter[9] <= 0; a_letter[10] <= 0; a_letter[11] <= 0; a_letter[12] <= 0; a_letter[13] <= 0; a_letter[14] <= 0;
                  a_letter[15] <= 0; a_letter[17] <= 0; a_letter[18] <= 0; a_letter[19] <= 0; a_letter[20] <= 0;
                  a_letter[21] <= 0; a_letter[22] <= 0; a_letter[23] <= 0; a_letter[24] <= 0; a_letter[25] <= 0; a_letter[26] <= 0;
                  a_number[7:1] <= 0; a_number[9] <= 0; //1-7,9
                end else if (res3 == RES_MED_CURVE) begin
                  a_letter[1] <= 0; a_letter[2] <= 0; a_letter[3] <= 0; a_letter[6] <= 0; a_letter[7] <= 0; //a,b,c,f,g,h,k,m,q,r,s,t,u,v,w,x,y,z
                  a_letter[8] <= 0; a_letter[11] <= 0; a_letter[13] <= 0; a_letter[17] <= 0;
                  a_letter[18] <= 0; a_letter[19] <= 0; a_letter[20] <= 0;
                  a_letter[21] <= 0; a_letter[22] <= 0; a_letter[23] <= 0; a_letter[24] <= 0; a_letter[25] <= 0; a_letter[26] <= 0;
                  a_number[7:1] <= 0; a_number[9] <= 0; //1-7,9
                end else begin // res3 very curve
                  a_letter[2] <= 0; a_letter[3] <= 0; a_letter[4] <= 0; a_letter[5] <= 0; a_letter[6] <= 0; a_letter[8] <= 0; //b,c,d,e,f,h,k,n,p,r,u,v,w
                  a_letter[11] <= 0; a_letter[14] <= 0; a_letter[16] <= 0;
                  a_letter[18] <= 0; a_letter[21] <= 0; a_letter[22] <= 0; a_letter[23] <= 0;
                  a_number[0] <= 0; a_number[9:2] <= 0; //0,2-9
                end //if res3
                end //case middle
        S_RING: begin
                if (res4 == RES_STRAIGHT) begin
                a_letter[1] <= 0; a_letter[3] <= 0; a_letter[4] <= 0; a_letter[5] <= 0; a_letter[7] <= 0; //acdeghijklmnopqrstuvxyz
                a_letter[8] <= 0; a_letter[9] <= 0; a_letter[10] <= 0; a_letter[11] <= 0; a_letter[12] <= 0; a_letter[13] <= 0; a_letter[14] <= 0;
                a_letter[15] <= 0; a_letter[16] <= 0; a_letter[17] <= 0; a_letter[18] <= 0; a_letter[19] <= 0; a_letter[20] <= 0;
                a_letter[21] <= 0; a_letter[22] <= 0; a_letter[24] <= 0; a_letter[25] <= 0; a_letter[26] <= 0;
                a_number[3:0] <= 0; a_number[7] <= 0; //0-3,7
                end else if (res4 == RES_SLIGHT_CURVE) begin
                a_letter[1] <= 0; a_letter[2] <= 0; a_letter[6] <= 0; a_letter[7] <= 0; //abfghijklmnopqrstuvwxyz
                a_letter[8] <= 0; a_letter[9] <= 0; a_letter[10] <= 0; a_letter[11] <= 0; a_letter[12] <= 0; a_letter[13] <= 0; a_letter[14] <= 0;
                a_letter[15] <= 0; a_letter[16] <= 0; a_letter[17] <= 0; a_letter[18] <= 0; a_letter[19] <= 0; a_letter[20] <= 0;
                a_letter[21] <= 0; a_letter[22] <= 0; a_letter[23] <= 0; a_letter[24] <= 0; a_letter[25] <= 0; a_letter[26] <= 0;
                a_number[6:1] <= 0; a_number[9:8] <= 0; //1-6,8,9
                end else if (res4 == RES_MED_CURVE) begin
                a_letter[1] <= 0; a_letter[2] <= 0; a_letter[3] <= 0; a_letter[6] <= 0; a_letter[7] <= 0; //abcfghijklpqrstuvwxyz
                a_letter[8] <= 0; a_letter[9] <= 0; a_letter[10] <= 0; a_letter[11] <= 0; a_letter[12] <= 0;
                a_letter[16] <= 0; a_letter[17] <= 0; a_letter[18] <= 0; a_letter[19] <= 0; a_letter[20] <= 0;
                a_letter[21] <= 0; a_letter[22] <= 0; a_letter[23] <= 0; a_letter[24] <= 0; a_letter[25] <= 0; a_letter[26] <= 0;
                a_number[2:0] <= 0; a_number[6:4] <= 0; a_number[9:8] <= 0; //0-2,4-6,8,9
                end else begin // res4 very curve
                a_letter[2] <= 0; a_letter[3] <= 0; a_letter[4] <= 0; a_letter[6] <= 0; a_letter[23] <= 0; //bcdfw
                a_number[0] <= 0; a_number[6:4] <= 0; a_number[9:8] <= 0; //0,4-6,8,9
                end //if res4
                end //case ring
        S_PINKY: begin
                if (res5 == RES_STRAIGHT) begin
                a_letter[1] <= 0; a_letter[3] <= 0; a_letter[4] <= 0; a_letter[5] <= 0; a_letter[7] <= 0; //acdeghklmnopqrstuvwxz
                a_letter[8] <= 0; a_letter[11] <= 0; a_letter[12] <= 0; a_letter[13] <= 0; a_letter[14] <= 0;
                a_letter[15] <= 0; a_letter[16] <= 0; a_letter[17] <= 0; a_letter[18] <= 0; a_letter[19] <= 0; a_letter[20] <= 0;
                a_letter[21] <= 0; a_letter[22] <= 0; a_letter[23] <= 0; a_letter[24] <= 0; a_letter[26] <= 0;
                a_number[3:0] <= 0; a_number[6] <= 0; //0-3,6
                end else if (res5 == RES_SLIGHT_CURVE) begin
                a_letter[1] <= 0; a_letter[2] <= 0; a_letter[4] <= 0; a_letter[6] <= 0; a_letter[7] <= 0; //abdfghijklmnopqrstxyz
                a_letter[8] <= 0; a_letter[9] <= 0; a_letter[10] <= 0; a_letter[11] <= 0; a_letter[12] <= 0; a_letter[13] <= 0; a_letter[14] <= 0;
                a_letter[15] <= 0; a_letter[16] <= 0; a_letter[17] <= 0; a_letter[18] <= 0; a_letter[19] <= 0; a_letter[20] <= 0;
                a_letter[24] <= 0; a_letter[25] <= 0; a_letter[26] <= 0;
                a_number[5:1] <= 0; a_number[9:7] <= 0; //1-5,7-9
                end else if (res5 == RES_MED_CURVE) begin
                a_letter[1] <= 0; a_letter[2] <= 0; a_letter[6] <= 0; a_letter[7] <= 0; //abfghijpqrstxyz
                a_letter[8] <= 0; a_letter[9] <= 0; a_letter[10] <= 0; 
                a_letter[16] <= 0; a_letter[17] <= 0; a_letter[18] <= 0; a_letter[19] <= 0; a_letter[20] <= 0;
                a_letter[24] <= 0; a_letter[25] <= 0; a_letter[26] <= 0;
                a_number[0] <= 0; a_number[1] <= 0; a_number[4] <= 0; a_number[5] <= 0; a_number[9:7] <= 0; //0,1,4,5,7-9
                end else begin // res5 very curve
                a_letter[2] <= 0; a_letter[3] <= 0; a_letter[4] <= 0; a_letter[6] <= 0; a_letter[9] <= 0; a_letter[10] <= 0; //bcdfijy
                a_letter[25] <= 0;
                a_number[0] <= 0; a_number[4] <= 0; a_number[5] <= 0; a_number[9:7] <= 0; //0,4,5,7,8,9
                end //if res5
                end //case pinky
      endcase
    end //always
    
    //********************************************** OUTPUTS **************************************************
    always @ (posedge clock) begin
      if (~resetn) begin
        letter <= 0;
        letter_valid <= 0;
      end else if (state == S_DONE) begin
        if (a_letter[1]) begin
          letter <= LETTER_A;
          letter_valid <= 1;
          letter_unknown <= 0;
        end else if (a_letter[2]) begin
          letter <= LETTER_B;
          letter_valid <= 1;
          letter_unknown <= 0;
        end else if (a_letter[3]) begin
          letter <= LETTER_C;
          letter_valid <= 1;
          letter_unknown <= 0;
        end else if (a_letter[4]) begin
          letter <= LETTER_D;
          letter_valid <= 1;
          letter_unknown <= 0;
        end else if (a_letter[5]) begin
          letter <= LETTER_E;
          letter_valid <= 1;
          letter_unknown <= 0;
        end else if (a_letter[6]) begin
          letter <= LETTER_F;
          letter_valid <= 1;
          letter_unknown <= 0;
        end else if (a_letter[7]) begin
          letter <= LETTER_G;
          letter_valid <= 1;
          letter_unknown <= 0;
        end else if (a_letter[8]) begin
          letter <= LETTER_H;
          letter_valid <= 1;
          letter_unknown <= 0;
        end else if (a_letter[9]) begin
          letter <= LETTER_I;
          letter_valid <= 1;
          letter_unknown <= 0;
        end else if (a_letter[10]) begin
          letter <= LETTER_J;
          letter_valid <= 1;
          letter_unknown <= 0;
        end else if (a_letter[11]) begin
          letter <= LETTER_K;
          letter_valid <= 1;
          letter_unknown <= 0;
        end else if (a_letter[12]) begin
          letter <= LETTER_L;
          letter_valid <= 1;
          letter_unknown <= 0;
        end else if (a_letter[13]) begin
          letter <= LETTER_M;
          letter_valid <= 1;
          letter_unknown <= 0;
        end else if (a_letter[14]) begin
          letter <= LETTER_N;
          letter_valid <= 1;
          letter_unknown <= 0;
        end else if (a_letter[15]) begin
          letter <= LETTER_O;
          letter_valid <= 1;
          letter_unknown <= 0;
        end else if (a_letter[16]) begin
          letter <= LETTER_P;
          letter_valid <= 1;
          letter_unknown <= 0;
        end else if (a_letter[17]) begin
          letter <= LETTER_Q;
          letter_valid <= 1;
          letter_unknown <= 0;
        end else if (a_letter[18]) begin
          letter <= LETTER_R;
          letter_valid <= 1;
          letter_unknown <= 0;
        end else if (a_letter[19]) begin
          letter <= LETTER_S;
          letter_valid <= 1;
          letter_unknown <= 0;
        end else if (a_letter[20]) begin
          letter <= LETTER_T;
          letter_valid <= 1;
          letter_unknown <= 0;
        end else if (a_letter[21]) begin
          letter <= LETTER_U;
          letter_valid <= 1;
          letter_unknown <= 0;
        end else if (a_letter[22]) begin
          letter <= LETTER_V;
          letter_valid <= 1;
          letter_unknown <= 0;
        end else if (a_letter[23]) begin
          letter <= LETTER_W;
          letter_valid <= 1;
          letter_unknown <= 0;
        end else if (a_letter[24]) begin
          letter <= LETTER_X;
          letter_valid <= 1;
          letter_unknown <= 0;
        end else if (a_letter[25]) begin
          letter <= LETTER_Y;
          letter_valid <= 1;
          letter_unknown <= 0;
        end else if (a_letter[26]) begin
          letter <= LETTER_Z;
          letter_valid <= 1;
          letter_unknown <= 0;
        end else if (a_number[1]) begin
          letter <= LETTER_1;
          letter_valid <= 1;
          letter_unknown <= 0;
        end else if (a_number[2]) begin
          letter <= LETTER_2;
          letter_valid <= 1;
          letter_unknown <= 0;
        end else if (a_number[3]) begin
          letter <= LETTER_3;
          letter_valid <= 1;
          letter_unknown <= 0;
        end else if (a_number[4]) begin
          letter <= LETTER_4;
          letter_valid <= 1;
          letter_unknown <= 0;
        end else if (a_number[5]) begin
          letter <= LETTER_5;
          letter_valid <= 1;
          letter_unknown <= 0;
        end else if (a_number[6]) begin
          letter <= LETTER_6;
          letter_valid <= 1;
          letter_unknown <= 0;
        end else if (a_number[7]) begin
          letter <= LETTER_7;
          letter_valid <= 1;
          letter_unknown <= 0;
        end else if (a_number[8]) begin
          letter <= LETTER_8;
          letter_valid <= 1;
          letter_unknown <= 0;
        end else if (a_number[9]) begin
          letter <= LETTER_9;
          letter_valid <= 1;
          letter_unknown <= 0;
        end else if (a_number[0]) begin
          letter <= LETTER_O;
          letter_valid <= 1;
          letter_unknown <= 0;
        end else begin
          letter <= 0;
          letter_valid <= 0;
          letter_unknown <= 1;
        end //a_letter/a_number
      end else begin
        letter <= 0;
        letter_valid <= 0;
        letter_unknown <= 0;
      end //state == S_DONE
    end //always
    
    //********************************************** FSM **************************************************
    
    always @ (posedge clock) begin
        if (~resetn)
          state <= S_RESET;
        else
          state <= next_state;
    end
    
    always @ (posedge clock) begin
        if (~resetn)
         next_state <= S_RESET;
       else begin //resetn
         if (state == S_RESET) begin
           next_state <= S_INIT;
         end else if (state == S_INIT) begin
           if (start)
             next_state <= S_THUMB;
           else
             next_state <= S_INIT;
         end else if (state == S_THUMB) begin
           next_state <= S_INDEX;
         end else if (state == S_INDEX) begin
           next_state <= S_MIDDLE;
         end else if (state == S_MIDDLE) begin
           next_state <= S_RING;
         end else if (state == S_RING) begin
           next_state <= S_PINKY;
         end else if (state == S_PINKY) begin
           next_state <= S_DONE;
         end else if (state == S_DONE) begin
           if (~start)
             next_state <= S_INIT;
           else
             next_state <= S_DONE;
         end else
           next_state <= S_INIT;
       end //else - resetn
    end //always
         
endmodule
