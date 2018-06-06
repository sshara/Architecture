----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:11:41 04/27/2018 
-- Design Name: 
-- Module Name:    Windows_manager - Behavioral 
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
use IEEE.numeric_std.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Windows_manager is
	Port ( 
		rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
		rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
		rd : in  STD_LOGIC_VECTOR (4 downto 0);
		op : in  STD_LOGIC_VECTOR (1 downto 0);
		op3 : in  STD_LOGIC_VECTOR (5 downto 0);
		cwp : in  STD_LOGIC_VECTOR (4 downto 0);
		nRs1 : out  STD_LOGIC_VECTOR (5 downto 0);
		nRs2 : out  STD_LOGIC_VECTOR (5 downto 0);
		nRd : out  STD_LOGIC_VECTOR (5 downto 0);
		nCwp : out  STD_LOGIC_VECTOR (4 downto 0);
		O7 : out  STD_LOGIC_VECTOR (5 downto 0)
	);
end Windows_manager;

architecture Behavioral of Windows_manager is

signal nRs1_Aux : STD_LOGIC_VECTOR (5 downto 0) := "000000";
signal nRs2_Aux : STD_LOGIC_VECTOR (5 downto 0) := "000000";
signal nRd_Aux : STD_LOGIC_VECTOR (5 downto 0) := "000000";
signal nCwp_Aux : STD_LOGIC_VECTOR (4 downto 0) := "00000";
signal O7_Aux : STD_LOGIC_VECTOR (5 downto 0) := "000000";

begin
	process(rs1, rs2, rd, op, op3, cwp) begin
		
		
		if(rs1>=24 and rs1<=31) then--valores de entrada
			nRs1_Aux<=conv_std_logic_vector(conv_integer(rs1)-(conv_integer(cwp)*16),6);--multiplica por 16
		end if;
		
		if(rs1>=16 and rs1<=23) then--valores locales
			nRs1_Aux<=conv_std_logic_vector(conv_integer(rs1)+(conv_integer(cwp)*16),6);
		end if;
		
		if(rs1>=8 and rs1<=15) then--valores de salida
			nRs1_Aux<=conv_std_logic_vector(conv_integer(rs1)+(conv_integer(cwp)*16),6);
		end if;
		
		if(rs1>=0 and rs1<=7) then--valores globales
			nRs1_Aux<=conv_std_logic_vector(conv_integer(rs1),6);
		end if;
		
		if(rs2>=24 and rs2<=31) then--valores de entrada
			nRs2_Aux<=conv_std_logic_vector(conv_integer(rs2)-(conv_integer(cwp)*16),6);--multiplica por 16
		end if;
		
		if(rs2>=16 and rs2<=23) then--valores locales
			nRs2_Aux<=conv_std_logic_vector(conv_integer(rs2)+(conv_integer(cwp)*16),6);
		end if;
		
		if(rs2>=8 and rs2<=15) then--valores de salida
			nRs2_Aux<=conv_std_logic_vector(conv_integer(rs2)+(conv_integer(cwp)*16),6);
		end if;
		
		if(rs2>=0 and rs2<=7) then--valores globales
			nRs2_Aux<=conv_std_logic_vector(conv_integer(rs2),6);
		end if;
		
		if(rd>=24 and rd<=31) then--valores de entrada
			nRd_Aux<=conv_std_logic_vector(conv_integer(rd)-(conv_integer(cwp)*16),6);--multiplica por 16
		end if;
		
		if(rd>=16 and rd<=23) then--valores locales
			nRd_Aux<=conv_std_logic_vector(conv_integer(rd)+(conv_integer(cwp)*16),6);
		end if;
		
		if(rd>=8 and rd<=15) then--valores de salida
			nRd_Aux<=conv_std_logic_vector(conv_integer(rd)+(conv_integer(cwp)*16),6);
		end if;
		 
		if(rd>=0 and rd<=7) then--valores globales
			nRd_Aux<=conv_std_logic_vector(conv_integer(rd),6);
		end if;
		
		O7_Aux<=conv_std_logic_vector(15+(conv_integer(cwp)*16),6);
		
		if(op="10") then
			if(op3="111100") then--SAVE
				if(cwp="00001") then
					nCwp_Aux<= cwp-1;
					if(rd>=24 and rd<=31) then--valores de entrada
						nRd_Aux<=conv_std_logic_vector(conv_integer(rd)-(conv_integer(cwp-1)*16),6);--multiplica por 16
					end if;
					
					if(rd>=16 and rd<=23) then--valores locales
						nRd_Aux<=conv_std_logic_vector(conv_integer(rd)+(conv_integer(cwp-1)*16),6);
					end if;
					
					if(rd>=8 and rd<=15) then--valores de salida
						nRd_Aux<=conv_std_logic_vector(conv_integer(rd)+(conv_integer(cwp-1)*16),6);
					end if;
					O7_Aux<=conv_std_logic_vector(15+(conv_integer(cwp-1)*16),6);
				end if;
			elsif(op3="111101") then--RESTORE
				if(cwp="00000") then
					nCwp_Aux<= cwp+1;
					if(rd>=24 and rd<=31) then--valores de entrada
						nRd_Aux<=conv_std_logic_vector(conv_integer(rd)-(conv_integer(cwp+1)*16),6);--multiplica por 16
					end if;
					
					if(rd>=16 and rd<=23) then--valores locales
						nRd_Aux<=conv_std_logic_vector(conv_integer(rd)+(conv_integer(cwp+1)*16),6);
					end if;
					
					if(rd>=8 and rd<=15) then--valores de salida
						nRd_Aux<=conv_std_logic_vector(conv_integer(rd)+(conv_integer(cwp+1)*16),6);
					end if;
					O7_Aux<=conv_std_logic_vector(15+(conv_integer(cwp+1)*16),6);
				end if;
			end if;
		end if;
		
	end process;
	
	nRs1 <= nRs1_Aux;
	nRs2 <= nRs2_Aux;
	nRd <= nRd_Aux;
	nCwp <= nCwp_Aux;
	O7 <= O7_Aux;
	
end Behavioral;

