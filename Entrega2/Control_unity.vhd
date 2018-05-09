----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:51:50 04/10/2018 
-- Design Name: 
-- Module Name:    Control_unity - Behavioral 
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

entity Control_unity is
    Port ( OP : in  STD_LOGIC_VECTOR (1 downto 0);
           Opcode : in  STD_LOGIC_VECTOR (5 downto 0);
           OP_out : out  STD_LOGIC_VECTOR (5 downto 0));
end Control_unity;

architecture Behavioral of Control_unity is

begin
process(OP, OPcode)is
begin
	if(OP = "10")then
	
		if(Opcode = "000000")then
			OP_out<= "000000";
		elsif(Opcode = "000100")then
			OP_out<= "000100";
		elsif(Opcode = "000001")then
			OP_out<= "000001";
		elsif(Opcode = "000101")then
			OP_out<= "000101";
		elsif(Opcode = "000010")then
			OP_out<= "000010";
		elsif(Opcode = "000110")then
			OP_out<= "000110";
		elsif(Opcode = "000011")then
			OP_out<= "000011";
		elsif(Opcode = "000111")then 
			OP_out<= "000111";
		
		elsif(Opcode = "010001")then
			OP_out<= "010001";
		elsif(Opcode = "010101")then
			OP_out<= "010101";
		elsif(Opcode = "010010")then
			OP_out<= "010010";
		elsif(Opcode = "010110")then
			OP_out<= "010110";
		elsif(Opcode = "010011")then
			OP_out<= "010011";
		elsif(Opcode = "010111")then
			OP_out<= "010111";
		elsif(Opcode = "010000")then 
			OP_out<= "010000";
		elsif(Opcode = "001000")then
			OP_out<= "001000";
		elsif(Opcode = "011000")then
			OP_out<= "011000";
		elsif(Opcode = "010100")then 
			OP_out<= "010100";
		elsif(Opcode = "001100")then
			OP_out<= "001100";
		elsif(Opcode = "011100")then
			OP_out<= "011100";
			
		else
			OP_out<= "111111";
		end if;
		
	elsif(OP = "11")then
	
	elsif(OP = "00")then
	
	else 
		OP_out <= "111111";
	
	end if;
end process;
end Behavioral;
