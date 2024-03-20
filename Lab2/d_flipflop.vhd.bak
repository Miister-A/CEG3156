-- d_flipflop

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


entity d_flipflop is
port(
	d, clk, preset, clear : in std_logic;
	q, q_not: out std_logic);
end d_flipflop;


architecture rtl of d_flipflop is

-- conmponents

-- wires
signal int_q, clk_not : std_logic;

begin
	clk_not <= not clk;
	master : ENTITY work.d_latch(struct)
		 port map (preset, d, clk_not, clear, int_q, open);
	slave : ENTITY work.d_latch(struct)
		 port map (preset, int_q, clk, clear, q, q_not);
end rtl;