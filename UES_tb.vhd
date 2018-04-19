--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:51:45 04/06/2018
-- Design Name:   
-- Module Name:   C:/Users/utp/Documents/datapath/datapath/UES_tb.vhd
-- Project Name:  datapath
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: UES
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
 
ENTITY UES_tb IS
END UES_tb;
 
ARCHITECTURE behavior OF UES_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT UES
    PORT(
         simm13 : IN  std_logic_vector(12 downto 0);
         simm32 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal simm13 : std_logic_vector(12 downto 0) := (others => '0');

 	--Outputs
   signal simm32 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: UES PORT MAP (
          simm13 => simm13,
          simm32 => simm32
        );

  

   -- Stimulus process
   stim_proc: process
   begin		
      
      wait for 100 ns;	
		simm13 <= "0000000000111";
		wait for 100 ns;	
		simm13 <= "1111000000100";
		wait for 100 ns;	
		simm13 <= "0000001000111";
		wait for 100 ns;	
		simm13 <= "1111110000000";
		wait for 100 ns;	
		simm13 <= "0000000000011";

      wait;
   end process;

END;
