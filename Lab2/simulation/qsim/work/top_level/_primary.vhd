library verilog;
use verilog.vl_types.all;
entity top_level is
    port(
        DMEM_data       : out    vl_logic_vector(31 downto 0);
        inclock         : in     vl_logic;
        WriteEnable     : in     vl_logic;
        DMEM_address    : in     vl_logic_vector(7 downto 0);
        data            : in     vl_logic_vector(31 downto 0);
        IMEM_data       : out    vl_logic_vector(31 downto 0);
        IMEM_address    : in     vl_logic_vector(7 downto 0)
    );
end top_level;
