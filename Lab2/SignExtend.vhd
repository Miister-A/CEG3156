library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SignExtend is
    Port ( input_16 : in STD_LOGIC_VECTOR(15 downto 0);
           output_32 : out STD_LOGIC_VECTOR(31 downto 0));
end SignExtend;

architecture Structural of SignExtend is
begin
    output_32(31 downto 16) <= (others => input_16(15)); -- replicate the sign bit
    output_32(15 downto 0) <= input_16; -- copy the original bits
end Structural;