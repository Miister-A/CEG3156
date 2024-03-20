library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ShiftLeft2 is
    Port ( input_32 : in STD_LOGIC_VECTOR(31 downto 0);
           output_32 : out STD_LOGIC_VECTOR(31 downto 0));
end ShiftLeft2;

architecture Structural of ShiftLeft2 is
begin
    output_32 <= input_32(29 downto 0) & "00"; -- shift left by 2 bits
end Structural;