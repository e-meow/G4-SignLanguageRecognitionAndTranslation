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
    x_coord,
    y_coord,
    letter,
    letter_valid,
    letter_unknown
    );
    //input output ports
    input clock, resetn, start;
    input [7:0] sensor1, sensor2, sensor3, sensor4, sensor5;
    output reg [5:0] letter;
    output reg letter_valid, letter_unknown;
    input [8:0] x_coord, y_coord;

    //parameter
    //THUMB  205 200-220 225-235 240
    //INDEX 180 180-190 188-210 238
    //MIDDLE 190 185-195 210-192 253
    //RING 188 180-195 220-185 236
    //PINKY
    parameter THUMB_STRAIGHT_MIN = 8'd230, THUMB_CURVE_1_MAX = 8'd240, THUMB_CURVE_1_MIN = 8'd220, THUMB_CURVE_2_MAX = 8'd230;
	parameter THUMB_CURVE_2_MIN = 8'd210, THUMB_CURVE_3_MAX = 8'd220, THUMB_CURVE_3_MIN = 8'd200, THUMB_VERY_CURVE_MAX = 8'd210;
    parameter STRAIGHT_MIN = 8'd220, CURVE_1_MAX = 8'd225, CURVE_1_MIN = 8'd210, CURVE_2_MAX = 8'd215, CURVE_2_MIN = 8'd200;
	parameter CURVE_3_MAX = 8'd205, CURVE_3_MIN = 8'd190, CURVE_4_MAX = 8'd195, CURVE_4_MIN = 8'd180;
	parameter CURVE_5_MAX = 8'd185, CURVE_5_MIN = 8'd170, VERY_CURVE_MAX = 8'd175;
	
    parameter POS_HORIZ_MIN = 9'b10000, POS_HORIZ_MAX = 9'h1FF, POS_VERT_MAX = 9'b111, POS_VERT_MIN = 9'h000;
    parameter POS_DOWN_MAX = 9'b11100000, POS_DOWN_MIN = 9'b11100, POS_INWARD_MAX = 9'b100, POS_OUTWARD_MIN = 9'b101000000;
    
    //accel parameter ASCII decoding
    parameter LETTER_1 = 7'd49, LETTER_2 = 7'd50, LETTER_3 = 7'd51, LETTER_4 = 7'd52, LETTER_5 = 7'd53, LETTER_6 = 7'd54, LETTER_7 = 7'd55, LETTER_8 = 7'd56, LETTER_9 = 7'd57;
    parameter LETTER_A = 7'd65, LETTER_B = 7'd66, LETTER_C = 7'd67, LETTER_D = 7'd68, LETTER_E = 7'd69, LETTER_F = 7'd70, LETTER_G = 7'd71;
    parameter LETTER_H = 7'd72, LETTER_I = 7'd73, LETTER_J = 7'd74, LETTER_K = 7'd75, LETTER_L = 7'd76, LETTER_M = 7'd77, LETTER_N = 7'd78;
    parameter LETTER_O = 7'd79, LETTER_P = 7'd80, LETTER_Q = 7'd81, LETTER_R = 7'd82, LETTER_S = 7'd83, LETTER_T = 7'd84;
    parameter LETTER_U = 7'd85, LETTER_V = 7'd86, LETTER_W = 7'd87, LETTER_X = 7'd88, LETTER_Y = 7'd89, LETTER_Z = 7'd90;
    parameter LETTER_SPACE = 7'd10, LETTER_CLEAR = 7'd1, LETTER_UNKNOWN = 7'd0; 
    
    //state parameters
    parameter S_RESET = 2'd0, S_INIT = 2'd1, S_1 = 2'd2, S_DONE = 2'd3;
  
    //wires
    reg [3:0] state, next_state;
    wire thumb_straight, 	thumb_curve1, 	thumb_curve2, 	thumb_curve3,  	thumb_very_curve;
    wire index_straight, 	index_curve1, 	index_curve2, 	index_curve3, 	index_curve4, 	index_curve5, 	index_very_curve;
    wire middle_straight,	middle_curve1, 	middle_curve2, 	middle_curve3, 	middle_curve4, 	middle_curve5, 	middle_very_curve;
    wire ring_straight, 	ring_curve1, 	ring_curve2, 	ring_curve3, 	ring_curve4, 	ring_curve5, 	ring_very_curve;
    wire pinky_straight, 	pinky_curve1, 	pinky_curve2, 	pinky_curve3, 	pinky_curve4, 	pinky_curve5, 	pinky_very_curve;
    wire pos_horiz, pos_vert, pos_tilt;
    wire pos_down, pos_inward, pos_outward;
    wire thumb_stat, index_stat, middle_stat, ring_stat, pinky_stat;
    
    //****************************************** SEQUENTIAL LOGIC *********************************************
    
    assign pos_horiz = ((y_coord >= POS_HORIZ_MIN)) ? 1 : 0;
    //assign pos_tilt = ((y_coord >= POS_TILT_MIN) && (y_coord =< POS_TILT_MAX)) ? 1 : 0;
    assign pos_vert = ((y_coord <= POS_VERT_MAX)) ? 1 : 0;
    
    assign pos_down = ((x_coord >= POS_DOWN_MIN) && (x_coord <= POS_DOWN_MAX)) ? 1 : 0;
    assign pos_inward = (x_coord <= POS_INWARD_MAX) ? 1 : 0;
    assign pos_outward = (x_coord >= POS_OUTWARD_MIN) ? 1 : 0;
    
    assign thumb_straight = (sensor1 >= THUMB_STRAIGHT_MIN) ? 1 : 0;
    assign thumb_curve1 = ((sensor1 >= THUMB_CURVE_1_MIN) && (sensor1 <= THUMB_CURVE_1_MAX)) ? 1 : 0;
    assign thumb_curve2 = ((sensor1 >= THUMB_CURVE_2_MIN) && (sensor1 <= THUMB_CURVE_2_MAX)) ? 1 : 0;
	assign thumb_curve3 = ((sensor1 >= THUMB_CURVE_3_MIN) && (sensor1 <= THUMB_CURVE_3_MAX)) ? 1 : 0;
    assign thumb_very_curve = (sensor1 <= THUMB_VERY_CURVE_MAX) ? 1 : 0;
    
    assign index_straight = (sensor2 >= STRAIGHT_MIN) ? 1 : 0;
    assign index_curve1 = ((sensor2 >= CURVE_1_MIN) && (sensor2 <= CURVE_1_MAX)) ? 1 : 0;
    assign index_curve2 = ((sensor2 >= CURVE_2_MIN) && (sensor2 <= CURVE_2_MAX)) ? 1 : 0;
	assign index_curve3 = ((sensor2 >= CURVE_3_MIN) && (sensor2 <= CURVE_3_MAX)) ? 1 : 0;
    assign index_curve4 = ((sensor2 >= CURVE_4_MIN) && (sensor2 <= CURVE_4_MAX)) ? 1 : 0;
	assign index_curve5 = ((sensor2 >= CURVE_5_MIN) && (sensor2 <= CURVE_5_MAX)) ? 1 : 0;
    assign index_very_curve = (sensor2 <= VERY_CURVE_MAX) ? 1 : 0;
    
    assign middle_straight = (sensor3 >= STRAIGHT_MIN) ? 1 : 0;
    assign middle_curve1 = ((sensor3 >= CURVE_1_MIN) && (sensor3 <= CURVE_1_MAX)) ? 1 : 0;
    assign middle_curve2 = ((sensor3 >= CURVE_2_MIN) && (sensor3 <= CURVE_2_MAX)) ? 1 : 0;
	assign middle_curve3 = ((sensor3 >= CURVE_3_MIN) && (sensor3 <= CURVE_3_MAX)) ? 1 : 0;
    assign middle_curve4 = ((sensor3 >= CURVE_4_MIN) && (sensor3 <= CURVE_4_MAX)) ? 1 : 0;
	assign middle_curve5 = ((sensor3 >= CURVE_5_MIN) && (sensor3 <= CURVE_5_MAX)) ? 1 : 0;
    assign middle_very_curve = (sensor3 <= VERY_CURVE_MAX) ? 1 : 0;
    
    assign ring_straight = (sensor4 >= STRAIGHT_MIN) ? 1 : 0;
    assign ring_curve1 = ((sensor4 >= CURVE_1_MIN) && (sensor4 <= CURVE_1_MAX)) ? 1 : 0;
    assign ring_curve2 = ((sensor4 >= CURVE_2_MIN) && (sensor4 <= CURVE_2_MAX)) ? 1 : 0;
	assign ring_curve3 = ((sensor4 >= CURVE_3_MIN) && (sensor4 <= CURVE_3_MAX)) ? 1 : 0;
    assign ring_curve4 = ((sensor4 >= CURVE_4_MIN) && (sensor4 <= CURVE_4_MAX)) ? 1 : 0;
	assign ring_curve5 = ((sensor4 >= CURVE_5_MIN) && (sensor4 <= CURVE_5_MAX)) ? 1 : 0;
    assign ring_very_curve = (sensor4 <= VERY_CURVE_MAX) ? 1 : 0;
    
    assign pinky_straight = (sensor5 >= STRAIGHT_MIN) ? 1 : 0;
    assign pinky_curve1 = ((sensor5 >= CURVE_1_MIN) && (sensor5 <= CURVE_1_MAX)) ? 1 : 0;
    assign pinky_curve2 = ((sensor5 >= CURVE_2_MIN) && (sensor5 <= CURVE_2_MAX)) ? 1 : 0;
	assign pinky_curve3 = ((sensor5 >= CURVE_3_MIN) && (sensor5 <= CURVE_3_MAX)) ? 1 : 0;
    assign pinky_curve4 = ((sensor5 >= CURVE_4_MIN) && (sensor5 <= CURVE_4_MAX)) ? 1 : 0;
	assign pinky_curve5 = ((sensor5 >= CURVE_5_MIN) && (sensor5 <= CURVE_5_MAX)) ? 1 : 0;
    assign pinky_very_curve = (sensor5 <= VERY_CURVE_MAX) ? 1 : 0;
    
    //DEBUGGING
    assign thumb_stat = thumb_straight || thumb_curve1 || thumb_curve2 || thumb_curve3 || thumb_very_curve;
    assign index_stat = index_straight || index_curve1 || index_curve2 || index_curve3 
						|| index_curve4 || index_curve5 || index_very_curve;
    assign middle_stat = middle_straight || middle_curve1 || middle_curve2 || middle_curve3 
						|| middle_curve4 || middle_curve5 || middle_very_curve;
    assign ring_stat = ring_straight || ring_curve1 || ring_curve2 || ring_curve3 
						|| ring_curve4 || ring_curve5 || ring_very_curve;
    assign pinky_stat = pinky_straight || pinky_curve1 || pinky_curve2 || pinky_curve3 
						|| pinky_curve4 || pinky_curve5 || pinky_very_curve;
    
    //********************************************** OUTPUTS **************************************************
    
always @ (posedge clock) begin
          if (~resetn) begin
            letter <= 0;
            letter_valid <= 0;
          end else if (state == S_1) begin
            if (thumb_straight && index_very_curve && (middle_curve5 || middle_very_curve) 
						&& ring_very_curve && pinky_very_curve && pos_vert) begin
              letter <= LETTER_A;
              letter_valid <= 1;
              letter_unknown <= 0;
            end else if (thumb_very_curve && index_straight && middle_straight 
						&& ring_straight && pinky_straight && pos_vert) begin
              letter <= LETTER_B;
              letter_valid <= 1;
              letter_unknown <= 0;
            end else if (thumb_curve2 && (index_curve4 || index_curve3) 
						&& middle_curve3 && ring_curve3 && pinky_curve3) begin
              letter <= LETTER_C;
              letter_valid <= 1;
              letter_unknown <= 0;
            end else if ((thumb_straight || thumb_curve1) && index_straight 
						&& (middle_curve4 || middle_curve5) && (ring_curve4 || ring_curve5) 
						&& (pinky_curve4 || pinky_curve5) && pos_vert) begin
              letter <= LETTER_D;
              letter_valid <= 1;
              letter_unknown <= 0;
            end else if (thumb_very_curve && index_very_curve && middle_curve5 
						&& ring_curve5 && pinky_curve5 && pos_vert) begin
              letter <= LETTER_E;
              letter_valid <= 1;
              letter_unknown <= 0;
            end else if ((thumb_straight || thumb_curve1) && index_curve5 
						&& middle_straight && ring_straight && pinky_straight && pos_vert) begin
              letter <= LETTER_F;
              letter_valid <= 1;
              letter_unknown <= 0;
            end else if (thumb_curve1 && index_straight 
						&& (middle_curve4 || middle_curve5) && (ring_curve4 || ring_curve5) 
						&& (pinky_curve4 || pinky_curve5) && pos_horiz && pos_inward) begin
              letter <= LETTER_G;
              letter_valid <= 1;
              letter_unknown <= 0;
            end else if (thumb_curve1 && index_straight && middle_curve4 
						&& ring_curve4 && pinky_curve4 && pos_horiz && pos_inward) begin
              letter <= LETTER_H;
              letter_valid <= 1;
              letter_unknown <= 0;
            end else if (thumb_very_curve && index_curve4 && middle_curve4 
						&& ring_curve4 && pinky_straight && pos_vert) begin
              letter <= LETTER_I;
              letter_valid <= 1;
              letter_unknown <= 0;
            end else if (thumb_very_curve && index_curve4 && middle_curve4 
						&& ring_curve4 && pinky_straight && pos_horiz && pos_inward) begin
              letter <= LETTER_J;
              letter_valid <= 1;
              letter_unknown <= 0;
            end else if (thumb_straight && index_straight && middle_curve4 
						&& ring_curve4 && pinky_curve4 && pos_vert) begin
              letter <= LETTER_K;
              letter_valid <= 1;
              letter_unknown <= 0;
            end else if (thumb_straight && index_straight && (middle_curve4 || middle_curve5) 
						&& (ring_curve4 || ring_curve5) && (pinky_curve4 || pinky_curve5) && pos_vert) begin
              letter <= LETTER_L;
              letter_valid <= 1;
              letter_unknown <= 0;
            end else if (thumb_very_curve && index_very_curve && middle_curve4 
						&& ring_curve3 && (pinky_curve4 || pinky_curve5)) begin
              letter <= LETTER_M;
              letter_valid <= 1;
              letter_unknown <= 0;
            end else if (thumb_very_curve && (index_curve5 || index_very_curve) && middle_curve3 
						&& (ring_curve4 || ring_curve5) && (pinky_curve4 || pinky_curve5)) begin
              letter <= LETTER_N;
              letter_valid <= 1;
              letter_unknown <= 0;
            end else if (thumb_curve2 && index_curve4 && middle_curve3 
						&& ring_curve3 && pinky_curve3) begin
              letter <= LETTER_O;
              letter_valid <= 1;
              letter_unknown <= 0;
            end else if (thumb_straight && index_straight && middle_curve2 
						&& ring_curve1 && pinky_curve1 && pos_horiz && pos_down) begin
              letter <= LETTER_P;
              letter_valid <= 1;
              letter_unknown <= 0;
            end else if (thumb_straight && (index_straight || index_curve1) 
						&& (middle_very_curve || middle_curve5) && (ring_very_curve || ring_curve5) 
						&& (pinky_very_curve || pinky_curve5) && pos_horiz && pos_down) begin
              letter <= LETTER_Q;
              letter_valid <= 1;
              letter_unknown <= 0;
            end else if (thumb_curve3 && index_straight && (middle_curve4 || middle_curve5) 
						&& (ring_curve4 || ring_curve5) && (pinky_curve4 || pinky_curve5) && pos_vert) begin
              letter <= LETTER_R;
              letter_valid <= 1;
              letter_unknown <= 0;
            end else if (thumb_curve3 && index_very_curve && middle_curve4 
						&& ring_curve5 && pinky_curve5 && pos_vert) begin
              letter <= LETTER_S;
              letter_valid <= 1;
              letter_unknown <= 0;
            end else if (thumb_curve3 && index_curve4 && (middle_very_curve || middle_curve5) 
						&& (ring_very_curve || ring_curve5) 
						&& (pinky_very_curve || pinky_curve5) && pos_vert) begin
              letter <= LETTER_T;
              letter_valid <= 1;
              letter_unknown <= 0;
            end else if (thumb_curve3 && index_straight && middle_curve3 
						&& ring_curve3 && pinky_curve3 && pos_vert) begin
              letter <= LETTER_U;
              letter_valid <= 1;
              letter_unknown <= 0;
            end else if (thumb_curve3 && index_straight && middle_curve3 
						&& ring_curve3 && pinky_curve3 && pos_vert) begin
              letter <= LETTER_V;
              letter_valid <= 1;
              letter_unknown <= 0;
            end else if (thumb_curve3 && index_straight && middle_straight 
						&& ring_straight && (pinky_curve4 || pinky_curve5) && pos_vert) begin
              letter <= LETTER_W;
              letter_valid <= 1;
              letter_unknown <= 0;
            end else if (thumb_very_curve && index_curve3 && (middle_very_curve || middle_curve5) 
						&& (ring_very_curve || ring_curve5) && (pinky_very_curve || pinky_curve5)) begin
              letter <= LETTER_X;
              letter_valid <= 1;
              letter_unknown <= 0;
            end else if (thumb_straight && index_curve5 && middle_curve4 && ring_curve4 && pinky_straight && pos_vert) begin
              letter <= LETTER_Y;
              letter_valid <= 1;
              letter_unknown <= 0;
            end else if ((thumb_straight || thumb_curve1) && index_straight 
						&& (middle_curve4 || middle_curve5) && (ring_curve4 || ring_curve5) 
						&& (pinky_curve4 || pinky_curve5) && pos_horiz && pos_down) begin
              letter <= LETTER_Z;
              letter_valid <= 1;
              letter_unknown <= 0;
            end else if ((thumb_very_curve || thumb_curve3) && index_very_curve 
						&& (middle_very_curve || middle_curve5) && (ring_very_curve || ring_curve5) 
						&& (pinky_very_curve || pinky_curve5) && pos_down && pos_horiz) begin
              letter <= LETTER_SPACE;
              letter_valid <= 1;
              letter_unknown <= 0;
            end else if (thumb_straight && index_straight && middle_straight 
						&& ring_straight && pinky_straight && pos_down && pos_horiz) begin
              letter <= LETTER_CLEAR;
              letter_valid <= 1;
              letter_unknown <= 0;
            end else begin
              letter <= LETTER_UNKNOWN;
              letter_valid <= 0;
              letter_unknown <= 1;
            end //a_letter
          end else if (state == S_DONE) begin
            letter <= letter;
            letter_valid <= letter_valid;
            letter_unknown <= letter_unknown;
          end else begin
            letter <= 0;
            letter_valid <= 0;
            letter_unknown <= 0;
          end //state == S_1, S_DONE
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
             next_state <= S_1;
           else
             next_state <= S_INIT;
         end else if (state == S_1) begin
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
