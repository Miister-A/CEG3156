library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity JumpAddressExtend is
    Port (
        instruction_26: in STD_LOGIC_VECTOR(25 downto 0);
        pc_upper_4: in STD_LOGIC_VECTOR(31 downto 28);
        jump_address_32: out STD_LOGIC_VECTOR(31 downto 0)
    );
end JumpAddressExtend;

architecture Behavioral of JumpAddressExtend is
begin
    jump_address_32 <= pc_upper_4 & instruction_26 & "00"; -- Shift left by 2 is achieved by concatenating '00'
end Behavioral;