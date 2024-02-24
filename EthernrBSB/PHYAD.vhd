----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:05:09 01/30/2024 
-- Design Name: 
-- Module Name:    PHYAD - Behavioral 
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

entity PHYAD is
PORT(
	clk: in std_logic;
	PHYAD1: out std_logic; 
	f: out std_logic
);
end PHYAD;

architecture Behavioral of PHYAD is

begin

--process (clk)
--begin
--	if (rising_edge(clk)) then
--		
--end process;

end Behavioral;

