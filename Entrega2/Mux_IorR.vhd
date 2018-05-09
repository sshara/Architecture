----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:56:15 04/06/2018 
-- Design Name: 
-- Module Name:    Mux_IorR - Behavioral 
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

entity Mux_IorR is
    Port ( CRS2 : in  STD_LOGIC_VECTOR (31 downto 0);
           simm32 : in  STD_LOGIC_VECTOR (31 downto 0);
           i : in  STD_LOGIC;
           OP2 : out  STD_LOGIC_VECTOR (31 downto 0));
end Mux_IorR;

architecture Behavioral of Mux_IorR is

begin
	process(CRS2, simm32, i) is
	begin
		if(i = '1') then
			OP2 <= simm32;
		else
			OP2 <= CRS2;
		end if;
	end process;


end Behavioral;

