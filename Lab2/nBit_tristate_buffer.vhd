-- nBit_tristate_buffer

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


entity nBit_tristate_buffer is
generic ( n : positive := 4 );
port(
	en : in std_logic;
	inp : in std_logic_vector(n-1 downto 0);
	outp : out std_logic_vector(n-1 downto 0));
end nBit_tristate_buffer;

architecture structural of nBit_tristate_buffer is


begin	
	loop0: for i in 0 to n-1 generate
		tsb: entity work.tristate_buffer(structural)
			port map (
				en, inp(i), outp(i));
	end generate;
end structural;