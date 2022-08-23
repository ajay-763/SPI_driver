`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:24:57 08/18/2022
// Design Name:   SPI_Master
// Module Name:   /home/ajay/SPI_for_nrf/SPI_Master_tb.v
// Project Name:  SPI_for_nrf
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SPI_Master
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SPI_Master_tb;

	// Inputs
	reg i_Rst_L;
	reg i_Clk;
	reg [7:0] i_TX_Byte;
	reg i_TX_DV;
	reg i_SPI_MISO;

	// Outputs
	wire o_TX_Ready;
	wire o_RX_DV;
	wire [7:0] o_RX_Byte;
	wire o_SPI_Clk;
	wire o_SPI_MOSI;
	
	// Instantiate the Unit Under Test (UUT)
	SPI_Master uut (
		.i_Rst_L(i_Rst_L), 
		.i_Clk(i_Clk), 
		.i_TX_Byte(i_TX_Byte), 
		.i_TX_DV(i_TX_DV), 
		.o_TX_Ready(o_TX_Ready), 
		.o_RX_DV(o_RX_DV), 
		.o_RX_Byte(o_RX_Byte), 
		.o_SPI_Clk(o_SPI_Clk), 
		.i_SPI_MISO(i_SPI_MISO), 
		.o_SPI_MOSI(o_SPI_MOSI)
	);
	
	always 
		#5 i_Clk = ~i_Clk;
	
	always @(o_SPI_MOSI) begin
		i_SPI_MISO = o_SPI_MOSI;
	end
	
	initial begin
		// Initialize Inputs
		i_Rst_L = 0;
		i_TX_Byte = 0;
		i_TX_DV = 0;
		i_SPI_MISO = 0;
		i_Clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		$monitor("Rst = %b, Clk = %b, Tx = %b, Txdv = %b, MISO = %b, Rx = %b, Rxdv = %b, MOSI = %b, Tx_ready = %b, Time = %b",i_Rst_L, i_Clk, i_TX_Byte, i_TX_DV, i_SPI_MISO, o_RX_Byte, o_RX_DV, o_SPI_MOSI, o_TX_Ready, $time);
		
		i_Rst_L = 1;
		#20;
		
		i_Rst_L = 0;
		#20;
		
		i_Rst_L = 1;
		#20;
		
		i_TX_Byte = 8'hAA;
		#20;
		
		i_TX_DV = 1;
		#20;
		i_TX_DV = 0;
		#10;
		
		
	end
      
endmodule

module clock(

	output clk);
	
	reg clk_o;

	initial
		clk_o = 0;

	always 
		#5 clk_o = ~clk_o;
		
	assign clk = clk_o;
endmodule 