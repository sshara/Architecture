----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:11:05 06/01/2018 
-- Design Name: 
-- Module Name:    MUXnPC - Behavioral 
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

entity MUXnPC is
	Port ( 
		clk: in STD_LOGIC;
		callPc : in  STD_LOGIC_VECTOR (31 downto 0);
		branch : in  STD_LOGIC_VECTOR (31 downto 0);
		nextPc : in  STD_LOGIC_VECTOR (31 downto 0);
		jumpL : in  STD_LOGIC_VECTOR (31 downto 0);
		pcSc : in  STD_LOGIC_VECTOR (1 downto 0);
		newPc : out  STD_LOGIC_VECTOR (31 downto 0)
	);
end MUXnPC;

architecture Behavioral of MUXnPC is
signal newPc_Aux : STD_LOGIC_VECTOR (31 downto 0) := (others=>'0');
begin
	process(callPc, branch, nextPc, jumpL, pcSc) begin
			case(pcSc) is
				when "01" =>
					newPc_Aux <= callPc;
				when "10" =>
					newPc_Aux <= branch;
				when "11" =>
					newPc_Aux <= jumpL;
				when others =>
					newPc_Aux <= nextPc;
			end case;
	
	end process;
	newPc <= newPc_Aux;
	
end Behavioral;

