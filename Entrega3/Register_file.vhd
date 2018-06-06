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
			  WriteEnable : in std_logic;
			  nRS1 : in  STD_LOGIC_VECTOR (5 downto 0);
           nRS2 : in  STD_LOGIC_VECTOR (5 downto 0);
           nRd : in  STD_LOGIC_VECTOR (5 downto 0);
           DWR : in  STD_LOGIC_VECTOR (31 downto 0);
			  CRD : out std_logic_vector (31 downto 0);
           CRS1 : out  STD_LOGIC_VECTOR (31 downto 0);
           CRS2 : out  STD_LOGIC_VECTOR (31 downto 0));
end Register_file;

architecture Behavioral of Register_file is
	TYPE files IS ARRAY ( 0 TO 39 ) OF STD_LOGIC_vector(31 downto 0);
	signal registros : files := (others => x"00000000"); 
	
	
begin
	process(rst, nRS1, nRS2, nRd, DWR) is
		begin
			if (rst = '0' ) then
				CRS1 <= registros(conv_integer(nRS1));
				CRS2 <= registros(conv_integer(nRS2));
				CRD <= registros(conv_integer(nRd));
				if (nRd /= "000000" and WriteEnable='1') then
					registros(conv_integer(nRd)) <= DWR;
				end if;
			else
				CRS1 <= (others => '0');
				CRS2 <= (others => '0');
				registros <= (others => x"00000000");
			end if;
	end process;

end Behavioral;

