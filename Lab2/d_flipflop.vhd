-- d_flipflop

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


entity d_flipflop is
port(
	d, clk, preset, clear : in std_logic;
	q, q_not: out std_logic);
end d_flipflop;


architecture structural of d_flipflop is

-- conmponents

-- wires
signal q_t, clk_not : std_logic;

begin
	clk_not <= not clk;
	master : ENTITY work.d_latch(structural)
		 port map (d, preset, clk_not, clear, q_t, open);
	slave : ENTITY work.d_latch(structural)
		 port map (q_t, preset, clk, clear, q, q_not);
end structural;