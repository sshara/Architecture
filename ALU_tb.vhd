--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:25:49 04/15/2018
-- Design Name:   
-- Module Name:   /home/zanahoria-chan/Documentos/Labs_Electronica/Data_Path/ALU_tb.vhd
-- Project Name:  Data_Path
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY ALU_tb IS
END ALU_tb;
 
ARCHITECTURE behavior OF ALU_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         Op_code : IN  std_logic_vector(5 downto 0);
         CRS1 : IN  std_logic_vector(31 downto 0);
         MUX_out : IN  std_logic_vector(31 downto 0);
         Alu_result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Op_code : std_logic_vector(5 downto 0) := (others => '0');
   signal CRS1 : std_logic_vector(31 downto 0) := (others => '0');
   signal MUX_out : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Alu_result : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          Op_code => Op_code,
          CRS1 => CRS1,
          MUX_out => MUX_out,
          Alu_result => Alu_result
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		 Op_code <= "000000";
       CRS1 <= "00000000000000000000000000001000";
       MUX_out <= "00000000000000000000000000010000";
      wait for 100 ns;	
		 Op_code <= "000100";
       CRS1 <= "00000000000000000000000000001000";
       MUX_out <= "00000000000000000000000000000010";
      wait for 100 ns;	
		 Op_code <= "000001";
       CRS1 <= "00000000000000000000000000001000";
       MUX_out <= "00000000000000000000000000001010";
      wait for 100 ns;	
		 Op_code <= "000010";
       CRS1 <= "00000000000000000000000000001000";
       MUX_out <= "00000000000000000000000000001010";
		 wait for 100 ns;	
		 Op_code <= "000101";
       CRS1 <= "00000000000000000000000000001000";
       MUX_out <= "00000000000000000000000000001010";
		 wait for 100 ns;	
		 Op_code <= "000110";
       CRS1 <= "00000000000000000000000000001000";
       MUX_out <= "00000000000000000000000000001010";
		 wait for 100 ns;	
		 Op_code <= "000011";
       CRS1 <= "00000000000000000000000000001000";
       MUX_out <= "00000000000000000000000000001010";
		 wait for 100 ns;	
		 Op_code <= "000111";
       CRS1 <= "00000000000000000000000000001000";
       MUX_out <= "00000000000000000000000000001010";
		 
      

      -- insert stimulus here 

      wait;
   end process;

END;
