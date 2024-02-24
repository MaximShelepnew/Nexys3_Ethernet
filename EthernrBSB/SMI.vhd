-----------------------------------------------------------------------------------
-- Company        : DB Radar
-- Engineer       : Rytskii V.I., pavelmvl@gmail.com
-- 
-- Create Date    : 22:43:26 06/07/2008 
-- Design Name    : Udar
-- Module Name    : SMI - RTL
-- Project Name   : vhdl12b_fast_ethernet
-- Target Devices : -
-- Tool versions  : PA v14.7
-- Description    : -
--
-- Dependencies   : -  
--
-- Revision       : 1.1.0 
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity SMI is
  Port (
    clk	                                : in     std_logic; -- clock
	 start : in std_logic;
    MDIO                                :   out  std_logic; -- MD data  port
    MDC                                 :   out  std_logic  -- MD clock port
  );
end SMI;

Architecture Behavioral of SMI is

  constant ADDR_size                    :        integer := 136;
    
  signal ADDR_int                       :        integer range 0 to ADDR_size - 1;
  signal rom                            :        std_logic_vector( 0 to ADDR_size - 1) := x"FF_FF_FF_FF_53_82_20_00_FF_FF_FF_FF_53_82_A0_00_FF"; -- вектор настройки езэрнет драйвера
  
  signal f: integer range 0 to 1 := 0;

begin

  MDC  <= clk;

process(clk)
 begin
		if (clk'event and clk = '1') then
		if (start = '1') then
			if (f /= 1) then
				if (ADDR_int < ADDR_size) then
					MDIO <= rom(ADDR_int);
				end if;
			end if;
		end if;	
		end if;
   
 end process;
  
 process (clk)
 begin
	if (clk'event and clk = '0') then
	if (start = '1') then
		if (ADDR_int = ADDR_size) then
			f <= 1;
		else
			ADDR_int <= ADDR_int + 1;
		end if;
	end if;	
	end if;
end process;	

end Behavioral;

-- MDIO message:
--
--	--preambl
--    '1','1','1','1','1','1','1','1',        '1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1',
--	--ST
--	'0','1',
--	--OP CODE
--	'0','1',
--	--PHY ADDR
--	'0','0','0','0','0',
--	--REG ADDR
--	'0','0','0','0','0',
--	--TAR
--    '1','0',
--	--DATA
--	'0','0','1','0','0','0','0','0',
--	--DATA
--	'0','0','0','0','0','0','0','0',
--
--	--post
--	--'1','1','1','1',
--
--	--preambl
--    '1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1',
--	--ST
--	'0','1',
--	--OP CODE
--	'0','1',
--	--PHY ADDR
--	'0','0','0','0','0',
--	--REG ADDR
--	'0','0','0','0','0',
--	--TAR
--    '1','0',
--	--DATA
--	'1','0','1','0','0','0','0','0',
--	--DATA 
--	'0','0','0','0','0','0','0','0'
--
--	--post
--	--'1','1','1','1'

