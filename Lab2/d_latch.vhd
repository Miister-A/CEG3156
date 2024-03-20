LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY d_latch IS
  port( d, preset_not, clear_not, en: IN STD_LOGIC;
    q, q_not : OUT STD_LOGIC);
END d_latch;

ARCHITECTURE structural OF d_latch IS
  SIGNAL nand_d_t, not_nand_d_t, and_D_t, not_and_D_t, q_t, q_t_not : STD_LOGIC;
BEGIN
  nand_d_t <= en nand d;
  not_nand_d_t <= en nand (not d);
  and_d_t <= nand_d_t and q_t_not;
  not_and_d_t <= not_nand_d_t and q_t;
  q_t <= and_d_t nand preset_not;
  q_t_not <= not_and_d_t nand clear_not;
  q <= q_t;
  q_not <= not q_t;		--q_t_not;		--NOT SURE WHY q_t_not DOESN'T SIMULATE CORRECTLY
END structural;