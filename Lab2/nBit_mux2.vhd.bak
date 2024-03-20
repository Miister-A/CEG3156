-- nBitMux2

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


entity nBit_mux2 is
	generic ( n : positive := 4 );
	port(
		sel : in std_logic;
		inp0, inp1 : in std_logic_vector(n-1 downto 0);
		outp : out std_logic_vector(n-1 downto 0));
end nBit_mux2;

architecture rtl of nBit_mux2 is

-- conmponents
--none

-- wires
signal sel_mask : std_logic_vector(n-1 downto 0);

begin
	tsb0 : entity work.nBit_tristate_buffer(structural)
		generic map(n)
		port map(not sel, inp0, outp);
	tsb1 : entity work.nBit_tristate_buffer(structural)
		generic map(n)
		port map(sel, inp1, outp);
end rtl;