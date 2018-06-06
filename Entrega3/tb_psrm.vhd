--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:41:24 05/09/2018
-- Design Name:   
-- Module Name:   /home/zanahoria-chan/Documentos/Labs_Electronica/Data_Path/tb_psrm.vhd
-- Project Name:  Data_Path
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PSR_modifier
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
 
ENTITY tb_psrm IS
END tb_psrm;
 
ARCHITECTURE behavior OF tb_psrm IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PSR_modifier
    PORT(
         CSR1 : IN  std_logic_vector(31 downto 0);
         MUX_out : IN  std_logic_vector(31 downto 0);
         ALU_out : IN  std_logic_vector(31 downto 0);
         OP_code : IN  std_logic_vector(5 downto 0);
         NZVC : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CSR1 : std_logic_vector(31 downto 0) := (others => '0');
   signal MUX_out : std_logic_vector(31 downto 0) := (others => '0');
   signal ALU_out : std_logic_vector(31 downto 0) := (others => '0');
   signal OP_code : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal NZVC : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSR_modifier PORT MAP (
          CSR1 => CSR1,
          MUX_out => MUX_out,
          ALU_out => ALU_out,
          OP_code => OP_code,
          NZVC => NZVC
        );

   -- Clock process definitions
   
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
			 CSR1 <= "00000000000000000000000000000100";
          MUX_out <= "00000000000000000000000010000000";
          ALU_out <= "00000000000000000000000010000000";
          OP_code <= "010001";
		wait for 100 ns;	
		
			 CSR1 <= "00000000000000000010000000000000";
          MUX_out <= "00000000000000000010000000000000";
          ALU_out <= "00100000000000000000000000000000";
          OP_code <= "010101";
		wait for 100 ns;	
		
			 CSR1 <= "10000000000000000000000000000000";
          MUX_out <= "01000000000000000000000000000000";
          ALU_out <= "00100000000000000000000000000000";
          OP_code <= "010010";
		wait for 100 ns;	
		
			 CSR1 <= "11000000000000000000000000000000";
          MUX_out <= "11100000000000000000000000000000";
          ALU_out <= "11110000000000000000000000000000";
          OP_code <= "010110";
		wait for 100 ns;	
		
			 CSR1 <= "00000000000111100000000000000000";
          MUX_out <= "10000000100000000000000000000000";
          ALU_out <= "10000010000000001000000010000000";
          OP_code <= "010011";
		wait for 100 ns;	
		
			 CSR1 <= "01001100000000000000001001001000";
          MUX_out <= "00000100000100000000000001000000";
          ALU_out <= "00000110100000000000000000000000";
          OP_code <= "010111";
		wait for 100 ns;	
		
			 CSR1 <= "00000000100000100010010010000000";
          MUX_out <= "00000000000000000000010001000000";
          ALU_out <= "10000000000000000000000000000000";
          OP_code <= "010000";
		wait for 100 ns;	
		
			 CSR1 <= "01000000000010000000000000000000";
          MUX_out <= "00000000010000000000000000000000";
          ALU_out <= "00000001010000000000000000000000";
          OP_code <= "001000";
		wait for 100 ns;	
		
			 CSR1 <= "00000000000000000000000000000000";
          MUX_out <= "00000000000000000000000000000000";
          ALU_out <= "00000000000000000000000000000000";
          OP_code <= "011000";
		wait for 100 ns;	
		
			 CSR1 <= "00000000010000000000000000000000";
          MUX_out <= "00000000000000000100000000000000";
          ALU_out <= "00000000000000000000000000000000";
          OP_code <= "010100";
			 
		wait for 100 ns;	
		
			 CSR1 <= "00000000001000000000000000000000";
          MUX_out <= "00000000000000000000000000000000";
          ALU_out <= "00000010000000000000000000000000";
          OP_code <= "001100";
		wait for 100 ns;	
		
			 CSR1 <= "00000000000000000000000000000000";
          MUX_out <= "00000000000100000000000000000000";
          ALU_out <= "00000000000000000000000000000000";
          OP_code <= "011100";
      -- insert stimulus here 

      wait;
   end process;

END;
