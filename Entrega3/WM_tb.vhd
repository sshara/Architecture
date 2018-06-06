--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:22:38 06/04/2018
-- Design Name:   
-- Module Name:   /home/zanahoria-chan/Documentos/Labs_Electronica/Data_Path/WM_tb.vhd
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
 
ENTITY WM_tb IS
END WM_tb;
 
ARCHITECTURE behavior OF WM_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Windows_manager
    PORT(
         rs1 : IN  std_logic_vector(4 downto 0);
         rs2 : IN  std_logic_vector(4 downto 0);
         rd : IN  std_logic_vector(4 downto 0);
         op : IN  std_logic_vector(1 downto 0);
         op3 : IN  std_logic_vector(5 downto 0);
         cwp : IN  std_logic_vector(4 downto 0);
         nRs1 : OUT  std_logic_vector(5 downto 0);
         nRs2 : OUT  std_logic_vector(5 downto 0);
         nRd : OUT  std_logic_vector(5 downto 0);
         nCwp : OUT  std_logic_vector(4 downto 0);
         O7 : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal rd : std_logic_vector(4 downto 0) := (others => '0');
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');
   signal cwp : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal nRs1 : std_logic_vector(5 downto 0);
   signal nRs2 : std_logic_vector(5 downto 0);
   signal nRd : std_logic_vector(5 downto 0);
   signal nCwp : std_logic_vector(4 downto 0);
   signal O7 : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Windows_manager PORT MAP (
          rs1 => rs1,
          rs2 => rs2,
          rd => rd,
          op => op,
          op3 => op3,
          cwp => cwp,
          nRs1 => nRs1,
          nRs2 => nRs2,
          nRd => nRd,
          nCwp => nCwp,
          O7 => O7
        );

   -- Clock process definitions
  
 

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 100 ns;	
			rs1 <= "11111";
         rs2 <= "11001";
          rd <= "10101";
          op <= "10";
          op3 <= "111100";
          cwp <= "00001";
     wait for 100 ns;	
			rs1 <= "01100";
         rs2 <= "10110";
          rd <= "11011";
          op <= "10";
          op3 <= "111101";
          cwp <= "00000";

      wait;
      wait;
   end process;

END;
