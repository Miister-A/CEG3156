-- nBitMux2

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;



entity nBit_decoder is
	generic ( n : positive := 4 );
	port(
		inp : in std_logic_vector(n-1 downto 0);
		outp : out std_logic_vector((2**n)-1 downto 0));
end nBit_decoder;

architecture structural of nBit_decoder is

begin
	loop0: for i in 0 to (2**n)-1 generate
		outp(i) <= '1' when (to_integer(unsigned(inp)) = i) else '0';
	end generate;
end structural;