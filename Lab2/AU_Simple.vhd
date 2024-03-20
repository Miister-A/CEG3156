LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


entity AU_Simple is
	generic(
		dsz : positive := 32);
	port(
		A, B : in std_logic_vector(dsz-1 downto 0);
		op_sel : in std_logic_vector(1 downto 0);
		result : out std_logic_vector(dsz-1 downto 0);
		c_out, overflow : out std_logic);
end AU_Simple;

architecture structural of AU_Simple is

-- wires
signal A_in, A_mask, B_sub : std_logic_vector(dsz-1 downto 0);
signal is_sub, c_in_sub, c_in : std_logic;

begin
	-- 00: a+b, 01: a-b, 10: -b, 11: b++
	
	is_sub <= op_sel(0) xor op_sel(1);
	
	sub_block: entity work.nBit_adder_subtraction_block(structural)
		generic map(dsz)		-- assert is handled by cla4
		port map(B, is_sub, B_sub, c_in_sub);
				-- b_in, is_subtract, b_out, c_out
				
	c_in <= is_sub or (op_sel(1) and op_sel(0));
	A_mask <= (others => not op_sel(1));
	A_in <= A and A_mask;
	
	decode: entity work.nBit_cla4_adder(structural)
		generic map(dsz)		-- assert is handled by cla4
		port map(A_in, B_sub, c_in, result, c_out, overflow);
				-- a, b, c_in, sum, c_out, overflow
	
end structural;


