----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:53:04 04/06/2018 
-- Design Name: 
-- Module Name:    UES - Behavioral 
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

entity UES is
    Port ( simm13 : in  STD_LOGIC_VECTOR (12 downto 0);
           simm32 : out  STD_LOGIC_VECTOR (31 downto 0));
end UES;

architecture Behavioral of UES is

begin

	process(simm13)is
	begin 
		if(simm13(12) = '1')then
			simm32(31 downto 13) <= "1111111111111111111";
			simm32(12 downto 0) <= simm13;
		else
			simm32(31 downto 13) <= "0000000000000000000";
			simm32(12 downto 0) <= simm13;
		
		end if;
	end process;
end Behavioral;

