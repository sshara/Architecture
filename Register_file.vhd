----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:22:11 04/13/2018 
-- Design Name: 
-- Module Name:    Register_file - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Register_file is
    Port ( rst : in STD_LOGIC;
			  RS1 : in  STD_LOGIC_VECTOR (4 downto 0);
           RS2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Rd : in  STD_LOGIC_VECTOR (4 downto 0);
           DWR : in  STD_LOGIC_VECTOR (31 downto 0);
           CRS1 : out  STD_LOGIC_VECTOR (31 downto 0);
           CRS2 : out  STD_LOGIC_VECTOR (31 downto 0));
end Register_file;

architecture Behavioral of Register_file is
	TYPE files IS ARRAY ( 0 TO 31 ) OF STD_LOGIC_vector(31 downto 0);
	signal registros : files := (others => x"00000000"); 
	
	
begin
	process(rst, RS1, RS2, Rd, DWR) is
		begin
			if (rst = '0') then
				CRS1 <= registros(conv_integer(RS1));
				CRS2 <= registros(conv_integer(RS2));
				if (Rd /= "000000") then
					registros(conv_integer(Rd)) <= DWR;
				end if;
			else
				CRS1 <= (others => '0');
				CRS2 <= (others => '0');
				registros <= (others => x"00000000");
			end if;
	end process;

end Behavioral;

