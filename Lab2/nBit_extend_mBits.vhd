-- nBit_extend

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity nBit_extend_mBits is
	generic ( 
		n : positive := 8;
		m : positive := 8 );
	port(
		inp : in std_logic_vector(n-1 downto 0);
		fill : in std_logic;
		outp : out std_logic_vector(n+m-1 downto 0));
end nBit_extend_mBits;


architecture structural of nBit_extend_mBits is

-- conmponents
--none

-- wires
--none

begin
	outp(n+m-1 downto m) <= inp;
	outp(m-1 downto 0) <= (others => fill);
end structural;
