----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:51:41 06/01/2018 
-- Design Name: 
-- Module Name:    MuxW_R - Behavioral 
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

entity MuxW_R is
	Port ( 
		rd : in  STD_LOGIC_VECTOR (5 downto 0);
		O7 : in  STD_LOGIC_VECTOR (5 downto 0);
		rfDest : in  STD_LOGIC;
		nRd : out  STD_LOGIC_VECTOR (5 downto 0)
	);
end MuxW_R;

architecture Behavioral of MuxW_R is
signal nRd_Aux : std_logic_vector(5 downto 0) := "000000";

begin

	process(rd, O7, rfDest) begin
		if(rfDest='1') then
			nRd_Aux <= O7;
		else
			nRd_Aux <= rd;
		end if;
	end process;
	
nRd <= nRd_Aux;

end Behavioral;



