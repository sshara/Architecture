--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:42:09 04/06/2018
-- Design Name:   
-- Module Name:   C:/Users/utp/Documents/datapath/datapath/Mux_IorR_tb.vhd
-- Project Name:  datapath
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Mux_IorR
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
 
ENTITY Mux_IorR_tb IS
END Mux_IorR_tb;
 
ARCHITECTURE behavior OF Mux_IorR_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mux_IorR
    PORT(
         CRS2 : IN  std_logic_vector(31 downto 0);
         simm32 : IN  std_logic_vector(31 downto 0);
         i : IN  std_logic;
         OP2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CRS2 : std_logic_vector(31 downto 0) := (others => '0');
   signal simm32 : std_logic_vector(31 downto 0) := (others => '0');
   signal i : std_logic := '0';

 	--Outputs
   signal OP2 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux_IorR PORT MAP (
          CRS2 => CRS2,
          simm32 => simm32,
          i => i,
          OP2 => OP2
        );

   
   
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		 CRS2 <= "00000000000000000000000000000101";
       simm32 <= "00000000000000000000000000000111";
       i <= '1';
		 
		 wait for 100 ns;	
		 CRS2 <= "00000000000000000000000000000001";
       simm32 <= "00000000000000000000000000000110";
       i <= '0';
		 
		 wait for 100 ns;	
		 CRS2 <= "00000000000000000000000000001000";
       simm32 <= "00000000000000000000000000000111";
       i <= '0';

      -- insert stimulus here 

      wait;
   end process;

END;
