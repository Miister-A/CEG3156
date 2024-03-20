-- d_flipflop_en

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


entity d_flipflop_en is
port(
	d, clk, preset, clear, en : in std_logic;
	q, q_not: out std_logic);
end d_flipflop_en;


architecture structural of d_flipflop_en is

-- conmponents

component mux2 is
port(
	sel, inp0, inp1 : in std_logic;
	outp : out std_logic);
end component;

-- wires
signal d_en, q_t, clk_not : std_logic;

begin
	mux : mux2 port map(en, q_t, d, d_en);
							-- sel0, in0, in1, out0

	master : ENTITY work.d_latch(structural)
		 port map (d_en, preset, not clk, clear, q_t, open);
	slave : ENTITY work.d_latch(structural)
		 port map (q_t, preset, clk, clear, q, q_not);
end structural;