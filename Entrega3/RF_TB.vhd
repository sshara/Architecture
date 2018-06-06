--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:57:41 04/17/2018
-- Design Name:   
-- Module Name:   /home/zanahoria-chan/Documentos/Labs_Electronica/Data_Path/RF_TB.vhd
-- Project Name:  Data_Path
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Register_file
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
 
ENTITY RF_TB IS
END RF_TB;
 
ARCHITECTURE behavior OF RF_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Register_file
    PORT(
         rst : IN  std_logic;
         RS1 : IN  std_logic_vector(4 downto 0);
         RS2 : IN  std_logic_vector(4 downto 0);
         Rd : IN  std_logic_vector(4 downto 0);
         DWR : IN  std_logic_vector(31 downto 0);
         CRS1 : OUT  std_logic_vector(31 downto 0);
         CRS2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal RS1 : std_logic_vector(4 downto 0) := (others => '0');
   signal RS2 : std_logic_vector(4 downto 0) := (others => '0');
   signal Rd : std_logic_vector(4 downto 0) := (others => '0');
   signal DWR : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal CRS1 : std_logic_vector(31 downto 0);
   signal CRS2 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Register_file PORT MAP (
          rst => rst,
          RS1 => RS1,
          RS2 => RS2,
          Rd => Rd,
          DWR => DWR,
          CRS1 => CRS1,
          CRS2 => CRS2
        );



   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		 rst <= '0';
       RS1 <= "10001";
       RS2 <= "10000";
       Rd <= "00000";
       DWR <= "00000000000000000000000000000001";
		 wait for 100 ns;	
		 rst <= '1';
       RS1 <= "10001";
       RS2 <= "10000";
       Rd <= "00000";
       DWR <= "00000000000000000000000000000001";
		 wait for 100 ns;	
		 rst <= '0';
       RS1 <= "10001";
       RS2 <= "10000";
       Rd <= "00001";
       DWR <= "00000000000000000000000000000011";
      wait;
   end process;

END;
