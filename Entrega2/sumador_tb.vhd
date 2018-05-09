--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:25:06 04/04/2018
-- Design Name:   
-- Module Name:   C:/Users/utp/Documents/datapath/datapath/sumador_tb.vhd
-- Project Name:  datapath
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sumador
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY sumador_tb IS
END sumador_tb;
 
ARCHITECTURE behavior OF sumador_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sumador
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         C : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal C : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sumador PORT MAP (
          A => A,
          B => B,
          C => C
        );

   
   -- Stimulus process
   stim_proc: process
   begin		
		wait for 100 ns;	
		A <= "00000000000000000000000000000011";
      B <= "00000000000000000000000000000101";
   	
		wait for 100 ns;	
		A <= "00000000000000000000000000000111";
      B <= "00000000000000000000000000001101";
  	
		wait for 100 ns;	
		A <= "00000000000000000000000000000001";
      B <= "00000000000000000000000000000100";
      wait;
   end process;
END;
