--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:35:36 05/09/2018
-- Design Name:   
-- Module Name:   /home/zanahoria-chan/Documentos/Labs_Electronica/Data_Path/tb_psr.vhd
-- Project Name:  Data_Path
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PSR
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
 
ENTITY tb_psr IS
END tb_psr;
 
ARCHITECTURE behavior OF tb_psr IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PSR
    PORT(
         nCWP : IN  std_logic;
         NZVC : IN  std_logic_vector(3 downto 0);
         rst : IN  std_logic;
         clk : IN  std_logic;
         cwp : OUT  std_logic;
         C : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal nCWP : std_logic := '0';
   signal NZVC : std_logic_vector(3 downto 0) := (others => '0');
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal cwp : std_logic;
   signal C : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSR PORT MAP (
          nCWP => nCWP,
          NZVC => NZVC,
          rst => rst,
          clk => clk,
          cwp => cwp,
          C => C
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
			
			nCWP <= '1';
         NZVC <= "1001";
         rst <= '0';
		
      wait for clk_period*10;
		
			nCWP <= '1';
         NZVC <= "1001";
         rst <= '1';
		
      wait for clk_period*10;
		
			nCWP <= '0';
         NZVC <= "1000";
         rst <= '0';
		
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
