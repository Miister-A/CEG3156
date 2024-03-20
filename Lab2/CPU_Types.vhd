library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package CPU_Types is
		
	constant isz : positive := 32;	-- instruction size
	constant itsz : positive := 6;	-- instruction type size
	constant dsz : positive := 8;	-- data size
	constant dasz : positive := 5;	-- data address size
	
	type data_array is array (natural range <>) of std_logic_vector(dsz-1 downto 0);
	 
end package CPU_Types;
