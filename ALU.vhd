----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:00:17 04/13/2018 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is 
    Port ( Op_code : in  STD_LOGIC_VECTOR (5 downto 0);
           CRS1 : in  STD_LOGIC_VECTOR (31 downto 0);
           MUX_out : in  STD_LOGIC_VECTOR (31 downto 0);
           Alu_result : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is

begin
process(Op_code, CRS1, MUX_out)is
begin
	case Op_code is
		when "000000" => Alu_result <= std_logic_vector(UNSIGNED(CRS1) + UNSIGNED(MUX_out));
		when "000100"=> Alu_result <= std_logic_vector(UNSIGNED(CRS1) - UNSIGNED(MUX_out));
		when "000001"=> Alu_result <= CRS1 and MUX_out;
		when "000101" => Alu_result <= CRS1 nand MUX_out;
		when "000010"=> Alu_result <= CRS1 or MUX_out;
		when "000110"=> Alu_result <= CRS1 nor MUX_out;
		when "000011" => Alu_result <= CRS1 xor MUX_out;
		when others => Alu_result <= CRS1 xnor MUX_out;
	end case;
end process;
end Behavioral;

