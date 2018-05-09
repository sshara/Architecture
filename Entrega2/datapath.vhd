----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:19:37 04/04/2018 
-- Design Name: 
-- Module Name:    datapath - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity datapath is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           Alu_Out : out  STD_LOGIC_VECTOR (31 downto 0));
end datapath;

architecture Behavioral of datapath is
	
	COMPONENT sumador
	PORT(
		A : IN std_logic_vector(31 downto 0);
		B : IN std_logic_vector(31 downto 0);          
		C : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Program_Counter
	PORT(
		Address : IN std_logic_vector(31 downto 0);
		rst : IN std_logic;
		clk : IN std_logic;          
		PC_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT instructionMemory
	PORT(
		address : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		outInstruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT ALU
	PORT(
		Op_code : IN std_logic_vector(5 downto 0);
		CRS1 : IN std_logic_vector(31 downto 0);
		C : IN std_logic;
		MUX_out : IN std_logic_vector(31 downto 0);          
		Alu_result : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Control_unity
	PORT(
		OP : IN std_logic_vector(1 downto 0);
		Opcode : IN std_logic_vector(5 downto 0);          
		OP_out : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Mux_IorR
	PORT(
		CRS2 : IN std_logic_vector(31 downto 0);
		simm32 : IN std_logic_vector(31 downto 0);
		i : IN std_logic;          
		OP2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Register_file
	PORT(
		rst : IN std_logic;
		nRS1 : IN std_logic_vector(5 downto 0);
		nRS2 : IN std_logic_vector(5 downto 0);
		nRd : IN std_logic_vector(5 downto 0);
		DWR : IN std_logic_vector(31 downto 0);          
		CRS1 : OUT std_logic_vector(31 downto 0);
		CRS2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT UES
	PORT(
		simm13 : IN std_logic_vector(12 downto 0);          
		simm32 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT PSR_modifier
	PORT(
		CSR1 : IN std_logic_vector(31 downto 0);
		MUX_out : IN std_logic_vector(31 downto 0);
		ALU_out : IN std_logic_vector(31 downto 0);
		OP_code : IN std_logic_vector(5 downto 0);          
		NZVC : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	COMPONENT PSR
	PORT(
		nCWP : IN std_logic;
		NZVC : IN std_logic_vector(3 downto 0);
		rst : IN std_logic;
		clk : IN std_logic;          
		cwp : OUT std_logic;
		C : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT Windows_manager
	PORT(
		Rs1 : IN std_logic_vector(4 downto 0);
		Rs2 : IN std_logic_vector(4 downto 0);
		Rd : IN std_logic_vector(4 downto 0);
		Op : IN std_logic_vector(1 downto 0);
		Op3 : IN std_logic_vector(5 downto 0);
		cwp : IN std_logic;          
		Rout : OUT std_logic_vector(17 downto 0);
		ncwp : OUT std_logic
		);
	END COMPONENT;
	
	signal S_sum: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
	signal S_nPc: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
	signal S_Pc: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
	signal S_Instr: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
	signal S_CRS1: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
	signal S_CRS2: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
	signal S_Mux_out: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
	signal S_UES:std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
	signal S_code:std_logic_vector(5 downto 0) := "000000";
	signal S_Alu_Out: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
	
	signal S_NZVC:std_logic_vector(3 downto 0) := "0000";
	signal S_C:std_logic := '0';
	signal S_cwp:std_logic := '0';
	signal S_ncwp:std_logic := '0';
	signal S_WmOut:std_logic_vector(17 downto 0) := "000000000000000000";
	
	
begin

	Inst_sumador: sumador PORT MAP(
		A => "00000000000000000000000000000001",
		B => S_nPc,
		C => S_sum
	);
	
	Inst_Program_Counter: Program_Counter PORT MAP(
		Address => S_nPc,
		rst => rst,
		clk => clk,
		PC_out => S_Pc
	);

	Inst_Next_Program_Counter: Program_Counter PORT MAP(
		Address => S_sum,
		rst => rst,
		clk => clk,
		PC_out => S_nPc
	);
	
	Inst_instructionMemory: instructionMemory PORT MAP(
		address => S_Pc,
		reset => rst,
		outInstruction => S_Instr
	);
	
	Inst_Mux_IorR: Mux_IorR PORT MAP(
		CRS2 => S_CRS2,
		simm32 => S_UES,
		i => S_Instr(13),
		OP2 => S_Mux_out
	);
	
	Inst_ALU: ALU PORT MAP(
		Op_code => S_code,
		CRS1 => S_CRS1,
		C => S_C,
		MUX_out => S_Mux_out,
		Alu_result => S_Alu_Out
	);
	
	Inst_Control_unity: Control_unity PORT MAP(
		OP => S_Instr(31 downto 30),
		Opcode => S_Instr(24 downto 19),
		OP_out => S_code
	);
	
	Inst_Register_file: Register_file PORT MAP(
		rst => rst,
		nRS1 => S_WmOut(17 downto 12),
		nRS2 => S_WmOut(11 downto 6),
		nRd => S_WmOut(5 downto 0),
		DWR => S_Alu_Out,
		CRS1 => S_CRS1,
		CRS2 => S_CRS2
	);
	
	Inst_UES: UES PORT MAP(
		simm13 => S_Instr(12 downto 0),
		simm32 => S_UES
	);
	
	Inst_PSR: PSR PORT MAP(
		nCWP => S_ncwp,
		NZVC => S_NZVC,
		rst => rst,
		clk => clk,
		cwp => S_cwp,
		C => S_C
	);
	
	Inst_PSR_modifier: PSR_modifier PORT MAP(
		CSR1 => S_CRS1,
		MUX_out => S_Mux_out,
		ALU_out => S_Alu_Out,
		OP_code => S_code,
		NZVC => S_NZVC
	);
	
	Inst_Windows_manager: Windows_manager PORT MAP(
		Rs1 => S_Instr(18 downto 14),
		Rs2 => S_Instr(4 downto 0),
		Rd => S_Instr(29 downto 25),
		Op => S_Instr(31 downto 30),
		Op3 => S_Instr(24 downto 19),
		cwp => S_cwp,
		Rout => S_WmOut,
		ncwp => S_ncwp
	);
	
	Alu_Out <= S_Alu_Out;
end Behavioral;

