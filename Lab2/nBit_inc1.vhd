-- nBit_inc1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_misc.all;


entity nBit_inc1 is
generic ( n : positive := 4 );
port(
	a : in std_logic_vector(n-1 downto 0);
	a_inc1 : out std_logic_vector(n-1 downto 0));
end nBit_inc1;

architecture structural of nBit_inc1 is

-- conmponents

-- wires
begin
	a_inc1(0) <= not a(0);

	loop0: for i in 1 to n-1 generate
		a_inc1(i) <= a(i) xor and_reduce(a(i-1 downto 0));
	end generate;
	
end structural;