LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


entity LU_Simple is
	generic(
		dsz : positive := 32;
		op_sel_sz : positive := 2);
	port(
		A, B : in std_logic_vector(dsz-1 downto 0);
		op_sel : in std_logic_vector(op_sel_sz-1 downto 0);
		result : out std_logic_vector(dsz-1 downto 0));
end LU_Simple;

architecture structural of LU_Simple is

-- wires
type data_array is array (natural range <>) of std_logic_vector(dsz-1 downto 0);
signal res_and, res_or : std_logic_vector(dsz-1 downto 0);
signal op_sel_mask : std_logic_vector((2**op_sel_sz)-1 downto 0);
signal res_array : data_array((2**op_sel_sz)-1 downto 0);

begin
	res_array(0) <= A and B;
	res_array(1) <= A or B;
	res_array(2) <= A nand B;
	res_array(3) <= A xor B;
	
	dec2 : entity work.nBit_decoder(structural)
		generic map(op_sel_sz)
		port map(op_sel, op_sel_mask);

	loop2: for i in 0 to (2**op_sel_sz)-1 generate
		tsb2: entity work.nBit_tristate_buffer(structural)
			generic map(dsz)
			port map (op_sel_mask(i), res_array(i), result);
	end generate;
	
end structural;


