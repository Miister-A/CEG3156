-- mux2

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


entity mux2 is
port(
	sel, inp0, inp1 : in std_logic;
	outp : out std_logic);
end mux2;

architecture rtl of mux2 is

-- conmponents
--none

-- wires
--none

begin
	tsb0 : entity work.tristate_buffer(structural)
		port map(not sel, inp0, outp);
	tsb1 : entity work.tristate_buffer(structural)
		port map(sel, inp1, outp);
end rtl;