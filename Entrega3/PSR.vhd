----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:17:04 04/27/2018 
-- Design Name: 
-- Module Name:    PSR - Behavioral 
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

entity PSR is
    Port ( nCWP : in  STD_LOGIC;
           NZVC : in  STD_LOGIC_VECTOR (3 downto 0);
			  rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           cwp : out  STD_LOGIC;
           C : out  STD_LOGIC);
			 
end PSR;

architecture Behavioral of PSR is
	
begin
process(clk, rst)is 
	begin
		if(rst = '1') then
			cwp <= '0';
			C <= '0';
		else
			if(rising_edge(clk))then
				C <= NZVC(0);
				cwp <= nCWP;
			end if;
	
		end if;
	end process;

end Behavioral;

