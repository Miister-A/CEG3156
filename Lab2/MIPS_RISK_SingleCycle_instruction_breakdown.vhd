LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.MIPS_RISK_SingleCycle_VARS.all;


entity MIPS_RISK_SingleCycle_instruction_breakdown is
port(
	instruction : in std_logic_vector(isz-1 downto 0);
	instruction_type : out std_logic_vector(5 downto 0);
	rs, rt, rd : out std_logic_vector(dasz-1 downto 0);
	shamt : out std_logic_vector(10 downto 6);
	funct : out std_logic_vector(5 downto 0);
	address_b : out std_logic_vector(absz-1 downto 0);
	address_j : out std_logic_vector(ajsz-1 downto 0));
end MIPS_RISK_SingleCycle_instruction_breakdown;

architecture structural of MIPS_RISK_SingleCycle_instruction_breakdown is


begin
	-- R-type:	[ itsz | dasz | dasz | dasz | 5 | 6 ]
	--				[ inst | REG1_adr | REG2_adr | REG_write_adr | ALU_shamt | ALU_op ]
	-- I-type:	[ itsz | dasz | dasz | address ]
	--				[ inst | REG1_adr | REG2_adr | address ]
	
	instruction_type <= instruction(31 downto 26);
	rs <= instruction(25 downto 21);
	rt <= instruction(20 downto 16);
	rd <= instruction(15 downto 11);
	shamt <= instruction(10 downto 6);
	funct <= instruction(5 downto 0);
	address_b <= instruction(absz-1 downto 0);
	address_j <= instruction(ajsz-1 downto 0);
end structural;