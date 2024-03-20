-- tristate_buffer

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


entity tristate_buffer is
port(
	en, inp : in std_logic;
	outp : out std_logic);
end tristate_buffer;

architecture structural of tristate_buffer is


begin
	outp <= inp when en = '1' else 'Z';
end structural;