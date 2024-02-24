----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:07:15 12/25/2023 
-- Design Name: 
-- Module Name:    TCP_IP - Behavioral 
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

entity TCP_IP is
port(
	TXD: out std_logic_vector(3 downto 0);
	TXEN: out std_logic;
	TXER: out std_logic;
	TXCLK: in std_logic
);
end TCP_IP;

architecture Behavioral of TCP_IP is

signal counter: integer range 0 to 30 := 0;
signal bitcounter: integer range 0 to 192 := 0;
signal f: integer range 0 to 1 := 0;

begin

	TXER <= '0';
	TXEN <= '1';

--	process (TXCLK)
--	begin
--		if (TXCLK'event and TXCLK = '0') then
--			if (bitcounter = 192) then
--				f <= 1;
--			end if;	
--		end if;	
--	end process;

	process (TXCLK)
	begin
		if (TXCLK'event and TXCLK = '1') then
				case bitcounter is
					when 0 => 
						TXD <= "0100";
						bitcounter <= 4;
					when 4 =>
						TXD <= "0101";
						bitcounter <= 8;
					when 8 =>
						TXD <= "0000";
						bitcounter <= 12;
					when 12 =>
						TXD <= "0000";
						bitcounter <= 16;
					when 16 =>
						TXD <= "0000";
						bitcounter <= 20;
					when 20 =>
						TXD <= "0000";
						bitcounter <= 24;
					when 24 =>
						TXD <= "0010";
						bitcounter <= 28;
					when 28 =>
						TXD <= "1100";
						bitcounter <= 32;
					when 32 =>
						TXD <= "0110";
						bitcounter <= 36;
					when 36 =>
						TXD <= "0000";
						bitcounter <= 40;
					when 40 =>
						TXD <= "1010";
						bitcounter <= 44;
					when 44 =>
						TXD <= "0110";
						bitcounter <= 48;
					when 48 =>
						TXD <= "0100";
						bitcounter <= 52;
					when 52 =>
						TXD <= "0000";
						bitcounter <= 56;
					when 56 =>
						TXD <= "0000";
						bitcounter <= 60;
					when 60 =>
						TXD <="0000";
						bitcounter <= 64;
					when 64 =>
						TXD <= "1000";
						bitcounter <= 68;
					when 68 =>
						TXD <="0000";
						bitcounter <= 72;
					when 72 =>
						TXD <= "0000";
						bitcounter <= 76;
					when 76 =>
						TXD <= "0110";
						bitcounter <= 80;
					when 80 =>
						TXD <= "0001";
						bitcounter <= 84;
					when 84 =>
						TXD <= "1000";
						bitcounter <= 88;
					when 88 =>
						TXD <= "1101";
						bitcounter <= 92;
					when 92 =>
						TXD <= "0000";
						bitcounter <= 96;
					when 96 =>
						TXD <= "1100";	
						bitcounter <= 100;		
					when 100 =>
						TXD <= "0000";
						bitcounter <= 104;
					when 104 =>
						TXD <= "1010";
						bitcounter <= 108;
					when 108 =>
						TXD <= "1000";
						bitcounter <= 112;
					when 112 =>
						TXD <= "0000";
						bitcounter <= 116;
					when 116 =>
						TXD <= "0000";	
						bitcounter <= 120;
					when 120 =>
						TXD <= "0000";
						bitcounter <= 124;
					when 124 =>
						TXD <= "0010";
						bitcounter <= 128;
					when 128 =>
						TXD <= "1100";
						bitcounter <= 132;
					when 132 =>
						TXD <= "0000";
						bitcounter <= 136;
					when 136 =>
						TXD <= "1010";
						bitcounter <= 140;		
					when 140 =>
						TXD <= "1000";
						bitcounter <= 144;	
					when 144 =>
						TXD <= "0000";
						bitcounter <= 148;	
					when 148 =>
						TXD <= "0000";
						bitcounter <= 152;	
					when 152 =>
						TXD <= "0111";
						bitcounter <= 156;							
					when 156 =>
						TXD <= "0111";
						bitcounter <= 160;
					when 160 =>
						TXD <= "0000";
						bitcounter <= 164;
					when 164 =>
						TXD <= "0000";
						bitcounter <= 168;
					when 168 =>
						TXD <= "0000";
						bitcounter <= 172;
					when 172 =>
						TXD <= "0000";
						bitcounter <= 176;
					when 176 =>
						TXD <= "0000";
						bitcounter <= 180;
					when 180 =>
						TXD <= "0000";
						bitcounter <= 184;
					when 184 =>
						TXD <= "0000";
						bitcounter <= 188;
					when 188 =>
						TXD <= "0000";
						bitcounter <= 192;
					when 192 =>
						TXD <= "0000";
						bitcounter <= 0;					
					when others => 
						bitcounter <= 0;
					end case;
		end if;			
	end process;


end Behavioral;

