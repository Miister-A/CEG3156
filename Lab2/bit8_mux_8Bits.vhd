LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


entity bit8_mux_8Bits is
port(
	sel : in std_logic_vector(2 downto 0);
	inp0 : in std_logic_vector(7 downto 0);
	inp1 : in std_logic_vector(7 downto 0);
	inp2 : in std_logic_vector(7 downto 0);
	inp3 : in std_logic_vector(7 downto 0);
	inp4 : in std_logic_vector(7 downto 0);
	inp5 : in std_logic_vector(7 downto 0);
	inp6 : in std_logic_vector(7 downto 0);
	inp7 : in std_logic_vector(7 downto 0);
	outp : out std_logic_vector(7 downto 0));
end bit8_mux_8Bits;

architecture structural of bit8_mux_8Bits is

-- conmponents
--none

begin
	loop0: for i in 0 to 7 generate
		mux_i : entity work.mux_2powMBits(structural)
			generic map (3)
			port map(sel, 
				inp0(i)&inp1(i)&inp2(i)&inp3(i) & inp4(i)&inp5(i)&inp6(i)&inp7(i),
				outp(i));
	end generate;
end structural;