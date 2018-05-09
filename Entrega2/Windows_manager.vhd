----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:11:41 04/27/2018 
-- Design Name: 
-- Module Name:    Windows_manager - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Windows_manager is
    Port ( Rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Rd : in  STD_LOGIC_VECTOR (4 downto 0);
           Op : in  STD_LOGIC_VECTOR (1 downto 0);
           Op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           cwp : in  STD_LOGIC;
           Rout : out  STD_LOGIC_VECTOR (17 downto 0);
           ncwp : out  STD_LOGIC);
end Windows_manager;

architecture Behavioral of Windows_manager is
	signal int_Rs1, int_Rs2, int_Rd: integer range 0 to 39;
begin
	process(Op, Op3, Rs1, Rs2, Rd, cwp)
	begin		
		if (Op = "10" and Op3 = "111100") then
			ncwp <= '0';
			if((Rd >= 0) and (Rd <= 7)) then
				int_Rd <= conv_integer(Rd);
			elsif((Rd >= 8) and (Rd <= 23)) then
				int_Rd <= conv_integer(Rd) + ((conv_integer(cwp)-1) * 16);
			elsif((Rd >= 24) and (Rd <= 31)) then
				int_Rd <= conv_integer(Rd) - ((conv_integer(cwp)-1) * 16);
			end if;	
			
		elsif(Op = "10" and Op3 = "111101") then -- Restore
			ncwp <= '1';
			if((Rd >= 0) and (Rd <= 7)) then
				int_Rd <= conv_integer(Rd);
			elsif((Rd >= 8) and (Rd <= 23)) then
				int_Rd <= conv_integer(Rd) + ((conv_integer(cwp)+1) * 16);
			elsif((Rd >= 24) and (Rd <= 31)) then
				int_Rd <= conv_integer(Rd) - ((conv_integer(cwp)+1) * 16);
			end if;	
			
		else
			if((Rd >= 0) and (Rd <= 7)) then
				int_Rd <= conv_integer(Rd);
			elsif((Rd >= 8) and (Rd <= 23)) then
				int_Rd <= conv_integer(Rd) + (conv_integer(cwp) * 16);
			elsif((Rd >= 24) and (Rd <= 31)) then
				int_Rd <= conv_integer(Rd) - (conv_integer(cwp) * 16);
			end if;
		
		end if;
		
		if((Rs1 >= 0) and (Rs1 <= 7)) then
			int_Rs1 <= conv_integer(Rs1);
		elsif((Rs1 >= 8) and (Rs1 <= 23)) then
			int_Rs1 <= conv_integer(Rs1) + (conv_integer(cwp) * 16);
		elsif((Rs1 >= 24) and (Rs1 <= 31)) then
			int_Rs1 <= conv_integer(Rs1) + (conv_integer(cwp) * 16);
		end if;
		
		if((Rs2 >= 0) and (Rs2 <= 7)) then
			int_Rs2 <= conv_integer(Rs2);
		elsif((Rs2 >= 8) and (Rs2 <= 23)) then
			int_Rs2 <= conv_integer(Rs2) + (conv_integer(cwp) * 16);
		elsif((Rs2 >= 24) and (Rs2 <= 31)) then
			int_Rs2 <= conv_integer(Rs2) - (conv_integer(cwp) * 16);
		end if;
		
	end process;
	
	Rout(17 downto 12) <= conv_std_logic_vector(int_Rs1, 6);
	Rout(11 downto 6) <= conv_std_logic_vector(int_Rs2, 6);
	Rout(5 downto 0) <= conv_std_logic_vector(int_Rd, 6);

end Behavioral;

