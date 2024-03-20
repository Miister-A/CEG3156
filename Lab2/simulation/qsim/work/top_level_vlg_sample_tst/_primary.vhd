library verilog;
use verilog.vl_types.all;
entity top_level_vlg_sample_tst is
    port(
        data            : in     vl_logic_vector(31 downto 0);
        DMEM_address    : in     vl_logic_vector(7 downto 0);
        IMEM_address    : in     vl_logic_vector(7 downto 0);
        inclock         : in     vl_logic;
        WriteEnable     : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end top_level_vlg_sample_tst;
