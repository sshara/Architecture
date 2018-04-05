--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:48:37 04/05/2018
-- Design Name:   
-- Module Name:   /home/zanahoria-chan/Documentos/Labs_Electronica/datapath/DP_tb.vhd
-- Project Name:  datapath
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: datapath
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
 
ENTITY DP_tb IS
END DP_tb;
 
ARCHITECTURE behavior OF DP_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT datapath
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         Address_Out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    
	 --Input
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal Address_Out : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;

 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: datapath PORT MAP (
          clk => clk,
          rst => rst,
          Address_Out => Address_Out
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
      
      wait for clk_period;
		rst<='1';
		
		wait for 100 ns;
		rst<='0';
		
		wait for 100 ns;
		rst<='1';
      
		wait for 100 ns;
		rst<='0';
		
      wait;
   end process;

END;
