----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:35:13 04/27/2018 
-- Design Name: 
-- Module Name:    PSR_modifier - Behavioral 
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

entity PSR_modifier is
    Port ( CSR1 : in  STD_LOGIC_VECTOR (31 downto 0);
           MUX_out : in  STD_LOGIC_VECTOR (31 downto 0);
           ALU_out : in  STD_LOGIC_VECTOR (31 downto 0);
			  OP_code: in STD_LOGIC_VECTOR(5  downto 0);
           NZVC : out  STD_LOGIC_VECTOR (3 downto 0));
end PSR_modifier;

architecture Behavioral of PSR_modifier is

begin
process(CSR1, MUX_out, ALU_out, OP_code)is
	begin	
		if(OP_code = "010000" or OP_code = "011000") then
				NZVC(3)<= ALU_out(31);
				if(ALU_out = "00000000000000000000000000000000") then
					NZVC(2) <= '1';
				else
					NZVC(2) <= '0';
				end if;
				NZVC(1)<= (CSR1(31) and MUX_out(31) and (not ALU_out(31))) or ((not CSR1(31)) and (not MUX_out(31)) and ALU_out(31));
				NZVC(0)<= (CSR1(31) and MUX_out(31)) or ((not ALU_out(31)) and (CSR1(31) or MUX_out(31)));
		
		elsif(OP_code = "010100" or OP_code = "011100") then
				NZVC(3)<= ALU_out(31);
				if(ALU_out = "00000000000000000000000000000000") then
					NZVC(2) <= '1';
				else
					NZVC(2)<= '0';
				end if;
				NZVC(1)<= (CSR1(31) and (not MUX_out(31)) and (not ALU_out(31))) or ((not CSR1(31)) and MUX_out(31) and ALU_out(31));
				NZVC(0)<= ((not CSR1(31)) and MUX_out(31)) or (ALU_out(31) and ((not CSR1(31)) or MUX_out(31)));
						
		elsif (OP_code = "010001" or OP_code = "010101" or OP_code = "010010" or OP_code = "010110" or OP_code = "010011" or OP_code = "010111") then 
				NZVC(3)<= ALU_out(31);
				if(ALU_out = "00000000000000000000000000000000") then
					NZVC(2) <= '1';
				else
					NZVC(2)<= '0';
				end if;
				NZVC(1)<= '0';
				NZVC(0)<= '0';	
		else
			--NZVC <= "0000";
		end if;
	end process;
end Behavioral;

