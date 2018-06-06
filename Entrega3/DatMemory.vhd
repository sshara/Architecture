----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:44:37 06/01/2018 
-- Design Name: 
-- Module Name:    DatMemory - Behavioral 
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
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DatMemory is
	Port ( 
		cRD : in  STD_LOGIC_VECTOR (31 downto 0);
		aluResult : in  STD_LOGIC_VECTOR (31 downto 0);
		WriteMemoryEnable : in  STD_LOGIC;
		reset : in std_logic;
		dataMem : out  STD_LOGIC_VECTOR (31 downto 0)
	);
end DatMemory;

architecture Behavioral of DatMemory is

type array32 is array (0 to 519) of std_logic_vector (31 downto 0);
signal valueArray32 : array32 := (others => x"00000000");
signal dataMem_Aux : std_Logic_Vector (31 downto 0) := x"00000000";
begin
	process(cRD, aluResult, WriteMemoryEnable, reset) begin
		if(reset='1') then
			valueArray32 <= (others => x"00000000");
		end if;
		if(WriteMemoryEnable='1' and reset='0' and 520>aluResult) then
			valueArray32(conv_integer(aluResult))<=cRD;
		end if;
		if(520>aluResult) then
			dataMem_Aux<=valueArray32(conv_integer(aluResult));
		else
			dataMem_Aux<=x"00000000";
		end if;
	end process;

	dataMem<= dataMem_Aux;
end Behavioral;

