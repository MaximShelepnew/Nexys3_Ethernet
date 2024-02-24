LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY microblaze IS
PORT (
	fpga_0_Ethernet_Lite_PHY_tx_clk_pin : IN STD_LOGIC;
	fpga_0_Ethernet_Lite_PHY_rx_clk_pin : IN STD_LOGIC;
	fpga_0_Ethernet_Lite_PHY_crs_pin : IN STD_LOGIC;
	fpga_0_Ethernet_Lite_PHY_dv_pin : IN STD_LOGIC;
	fpga_0_Ethernet_Lite_PHY_rx_data_pin : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	fpga_0_Ethernet_Lite_PHY_col_pin : IN STD_LOGIC;
	fpga_0_Ethernet_Lite_PHY_rx_er_pin : IN STD_LOGIC;
	fpga_0_Ethernet_Lite_PHY_rst_n_pin : OUT STD_LOGIC;
	fpga_0_Ethernet_Lite_PHY_tx_en_pin : OUT STD_LOGIC;
	fpga_0_Ethernet_Lite_PHY_tx_data_pin : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	fpga_0_Ethernet_Lite_PHY_MDC_pin : OUT STD_LOGIC;
	fpga_0_Ethernet_Lite_PHY_MDIO_pin : INOUT STD_LOGIC;
	fpga_0_Ethernet_Lite_TX_ER_pin : OUT STD_LOGIC;
	fpga_0_mem_bus_mux_0_MEM_ADDR_pin : OUT STD_LOGIC_VECTOR(0 TO 22);
	fpga_0_mem_bus_mux_0_DQ_pin : INOUT STD_LOGIC_VECTOR(0 TO 15);
	fpga_0_mem_bus_mux_0_MEM_OEN_pin : OUT STD_LOGIC;
	fpga_0_mem_bus_mux_0_MEM_WEN_pin : OUT STD_LOGIC;
	fpga_0_mem_bus_mux_0_RAM_CEN_O_pin : OUT STD_LOGIC;
	fpga_0_mem_bus_mux_0_RAM_BEN_O_pin : OUT STD_LOGIC_VECTOR(0 TO 1);
	fpga_0_mem_bus_mux_0_FLASH_ADDR_pin : OUT STD_LOGIC_VECTOR(5 TO 7);
	fpga_0_mem_bus_mux_0_FLASH_CEN_O_pin : OUT STD_LOGIC;
	fpga_0_mem_bus_mux_0_FLASH_RPN_O_pin : OUT STD_LOGIC;
	fpga_0_mem_bus_mux_0_QUAD_SPI_C_O_pin : OUT STD_LOGIC;
	fpga_0_mem_bus_mux_0_QUAD_SPI_S_O_pin : OUT STD_LOGIC;
	fpga_0_mem_bus_mux_0_MOSI_QUAD_SPI_pin : INOUT STD_LOGIC;
	fpga_0_clk_1_sys_clk_pin : IN STD_LOGIC;
	fpga_0_rst_1_sys_rst_pin : IN STD_LOGIC
	);
END microblaze;

ARCHITECTURE STRUCTURE OF microblaze IS

BEGIN
END ARCHITECTURE STRUCTURE;
