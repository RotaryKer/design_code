set_property SRC_FILE_INFO {cfile:/home/users/kakizaki/graduate_report/design_code/xdc/SiTCP.xdc rfile:../../../../../xdc/SiTCP.xdc id:1} [current_design]
set_property SRC_FILE_INFO {cfile:/home/users/kakizaki/graduate_report/design_code/xdc/kc705sitcp.xdc rfile:../../../../../xdc/kc705sitcp.xdc id:2} [current_design]
set_property src_info {type:XDC file:1 line:2 export:INPUT save:INPUT read:READ} [current_design]
set SiPDMIN [expr [get_property -min PERIOD [get_clocks -of_objects [get_pins -hier -filter {name =~ */GMII/*}]]] - 1.5]
set_property src_info {type:XDC file:1 line:4 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay $SiPDMIN -datapath_only -from [get_pins -hier -filter {name =~ */GMII_RXBUF/cmpWrAddr*/C}] -to [get_pins -hier -filter {name =~ */GMII_RXBUF/smpWrStatusAddr*/D}]
set_property src_info {type:XDC file:1 line:5 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay $SiPDMIN -datapath_only -from [get_pins -hier -filter {name =~ */GMII_TXBUF/orRdAct*/C}] -to [get_pins -hier -filter {name =~ */GMII_TXBUF/irRdAct*/D}]
set_property src_info {type:XDC file:1 line:6 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay $SiPDMIN -datapath_only -from [get_pins -hier -filter {name =~ */GMII_TXBUF/muxEndTgl/C}] -to [get_pins -hier -filter {name =~ */GMII_TXBUF/rsmpMuxTrnsEnd*/D}]
set_property src_info {type:XDC file:1 line:8 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay $SiPDMIN -datapath_only -from [get_pins -hier -filter {name =~ */SiTCP_INT_REG/regX10Data*/C}] -to [get_pins -hier -filter {name =~ */GMII_RXCNT/irMacFlowEnb/D}]
set_property src_info {type:XDC file:1 line:9 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay $SiPDMIN -datapath_only -from [get_pins -hier -filter {name =~ */SiTCP_INT_REG/regX12Data*/C}] -to [get_pins -hier -filter {name =~ */GMII_RXCNT/muxMyMac*/D}]
set_property src_info {type:XDC file:1 line:10 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay $SiPDMIN -datapath_only -from [get_pins -hier -filter {name =~ */SiTCP_INT_REG/regX13Data*/C}] -to [get_pins -hier -filter {name =~ */GMII_RXCNT/muxMyMac*/D}]
set_property src_info {type:XDC file:1 line:11 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay $SiPDMIN -datapath_only -from [get_pins -hier -filter {name =~ */SiTCP_INT_REG/regX14Data*/C}] -to [get_pins -hier -filter {name =~ */GMII_RXCNT/muxMyMac*/D}]
set_property src_info {type:XDC file:1 line:12 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay $SiPDMIN -datapath_only -from [get_pins -hier -filter {name =~ */SiTCP_INT_REG/regX15Data*/C}] -to [get_pins -hier -filter {name =~ */GMII_RXCNT/muxMyMac*/D}]
set_property src_info {type:XDC file:1 line:13 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay $SiPDMIN -datapath_only -from [get_pins -hier -filter {name =~ */SiTCP_INT_REG/regX16Data*/C}] -to [get_pins -hier -filter {name =~ */GMII_RXCNT/muxMyMac*/D}]
set_property src_info {type:XDC file:1 line:14 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay $SiPDMIN -datapath_only -from [get_pins -hier -filter {name =~ */SiTCP_INT_REG/regX17Data*/C}] -to [get_pins -hier -filter {name =~ */GMII_RXCNT/muxMyMac*/D}]
set_property src_info {type:XDC file:1 line:15 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay $SiPDMIN -datapath_only -from [get_pins -hier -filter {name =~ */SiTCP_INT_REG/regX18Data*/C}] -to [get_pins -hier -filter {name =~ */GMII_RXCNT/muxMyIp*/D}]
set_property src_info {type:XDC file:1 line:16 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay $SiPDMIN -datapath_only -from [get_pins -hier -filter {name =~ */SiTCP_INT_REG/regX19Data*/C}] -to [get_pins -hier -filter {name =~ */GMII_RXCNT/muxMyIp*/D}]
set_property src_info {type:XDC file:1 line:17 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay $SiPDMIN -datapath_only -from [get_pins -hier -filter {name =~ */SiTCP_INT_REG/regX1AData*/C}] -to [get_pins -hier -filter {name =~ */GMII_RXCNT/muxMyIp*/D}]
set_property src_info {type:XDC file:1 line:18 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay $SiPDMIN -datapath_only -from [get_pins -hier -filter {name =~ */SiTCP_INT_REG/regX1BData*/C}] -to [get_pins -hier -filter {name =~ */GMII_RXCNT/muxMyIp*/D}]
set_property src_info {type:XDC file:1 line:20 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay $SiPDMIN -datapath_only -from [get_pins -hier -filter {name =~ */GMII_TXBUF/dlyBank0LastWrAddr*/C}]  -to [get_pins -hier -filter {name =~ */GMII_TXBUF/rsmpBank0LastWrAddr*/D}]
set_property src_info {type:XDC file:1 line:21 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay $SiPDMIN -datapath_only -from [get_pins -hier -filter {name =~ */GMII_TXBUF/dlyBank1LastWrAddr*/C}]  -to [get_pins -hier -filter {name =~ */GMII_TXBUF/rsmpBank1LastWrAddr*/D}]
set_property src_info {type:XDC file:1 line:22 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay $SiPDMIN -datapath_only -from [get_pins -hier -filter {name =~ */GMII_TXBUF/memRdReq*/C}]            -to [get_pins -hier -filter {name =~ */GMII_TXBUF/irMemRdReq*/D}]
set_property src_info {type:XDC file:1 line:24 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay $SiPDMIN -datapath_only -from [get_pins -hier -filter {name =~ */GMII_RXCNT/orMacTim*/C}]  -to [get_pins -hier -filter {name =~ */GMII_TXCNT/irMacPauseTime*/D}]
set_property src_info {type:XDC file:1 line:25 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay $SiPDMIN -datapath_only -from [get_pins -hier -filter {name =~ */GMII_RXCNT/orMacPause/C}] -to [get_pins -hier -filter {name =~ */GMII_TXCNT/irMacPauseExe_0/D}]
set_property src_info {type:XDC file:1 line:27 export:INPUT save:INPUT read:READ} [current_design]
set_false_path -from [get_pins -hier -filter {name =~ */SiTCP_INT/SiTCP_RESET_OUT/C}]
set_property src_info {type:XDC file:2 line:39 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AD11 [get_ports SYSCLK_200MN_IN]
set_property src_info {type:XDC file:2 line:40 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AD12 [get_ports SYSCLK_200MP_IN]
set_property src_info {type:XDC file:2 line:41 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN L20 [get_ports GMII_RSTn]
set_property src_info {type:XDC file:2 line:42 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN M27 [get_ports GMII_TX_EN]
set_property src_info {type:XDC file:2 line:43 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN N27 [get_ports {GMII_TXD[0]}]
set_property src_info {type:XDC file:2 line:44 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN N25 [get_ports {GMII_TXD[1]}]
set_property src_info {type:XDC file:2 line:45 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN M29 [get_ports {GMII_TXD[2]}]
set_property src_info {type:XDC file:2 line:46 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN L28 [get_ports {GMII_TXD[3]}]
set_property src_info {type:XDC file:2 line:47 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN J26 [get_ports {GMII_TXD[4]}]
set_property src_info {type:XDC file:2 line:48 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN K26 [get_ports {GMII_TXD[5]}]
set_property src_info {type:XDC file:2 line:49 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN L30 [get_ports {GMII_TXD[6]}]
set_property src_info {type:XDC file:2 line:50 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN J28 [get_ports {GMII_TXD[7]}]
set_property src_info {type:XDC file:2 line:51 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN N29 [get_ports GMII_TX_ER]
set_property src_info {type:XDC file:2 line:52 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U27 [get_ports GMII_RX_CLK]
set_property src_info {type:XDC file:2 line:53 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN R28 [get_ports GMII_RX_DV]
set_property src_info {type:XDC file:2 line:54 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U30 [get_ports {GMII_RXD[0]}]
set_property src_info {type:XDC file:2 line:55 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U25 [get_ports {GMII_RXD[1]}]
set_property src_info {type:XDC file:2 line:56 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN T25 [get_ports {GMII_RXD[2]}]
set_property src_info {type:XDC file:2 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U28 [get_ports {GMII_RXD[3]}]
set_property src_info {type:XDC file:2 line:58 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN R19 [get_ports {GMII_RXD[4]}]
set_property src_info {type:XDC file:2 line:59 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN T27 [get_ports {GMII_RXD[5]}]
set_property src_info {type:XDC file:2 line:60 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN T26 [get_ports {GMII_RXD[6]}]
set_property src_info {type:XDC file:2 line:61 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN T28 [get_ports {GMII_RXD[7]}]
set_property src_info {type:XDC file:2 line:62 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V26 [get_ports GMII_RX_ER]
set_property src_info {type:XDC file:2 line:63 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN R30 [get_ports GMII_CRS]
set_property src_info {type:XDC file:2 line:64 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN W19 [get_ports GMII_COL]
set_property src_info {type:XDC file:2 line:65 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN J21 [get_ports GMII_MDIO]
set_property src_info {type:XDC file:2 line:66 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN K30 [get_ports GMII_GTXCLK]
set_property src_info {type:XDC file:2 line:67 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN M28 [get_ports GMII_TX_CLK]
set_property src_info {type:XDC file:2 line:68 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN R23 [get_ports GMII_MDC]
set_property src_info {type:XDC file:2 line:69 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN L21 [get_ports I2C_SDA]
set_property src_info {type:XDC file:2 line:70 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN K21 [get_ports I2C_SCL]
set_property src_info {type:XDC file:2 line:71 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN Y29 [get_ports GPIO_SWITCH_0]
set_property src_info {type:XDC file:2 line:72 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AA12 [get_ports SW_N]
set_property src_info {type:XDC file:2 line:86 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -datapath_only -from [get_pins {RX_CNT_reg[6]/C}] -to [get_pins GMII_1000M_reg/D] 5.000
set_property src_info {type:XDC file:2 line:91 export:INPUT save:INPUT read:READ} [current_design]
set_property IOB false [get_cells -hierarchical -filter {name =~ */GMII_RXCNT/IOB_RD_*}]
set_property src_info {type:XDC file:2 line:92 export:INPUT save:INPUT read:READ} [current_design]
set_property IOB false [get_cells -hierarchical -filter {name =~ */GMII_RXCNT/IOB_RDV}]
set_property src_info {type:XDC file:2 line:93 export:INPUT save:INPUT read:READ} [current_design]
set_property IOB false [get_cells -hierarchical -filter {name =~ */GMII_RXCNT/IOB_RERR}]
set_property src_info {type:XDC file:2 line:103 export:INPUT save:INPUT read:READ} [current_design]
set_min_delay -from [get_port GMII_MDIO] 0
set_property src_info {type:XDC file:2 line:105 export:INPUT save:INPUT read:READ} [current_design]
set_min_delay -from [get_port I2C_SDA] 0
set_property src_info {type:XDC file:2 line:107 export:INPUT save:INPUT read:READ} [current_design]
set_property IOB true [get_cells -hierarchical -filter {name =~ */GMII_TXCNT/IOB_TD_*}]
set_property src_info {type:XDC file:2 line:108 export:INPUT save:INPUT read:READ} [current_design]
set_property IOB true [get_cells -hierarchical -filter {name =~ */GMII_TXCNT/IOB_TEN}]
set_property src_info {type:XDC file:2 line:111 export:INPUT save:INPUT read:READ} [current_design]
set_min_delay -from [get_clocks GMII_TX_CLK] -to [get_port GMII_TXD*] 0
set_property src_info {type:XDC file:2 line:113 export:INPUT save:INPUT read:READ} [current_design]
set_min_delay -from [get_clocks GMII_TX_CLK] -to [get_port GMII_TX_EN] 0
set_property src_info {type:XDC file:2 line:115 export:INPUT save:INPUT read:READ} [current_design]
set_min_delay -from [get_clocks GMII_TX_CLK] -to [get_port GMII_TX_ER] 0
set_property src_info {type:XDC file:2 line:118 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -datapath_only -from [get_clocks CLK_125M] -to [get_port GMII_GTXCLK] 3.2
set_property src_info {type:XDC file:2 line:119 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -datapath_only -from [get_clocks CLK_125M] -to [get_port GMII_TX_EN] 3.2
set_property src_info {type:XDC file:2 line:120 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -datapath_only -from [get_clocks CLK_125M] -to [get_port GMII_TXD*] 3.2
set_property src_info {type:XDC file:2 line:121 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -datapath_only -from [get_clocks CLK_125M] -to [get_port GMII_TX_ER] 3.2
set_property src_info {type:XDC file:2 line:123 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -datapath_only -from [get_clocks SYSCLK_200MP_IN] -to [get_port GMII_MDC] 10
set_property src_info {type:XDC file:2 line:124 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -datapath_only -from [get_clocks SYSCLK_200MP_IN] -to [get_port GMII_MDIO] 10
set_property src_info {type:XDC file:2 line:125 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -datapath_only -from [get_clocks SYSCLK_200MP_IN] -to [get_port GMII_RSTn] 10
set_property src_info {type:XDC file:2 line:126 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -datapath_only -from [get_clocks SYSCLK_200MP_IN] -to [get_port I2C_SCL] 10
set_property src_info {type:XDC file:2 line:127 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -datapath_only -from [get_clocks SYSCLK_200MP_IN] -to [get_port I2C_SDA] 10
set_property src_info {type:XDC file:2 line:135 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN G12 [get_ports bt[0]]
set_property src_info {type:XDC file:2 line:137 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AG5 [get_ports bt[1]]
set_property src_info {type:XDC file:2 line:139 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AB12 [get_ports bt[2]]
set_property src_info {type:XDC file:2 line:141 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AC6 [get_ports bt[3]]
set_property src_info {type:XDC file:2 line:144 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN AB8 IOSTANDARD LVCMOS15}  [get_ports led[0]]
set_property src_info {type:XDC file:2 line:145 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN AA8 IOSTANDARD LVCMOS15}  [get_ports led[1]]
set_property src_info {type:XDC file:2 line:146 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN AC9 IOSTANDARD LVCMOS15}  [get_ports led[2]]
set_property src_info {type:XDC file:2 line:147 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN AB9 IOSTANDARD LVCMOS15}  [get_ports led[3]]
set_property src_info {type:XDC file:2 line:148 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN AE26 IOSTANDARD LVCMOS25} [get_ports led[4]]
set_property src_info {type:XDC file:2 line:149 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN G19 IOSTANDARD LVCMOS25}  [get_ports led[5]]
set_property src_info {type:XDC file:2 line:150 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN E18 IOSTANDARD LVCMOS25}  [get_ports led[6]]
set_property src_info {type:XDC file:2 line:151 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN F16 IOSTANDARD LVCMOS25}  [get_ports led[7]]