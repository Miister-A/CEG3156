-- nBit_shift_reg

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


entity nBit_reg is
generic ( n : positive := 4 );
port(
	parallel_in, preset, clear : in std_logic_vector(n-1 downto 0);		--preset, clear could be masks with preset = !clear
	clk, en : in std_logic;
	q, q_not: out std_logic_vector(n-1 downto 0));
end nBit_reg;

architecture rtl of nBit_reg is


-- conmponents
component d_flipflop_en is
port(
	d,	clk, en, preset, clear : in std_logic;
	q, q_not: out std_logic);
end component;

-- wires
	

begin	

	--bits 1->n-2
	loop0: for i in 0 to n-1 generate
		dff: d_flipflop_en port map (
			parallel_in(i), clk, en, preset(i), clear(i), 
			q(i), q_not(i));
	end generate;

	
end rtl;