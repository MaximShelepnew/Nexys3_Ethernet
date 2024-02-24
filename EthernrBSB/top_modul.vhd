----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:27:40 01/24/2024 
-- Design Name: 
-- Module Name:    top_modul - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_modul is
port(
	clk: in std_logic;
	
	--SMSC LAN8710A
	--MII
	MDIO: inout std_logic;
	MDC: out std_logic;
	RESET: out std_logic;
	COL: inout std_logic;
	CRS: in std_logic;
	
	TXD: out std_logic_vector(3 downto 0);
	TXEN: out std_logic;
	TXER: out std_logic;
	TXCLK: in std_logic;

	RXD: in std_logic_vector(3 downto 0);
	RXDV: in std_logic;
	RXER: inout std_logic;
	RXCLK: inout std_logic;
	
	led: out std_logic_vector(7 downto 0);
	pmod: in std_logic
);	
end top_modul;

architecture Behavioral of top_modul is

COMPONENT SMI
port(
	clk: in std_logic;
	start: in std_logic;
	MDC: out std_logic;
	MDIO: out std_logic
);
END COMPONENT;

signal counter: integer range 0 to 300000000 := 0;
signal counter1: integer range 0 to 300000000 := 0;
signal del: integer range 0 to 3 := 0;
signal deltx: integer range 0 to 25000000 := 0;
signal clk_del: std_logic := '0';
signal TXCLK1: std_logic := '0';
signal f: std_logic:='0';
--
	COMPONENT WRITE_MAC
	  PORT (
		 clk_in : in std_logic;
		 
		 RXDV: in std_logic;
		 TXD: out std_logic_vector(3 downto 0);
		 TXEN: out std_logic;
		 TXER: out std_logic;
		 TXCLK: in std_logic
	  );
	END COMPONENT;
	

--	COMPONENT TCP_IP
--		port(
--			TXD: out std_logic_vector(3 downto 0);
--			TXEN: out std_logic;
--			TXER: out std_logic;
--			TXCLK: in std_logic
--		);
--	END COMPONENT;	

begin

	MDIO <= '0';
	MDC <= '0';
	
--	process(clk)
--	begin
--		if (rising_edge(clk)) then
--			if (counter < 1000000) then
--				counter <= counter + 1;
----				RXER <= '1';
----				RXCLK <= '1';
----				RXD(3) <= '1';
--			else 	
--				RXER <= '0';
--				RXCLK <= '0';
--				RXD(3) <= '0';
--				f <= '1';
--			end if;
--		end if;
--	end process;

--	process(clk)--MODE 
--	begin
--		if (rising_edge(clk)) then
--			if (counter1 < 1000000) then
--				counter1 <= counter1 + 1;
--				RXD(0) <= '1';
--				RXD(1) <= '0';
--				COL <= '1';
--			else 	
--				RXD(0) <= '0';
--				RXD(1) <= '0';
--				COL <= '0';
--			end if;
--		end if;
--	end process;
	
	process(clk)
	begin
		if (rising_edge(clk)) then
			if (counter < 1000 ) then
				counter <= counter + 1;
				RESET <= '1';
			elsif counter<900000 and counter> 1000 then
--				RXD(0) <= '1';--MDC
--				RXD(1) <= '0';
--				COL <= '1';
				RESET <= '0';
				counter <= counter + 1;
			else RESET <= '1';
			end if;
		end if;	
	end process;
	

--
--	process(clk)
--	begin
--		if (rising_edge(clk)) then
--			if (del = 3) then
--				clk_del <= not clk_del;
--				del <= 0;
--			else 
--				del <= del + 1;
--			end if;
--		end if;
--	end process;	
--	
--
--	SMI_nastr : SMI
--	port map(
--		clk => clk_del,
--		start => f,
--		MDIO => MDIO,
--		MDC => MDC
----	);
	Write_cycle : WRITE_MAC
	port map(
		clk_in => clk,
		RXDV => RXDV,
		TXER => TXER,
		TXD => TXD,
		TXEN => TXEN,
		TXCLK => TXCLK
		);
		
--		IP : TCP_IP
--		port map(
--			TXD => TXD,
--			TXEN => TXEN,
--			TXER => TXER,
--			TXCLK => TXCLK
--		);

--	process(TXCLK)
--	begin
--		if (rising_edge(TXCLK)) then 
--			if (deltx = 25000000) then
--				TXCLK1 <= not TXCLK1;
--				deltx <= 0;
--			else 
--				deltx <= deltx + 1;
--			end if;
--		end if;
--	end process;
	
	process(clk)
	begin
		if (rising_edge(clk)) then
			if (rxdv='1') then
				led(0) <= RXD(0);
				led(1) <= RXD(1);
				led(2) <= RXD(2);
				led(3) <= RXD(3);
				led(4) <= RXDV;
				led(5) <= CRS;
				led(6) <= '0';
				led(7) <= COL;
			end if;
		end if;
	end process;	
	

--	led <= COL;
--	led1 <= CRS;
--	led2 <= CRS;
--	led <= '0';
--	led1 <= '0';
--	led2 <= '0';
	
end Behavioral;

