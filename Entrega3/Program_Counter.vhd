----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:32:25 04/04/2018 
-- Design Name: 
-- Module Name:    Program_Counter - Behavioral 
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

entity Program_Counter is
    Port ( Address : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           PC_out : out  STD_LOGIC_VECTOR (31 downto 0));
end Program_Counter;

architecture Behavioral of Program_Counter is
signal PC_out_Aux : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
begin 
	process(clk, rst)is 
	begin
		if(rst = '1') then
			PC_out_Aux <= "00000000000000000000000000000000";
		else
			if(rising_edge(clk))then
				PC_out_Aux <= Address;
			end if;
	
		end if;
	end process;
	PC_out <= PC_out_Aux;
end Behavioral;

