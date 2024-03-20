-- cla4_adder is short for: Carry look ahead 4-Bit adder

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity cla4_adder is
	port(
		a, b : in std_logic_vector(3 downto 0);
		c_in : in std_logic;
		sum : out std_logic_vector(3 downto 0);
		c_ovfl, c_out : out std_logic);				-- c_ovfl is used to calculate overflow in nBit adders that use cla4_adder
end cla4_adder;

architecture structural of cla4_adder is

-- components
component half_adder is
	port(
		a, b : in std_logic;
		sum, c_out : out std_logic);
end component;

-- wires
signal p, g, c : std_logic_vector(3 downto 0);


begin	
	loop0: for i in 0 to 3 generate
		half_adder_inst : half_adder
			port map (a(i), b(i), p(i), g(i));
		
		-- sequentially, you can think of this as being after the carry is calculated
		sum(i) <= c(i) xor p(i);
	end generate;
	
	c(0)  <= c_in;
	c(1)  <= g(0) or (p(0) and c(0));
	c(2)  <= g(1) or (g(0) and p(1)) or (c(0) and p(0) and p(1));
	c(3)  <= g(2) or (g(1) and p(2)) or (g(0) and p(1) and p(2)) or (c(0) and p(0) and p(1) and p(2));
	c_out <= g(3) or (g(2) and p(3)) or (g(1) and p(2) and p(3)) or (g(0) and p(1) and p(2) and p(3)) or (c(0) and p(0) and p(1) and p(2) and p(3));
	
	c_ovfl <= c(3);
end structural;