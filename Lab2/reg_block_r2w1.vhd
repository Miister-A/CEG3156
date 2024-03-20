LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_misc.all;


entity register_file is
	generic(
		dsz : positive := 32;
		dasz : positive := 6);
	port(
		clk, global_reset, write_en : in std_logic;
		reg1_adr, reg2_adr, write_adr : in std_logic_vector(dasz-1 downto 0);
		write_data : in std_logic_vector(dsz-1 downto 0);
		reg1_data, reg2_data : out std_logic_vector(dsz-1 downto 0));
end register_file;

architecture structural of register_file is

-- components

-- wires
type data_array is array (natural range <>) of std_logic_vector(dsz-1 downto 0);

signal write_mask, write_mask_en, write_en_vector : std_logic_vector((2**dasz)-1 downto 0);
signal reg1_en_mask, reg2_en_mask : std_logic_vector((2**dasz)-1 downto 0);
signal all_registers : data_array((2**dasz)-1 downto 0);

begin
	-- write en decode from write address
	decode: entity work.nBit_decoder(structural)
		generic map(dasz)
		port map(write_adr, write_mask);
	
	write_en_vector <= (others => write_en);
	write_mask_en <= write_mask and write_en_vector;

	
	-- registers
	
	loop0: for i in 0 to (2**dasz)-1 generate
		reg: entity work.nBit_reg_en(structural)
			generic map(dsz)
			port map(write_data, clk, '1', global_reset, write_mask_en(i), all_registers(i), open);
					-- parallel_in, clk, preset, clear, 		en, 					q, 				q_not
	end generate;
	
	
	-- reg1_data mux from reg1_adr	
	
	dec1 : entity work.nBit_decoder(structural)
		generic map(dasz)
		port map(reg1_adr, reg1_en_mask);

	loop1: for i in 0 to (2**dasz)-1 generate
		tsb1: entity work.nBit_tristate_buffer(structural)
			generic map(dsz)
			port map (reg1_en_mask(i), all_registers(i), reg1_data);
	end generate;
	
	
	-- reg2_data mux from reg2_adr	
	
	dec2 : entity work.nBit_decoder(structural)
		generic map(dasz)
		port map(reg2_adr, reg2_en_mask);

	loop2: for i in 0 to (2**dasz)-1 generate
		tsb2: entity work.nBit_tristate_buffer(structural)
			generic map(dsz)
			port map (reg2_en_mask(i), all_registers(i), reg2_data);
	end generate;
end structural;


