--- MIPS Single Cycle Processor

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
use work.MIPS_RISK_SingleCycle_VARS.all;

entity EX_ALU is
	port(
		PC_branch_offset : in std_logic_vector(isz-1 downto 0);
		
		REG_data1, REG_data2 : in std_logic_vector(dsz-1 downto 0);
		ALU_src: in std_logic;
		ALU_op : in std_logic_vector(5 downto 0);
		ALU_shamt : in std_logic_vector(10 downto 6);
		ALU_funct : in std_logic_vector(5 downto 0);
		
		ALU_result : out std_logic_vector(dsz-1 downto 0);
		ALU_zero, ALU_c_out, ALU_overflow : out std_logic
		);
end EX_ALU;


architecture structural of EX_ALU is


-- wires
signal ALU_A, ALU_B : std_logic_vector(dsz-1 downto 0);
signal ALU_ctrl : std_logic_vector(2 downto 0);

begin

	-- patterned after:
	-- uOttawa CEG 3156 - slideset BML4 - slide 19 
	-- https://uottawa.brightspace.com/d2l/le/content/417607/viewContent/5836345/View
	
	
	-- ALU_Ctrl here
	--		in: ALU_op, ALU_funct
	--		out: ALU_ctrl
	
	
	ALU_A <= REG_data1;
	ALU_mux : entity work.nBit_mux2(structural)
		generic map(dsz)
		port map(ALU_src, PC_branch_offset, REG_data2, ALU_B);
	
	ALU : entity work.ALU_Simple(structural)
		generic map(dsz)
		port map(ALU_A, ALU_B, ALU_ctrl, ALU_result, ALU_zero, ALU_c_out, ALU_overflow);
				-- A, B, op_sel, result, zero, c_out, overflow
	
end structural;