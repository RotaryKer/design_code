//-------------------------------------------------------------------//
//
//		Copyright (c) 2012 BeeBeans Technologies
//			All rights reserved
//
//	System      : KC705
//
//	Module      : KC705 Evaluation Board
//
//	Description : Top Module of KC705 Evaluation Board
//
//	file	: KC705 Evaluation Board
//
//	Note	:
//
//
//-------------------------------------------------------------------//

module
	kc705sitcp(
	// System
		input	wire		SYSCLK_200MP_IN	,	// From 200MHz Oscillator module
		input	wire		SYSCLK_200MN_IN	,	// From 200MHz Oscillator module
	// EtherNet
		output	wire		GMII_RSTn	,
		output	wire		GMII_TX_EN	,
		output	wire	[7:0]	GMII_TXD	,
		output	wire		GMII_TX_ER	,
		input	wire		GMII_TX_CLK	,
		output	wire		GMII_GTXCLK	,

		input	wire		GMII_RX_CLK	,
		input	wire		GMII_RX_DV	,
		input	wire	[7:0]	GMII_RXD	,
		input	wire		GMII_RX_ER	,
		input	wire		GMII_CRS	,
		input	wire		GMII_COL	,

		inout	wire		GMII_MDIO	,
		output	wire		GMII_MDC	,
	// reset switch
		input	wire		SW_N		,
	
		input	wire		GPIO_SWITCH_0	,
		//connect EEPROM
		inout	wire		I2C_SDA		,
		output	wire		I2C_SCL     ,
       input   wire    [3:0]   bt      ,
        output  wire    [7:0]   led         
	);
    

//------------------------------------------------------------------------------
//	Buffers
//------------------------------------------------------------------------------
	wire			GMII_MDIO_IN	;
	wire			GMII_MDIO_OE	;
	wire			GMII_MDIO_OUT	;
	wire			CLK_125M	;
	wire			LOCKED		;
	wire			PLL_CLKFB	;
	wire			BUF_TX_CLK	;
	wire			SiTCP_RST	;
	wire			TCP_OPEN_ACK	;
	wire			TCP_CLOSE_REQ	;
	wire			TCP_RX_WR	;
	wire		[7:0]	TCP_RX_DATA	;
	wire			TCP_TX_FULL	;
	wire		[31:0]	RBCP_ADDR	;
	wire		[7:0]	RBCP_WD		;
	wire			RBCP_WE		;
	wire			RBCP_RE		;
	reg			TCP_CLOSE_ACK	;
	wire		[7:0]	TCP_TX_DATA	;
	reg			RBCP_ACK	;
	reg		[7:0]	RBCP_RD		;
	wire			CLK_200M	;
	reg		[31:0]	OFFSET_TEST	;
	wire		[11:0]	FIFO_DATA_COUNT	;
	wire			FIFO_RD_VALID	;
	reg		SYS_RSTn		;
	reg		[29:0]	INICNT		;
	reg			GMII_1000M	;
	reg		[8:0]	CNT_CLK		;
	reg			CNT_RST		;
	reg			CNT_LD		;
	reg		[6:0]	RX_CNT		;
    wire    [7:0]   data_out    ;
	IBUFDS #(.IOSTANDARD ("LVDS"))		LVDS_BUF(.O(CLK_200M), .I(SYSCLK_200MP_IN), .IB(SYSCLK_200MN_IN));


	PLLE2_BASE #(
		.CLKFBOUT_MULT		(5),
		.CLKIN1_PERIOD		(5.000),
		.CLKOUT0_DIVIDE		(8),
		.CLKOUT0_DUTY_CYCLE	(0.500),
		.DIVCLK_DIVIDE		(1)
	) 
	PLLE2_BASE(
		.CLKFBOUT(PLL_CLKFB),
		.CLKOUT0(CLK_125M),
		.CLKOUT1(),
		.CLKOUT2(),
		.CLKOUT3(),
		.CLKOUT4(),
		.CLKOUT5(),
		.LOCKED	(LOCKED),
		.CLKFBIN(PLL_CLKFB),
		.CLKIN1	(CLK_200M),
		.PWRDWN	(1'b0),
		.RST	(1'b0)
	);


	//SYS_RSTn->off//
	always@(posedge CLK_200M or negedge LOCKED)begin
		if (SW_N || (LOCKED == 1'b0)) begin
			INICNT[29:0]<=	30'd0;
			SYS_RSTn<= 1'b0;
		end else begin
			INICNT[29:0]<=	INICNT[29]? INICNT[29:0]:	(INICNT[29:0] + 30'd1);
			SYS_RSTn<=INICNT[29];
		end
	end

	wire		EEPROM_CS;
	wire		EEPROM_SK;
	wire		EEPROM_DI;
	wire		EEPROM_DO;


	AT93C46_IIC #(
		.PCA9548_AD	(7'b1110_100),				// PCA9548 Dvice Address
		.PCA9548_SL	(8'b0000_1000),				// PCA9548 Select code (Ch3,Ch4 enable)
		.IIC_MEM_AD	(7'b1010_100),				// IIC Memory Dvice Address
		.FREQUENCY	(8'd200),				// CLK_IN Frequency  > 10MHz
		.DRIVE		(4),					// Output Buffer Strength
		.IOSTANDARD	("LVCMOS25"),				// I/O Standard
		.SLEW		("SLOW")				// Outputbufer Slew rate
	)
	AT93C46_IIC(
		.CLK_IN		(CLK_200M),				// System Clock
		.RESET_IN	(~SYS_RSTn),				// Reset
		.IIC_INIT_OUT	(RST_EEPROM),				// IIC , AT93C46 Initialize (0=Initialize End)
		.EEPROM_CS_IN	(EEPROM_CS),				// AT93C46 Chip select
		.EEPROM_SK_IN	(EEPROM_SK),				// AT93C46 Serial data clock
		.EEPROM_DI_IN	(EEPROM_DI),				// AT93C46 Serial write data (Master to Memory)
		.EEPROM_DO_OUT	(EEPROM_DO),				// AT93C46 Serial read data(Slave to Master)
		.INIT_ERR_OUT	(),					// PCA9548 Initialize Error
		.IIC_REQ_IN	(1'b0),					// IIC ch0 Request
		.IIC_NUM_IN	(8'h00),				// IIC ch0 Number of Access[7:0]	0x00:1Byte , 0xff:256Byte
		.IIC_DAD_IN	(7'b0),					// IIC ch0 Device Address[6:0]
		.IIC_ADR_IN	(8'b0),					// IIC ch0 Word Address[7:0]
		.IIC_RNW_IN	(1'b0),					// IIC ch0 Read(1) / Write(0)
		.IIC_WDT_IN	(8'b0),					// IIC ch0 Write Data[7:0]
		.IIC_RAK_OUT	(),					// IIC ch0 Request Acknowledge
		.IIC_WDA_OUT	(),					// IIC ch0 Wite Data Acknowledge(Next Data Request)
		.IIC_WAE_OUT	(),					// IIC ch0 Wite Last Data Acknowledge(same as IIC_WDA timing)
		.IIC_BSY_OUT	(),					// IIC ch0 Busy
		.IIC_RDT_OUT	(),					// IIC ch0 Read Data[7:0]
		.IIC_RVL_OUT	(),					// IIC ch0 Read Data Valid
		.IIC_EOR_OUT	(),					// IIC ch0 End of Read Data(same as IIC_RVL timing)
		.IIC_ERR_OUT	(),					// IIC ch0 Error Detect
		// Device Interface
		.IIC_SCL_OUT	(I2C_SCL),				// IIC Clock
		.IIC_SDA_IO	(I2C_SDA)				// IIC Data
	);


	BUFGMUX GMIIMUX(.O(BUF_TX_CLK), .I0(GMII_TX_CLK), .I1(CLK_125M), .S(GMII_1000M));
	ODDR	IOB_GTX		(.C(BUF_TX_CLK), .CE(1'b1), .D1(1'b1), .D2(1'b0), .R(1'b0), .S(1'b0), .Q(GMII_GTXCLK));


	always@(posedge CLK_200M or negedge SYS_RSTn)begin
		if (~SYS_RSTn) begin
			CNT_CLK[8:0]	<=9'b0;
			CNT_LD		<=1'b0;
			CNT_RST		<=1'b1;
			GMII_1000M	<=1'b0;
		end else begin 
			CNT_CLK[8:0]	<=CNT_CLK[8] ? 9'd198 : CNT_CLK[8:0] - 9'd1;
			CNT_LD		<=CNT_CLK[8];
			CNT_RST		<=CNT_LD;
			GMII_1000M	<=CNT_LD ? RX_CNT[6] : GMII_1000M;
		end
	end
	
	always@(posedge GMII_RX_CLK or posedge CNT_RST)begin
		if (CNT_RST) begin
			RX_CNT[6:0]	<=7'd0;
		end else begin
			RX_CNT[6:0]	<=RX_CNT[6] ? RX_CNT[6:0] : RX_CNT[6:0] + 7'd1;
		end
	end


	assign	GMII_MDIO= (GMII_MDIO_OE ? GMII_MDIO_OUT : 1'bz)	;


	WRAP_SiTCP_GMII_XC7K_32K#(
		.TIM_PERIOD	(8'd200)					// = System clock frequency(MHz), integer only
	)
	SiTCP	(
		.CLK		(CLK_200M),					// in	: System Clock (MII: >15MHz, GMII>129MHz)
		.RST		(RST_EEPROM),				// in	: System reset
	// Configuration parameters
		.FORCE_DEFAULTn	(1'b0),						// in	: Load default parameters
		.EXT_IP_ADDR	(32'h0000_0000),			// in	: IP address[31:0]
		.EXT_TCP_PORT	(16'h0000),					// in	: TCP port #[15:0]
		.EXT_RBCP_PORT	(16'h0000),					// in	: RBCP port #[15:0]
		.PHY_ADDR	    (5'b0_0111),				// in	: PHY-device MIF address[4:0]
	// EEPROM
		.EEPROM_CS	(EEPROM_CS),				// out	: Chip select
		.EEPROM_SK	(EEPROM_SK),				// out	: Serial data clock
		.EEPROM_DI	(EEPROM_DI),				// out	: Serial write data
		.EEPROM_DO	(EEPROM_DO),				// in	: Serial read data
	// user data, intialial values are stored in the EEPROM, 0xFFFF_FC3C-3F
		.USR_REG_X3C	(),							// out	: Stored at 0xFFFF_FF3C
		.USR_REG_X3D	(),							// out	: Stored at 0xFFFF_FF3D
		.USR_REG_X3E	(),							// out	: Stored at 0xFFFF_FF3E
		.USR_REG_X3F	(),							// out	: Stored at 0xFFFF_FF3F
	// MII interface
		.GMII_RSTn	(GMII_RSTn),				// out	: PHY reset
		.GMII_1000M	(GMII_1000M),				// in	: GMII mode (0:MII, 1:GMII)
		// TX
		.GMII_TX_CLK	(BUF_TX_CLK),				// in	: Tx clock
		.GMII_TX_EN	(GMII_TX_EN),				// out	: Tx enable
		.GMII_TXD	(GMII_TXD[7:0]),			// out	: Tx data[7:0]
		.GMII_TX_ER	(GMII_TX_ER),				// out	: TX error
		// RX
		.GMII_RX_CLK	(GMII_RX_CLK),				// in	: Rx clock
		.GMII_RX_DV	(GMII_RX_DV),				// in	: Rx data valid
		.GMII_RXD	(GMII_RXD[7:0]),			// in	: Rx data[7:0]
		.GMII_RX_ER	(GMII_RX_ER),				// in	: Rx error
		.GMII_CRS	(GMII_CRS),					// in	: Carrier sense
		.GMII_COL	(GMII_COL),					// in	: Collision detected
		// Management IF
		.GMII_MDC	(GMII_MDC),					// out	: Clock for MDIO
		.GMII_MDIO_IN	(GMII_MDIO),				// in	: Data
		.GMII_MDIO_OUT	(GMII_MDIO_OUT),			// out	: Data
		.GMII_MDIO_OE	(GMII_MDIO_OE),				// out	: MDIO output enable
	// User I/F
		.SiTCP_RST	(SiTCP_RST),				// out	: Reset for SiTCP and related circuits
		// TCP connection control
		.TCP_OPEN_REQ	(1'b0),						// in	: Reserved input, shoud be 0
		.TCP_OPEN_ACK	(TCP_OPEN_ACK),				// out	: Acknowledge for open (=Socket busy)
		.TCP_ERROR	(),							// out	: TCP error, its active period is equal to MSL
		.TCP_CLOSE_REQ	(TCP_CLOSE_REQ),			// out	: Connection close request
		.TCP_CLOSE_ACK	(TCP_CLOSE_REQ),			// in	: Acknowledge for closing
		// FIFO I/F
		.TCP_RX_WC	({4'b1111,FIFO_DATA_COUNT[11:0]}),					// in	: Rx FIFO write count[15:0] (Unused bits should be set 1)
		.TCP_RX_WR	(TCP_RX_WR),				// out	: Write enable
		.TCP_RX_DATA	(TCP_RX_DATA[7:0]),			// out	: Write data[7:0]	
		.TCP_TX_FULL	(TCP_TX_FULL),				// out	: Almost full flag
		.TCP_TX_WR	(FIFO_RD_VALID),			// in	: Write enable
		.TCP_TX_DATA	(TCP_TX_DATA[7:0]),			// in	: Write data[7:0]
	// RBCP
		.RBCP_ACT	(),					// out	: RBCP active
		.RBCP_ADDR	(RBCP_ADDR[31:0]),			// out	: Address[31:0]
		.RBCP_WD	(RBCP_WD[7:0]),				// out	: Data[7:0]
		.RBCP_WE	(RBCP_WE),					// out	: Write enable
		.RBCP_RE	(RBCP_RE),					// out	: Read enable
		.RBCP_ACK	(RBCP_ACK),					// in	: Access acknowledge
		.RBCP_RD	(RBCP_RD[7:0])				// in	: Read data[7:0]
	);
//LED
    Led led0(
        .clk          (CLK_200M     ),
        .rst          (~TCP_OPEN_ACK),
        .led           (led[7:0]      ),
        .data_in         (data_out[7:0])
    );
    
    
//Transport
    Transport Transport0(
      .clk          (CLK_125M     ),
      .rst          (~TCP_OPEN_ACK),
      .data         (data_out[7:0])
    );
  
  
  
	fifo_generator_v11_0 fifo_generator_v11_0(
	  .clk			(CLK_200M				),//in	:
	  .rst			(~TCP_OPEN_ACK			),//in	:
	  .din			(data_out[7:0]	        ),//in	:
	// .din			(TCP_RX_DATA[7:0]		),//in	:
	  //.wr_en		(TCP_RX_WR				),//in	:
	  .wr_en		(1'b1			        ),//in	:
	  .full			(						),//out	:
	  .dout			(TCP_TX_DATA[7:0]		),//out	:
	  .valid		(FIFO_RD_VALID			),//out	:active hi
	  .rd_en		(~TCP_TX_FULL			),//in	:
	  //.rd_en		(1'b1	               	),//in	:
	  .empty		(						),//out	:
	  .data_count	(FIFO_DATA_COUNT[11:0]	)//out	:[11:0]
	);
	
	

//RBCP_test
	always@(posedge CLK_200M)begin
		if(RBCP_WE)begin
			OFFSET_TEST[31:0]  <= {RBCP_ADDR[31:2],2'b00}+{RBCP_WD[7:0],RBCP_WD[7:0],RBCP_WD[7:0],RBCP_WD[7:0]};
		end
		RBCP_RD[7:0]	<=  (
			((RBCP_ADDR[7:0]==8'h00)?	OFFSET_TEST[ 7: 0]:	8'h00)|
			((RBCP_ADDR[7:0]==8'h01)?	OFFSET_TEST[15: 8]:	8'h00)|
			((RBCP_ADDR[7:0]==8'h02)?	OFFSET_TEST[23:16]:	8'h00)|
			((RBCP_ADDR[7:0]==8'h03)?	OFFSET_TEST[31:24]:	8'h00)
		);
		RBCP_ACK  <= RBCP_RE | RBCP_WE;
	end


endmodule
