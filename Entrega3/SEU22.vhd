----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:08:09 06/01/2018 
-- Design Name: 
-- Module Name:    SEU22 - Behavioral 
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

entity SEU22 is
	Port ( 
		imm22 : in  STD_LOGIC_VECTOR (21 downto 0);
		imm32 : out  STD_LOGIC_VECTOR (31 downto 0)
	);
end SEU22;

architecture Behavioral of SEU22 is

begin
	process(imm22) begin
	
		if(imm22(21)='1') then
			imm32(31 downto 22) <= "1111111111";
			imm32(21 downto 0) <= imm22;
		else
			imm32(31 downto 22) <= "0000000000";
			imm32(21 downto 0) <= imm22;
		end if;
		
	end process;

end Behavioral;

