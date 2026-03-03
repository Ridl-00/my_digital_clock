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

-- DATE "12/17/2024 22:23:00"

-- 
-- Device: Altera EP4CE6E22C8 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	clock_top_57 IS
    PORT (
	clk_50m_57 : IN std_logic;
	rst_57 : IN std_logic;
	clock_en : IN std_logic;
	seg_57 : BUFFER std_logic_vector(6 DOWNTO 0);
	dig_57 : BUFFER std_logic_vector(7 DOWNTO 0)
	);
END clock_top_57;

-- Design Ports Information
-- clock_en	=>  Location: PIN_38,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_57[0]	=>  Location: PIN_110,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_57[1]	=>  Location: PIN_111,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_57[2]	=>  Location: PIN_112,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_57[3]	=>  Location: PIN_113,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_57[4]	=>  Location: PIN_114,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_57[5]	=>  Location: PIN_115,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg_57[6]	=>  Location: PIN_119,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig_57[0]	=>  Location: PIN_135,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig_57[1]	=>  Location: PIN_136,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig_57[2]	=>  Location: PIN_137,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig_57[3]	=>  Location: PIN_138,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig_57[4]	=>  Location: PIN_141,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig_57[5]	=>  Location: PIN_142,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig_57[6]	=>  Location: PIN_143,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig_57[7]	=>  Location: PIN_144,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst_57	=>  Location: PIN_39,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk_50m_57	=>  Location: PIN_23,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF clock_top_57 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk_50m_57 : std_logic;
SIGNAL ww_rst_57 : std_logic;
SIGNAL ww_clock_en : std_logic;
SIGNAL ww_seg_57 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_dig_57 : std_logic_vector(7 DOWNTO 0);
SIGNAL \clk_50m_57~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clock_en~input_o\ : std_logic;
SIGNAL \seg_57[0]~output_o\ : std_logic;
SIGNAL \seg_57[1]~output_o\ : std_logic;
SIGNAL \seg_57[2]~output_o\ : std_logic;
SIGNAL \seg_57[3]~output_o\ : std_logic;
SIGNAL \seg_57[4]~output_o\ : std_logic;
SIGNAL \seg_57[5]~output_o\ : std_logic;
SIGNAL \seg_57[6]~output_o\ : std_logic;
SIGNAL \dig_57[0]~output_o\ : std_logic;
SIGNAL \dig_57[1]~output_o\ : std_logic;
SIGNAL \dig_57[2]~output_o\ : std_logic;
SIGNAL \dig_57[3]~output_o\ : std_logic;
SIGNAL \dig_57[4]~output_o\ : std_logic;
SIGNAL \dig_57[5]~output_o\ : std_logic;
SIGNAL \dig_57[6]~output_o\ : std_logic;
SIGNAL \dig_57[7]~output_o\ : std_logic;
SIGNAL \clk_50m_57~input_o\ : std_logic;
SIGNAL \clk_50m_57~inputclkctrl_outclk\ : std_logic;
SIGNAL \rst_57~input_o\ : std_logic;
SIGNAL \dig_57~1_combout\ : std_logic;
SIGNAL \dig_57[1]~reg0_q\ : std_logic;
SIGNAL \dig_57~2_combout\ : std_logic;
SIGNAL \dig_57[2]~reg0_q\ : std_logic;
SIGNAL \dig_57~3_combout\ : std_logic;
SIGNAL \dig_57[3]~reg0_q\ : std_logic;
SIGNAL \dig_57~4_combout\ : std_logic;
SIGNAL \dig_57[4]~reg0_q\ : std_logic;
SIGNAL \dig_57~5_combout\ : std_logic;
SIGNAL \dig_57[5]~reg0_q\ : std_logic;
SIGNAL \dig_57~6_combout\ : std_logic;
SIGNAL \dig_57[6]~reg0_q\ : std_logic;
SIGNAL \dig_57~7_combout\ : std_logic;
SIGNAL \dig_57[7]~reg0_q\ : std_logic;
SIGNAL \dig_57~0_combout\ : std_logic;
SIGNAL \dig_57[0]~reg0_q\ : std_logic;

BEGIN

ww_clk_50m_57 <= clk_50m_57;
ww_rst_57 <= rst_57;
ww_clock_en <= clock_en;
seg_57 <= ww_seg_57;
dig_57 <= ww_dig_57;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk_50m_57~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk_50m_57~input_o\);

-- Location: IOOBUF_X30_Y24_N2
\seg_57[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \seg_57[0]~output_o\);

-- Location: IOOBUF_X30_Y24_N23
\seg_57[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \seg_57[1]~output_o\);

-- Location: IOOBUF_X28_Y24_N2
\seg_57[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \seg_57[2]~output_o\);

-- Location: IOOBUF_X28_Y24_N9
\seg_57[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \seg_57[3]~output_o\);

-- Location: IOOBUF_X28_Y24_N16
\seg_57[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \seg_57[4]~output_o\);

-- Location: IOOBUF_X28_Y24_N23
\seg_57[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \seg_57[5]~output_o\);

-- Location: IOOBUF_X23_Y24_N2
\seg_57[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \seg_57[6]~output_o\);

-- Location: IOOBUF_X11_Y24_N16
\dig_57[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dig_57[0]~reg0_q\,
	devoe => ww_devoe,
	o => \dig_57[0]~output_o\);

-- Location: IOOBUF_X9_Y24_N9
\dig_57[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dig_57[1]~reg0_q\,
	devoe => ww_devoe,
	o => \dig_57[1]~output_o\);

-- Location: IOOBUF_X7_Y24_N2
\dig_57[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dig_57[2]~reg0_q\,
	devoe => ww_devoe,
	o => \dig_57[2]~output_o\);

-- Location: IOOBUF_X7_Y24_N9
\dig_57[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dig_57[3]~reg0_q\,
	devoe => ww_devoe,
	o => \dig_57[3]~output_o\);

-- Location: IOOBUF_X5_Y24_N9
\dig_57[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dig_57[4]~reg0_q\,
	devoe => ww_devoe,
	o => \dig_57[4]~output_o\);

-- Location: IOOBUF_X3_Y24_N23
\dig_57[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dig_57[5]~reg0_q\,
	devoe => ww_devoe,
	o => \dig_57[5]~output_o\);

-- Location: IOOBUF_X1_Y24_N2
\dig_57[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dig_57[6]~reg0_q\,
	devoe => ww_devoe,
	o => \dig_57[6]~output_o\);

-- Location: IOOBUF_X1_Y24_N9
\dig_57[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dig_57[7]~reg0_q\,
	devoe => ww_devoe,
	o => \dig_57[7]~output_o\);

-- Location: IOIBUF_X0_Y11_N8
\clk_50m_57~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk_50m_57,
	o => \clk_50m_57~input_o\);

-- Location: CLKCTRL_G2
\clk_50m_57~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk_50m_57~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk_50m_57~inputclkctrl_outclk\);

-- Location: IOIBUF_X1_Y0_N15
\rst_57~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst_57,
	o => \rst_57~input_o\);

-- Location: LCCOMB_X7_Y23_N18
\dig_57~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \dig_57~1_combout\ = (\rst_57~input_o\) # (\dig_57[0]~reg0_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rst_57~input_o\,
	datad => \dig_57[0]~reg0_q\,
	combout => \dig_57~1_combout\);

-- Location: FF_X7_Y23_N19
\dig_57[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50m_57~inputclkctrl_outclk\,
	d => \dig_57~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dig_57[1]~reg0_q\);

-- Location: LCCOMB_X7_Y23_N12
\dig_57~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \dig_57~2_combout\ = (\rst_57~input_o\) # (\dig_57[1]~reg0_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rst_57~input_o\,
	datad => \dig_57[1]~reg0_q\,
	combout => \dig_57~2_combout\);

-- Location: FF_X7_Y23_N13
\dig_57[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50m_57~inputclkctrl_outclk\,
	d => \dig_57~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dig_57[2]~reg0_q\);

-- Location: LCCOMB_X7_Y23_N10
\dig_57~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \dig_57~3_combout\ = (\rst_57~input_o\) # (\dig_57[2]~reg0_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rst_57~input_o\,
	datad => \dig_57[2]~reg0_q\,
	combout => \dig_57~3_combout\);

-- Location: FF_X7_Y23_N11
\dig_57[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50m_57~inputclkctrl_outclk\,
	d => \dig_57~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dig_57[3]~reg0_q\);

-- Location: LCCOMB_X7_Y23_N20
\dig_57~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \dig_57~4_combout\ = (\rst_57~input_o\) # (\dig_57[3]~reg0_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rst_57~input_o\,
	datad => \dig_57[3]~reg0_q\,
	combout => \dig_57~4_combout\);

-- Location: FF_X7_Y23_N21
\dig_57[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50m_57~inputclkctrl_outclk\,
	d => \dig_57~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dig_57[4]~reg0_q\);

-- Location: LCCOMB_X7_Y23_N6
\dig_57~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \dig_57~5_combout\ = (\rst_57~input_o\) # (\dig_57[4]~reg0_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rst_57~input_o\,
	datad => \dig_57[4]~reg0_q\,
	combout => \dig_57~5_combout\);

-- Location: FF_X7_Y23_N7
\dig_57[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50m_57~inputclkctrl_outclk\,
	d => \dig_57~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dig_57[5]~reg0_q\);

-- Location: LCCOMB_X7_Y23_N28
\dig_57~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \dig_57~6_combout\ = (\rst_57~input_o\) # (\dig_57[5]~reg0_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rst_57~input_o\,
	datad => \dig_57[5]~reg0_q\,
	combout => \dig_57~6_combout\);

-- Location: FF_X7_Y23_N29
\dig_57[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50m_57~inputclkctrl_outclk\,
	d => \dig_57~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dig_57[6]~reg0_q\);

-- Location: LCCOMB_X7_Y23_N2
\dig_57~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \dig_57~7_combout\ = (\rst_57~input_o\) # (\dig_57[6]~reg0_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rst_57~input_o\,
	datad => \dig_57[6]~reg0_q\,
	combout => \dig_57~7_combout\);

-- Location: FF_X7_Y23_N3
\dig_57[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50m_57~inputclkctrl_outclk\,
	d => \dig_57~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dig_57[7]~reg0_q\);

-- Location: LCCOMB_X7_Y23_N24
\dig_57~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dig_57~0_combout\ = (!\rst_57~input_o\ & \dig_57[7]~reg0_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rst_57~input_o\,
	datad => \dig_57[7]~reg0_q\,
	combout => \dig_57~0_combout\);

-- Location: FF_X7_Y23_N25
\dig_57[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50m_57~inputclkctrl_outclk\,
	d => \dig_57~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dig_57[0]~reg0_q\);

-- Location: IOIBUF_X1_Y0_N22
\clock_en~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock_en,
	o => \clock_en~input_o\);

ww_seg_57(0) <= \seg_57[0]~output_o\;

ww_seg_57(1) <= \seg_57[1]~output_o\;

ww_seg_57(2) <= \seg_57[2]~output_o\;

ww_seg_57(3) <= \seg_57[3]~output_o\;

ww_seg_57(4) <= \seg_57[4]~output_o\;

ww_seg_57(5) <= \seg_57[5]~output_o\;

ww_seg_57(6) <= \seg_57[6]~output_o\;

ww_dig_57(0) <= \dig_57[0]~output_o\;

ww_dig_57(1) <= \dig_57[1]~output_o\;

ww_dig_57(2) <= \dig_57[2]~output_o\;

ww_dig_57(3) <= \dig_57[3]~output_o\;

ww_dig_57(4) <= \dig_57[4]~output_o\;

ww_dig_57(5) <= \dig_57[5]~output_o\;

ww_dig_57(6) <= \dig_57[6]~output_o\;

ww_dig_57(7) <= \dig_57[7]~output_o\;
END structure;


