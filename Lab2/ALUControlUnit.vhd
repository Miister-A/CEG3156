library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALUControlUnit is
    Port (Opcode : in STD_LOGIC_VECTOR(1 downto 0);
          FunctionField : in STD_LOGIC_VECTOR(3 downto 0);
          ALUControl : out STD_LOGIC_VECTOR(2 downto 0));
end ALUControlUnit;

architecture Structural of ALUControlUnit is
begin
    ALUControl(0) <= Opcode(0) OR (Opcode(1) AND FunctionField(0)) OR (Opcode(1) AND NOT FunctionField(3) AND FunctionField(1));
    ALUControl(1) <= (Opcode(1) AND FunctionField(2)) OR (Opcode(1) AND FunctionField(3) AND FunctionField(1));
    ALUControl(2) <= Opcode(1) AND FunctionField(3);
end Structural;