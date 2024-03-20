-- nBit_reg


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


entity nBit_reg is
generic ( n : positive := 4 );
port(
	parallel_in : in std_logic_vector(n-1 downto 0);
	clk, preset, clear : in std_logic;
	q, q_not: out std_logic_vector(n-1 downto 0));
end nBit_reg;


architecture structural of nBit_reg is

-- conmponents

-- wires
	

begin	

	--bits 1->n-2
	loop0: for i in 0 to n-1 generate
		dff: ENTITY work.d_flipflop(structural)
			port map (
				parallel_in(i), clk, preset, clear,
				q(i), q_not(i));
	end generate;

	
end structural;