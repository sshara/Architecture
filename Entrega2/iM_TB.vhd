--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:32:39 04/18/2018
-- Design Name:   
-- Module Name:   /home/zanahoria-chan/Documentos/Labs_Electronica/Data_Path/iM_TB.vhd
-- Project Name:  Data_Path
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: instructionMemory
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
 
ENTITY iM_TB IS
END iM_TB;
 
ARCHITECTURE behavior OF iM_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT instructionMemory
    PORT(
         address : IN  std_logic_vector(31 downto 0);
         reset : IN  std_logic;
         outInstruction : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal address : std_logic_vector(31 downto 0) := (others => '0');
   signal reset : std_logic := '0';

 	--Outputs
   signal outInstruction : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: instructionMemory PORT MAP (
          address => address,
          reset => reset,
          outInstruction => outInstruction
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		address <= "00000000000000000000000000000000";
      reset <= '1';
		
		wait for 100 ns;	
		
		address <= "00000000000000000000000000000000";
      reset <= '0';
		
		wait for 100 ns;	
		
		address <= "00000000000000000000000000000010";
      reset <= '0';
		
		wait for 100 ns;	
		
		address <= "00000000000000000000000000000001";
      reset <= '0';
		
		wait for 100 ns;	
		
		address <= "00000000000000000000000000000100";
      reset <= '0';
		
		wait for 100 ns;	
		
		address <= "00000000000000000000000000000011";
      reset <= '0';
      
      -- insert stimulus here 

      wait;
   end process;

END;
