----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:19:37 04/04/2018 
-- Design Name: 
-- Module Name:    datapath - Behavioral 
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

entity datapath is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           Address_Out : out  STD_LOGIC_VECTOR (31 downto 0));
end datapath;

architecture Behavioral of datapath is
	
	COMPONENT sumador
	PORT(
		A : IN std_logic_vector(31 downto 0);
		B : IN std_logic_vector(31 downto 0);          
		C : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Program_Counter
	PORT(
		Address : IN std_logic_vector(31 downto 0);
		rst : IN std_logic;
		clk : IN std_logic;          
		PC_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	signal S_sum: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
	signal S_nPc: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
	
begin

	Inst_sumador: sumador PORT MAP(
		A => "00000000000000000000000000000100",
		B => S_nPc,
		C => S_sum
	);
	
	Inst_Program_Counter: Program_Counter PORT MAP(
		Address => S_nPc,
		rst => rst,
		clk => clk,
		PC_out => Address_Out
	);

	Inst_Next_Program_Counter: Program_Counter PORT MAP(
		Address => S_sum,
		rst => rst,
		clk => clk,
		PC_out => S_nPc
	);

end Behavioral;

