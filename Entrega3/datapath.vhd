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
		op3 : IN std_logic_vector(5 downto 0);
		op : IN std_logic_vector(1 downto 0);
		icc : IN std_logic_vector(3 downto 0);
		cond : IN std_logic_vector(3 downto 0);          
		rfRd : OUT std_logic;
		rfSource : OUT std_logic_vector(1 downto 0);
		WriteMemoryEnable : OUT std_logic;
		pcSc : OUT std_logic_vector(1 downto 0);
		WriteEnable : OUT std_logic;
		aluOp : OUT std_logic_vector(5 downto 0)
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
		WriteEnable : IN std_logic;
		nRS1 : IN std_logic_vector(5 downto 0);
		nRS2 : IN std_logic_vector(5 downto 0);
		nRd : IN std_logic_vector(5 downto 0);
		DWR : IN std_logic_vector(31 downto 0);          
		CRD : OUT std_logic_vector(31 downto 0);
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
		rs1 : IN std_logic_vector(4 downto 0);
		rs2 : IN std_logic_vector(4 downto 0);
		rd : IN std_logic_vector(4 downto 0);
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);
		cwp : IN std_logic_vector(4 downto 0);          
		nRs1 : OUT std_logic_vector(5 downto 0);
		nRs2 : OUT std_logic_vector(5 downto 0);
		nRd : OUT std_logic_vector(5 downto 0);
		nCwp : OUT std_logic_vector(4 downto 0);
		O7 : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	
	COMPONENT DatMemory
	PORT(
		cRD : IN std_logic_vector(31 downto 0);
		aluResult : IN std_logic_vector(31 downto 0);
		WriteMemoryEnable : IN std_logic;
		reset : IN std_logic;          
		dataMem : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT MUXRf
	PORT(
		dataMem : IN std_logic_vector(31 downto 0);
		aluResult : IN std_logic_vector(31 downto 0);
		Pc : IN std_logic_vector(31 downto 0);
		rfSource : IN std_logic_vector(1 downto 0);          
		dataRf : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT MUXnPC
	PORT(
		clk: in STD_LOGIC;
		callPc : IN std_logic_vector(31 downto 0);
		branch : IN std_logic_vector(31 downto 0);
		nextPc : IN std_logic_vector(31 downto 0);
		jumpL : IN std_logic_vector(31 downto 0);
		pcSc : IN std_logic_vector(1 downto 0);          
		newPc : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT MuxW_R
	PORT(
		rd : IN std_logic_vector(5 downto 0);
		O7 : IN std_logic_vector(5 downto 0);
		rfDest : IN std_logic;          
		nRd : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	
	COMPONENT SEU22
	PORT(
		imm22 : IN std_logic_vector(21 downto 0);          
		imm32 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT SEU30
	PORT(
		imm30 : IN std_logic_vector(29 downto 0);          
		imm32 : OUT std_logic_vector(31 downto 0)
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
	signal S_cwp:std_logic_vector (4 downto 0):= "00000";
	signal S_ncwp:std_logic_vector (4 downto 0):= "00000";
	signal S_Out_Rs1:std_logic_vector(5 downto 0) := "000000";
	signal S_Out_Rs2:std_logic_vector(5 downto 0) := "000000";
	signal S_Out_Rd:std_logic_vector(5 downto 0) := "000000";
	
	signal S_SEU22: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
	signal S_SEU30: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
	signal S_SCALL: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
	signal S_SBRANCH: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
	signal S_MUXnPC: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
	signal S_O7: std_logic_vector(5 downto 0) := "000000";
	signal S_Mux_Rd: std_logic_vector(5 downto 0) := "000000";
	signal S_RfS: std_logic_vector(1 downto 0) := "00";
	signal S_WME: std_logic := '0';
	signal S_RFDEST: std_logic := '0';
	signal S_WE: std_logic := '0';
	signal S_PcSc: std_logic_vector(1 downto 0) := "00";
	signal S_CRD: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
	
	signal S_Data_Out: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
	signal S_Data_RF: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";


	
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
		Address => S_MUXnPC,
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
		op3 => S_Instr(24 downto 19),
		op => S_Instr(31 downto 30),
		icc => S_NZVC,
		cond => S_Instr(28 downto 25),
		rfRd => S_RFDEST,
		rfSource => S_RfS,
		WriteMemoryEnable => S_WME,
		pcSc => S_PcSc,
		WriteEnable => S_WE,
		aluOp => S_code
	);
	
	Inst_Register_file: Register_file PORT MAP(
		rst => rst,
		WriteEnable => S_WE,
		nRS1 => S_Out_Rs1,
		nRS2 => S_Out_Rs2,
		nRd => S_Mux_Rd,
		DWR => S_Data_RF,
		CRD => S_CRD,
		CRS1 => S_CRS1,
		CRS2 => S_CRS2
	);
	
	Inst_UES: UES PORT MAP(
		simm13 => S_Instr(12 downto 0),
		simm32 => S_UES
	);
	
	Inst_PSR: PSR PORT MAP(
		nCWP => S_ncwp(0),
		NZVC => S_NZVC,
		rst => rst,
		clk => clk,
		cwp => S_cwp(0),
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
		rs1 => S_Instr(18 downto 14),
		rs2 => S_Instr(4 downto 0),
		rd => S_Instr(29 downto 25),
		op => S_Instr(31 downto 30),
		op3 => S_Instr(24 downto 19),
		cwp => S_cwp,
		nRs1 => S_Out_Rs1,
		nRs2 => S_Out_Rs2,
		nRd => S_Out_Rd,
		nCwp => S_ncwp,
		O7 => S_O7
	);

	
	Inst_sumador_call: sumador PORT MAP(
		A => S_SEU30,
		B => S_Pc,
		C => S_SCALL
	);
	
	Inst_sumador_branch: sumador PORT MAP(
		A => S_SEU22,
		B => S_Pc,
		C => S_SBRANCH
	);
	
	Inst_DatMemory: DatMemory PORT MAP(
		cRD => S_CRD,
		aluResult => S_Alu_Out,
		WriteMemoryEnable => S_WME,
		reset => rst,
		dataMem => S_Data_Out
	);
	
	Inst_MUXRf: MUXRf PORT MAP(
		dataMem => S_Data_Out,
		aluResult => S_Alu_Out,
		Pc => S_Pc,
		rfSource => S_RfS,
		dataRf => S_Data_RF
	);
	
	Inst_MUXnPC: MUXnPC PORT MAP(
		clk => clk,
		callPc => S_SCALL,
		branch => S_SBRANCH,
		nextPc => S_sum,
		jumpL => S_Alu_Out,
		pcSc => S_PcSc,
		newPc => S_MUXnPC
	);
	
	Inst_MuxW_R: MuxW_R PORT MAP(
		rd => S_Out_Rd,
		O7 => S_O7,
		rfDest => S_RFDEST,
		nRd => S_Mux_Rd
	);
	
	Inst_SEU22: SEU22 PORT MAP(
		imm22 => S_Instr(21 downto 0),
		imm32 => S_SEU22
	);
	
	Inst_SEU30: SEU30 PORT MAP(
		imm30 => S_Instr(29 downto 0),
		imm32 => S_SEU30
	);
	
	Alu_Out <= S_Alu_Out;
end Behavioral;

