--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:41:10 04/15/2018
-- Design Name:   
-- Module Name:   /home/zanahoria-chan/Documentos/Labs_Electronica/Data_Path/CU_tb.vhd
-- Project Name:  Data_Path
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Control_unity
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
 
ENTITY CU_tb IS
END CU_tb;
 
ARCHITECTURE behavior OF CU_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Control_unity
    PORT(
         OP : IN  std_logic_vector(1 downto 0);
         Opcode : IN  std_logic_vector(5 downto 0);
         OP_out : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal OP : std_logic_vector(1 downto 0) := (others => '0');
   signal Opcode : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal OP_out : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Control_unity PORT MAP (
          OP => OP,
          Opcode => Opcode,
          OP_out => OP_out
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		 OP <= "10";
       Opcode <="000000";
		 wait for 100 ns;	
		 OP <= "10";
       Opcode <="000001";
		 wait for 100 ns;	
		 OP <= "10";
       Opcode <="000010";
		 wait for 100 ns;	
		 OP <= "10";
       Opcode <="000100";
		 wait for 100 ns;	
		 OP <= "10";
       Opcode <="000101";
		 wait for 100 ns;	
		 OP <= "10";
       Opcode <="000110";
		 wait for 100 ns;	
		 OP <= "10";
       Opcode <="000011";
		 wait for 100 ns;	
		 OP <= "10";
       Opcode <="000111";

     

      -- insert stimulus here 

      wait;
   end process;

END;
