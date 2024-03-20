--- MIPS Single Cycle Processor

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
use work.MIPS_RISK_SingleCycle_VARS.all;

entity IF_PC_inc is
	port(
		clk, global_reset : in std_logic;
		PC : in std_logic_vector(dsz-1 downto 0);
		PC_inc : out std_logic_vector(dsz-1 downto 0));
end IF_PC_inc;


architecture structural of IF_PC_inc is

begin

	-- patterned after:
	-- uOttawa CEG 3156 - slideset BML4 - slide 19 
	-- https://uottawa.brightspace.com/d2l/le/content/417607/viewContent/5836345/View
	
	PC_inc(isz_static-1 downto 0) <= PC(isz_static-1 downto 0);
	PC_inc_adder : entity work.nBit_inc1(structural)
		generic map(isz-isz_static)
		port map(PC(isz-1 downto isz_static), PC_inc(isz-1 downto isz_static));
end structural;