--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:17:51 05/09/2018
-- Design Name:   
-- Module Name:   /home/zanahoria-chan/Documentos/Labs_Electronica/Data_Path/tb_wm.vhd
-- Project Name:  Data_Path
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Windows_manager
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
 
ENTITY tb_wm IS
END tb_wm;
 
ARCHITECTURE behavior OF tb_wm IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Windows_manager
    PORT(
         Rs1 : IN  std_logic_vector(4 downto 0);
         Rs2 : IN  std_logic_vector(4 downto 0);
         Rd : IN  std_logic_vector(4 downto 0);
         Op : IN  std_logic_vector(1 downto 0);
         Op3 : IN  std_logic_vector(5 downto 0);
         cwp : IN  std_logic;
         Rout : OUT  std_logic_vector(17 downto 0);
         ncwp : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal Rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal Rd : std_logic_vector(4 downto 0) := (others => '0');
   signal Op : std_logic_vector(1 downto 0) := (others => '0');
   signal Op3 : std_logic_vector(5 downto 0) := (others => '0');
   signal cwp : std_logic := '0';

 	--Outputs
   signal Rout : std_logic_vector(17 downto 0);
   signal ncwp : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Windows_manager PORT MAP (
          Rs1 => Rs1,
          Rs2 => Rs2,
          Rd => Rd,
          Op => Op,
          Op3 => Op3,
          cwp => cwp,
          Rout => Rout,
          ncwp => ncwp
        );

   -- Clock process definitions
   
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
			Rs1 <= "00001";
         Rs2 <= "11001";
          Rd <= "00100";
          Op <= "10";
          Op3 <= "111100";
          cwp <= '1';
     wait for 100 ns;	
			Rs1 <= "01100";
         Rs2 <= "10110";
          Rd <= "11011";
          Op <= "10";
          Op3 <= "111101";
          cwp <= '0';

      -- insert stimulus here 

      wait;
   end process;

END;
