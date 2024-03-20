-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "03/06/2024 09:24:33"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	top_level IS
    PORT (
	q : OUT std_logic;
	d : IN std_logic;
	clk : IN std_logic;
	preset : IN std_logic;
	clear : IN std_logic;
	q_not : OUT std_logic
	);
END top_level;

-- Design Ports Information
-- q	=>  Location: PIN_T4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q_not	=>  Location: PIN_R3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_T3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clear	=>  Location: PIN_R4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- preset	=>  Location: PIN_R5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d	=>  Location: PIN_U4,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF top_level IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_q : std_logic;
SIGNAL ww_d : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_preset : std_logic;
SIGNAL ww_clear : std_logic;
SIGNAL ww_q_not : std_logic;
SIGNAL \q~output_o\ : std_logic;
SIGNAL \q_not~output_o\ : std_logic;
SIGNAL \preset~input_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clear~input_o\ : std_logic;
SIGNAL \d~input_o\ : std_logic;
SIGNAL \inst|master|q_t~0_combout\ : std_logic;
SIGNAL \inst|master|q_t~1_combout\ : std_logic;
SIGNAL \inst|slave|q_t_not~0_combout\ : std_logic;
SIGNAL \inst|slave|q_t~0_combout\ : std_logic;
SIGNAL \inst|slave|ALT_INV_q_t~0_combout\ : std_logic;
SIGNAL \inst|slave|ALT_INV_q_t_not~0_combout\ : std_logic;

BEGIN

q <= ww_q;
ww_d <= d;
ww_clk <= clk;
ww_preset <= preset;
ww_clear <= clear;
q_not <= ww_q_not;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\inst|slave|ALT_INV_q_t~0_combout\ <= NOT \inst|slave|q_t~0_combout\;
\inst|slave|ALT_INV_q_t_not~0_combout\ <= NOT \inst|slave|q_t_not~0_combout\;

-- Location: IOOBUF_X0_Y33_N23
\q~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|slave|ALT_INV_q_t~0_combout\,
	devoe => ww_devoe,
	o => \q~output_o\);

-- Location: IOOBUF_X0_Y34_N23
\q_not~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|slave|ALT_INV_q_t_not~0_combout\,
	devoe => ww_devoe,
	o => \q_not~output_o\);

-- Location: IOIBUF_X0_Y32_N22
\preset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_preset,
	o => \preset~input_o\);

-- Location: IOIBUF_X0_Y32_N15
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: IOIBUF_X0_Y33_N15
\clear~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clear,
	o => \clear~input_o\);

-- Location: IOIBUF_X0_Y34_N15
\d~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d,
	o => \d~input_o\);

-- Location: LCCOMB_X1_Y33_N12
\inst|master|q_t~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|master|q_t~0_combout\ = (\clear~input_o\ & (((!\d~input_o\)))) # (!\clear~input_o\ & ((\clk~input_o\) # ((\inst|master|q_t~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk~input_o\,
	datab => \clear~input_o\,
	datac => \d~input_o\,
	datad => \inst|master|q_t~1_combout\,
	combout => \inst|master|q_t~0_combout\);

-- Location: LCCOMB_X1_Y33_N6
\inst|master|q_t~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|master|q_t~1_combout\ = (\preset~input_o\ & \inst|master|q_t~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \preset~input_o\,
	datad => \inst|master|q_t~0_combout\,
	combout => \inst|master|q_t~1_combout\);

-- Location: LCCOMB_X1_Y33_N0
\inst|slave|q_t_not~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|slave|q_t_not~0_combout\ = (\clk~input_o\ & (!\inst|slave|q_t~0_combout\ & ((!\inst|master|q_t~1_combout\) # (!\clear~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk~input_o\,
	datab => \clear~input_o\,
	datac => \inst|slave|q_t~0_combout\,
	datad => \inst|master|q_t~1_combout\,
	combout => \inst|slave|q_t_not~0_combout\);

-- Location: LCCOMB_X1_Y33_N2
\inst|slave|q_t~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|slave|q_t~0_combout\ = (\preset~input_o\ & (!\inst|slave|q_t_not~0_combout\ & ((\inst|master|q_t~1_combout\) # (!\clear~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|master|q_t~1_combout\,
	datab => \clear~input_o\,
	datac => \preset~input_o\,
	datad => \inst|slave|q_t_not~0_combout\,
	combout => \inst|slave|q_t~0_combout\);

ww_q <= \q~output_o\;

ww_q_not <= \q_not~output_o\;
END structure;


