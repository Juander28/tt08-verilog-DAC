`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: PONTIFICIA UNIVERSIDAD JAVERIANA
// Engineer: JUAN DIEGO SANCHEZ ROJAS
// 
// Create Date:    22:52:12 02/28/2023 
// Design Name: 
// Module Name:    FSM_LAT
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////


module tt_um_CONTROL(
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);





wire stp_vref, stp_data, stp_conver, stp_comp;

			
					 //wire [2:0] VR, VM, VRC;
					 
			 
			 wire [3:0]vref;
			 wire [7:0]data;
			 wire [7:0]conver;
			 
			 
		
			 assign uo_out[0]  = vref[0];
			 assign uo_out[1]  = vref[1];
			 assign uo_out[2]  = vref[2];
			 assign uo_out[3]  = vref[3];
			 assign uo_out[4]  = data[0];
			 assign uo_out[5]  = data[1];
			 assign uo_out[6]  = data[2];
			 assign uo_out[7]  = data[3];
			 
			 assign uio_out[0]  = data[4];
			 assign uio_out[1]  = data[5];
			 assign uio_out[2]  = data[6];
			 assign uio_out[3]  = data[7];/*
			 assign uio_out[4]  = conver[0];
			 assign uio_out[5]  = conver[1];
			 assign uio_out[6]  = conver[2];
			 assign uio_out[7]  = conver[3];
			 
			 
			 assign uio_oe[0]  = conver[4];
			 assign uio_oe[1]  = conver[5];
			 assign uio_oe[2]  = conver[6];
			 assign uio_oe[3]  = conver[7];*/
	
			//assign uio_oe=8'hff;
			//assign uio_out={VR[2],7'h00};
		 
			 shiftRegP #(.N(5)) VREF(
						 .clk(clk),
						 .rst(rst_n),
						 .en(!stp_vref),
				 		 .d(ui_in[0]),
				 		 .buffer_s({vref,stp_vref}));
						 
			 shiftRegP #(.N(9)) DATA(
						 .clk(clk),
						 .rst(rst_n),
						 .en(!stp_data),
						 .d(ui_in[1]),
				 .buffer_s({data,stp_data}));
						 
			/* shiftRegP #(.N(9)) CONVER(
						 .clk(clk),
						 .rst(rst_n),
						 .en(!stp_conver),
						 .d(ui_in[2]),
				 .buffer_s({conver,stp_conver}));
			*/			 
			/* shiftRegP #(.N(7)) COMP(
						 .clk(clk),
						 .rst(rst_n),
						 .en(!stp_comp),
						 .d(ui_in[3]),
						 .buffer_s({comp,stp_comp}));	
						 
			d_ff low [2:0](
								.clk(clk),
								.reset(rst_n),
								.en(ena),
								.d(ui_in[4:6]),
								.q(VR));
			d_ff med [2:0](
								.clk(clk),
								.reset(rst_n),
								.en(ena),
								.d({ui_in[7],uio_in[0:1]),
								.q(VM));
			d_ff high [2:0](
								.clk(clk),
								.reset(rst_n),
								.en(ena),
								.d(uio_in[2:4]),
						 .buffer_s({comp,stp_comp}));	
						 .buffer_s({comp,stp_comp}));	
								.q(VRC)); */

endmodule

