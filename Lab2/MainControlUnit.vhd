library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MainControlUnit is
    Port (Instruction : in STD_LOGIC_VECTOR(31 downto 26);
          RegDst : out STD_LOGIC;
			 ALUSrc : out STD_LOGIC;
          MemToReg : out STD_LOGIC;
          RegWrite : out STD_LOGIC;
          MemRead : out STD_LOGIC;
          MemWrite : out STD_LOGIC;
          Branch : out STD_LOGIC;
          Jump : out STD_LOGIC;
          ALUOp : out STD_LOGIC_VECTOR(1 downto 0));
end MainControlUnit;

architecture Structural of MainControlUnit is
begin
    RegDst <= NOT Instruction(31);
    ALUSrc <= Instruction(27);
    MemToReg <= Instruction(26);
    RegWrite <= (NOT Instruction(28) AND NOT Instruction(27)) OR (Instruction(31) AND NOT Instruction(29));  --THIS
    MemRead <= Instruction(31) AND NOT Instruction(29);
    MemWrite <= Instruction(29);
    Branch <= Instruction(28);
    Jump <= NOT Instruction(31) AND NOT Instruction(28);
    ALUOp(1) <= NOT Instruction(31) AND NOT Instruction(28);
    ALUOp(0) <= Instruction(28);
end Structural;