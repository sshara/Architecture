----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:05:53 06/01/2018 
-- Design Name: 
-- Module Name:    MUXRf - Behavioral 
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

entity MUXRf is
	Port ( 
		dataMem : in  STD_LOGIC_VECTOR (31 downto 0);
		aluResult : in  STD_LOGIC_VECTOR (31 downto 0);
		Pc : in  STD_LOGIC_VECTOR (31 downto 0);
		rfSource : in  STD_LOGIC_VECTOR (1 downto 0);
		dataRf : out  STD_LOGIC_VECTOR (31 downto 0)
	);
end MUXRf;

architecture Behavioral of MUXRf is
signal dataRf_Aux : STD_LOGIC_VECTOR (31 downto 0) := (others=>'0');
begin
	process(Pc, rfSource) begin
		case(rfSource) is
			when "00" =>
				dataRf_Aux <= aluResult;
			when "01" =>
				dataRf_Aux <= Pc;
			when "10" =>
				dataRf_Aux <= dataMem;
			when others =>
				dataRf_Aux <= Pc;
		end case;
	end process;
	dataRf <= dataRf_Aux;

end Behavioral;

