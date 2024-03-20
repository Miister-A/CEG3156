--- MIPS Single Cycle Processor

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
use work.MIPS_RISK_SingleCycle_VARS.all;

entity MEM_Branch is
	port(
		PC_inc : in std_logic_vector(isz-1 downto 0);
		PC_jump, PC_branch_offset : in std_logic_vector(isz-1 downto 0);
		jump, branch: in std_logic;
		ALU_zero : in std_logic;
		PC_next : out std_logic_vector(isz-1 downto 0)
		);
end MEM_Branch;


architecture structural of MEM_Branch is


-- wires
signal PC_branch, PC_b_next : std_logic_vector(isz-1 downto 0);

begin

	-- patterned after:
	-- uOttawa CEG 3156 - slideset BML4 - slide 19 
	-- https://uottawa.brightspace.com/d2l/le/content/417607/viewContent/5836345/View
	
	
	
	PC_branch_adder : entity work.nBit_cla4_adder(structural)
		generic map(isz)
		port map(PC_inc, PC_branch_offset, '0', PC_branch, open, open);
			-- a, b, c_in, sum, c_out, overflow

	PC_branch_mux : entity work.nBit_mux2(structural)
		generic map(isz)
		port map(branch and ALU_zero, PC_inc, PC_branch, PC_b_next);
		
	PC_jump_mux : entity work.nBit_mux2(structural)
		generic map(isz)
		port map(jump, PC_b_next, PC_jump, PC_next);
	
end structural;