----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:30:42 11/25/2023 
-- Design Name: 
-- Module Name:    WRITE_MAC - Behavioral 
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

entity WRITE_MAC is
	  generic(
			DestinationAddress: std_logic_vector(47 downto 0) := "111001001010100011011111110100101011100000110000";--кому E4-A8-DF-D2-B8-30
			SourceAdress: std_logic_vector(47 downto 0) := "000000000001100000111110000000010010001010101100";--от кого 00-18-3E-01-22-AC
			LengthData: std_logic_vector(15 downto 0) := "0000000011000000";
			Data: std_logic_vector(0 to 191) := x"45_00_00_C0_00_00_40_00_01_06_00_00_C0_A8_01_02_C0_A8_01_01_00_00_00_00";
			
			FCS: std_logic_vector(31 downto 0) := "00000000000000000000000000000000"
	  );
	  PORT (
		 clk_in : in std_logic;
--		 MDC: out std_logic;
--		 MDIO: inout std_logic;
--		 RESET: out std_logic;
		 
		 RXDV: in std_logic;
		 TXER: out std_logic;
		 TXD: out std_logic_vector(3 downto 0);
		 TXEN: out std_logic;
		 TXCLK: in std_logic
	  );
end WRITE_MAC;

architecture Behavioral of WRITE_MAC is

signal counter: integer range 0 to 30 := 0;
signal bitcounter: integer range 1 to 150 := 1;
signal f: integer range 0 to 1 := 0;


begin

	TXER <= '0';

	process (TXCLK, clk_in, RXDV)
	begin
	if (rising_edge(clk_in)) then 

				TXEN <= '1';
			if (bitcounter = 194) then
				f <= 1;
			end if;

	end if;	
	end process;

	process (TXCLK, RXDV)
	begin
		if (TXCLK'event and TXCLK = '1') then

				if (bitcounter > 150) then bitcounter <= 1; end if;
				case bitcounter is
					when 1 to 63 => 
						if (bitcounter mod 2  = 0) then 
							TXD <= "0000";
						else TXD <= "0001";
						end if;
						bitcounter <= bitcounter + 1;
					when 64 =>
						TXD <= "0001";
						bitcounter <= bitcounter + 1;
					when 65 =>
						TXD <= DestinationAddress(47 downto 44);
						bitcounter <= bitcounter + 1;
					when 66 =>
						TXD <= DestinationAddress(43 downto 40);
						bitcounter <= bitcounter + 1;
					when 67 =>
						TXD <= DestinationAddress(39 downto 36);
						bitcounter <= bitcounter + 1;
					when 68 =>
						TXD <= DestinationAddress(35 downto 32);
						bitcounter <= bitcounter + 1;
					when 69 =>
						TXD <= DestinationAddress(31 downto 28);
						bitcounter <= bitcounter + 1;
					when 70 =>
						TXD <= DestinationAddress(27 downto 24);
						bitcounter <= bitcounter + 1;
					when 71 =>
						TXD <= DestinationAddress(23 downto 20);
						bitcounter <= bitcounter + 1;
					when 72 =>
						TXD <= DestinationAddress(19 downto 16);
						bitcounter <= bitcounter + 1;
					when 73 =>
						TXD <= DestinationAddress(15 downto 12);
						bitcounter <= bitcounter + 1;
					when 74 =>
						TXD <= DestinationAddress(11 downto 8);
						bitcounter <= bitcounter + 1;
					when 75 =>
						TXD <= DestinationAddress(7 downto 4);
						bitcounter <= bitcounter + 1;
					when 76 =>
						TXD <= DestinationAddress(3 downto 0);
						bitcounter <= bitcounter + 1;
					when 77 =>
						TXD <= SourceAdress(47 downto 44);
						bitcounter <= bitcounter + 1;
					when 78 =>
						TXD <= SourceAdress(43 downto 40);
						bitcounter <= bitcounter + 1;
					when 79 =>
						TXD <= SourceAdress(39 downto 36);
						bitcounter <= bitcounter + 1;
					when 80 =>
						TXD <= SourceAdress(35 downto 32);
						bitcounter <= bitcounter + 1;
					when 81 =>
						TXD <= SourceAdress(31 downto 28);
						bitcounter <= bitcounter + 1;
					when 82 =>
						TXD <= SourceAdress(27 downto 24);
						bitcounter <= bitcounter + 1;
					when 83 =>
						TXD <= SourceAdress(23 downto 20);
						bitcounter <= bitcounter + 1;
					when 84 =>
						TXD <= SourceAdress(19 downto 16);
						bitcounter <= bitcounter + 1;
					when 85 =>
						TXD <= SourceAdress(15 downto 12);
						bitcounter <= bitcounter + 1;
					when 86 =>
						TXD <= SourceAdress(11 downto 8);
						bitcounter <= bitcounter + 1;
					when 87 =>
						TXD <= SourceAdress(7 downto 4);	
						bitcounter <= bitcounter + 1;		
					when 88 =>
						TXD <= SourceAdress(3 downto 0);
						bitcounter <= bitcounter + 1;
					when 89 =>
						TXD <= LengthData(15 downto 12);
						bitcounter <= bitcounter + 1;
					when 90 =>
						TXD <= LengthData(11 downto 8);
						bitcounter <= bitcounter + 1;
					when 91 =>
						TXD <= LengthData(7 downto 4);
						bitcounter <= bitcounter + 1;
					when 92 =>
						TXD <= LengthData(3 downto 0);	
						bitcounter <= bitcounter + 1;
					when 93 to 140 =>
						TXD <= Data((bitcounter-93)*4 to (bitcounter-92)*4-1);
						bitcounter <= bitcounter + 1;
					when 141 =>
						TXD <= FCS(31 downto 28);
						bitcounter <= bitcounter + 1;
					when 142 =>
						TXD <= FCS(27 downto 24);
						bitcounter <= bitcounter + 1;
					when 143 =>
						TXD <= FCS(23 downto 20);
						bitcounter <= bitcounter + 1;
					when 144 =>
						TXD <= FCS(19 downto 16);
						bitcounter <= bitcounter + 1;		
					when 145 =>
						TXD <= FCS(15 downto 12);
						bitcounter <= bitcounter + 1;	
					when 146 =>
						TXD <= FCS(11 downto 8);
						bitcounter <= bitcounter + 1;	
					when 147 =>
						TXD <= FCS(7 downto 4);
						bitcounter <= bitcounter + 1;	
					when 148 =>
						TXD <= FCS(3 downto 0);
						bitcounter <= bitcounter + 1;							
					when 149 =>
						bitcounter <= 1;
					when others => 
						bitcounter <= 1;
					end case;
				end if;	
	
	end process;

end Behavioral;

