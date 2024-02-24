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
    en 	                                : in     std_logic; -- enable SMI when '1'
    rst	                                : in     std_logic; -- reset  SMI when '1' and EN = '1'
    clk	                                : in     std_logic; -- clock
    str                                 : in     std_logic; -- start send 128 bit by SMI on DATA
    busy                                :   out  std_logic; -- не используеться, флаг готовности(ресет)
    MDIO                                :   out  std_logic; -- MD data  port
    MDC                                 :   out  std_logic  -- MD clock port
  );
end SMI;

architecture RTL of SMI is

--  attribute BUFFER_TYPE                 :        string;
--  attribute BUFFER_TYPE of MDC : signal is "none"; 

  constant ADDR_size                    :        integer := 128;
    
  signal ADDR_int                       :        integer range 0 to ADDR_size - 1;
  signal rom                            :        std_logic_vector( 0 to ADDR_size - 1) := x"FF_FF_FF_50_02_20_00_FF_FF_FF_FF_50_02_A0_00_FF"; -- вектор настройки езэрнет драйвера
    
  attribute rom_style                   :        string;
  attribute rom_style of rom            : signal is "DISTRIBUTED";

begin

  MDC  <= clk;

MDIO_output_process:process(en, rst, clk)
  begin
    if en = '1' then
      if rst = '1' then
        MDIO                            <= '1';
      elsif rising_edge( clk ) then
        MDIO                            <= rom( ADDR_int );
      end if; -- rising_edge(clk)
    end if; -- en = '1'
  end process;

str_carpiturier: process(en, rst, clk, str)
  begin
    if en = '1' then
      if rst = '1' then
        ADDR_int                        <=  0;
        busy                            <= '1';
      elsif falling_edge( clk ) then -- rst = '1'
        if ADDR_int = ADDR_size - 1 then
          busy                          <= '0';
        else
          ADDR_int                      <= ADDR_int + 1;
          busy                          <= '1';
        end if; --
      end if; -- else rst = '1' & if rising_edge(clk)
    end if; -- en = '1'
  end process;

end RTL;

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

