--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:39:54 06/01/2018
-- Design Name:   
-- Module Name:   /home/zanahoria-chan/Documentos/Labs_Electronica/Data_Path/tb_datamemory.vhd
-- Project Name:  Data_Path
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DatMemory
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
 
ENTITY tb_datamemory IS
END tb_datamemory;
 
ARCHITECTURE behavior OF tb_datamemory IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DatMemory
    PORT(
         cRD : IN  std_logic_vector(31 downto 0);
         aluResult : IN  std_logic_vector(31 downto 0);
         WriteMemoryEnable : IN  std_logic;
         reset : IN  std_logic;
         dataMem : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal cRD : std_logic_vector(31 downto 0) := (others => '0');
   signal aluResult : std_logic_vector(31 downto 0) := (others => '0');
   signal WriteMemoryEnable : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal dataMem : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DatMemory PORT MAP (
          cRD => cRD,
          aluResult => aluResult,
          WriteMemoryEnable => WriteMemoryEnable,
          reset => reset,
          dataMem => dataMem
        );

   

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		cRD <= x"00000000";
		aluResult <= x"00000000";
		WriteMemoryEnable <= '0';
		reset <='1';
      wait for 100 ns;
		reset <='0';
		
		cRD <= x"00000159";--valor 345 
		aluResult <= x"00000064";--Adress 100
		WriteMemoryEnable <= '1';--Store
		
		wait for 20 ns;
		
		cRD <= x"0000009B";--valor 155
		aluResult <= x"00000000";--Adress 0
		WriteMemoryEnable <= '1';--Store
		
		wait for 20 ns;
		
		cRD <= x"00000CBA";
		aluResult <= x"00000064";
		WriteMemoryEnable <= '0';--Load
		
		wait for 20 ns;
		
		cRD <= x"00000ABC";
		aluResult <= x"00000000";
		WriteMemoryEnable <= '0';--Load
		

      -- insert stimulus here 

      wait;
   end process;

END;
