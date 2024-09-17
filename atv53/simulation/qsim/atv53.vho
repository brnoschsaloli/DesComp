-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"

-- DATE "09/15/2024 23:46:53"

-- 
-- Device: Altera 5CEBA4F23C7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	atv53 IS
    PORT (
	CLOCK_50 : IN std_logic;
	KEY : IN std_logic_vector(3 DOWNTO 0);
	PC_OUT : OUT std_logic_vector(8 DOWNTO 0);
	Palavra_Controle : OUT std_logic_vector(11 DOWNTO 0);
	flag : OUT std_logic
	);
END atv53;

ARCHITECTURE structure OF atv53 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_KEY : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_PC_OUT : std_logic_vector(8 DOWNTO 0);
SIGNAL ww_Palavra_Controle : std_logic_vector(11 DOWNTO 0);
SIGNAL ww_flag : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \KEY[1]~input_o\ : std_logic;
SIGNAL \KEY[2]~input_o\ : std_logic;
SIGNAL \KEY[3]~input_o\ : std_logic;
SIGNAL \PC_OUT[0]~output_o\ : std_logic;
SIGNAL \PC_OUT[1]~output_o\ : std_logic;
SIGNAL \PC_OUT[2]~output_o\ : std_logic;
SIGNAL \PC_OUT[3]~output_o\ : std_logic;
SIGNAL \PC_OUT[4]~output_o\ : std_logic;
SIGNAL \PC_OUT[5]~output_o\ : std_logic;
SIGNAL \PC_OUT[6]~output_o\ : std_logic;
SIGNAL \PC_OUT[7]~output_o\ : std_logic;
SIGNAL \PC_OUT[8]~output_o\ : std_logic;
SIGNAL \Palavra_Controle[0]~output_o\ : std_logic;
SIGNAL \Palavra_Controle[1]~output_o\ : std_logic;
SIGNAL \Palavra_Controle[2]~output_o\ : std_logic;
SIGNAL \Palavra_Controle[3]~output_o\ : std_logic;
SIGNAL \Palavra_Controle[4]~output_o\ : std_logic;
SIGNAL \Palavra_Controle[5]~output_o\ : std_logic;
SIGNAL \Palavra_Controle[6]~output_o\ : std_logic;
SIGNAL \Palavra_Controle[7]~output_o\ : std_logic;
SIGNAL \Palavra_Controle[8]~output_o\ : std_logic;
SIGNAL \Palavra_Controle[9]~output_o\ : std_logic;
SIGNAL \Palavra_Controle[10]~output_o\ : std_logic;
SIGNAL \Palavra_Controle[11]~output_o\ : std_logic;
SIGNAL \flag~output_o\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \incrementaPC|Add0~2\ : std_logic;
SIGNAL \incrementaPC|Add0~6\ : std_logic;
SIGNAL \incrementaPC|Add0~10\ : std_logic;
SIGNAL \incrementaPC|Add0~13_sumout\ : std_logic;
SIGNAL \ROM1|memROM~7_combout\ : std_logic;
SIGNAL \ROM1|memROM~3_combout\ : std_logic;
SIGNAL \DEC_Instrucao|saida~8_combout\ : std_logic;
SIGNAL \MUXProxPC|saida_MUX[3]~3_combout\ : std_logic;
SIGNAL \ROM1|memROM~2_combout\ : std_logic;
SIGNAL \MUXProxPC|Equal1~0_combout\ : std_logic;
SIGNAL \incrementaPC|Add0~9_sumout\ : std_logic;
SIGNAL \ROM1|memROM~6_combout\ : std_logic;
SIGNAL \MUXProxPC|saida_MUX[2]~2_combout\ : std_logic;
SIGNAL \ROM1|memROM~1_combout\ : std_logic;
SIGNAL \MUXProxPC|Equal2~0_combout\ : std_logic;
SIGNAL \incrementaPC|Add0~5_sumout\ : std_logic;
SIGNAL \ROM1|memROM~5_combout\ : std_logic;
SIGNAL \MUXProxPC|saida_MUX[1]~1_combout\ : std_logic;
SIGNAL \ROM1|memROM~0_combout\ : std_logic;
SIGNAL \DEC_Instrucao|Equal10~0_combout\ : std_logic;
SIGNAL \DEC_Instrucao|saida~9_combout\ : std_logic;
SIGNAL \incrementaPC|Add0~14\ : std_logic;
SIGNAL \incrementaPC|Add0~17_sumout\ : std_logic;
SIGNAL \MUXProxPC|saida_MUX[4]~4_combout\ : std_logic;
SIGNAL \incrementaPC|Add0~18\ : std_logic;
SIGNAL \incrementaPC|Add0~21_sumout\ : std_logic;
SIGNAL \MUXProxPC|saida_MUX[5]~5_combout\ : std_logic;
SIGNAL \incrementaPC|Add0~22\ : std_logic;
SIGNAL \incrementaPC|Add0~25_sumout\ : std_logic;
SIGNAL \MUXProxPC|saida_MUX[6]~6_combout\ : std_logic;
SIGNAL \incrementaPC|Add0~26\ : std_logic;
SIGNAL \incrementaPC|Add0~29_sumout\ : std_logic;
SIGNAL \MUXProxPC|saida_MUX[7]~7_combout\ : std_logic;
SIGNAL \incrementaPC|Add0~30\ : std_logic;
SIGNAL \incrementaPC|Add0~33_sumout\ : std_logic;
SIGNAL \ROM1|memROM~8_combout\ : std_logic;
SIGNAL \MUXProxPC|saida_MUX[8]~8_combout\ : std_logic;
SIGNAL \DEC_Instrucao|saida[4]~0_combout\ : std_logic;
SIGNAL \incrementaPC|Add0~1_sumout\ : std_logic;
SIGNAL \ROM1|memROM~4_combout\ : std_logic;
SIGNAL \MUXProxPC|saida_MUX[0]~0_combout\ : std_logic;
SIGNAL \DEC_Instrucao|saida[0]~1_combout\ : std_logic;
SIGNAL \DEC_Instrucao|saida[2]~3_combout\ : std_logic;
SIGNAL \DEC_Instrucao|saida[4]~4_combout\ : std_logic;
SIGNAL \DEC_Instrucao|saida[5]~5_combout\ : std_logic;
SIGNAL \DEC_Instrucao|saida[1]~2_combout\ : std_logic;
SIGNAL \DEC_Instrucao|saida[6]~6_combout\ : std_logic;
SIGNAL \DEC_Instrucao|saida~7_combout\ : std_logic;
SIGNAL \DEC_Instrucao|Equal4~0_combout\ : std_logic;
SIGNAL \REG_RETORNO|DOUT\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \PC|DOUT\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \REG_RETORNO|ALT_INV_DOUT\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \ROM1|ALT_INV_memROM~8_combout\ : std_logic;
SIGNAL \DEC_Instrucao|ALT_INV_Equal10~0_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~7_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~6_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~5_combout\ : std_logic;
SIGNAL \MUXProxPC|ALT_INV_Equal1~0_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~4_combout\ : std_logic;
SIGNAL \MUXProxPC|ALT_INV_Equal2~0_combout\ : std_logic;
SIGNAL \DEC_Instrucao|ALT_INV_saida~9_combout\ : std_logic;
SIGNAL \DEC_Instrucao|ALT_INV_saida[2]~3_combout\ : std_logic;
SIGNAL \DEC_Instrucao|ALT_INV_saida[1]~2_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~3_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~2_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~1_combout\ : std_logic;
SIGNAL \DEC_Instrucao|ALT_INV_saida[4]~0_combout\ : std_logic;
SIGNAL \ROM1|ALT_INV_memROM~0_combout\ : std_logic;
SIGNAL \PC|ALT_INV_DOUT\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \incrementaPC|ALT_INV_Add0~33_sumout\ : std_logic;
SIGNAL \incrementaPC|ALT_INV_Add0~29_sumout\ : std_logic;
SIGNAL \incrementaPC|ALT_INV_Add0~25_sumout\ : std_logic;
SIGNAL \incrementaPC|ALT_INV_Add0~21_sumout\ : std_logic;
SIGNAL \incrementaPC|ALT_INV_Add0~17_sumout\ : std_logic;
SIGNAL \incrementaPC|ALT_INV_Add0~13_sumout\ : std_logic;
SIGNAL \incrementaPC|ALT_INV_Add0~9_sumout\ : std_logic;
SIGNAL \incrementaPC|ALT_INV_Add0~5_sumout\ : std_logic;
SIGNAL \incrementaPC|ALT_INV_Add0~1_sumout\ : std_logic;

BEGIN

ww_CLOCK_50 <= CLOCK_50;
ww_KEY <= KEY;
PC_OUT <= ww_PC_OUT;
Palavra_Controle <= ww_Palavra_Controle;
flag <= ww_flag;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\REG_RETORNO|ALT_INV_DOUT\(8) <= NOT \REG_RETORNO|DOUT\(8);
\ROM1|ALT_INV_memROM~8_combout\ <= NOT \ROM1|memROM~8_combout\;
\REG_RETORNO|ALT_INV_DOUT\(7) <= NOT \REG_RETORNO|DOUT\(7);
\REG_RETORNO|ALT_INV_DOUT\(6) <= NOT \REG_RETORNO|DOUT\(6);
\REG_RETORNO|ALT_INV_DOUT\(5) <= NOT \REG_RETORNO|DOUT\(5);
\REG_RETORNO|ALT_INV_DOUT\(4) <= NOT \REG_RETORNO|DOUT\(4);
\DEC_Instrucao|ALT_INV_Equal10~0_combout\ <= NOT \DEC_Instrucao|Equal10~0_combout\;
\REG_RETORNO|ALT_INV_DOUT\(3) <= NOT \REG_RETORNO|DOUT\(3);
\ROM1|ALT_INV_memROM~7_combout\ <= NOT \ROM1|memROM~7_combout\;
\REG_RETORNO|ALT_INV_DOUT\(2) <= NOT \REG_RETORNO|DOUT\(2);
\ROM1|ALT_INV_memROM~6_combout\ <= NOT \ROM1|memROM~6_combout\;
\REG_RETORNO|ALT_INV_DOUT\(1) <= NOT \REG_RETORNO|DOUT\(1);
\ROM1|ALT_INV_memROM~5_combout\ <= NOT \ROM1|memROM~5_combout\;
\REG_RETORNO|ALT_INV_DOUT\(0) <= NOT \REG_RETORNO|DOUT\(0);
\MUXProxPC|ALT_INV_Equal1~0_combout\ <= NOT \MUXProxPC|Equal1~0_combout\;
\ROM1|ALT_INV_memROM~4_combout\ <= NOT \ROM1|memROM~4_combout\;
\MUXProxPC|ALT_INV_Equal2~0_combout\ <= NOT \MUXProxPC|Equal2~0_combout\;
\DEC_Instrucao|ALT_INV_saida~9_combout\ <= NOT \DEC_Instrucao|saida~9_combout\;
\DEC_Instrucao|ALT_INV_saida[2]~3_combout\ <= NOT \DEC_Instrucao|saida[2]~3_combout\;
\DEC_Instrucao|ALT_INV_saida[1]~2_combout\ <= NOT \DEC_Instrucao|saida[1]~2_combout\;
\ROM1|ALT_INV_memROM~3_combout\ <= NOT \ROM1|memROM~3_combout\;
\ROM1|ALT_INV_memROM~2_combout\ <= NOT \ROM1|memROM~2_combout\;
\ROM1|ALT_INV_memROM~1_combout\ <= NOT \ROM1|memROM~1_combout\;
\DEC_Instrucao|ALT_INV_saida[4]~0_combout\ <= NOT \DEC_Instrucao|saida[4]~0_combout\;
\ROM1|ALT_INV_memROM~0_combout\ <= NOT \ROM1|memROM~0_combout\;
\PC|ALT_INV_DOUT\(8) <= NOT \PC|DOUT\(8);
\PC|ALT_INV_DOUT\(7) <= NOT \PC|DOUT\(7);
\PC|ALT_INV_DOUT\(6) <= NOT \PC|DOUT\(6);
\PC|ALT_INV_DOUT\(5) <= NOT \PC|DOUT\(5);
\PC|ALT_INV_DOUT\(4) <= NOT \PC|DOUT\(4);
\PC|ALT_INV_DOUT\(3) <= NOT \PC|DOUT\(3);
\PC|ALT_INV_DOUT\(2) <= NOT \PC|DOUT\(2);
\PC|ALT_INV_DOUT\(1) <= NOT \PC|DOUT\(1);
\PC|ALT_INV_DOUT\(0) <= NOT \PC|DOUT\(0);
\incrementaPC|ALT_INV_Add0~33_sumout\ <= NOT \incrementaPC|Add0~33_sumout\;
\incrementaPC|ALT_INV_Add0~29_sumout\ <= NOT \incrementaPC|Add0~29_sumout\;
\incrementaPC|ALT_INV_Add0~25_sumout\ <= NOT \incrementaPC|Add0~25_sumout\;
\incrementaPC|ALT_INV_Add0~21_sumout\ <= NOT \incrementaPC|Add0~21_sumout\;
\incrementaPC|ALT_INV_Add0~17_sumout\ <= NOT \incrementaPC|Add0~17_sumout\;
\incrementaPC|ALT_INV_Add0~13_sumout\ <= NOT \incrementaPC|Add0~13_sumout\;
\incrementaPC|ALT_INV_Add0~9_sumout\ <= NOT \incrementaPC|Add0~9_sumout\;
\incrementaPC|ALT_INV_Add0~5_sumout\ <= NOT \incrementaPC|Add0~5_sumout\;
\incrementaPC|ALT_INV_Add0~1_sumout\ <= NOT \incrementaPC|Add0~1_sumout\;

\PC_OUT[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PC|DOUT\(0),
	devoe => ww_devoe,
	o => \PC_OUT[0]~output_o\);

\PC_OUT[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PC|DOUT\(1),
	devoe => ww_devoe,
	o => \PC_OUT[1]~output_o\);

\PC_OUT[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PC|DOUT\(2),
	devoe => ww_devoe,
	o => \PC_OUT[2]~output_o\);

\PC_OUT[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PC|DOUT\(3),
	devoe => ww_devoe,
	o => \PC_OUT[3]~output_o\);

\PC_OUT[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PC|DOUT\(4),
	devoe => ww_devoe,
	o => \PC_OUT[4]~output_o\);

\PC_OUT[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PC|DOUT\(5),
	devoe => ww_devoe,
	o => \PC_OUT[5]~output_o\);

\PC_OUT[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PC|DOUT\(6),
	devoe => ww_devoe,
	o => \PC_OUT[6]~output_o\);

\PC_OUT[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PC|DOUT\(7),
	devoe => ww_devoe,
	o => \PC_OUT[7]~output_o\);

\PC_OUT[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PC|DOUT\(8),
	devoe => ww_devoe,
	o => \PC_OUT[8]~output_o\);

\Palavra_Controle[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DEC_Instrucao|saida[0]~1_combout\,
	devoe => ww_devoe,
	o => \Palavra_Controle[0]~output_o\);

\Palavra_Controle[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Palavra_Controle[1]~output_o\);

\Palavra_Controle[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DEC_Instrucao|ALT_INV_saida[2]~3_combout\,
	devoe => ww_devoe,
	o => \Palavra_Controle[2]~output_o\);

\Palavra_Controle[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Palavra_Controle[3]~output_o\);

\Palavra_Controle[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DEC_Instrucao|saida[4]~4_combout\,
	devoe => ww_devoe,
	o => \Palavra_Controle[4]~output_o\);

\Palavra_Controle[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DEC_Instrucao|saida[5]~5_combout\,
	devoe => ww_devoe,
	o => \Palavra_Controle[5]~output_o\);

\Palavra_Controle[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DEC_Instrucao|saida[6]~6_combout\,
	devoe => ww_devoe,
	o => \Palavra_Controle[6]~output_o\);

\Palavra_Controle[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DEC_Instrucao|saida~7_combout\,
	devoe => ww_devoe,
	o => \Palavra_Controle[7]~output_o\);

\Palavra_Controle[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DEC_Instrucao|saida~8_combout\,
	devoe => ww_devoe,
	o => \Palavra_Controle[8]~output_o\);

\Palavra_Controle[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DEC_Instrucao|saida~9_combout\,
	devoe => ww_devoe,
	o => \Palavra_Controle[9]~output_o\);

\Palavra_Controle[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DEC_Instrucao|Equal4~0_combout\,
	devoe => ww_devoe,
	o => \Palavra_Controle[10]~output_o\);

\Palavra_Controle[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DEC_Instrucao|saida~8_combout\,
	devoe => ww_devoe,
	o => \Palavra_Controle[11]~output_o\);

\flag~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \flag~output_o\);

\KEY[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(0),
	o => \KEY[0]~input_o\);

\incrementaPC|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \incrementaPC|Add0~1_sumout\ = SUM(( \PC|DOUT\(0) ) + ( VCC ) + ( !VCC ))
-- \incrementaPC|Add0~2\ = CARRY(( \PC|DOUT\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC|ALT_INV_DOUT\(0),
	cin => GND,
	sumout => \incrementaPC|Add0~1_sumout\,
	cout => \incrementaPC|Add0~2\);

\incrementaPC|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \incrementaPC|Add0~5_sumout\ = SUM(( \PC|DOUT\(1) ) + ( GND ) + ( \incrementaPC|Add0~2\ ))
-- \incrementaPC|Add0~6\ = CARRY(( \PC|DOUT\(1) ) + ( GND ) + ( \incrementaPC|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC|ALT_INV_DOUT\(1),
	cin => \incrementaPC|Add0~2\,
	sumout => \incrementaPC|Add0~5_sumout\,
	cout => \incrementaPC|Add0~6\);

\incrementaPC|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \incrementaPC|Add0~9_sumout\ = SUM(( \PC|DOUT\(2) ) + ( GND ) + ( \incrementaPC|Add0~6\ ))
-- \incrementaPC|Add0~10\ = CARRY(( \PC|DOUT\(2) ) + ( GND ) + ( \incrementaPC|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC|ALT_INV_DOUT\(2),
	cin => \incrementaPC|Add0~6\,
	sumout => \incrementaPC|Add0~9_sumout\,
	cout => \incrementaPC|Add0~10\);

\incrementaPC|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \incrementaPC|Add0~13_sumout\ = SUM(( \PC|DOUT\(3) ) + ( GND ) + ( \incrementaPC|Add0~10\ ))
-- \incrementaPC|Add0~14\ = CARRY(( \PC|DOUT\(3) ) + ( GND ) + ( \incrementaPC|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC|ALT_INV_DOUT\(3),
	cin => \incrementaPC|Add0~10\,
	sumout => \incrementaPC|Add0~13_sumout\,
	cout => \incrementaPC|Add0~14\);

\ROM1|memROM~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~7_combout\ = (!\PC|DOUT\(0) & (((!\PC|DOUT\(2) & !\PC|DOUT\(3))))) # (\PC|DOUT\(0) & (!\PC|DOUT\(1) & (\PC|DOUT\(2) & \PC|DOUT\(3))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000000000100101000000000010010100000000001001010000000000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(0),
	datab => \PC|ALT_INV_DOUT\(1),
	datac => \PC|ALT_INV_DOUT\(2),
	datad => \PC|ALT_INV_DOUT\(3),
	combout => \ROM1|memROM~7_combout\);

\ROM1|memROM~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~3_combout\ = (!\PC|DOUT\(3) & (!\PC|DOUT\(2) & (!\PC|DOUT\(0) $ (!\PC|DOUT\(1))))) # (\PC|DOUT\(3) & ((!\PC|DOUT\(0) & (!\PC|DOUT\(1))) # (\PC|DOUT\(0) & ((\PC|DOUT\(2))))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110000010001101011000001000110101100000100011010110000010001101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(0),
	datab => \PC|ALT_INV_DOUT\(1),
	datac => \PC|ALT_INV_DOUT\(2),
	datad => \PC|ALT_INV_DOUT\(3),
	combout => \ROM1|memROM~3_combout\);

\DEC_Instrucao|saida~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \DEC_Instrucao|saida~8_combout\ = ( !\ROM1|memROM~3_combout\ & ( (\ROM1|memROM~0_combout\ & (\DEC_Instrucao|saida[4]~0_combout\ & (\ROM1|memROM~1_combout\ & !\ROM1|memROM~2_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000000000000000000000000000001000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~0_combout\,
	datab => \DEC_Instrucao|ALT_INV_saida[4]~0_combout\,
	datac => \ROM1|ALT_INV_memROM~1_combout\,
	datad => \ROM1|ALT_INV_memROM~2_combout\,
	datae => \ROM1|ALT_INV_memROM~3_combout\,
	combout => \DEC_Instrucao|saida~8_combout\);

\REG_RETORNO|DOUT[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \incrementaPC|Add0~13_sumout\,
	ena => \DEC_Instrucao|saida~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \REG_RETORNO|DOUT\(3));

\MUXProxPC|saida_MUX[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \MUXProxPC|saida_MUX[3]~3_combout\ = ( \ROM1|memROM~7_combout\ & ( \REG_RETORNO|DOUT\(3) & ( (!\MUXProxPC|Equal2~0_combout\ & (((\incrementaPC|Add0~13_sumout\)))) # (\MUXProxPC|Equal2~0_combout\ & (((!\MUXProxPC|Equal1~0_combout\)) # 
-- (\DEC_Instrucao|saida[4]~0_combout\))) ) ) ) # ( !\ROM1|memROM~7_combout\ & ( \REG_RETORNO|DOUT\(3) & ( (!\MUXProxPC|Equal2~0_combout\ & ((\incrementaPC|Add0~13_sumout\))) # (\MUXProxPC|Equal2~0_combout\ & (!\MUXProxPC|Equal1~0_combout\)) ) ) ) # ( 
-- \ROM1|memROM~7_combout\ & ( !\REG_RETORNO|DOUT\(3) & ( (!\MUXProxPC|Equal2~0_combout\ & (((\incrementaPC|Add0~13_sumout\)))) # (\MUXProxPC|Equal2~0_combout\ & (\DEC_Instrucao|saida[4]~0_combout\ & (\MUXProxPC|Equal1~0_combout\))) ) ) ) # ( 
-- !\ROM1|memROM~7_combout\ & ( !\REG_RETORNO|DOUT\(3) & ( (!\MUXProxPC|Equal2~0_combout\ & \incrementaPC|Add0~13_sumout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000011100110100110000111111000011000111111101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \DEC_Instrucao|ALT_INV_saida[4]~0_combout\,
	datab => \MUXProxPC|ALT_INV_Equal2~0_combout\,
	datac => \MUXProxPC|ALT_INV_Equal1~0_combout\,
	datad => \incrementaPC|ALT_INV_Add0~13_sumout\,
	datae => \ROM1|ALT_INV_memROM~7_combout\,
	dataf => \REG_RETORNO|ALT_INV_DOUT\(3),
	combout => \MUXProxPC|saida_MUX[3]~3_combout\);

\PC|DOUT[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \MUXProxPC|saida_MUX[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC|DOUT\(3));

\ROM1|memROM~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~2_combout\ = (!\PC|DOUT\(3) & (!\PC|DOUT\(0) $ ((!\PC|DOUT\(1))))) # (\PC|DOUT\(3) & ((!\PC|DOUT\(2) & (!\PC|DOUT\(0))) # (\PC|DOUT\(2) & ((!\PC|DOUT\(1))))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011010101100011001101010110001100110101011000110011010101100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(0),
	datab => \PC|ALT_INV_DOUT\(1),
	datac => \PC|ALT_INV_DOUT\(2),
	datad => \PC|ALT_INV_DOUT\(3),
	combout => \ROM1|memROM~2_combout\);

\MUXProxPC|Equal1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \MUXProxPC|Equal1~0_combout\ = ( \ROM1|memROM~3_combout\ & ( (!\ROM1|memROM~0_combout\ & (\DEC_Instrucao|saida[4]~0_combout\ & (!\ROM1|memROM~1_combout\ & \ROM1|memROM~2_combout\))) ) ) # ( !\ROM1|memROM~3_combout\ & ( (\ROM1|memROM~0_combout\ & 
-- (\DEC_Instrucao|saida[4]~0_combout\ & (\ROM1|memROM~1_combout\ & !\ROM1|memROM~2_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000000000000000010000000000001000000000000000000100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~0_combout\,
	datab => \DEC_Instrucao|ALT_INV_saida[4]~0_combout\,
	datac => \ROM1|ALT_INV_memROM~1_combout\,
	datad => \ROM1|ALT_INV_memROM~2_combout\,
	datae => \ROM1|ALT_INV_memROM~3_combout\,
	combout => \MUXProxPC|Equal1~0_combout\);

\ROM1|memROM~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~6_combout\ = (!\PC|DOUT\(0) & (!\PC|DOUT\(2) & (!\PC|DOUT\(1) $ (\PC|DOUT\(3))))) # (\PC|DOUT\(0) & (!\PC|DOUT\(1) & ((!\PC|DOUT\(3)) # (\PC|DOUT\(2)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100010000100100110001000010010011000100001001001100010000100100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(0),
	datab => \PC|ALT_INV_DOUT\(1),
	datac => \PC|ALT_INV_DOUT\(2),
	datad => \PC|ALT_INV_DOUT\(3),
	combout => \ROM1|memROM~6_combout\);

\REG_RETORNO|DOUT[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \incrementaPC|Add0~9_sumout\,
	ena => \DEC_Instrucao|saida~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \REG_RETORNO|DOUT\(2));

\MUXProxPC|saida_MUX[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \MUXProxPC|saida_MUX[2]~2_combout\ = ( \ROM1|memROM~6_combout\ & ( \REG_RETORNO|DOUT\(2) & ( (!\MUXProxPC|Equal2~0_combout\ & (((\incrementaPC|Add0~9_sumout\)))) # (\MUXProxPC|Equal2~0_combout\ & (((!\MUXProxPC|Equal1~0_combout\)) # 
-- (\DEC_Instrucao|saida[4]~0_combout\))) ) ) ) # ( !\ROM1|memROM~6_combout\ & ( \REG_RETORNO|DOUT\(2) & ( (!\MUXProxPC|Equal2~0_combout\ & ((\incrementaPC|Add0~9_sumout\))) # (\MUXProxPC|Equal2~0_combout\ & (!\MUXProxPC|Equal1~0_combout\)) ) ) ) # ( 
-- \ROM1|memROM~6_combout\ & ( !\REG_RETORNO|DOUT\(2) & ( (!\MUXProxPC|Equal2~0_combout\ & (((\incrementaPC|Add0~9_sumout\)))) # (\MUXProxPC|Equal2~0_combout\ & (\DEC_Instrucao|saida[4]~0_combout\ & (\MUXProxPC|Equal1~0_combout\))) ) ) ) # ( 
-- !\ROM1|memROM~6_combout\ & ( !\REG_RETORNO|DOUT\(2) & ( (!\MUXProxPC|Equal2~0_combout\ & \incrementaPC|Add0~9_sumout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000011100110100110000111111000011000111111101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \DEC_Instrucao|ALT_INV_saida[4]~0_combout\,
	datab => \MUXProxPC|ALT_INV_Equal2~0_combout\,
	datac => \MUXProxPC|ALT_INV_Equal1~0_combout\,
	datad => \incrementaPC|ALT_INV_Add0~9_sumout\,
	datae => \ROM1|ALT_INV_memROM~6_combout\,
	dataf => \REG_RETORNO|ALT_INV_DOUT\(2),
	combout => \MUXProxPC|saida_MUX[2]~2_combout\);

\PC|DOUT[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \MUXProxPC|saida_MUX[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC|DOUT\(2));

\ROM1|memROM~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~1_combout\ = (!\PC|DOUT\(0) & (!\PC|DOUT\(1) & (!\PC|DOUT\(2) & !\PC|DOUT\(3)))) # (\PC|DOUT\(0) & (\PC|DOUT\(1) & ((\PC|DOUT\(3)) # (\PC|DOUT\(2)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000100010001100000010001000110000001000100011000000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(0),
	datab => \PC|ALT_INV_DOUT\(1),
	datac => \PC|ALT_INV_DOUT\(2),
	datad => \PC|ALT_INV_DOUT\(3),
	combout => \ROM1|memROM~1_combout\);

\MUXProxPC|Equal2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \MUXProxPC|Equal2~0_combout\ = ( \ROM1|memROM~3_combout\ & ( (!\ROM1|memROM~0_combout\ & (\DEC_Instrucao|saida[4]~0_combout\ & (!\ROM1|memROM~1_combout\ $ (!\ROM1|memROM~2_combout\)))) ) ) # ( !\ROM1|memROM~3_combout\ & ( (\ROM1|memROM~0_combout\ & 
-- (\DEC_Instrucao|saida[4]~0_combout\ & (\ROM1|memROM~1_combout\ & !\ROM1|memROM~2_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000000000000100010000000000001000000000000001000100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~0_combout\,
	datab => \DEC_Instrucao|ALT_INV_saida[4]~0_combout\,
	datac => \ROM1|ALT_INV_memROM~1_combout\,
	datad => \ROM1|ALT_INV_memROM~2_combout\,
	datae => \ROM1|ALT_INV_memROM~3_combout\,
	combout => \MUXProxPC|Equal2~0_combout\);

\ROM1|memROM~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~5_combout\ = (!\PC|DOUT\(0) & (!\PC|DOUT\(1) & ((!\PC|DOUT\(2)) # (\PC|DOUT\(3)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000010001000100000001000100010000000100010001000000010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(0),
	datab => \PC|ALT_INV_DOUT\(1),
	datac => \PC|ALT_INV_DOUT\(2),
	datad => \PC|ALT_INV_DOUT\(3),
	combout => \ROM1|memROM~5_combout\);

\REG_RETORNO|DOUT[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \incrementaPC|Add0~5_sumout\,
	ena => \DEC_Instrucao|saida~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \REG_RETORNO|DOUT\(1));

\MUXProxPC|saida_MUX[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \MUXProxPC|saida_MUX[1]~1_combout\ = ( \ROM1|memROM~5_combout\ & ( \REG_RETORNO|DOUT\(1) & ( (!\MUXProxPC|Equal2~0_combout\ & (((\incrementaPC|Add0~5_sumout\)))) # (\MUXProxPC|Equal2~0_combout\ & (((!\MUXProxPC|Equal1~0_combout\)) # 
-- (\DEC_Instrucao|saida[4]~0_combout\))) ) ) ) # ( !\ROM1|memROM~5_combout\ & ( \REG_RETORNO|DOUT\(1) & ( (!\MUXProxPC|Equal2~0_combout\ & ((\incrementaPC|Add0~5_sumout\))) # (\MUXProxPC|Equal2~0_combout\ & (!\MUXProxPC|Equal1~0_combout\)) ) ) ) # ( 
-- \ROM1|memROM~5_combout\ & ( !\REG_RETORNO|DOUT\(1) & ( (!\MUXProxPC|Equal2~0_combout\ & (((\incrementaPC|Add0~5_sumout\)))) # (\MUXProxPC|Equal2~0_combout\ & (\DEC_Instrucao|saida[4]~0_combout\ & (\MUXProxPC|Equal1~0_combout\))) ) ) ) # ( 
-- !\ROM1|memROM~5_combout\ & ( !\REG_RETORNO|DOUT\(1) & ( (!\MUXProxPC|Equal2~0_combout\ & \incrementaPC|Add0~5_sumout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000011100110100110000111111000011000111111101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \DEC_Instrucao|ALT_INV_saida[4]~0_combout\,
	datab => \MUXProxPC|ALT_INV_Equal2~0_combout\,
	datac => \MUXProxPC|ALT_INV_Equal1~0_combout\,
	datad => \incrementaPC|ALT_INV_Add0~5_sumout\,
	datae => \ROM1|ALT_INV_memROM~5_combout\,
	dataf => \REG_RETORNO|ALT_INV_DOUT\(1),
	combout => \MUXProxPC|saida_MUX[1]~1_combout\);

\PC|DOUT[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \MUXProxPC|saida_MUX[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC|DOUT\(1));

\ROM1|memROM~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~0_combout\ = (!\PC|DOUT\(0) & (!\PC|DOUT\(3) $ (((!\PC|DOUT\(1) & \PC|DOUT\(2))))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010001000001000101000100000100010100010000010001010001000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(0),
	datab => \PC|ALT_INV_DOUT\(1),
	datac => \PC|ALT_INV_DOUT\(2),
	datad => \PC|ALT_INV_DOUT\(3),
	combout => \ROM1|memROM~0_combout\);

\DEC_Instrucao|Equal10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DEC_Instrucao|Equal10~0_combout\ = ( \ROM1|memROM~3_combout\ & ( \DEC_Instrucao|saida[4]~0_combout\ ) ) # ( !\ROM1|memROM~3_combout\ & ( (\DEC_Instrucao|saida[4]~0_combout\ & (((\ROM1|memROM~2_combout\) # (\ROM1|memROM~1_combout\)) # 
-- (\ROM1|memROM~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001001100110011001100110011001100010011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~0_combout\,
	datab => \DEC_Instrucao|ALT_INV_saida[4]~0_combout\,
	datac => \ROM1|ALT_INV_memROM~1_combout\,
	datad => \ROM1|ALT_INV_memROM~2_combout\,
	datae => \ROM1|ALT_INV_memROM~3_combout\,
	combout => \DEC_Instrucao|Equal10~0_combout\);

\DEC_Instrucao|saida~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \DEC_Instrucao|saida~9_combout\ = ( \ROM1|memROM~3_combout\ & ( (!\ROM1|memROM~0_combout\ & (\DEC_Instrucao|saida[4]~0_combout\ & (\ROM1|memROM~1_combout\ & !\ROM1|memROM~2_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000100000000000000000000000000000001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~0_combout\,
	datab => \DEC_Instrucao|ALT_INV_saida[4]~0_combout\,
	datac => \ROM1|ALT_INV_memROM~1_combout\,
	datad => \ROM1|ALT_INV_memROM~2_combout\,
	datae => \ROM1|ALT_INV_memROM~3_combout\,
	combout => \DEC_Instrucao|saida~9_combout\);

\incrementaPC|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \incrementaPC|Add0~17_sumout\ = SUM(( \PC|DOUT\(4) ) + ( GND ) + ( \incrementaPC|Add0~14\ ))
-- \incrementaPC|Add0~18\ = CARRY(( \PC|DOUT\(4) ) + ( GND ) + ( \incrementaPC|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC|ALT_INV_DOUT\(4),
	cin => \incrementaPC|Add0~14\,
	sumout => \incrementaPC|Add0~17_sumout\,
	cout => \incrementaPC|Add0~18\);

\REG_RETORNO|DOUT[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \incrementaPC|Add0~17_sumout\,
	ena => \DEC_Instrucao|saida~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \REG_RETORNO|DOUT\(4));

\MUXProxPC|saida_MUX[4]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \MUXProxPC|saida_MUX[4]~4_combout\ = ( \REG_RETORNO|DOUT\(4) & ( (!\DEC_Instrucao|Equal10~0_combout\ & (((\incrementaPC|Add0~17_sumout\)))) # (\DEC_Instrucao|Equal10~0_combout\ & (!\MUXProxPC|Equal1~0_combout\ & ((\incrementaPC|Add0~17_sumout\) # 
-- (\DEC_Instrucao|saida~9_combout\)))) ) ) # ( !\REG_RETORNO|DOUT\(4) & ( (\incrementaPC|Add0~17_sumout\ & ((!\DEC_Instrucao|Equal10~0_combout\) # ((!\DEC_Instrucao|saida~9_combout\ & !\MUXProxPC|Equal1~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011101010000100001111101000000000111010100001000011111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \DEC_Instrucao|ALT_INV_Equal10~0_combout\,
	datab => \DEC_Instrucao|ALT_INV_saida~9_combout\,
	datac => \MUXProxPC|ALT_INV_Equal1~0_combout\,
	datad => \incrementaPC|ALT_INV_Add0~17_sumout\,
	datae => \REG_RETORNO|ALT_INV_DOUT\(4),
	combout => \MUXProxPC|saida_MUX[4]~4_combout\);

\PC|DOUT[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \MUXProxPC|saida_MUX[4]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC|DOUT\(4));

\incrementaPC|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \incrementaPC|Add0~21_sumout\ = SUM(( \PC|DOUT\(5) ) + ( GND ) + ( \incrementaPC|Add0~18\ ))
-- \incrementaPC|Add0~22\ = CARRY(( \PC|DOUT\(5) ) + ( GND ) + ( \incrementaPC|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC|ALT_INV_DOUT\(5),
	cin => \incrementaPC|Add0~18\,
	sumout => \incrementaPC|Add0~21_sumout\,
	cout => \incrementaPC|Add0~22\);

\REG_RETORNO|DOUT[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \incrementaPC|Add0~21_sumout\,
	ena => \DEC_Instrucao|saida~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \REG_RETORNO|DOUT\(5));

\MUXProxPC|saida_MUX[5]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \MUXProxPC|saida_MUX[5]~5_combout\ = ( \REG_RETORNO|DOUT\(5) & ( (!\DEC_Instrucao|Equal10~0_combout\ & (((\incrementaPC|Add0~21_sumout\)))) # (\DEC_Instrucao|Equal10~0_combout\ & (!\MUXProxPC|Equal1~0_combout\ & ((\incrementaPC|Add0~21_sumout\) # 
-- (\DEC_Instrucao|saida~9_combout\)))) ) ) # ( !\REG_RETORNO|DOUT\(5) & ( (\incrementaPC|Add0~21_sumout\ & ((!\DEC_Instrucao|Equal10~0_combout\) # ((!\DEC_Instrucao|saida~9_combout\ & !\MUXProxPC|Equal1~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011101010000100001111101000000000111010100001000011111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \DEC_Instrucao|ALT_INV_Equal10~0_combout\,
	datab => \DEC_Instrucao|ALT_INV_saida~9_combout\,
	datac => \MUXProxPC|ALT_INV_Equal1~0_combout\,
	datad => \incrementaPC|ALT_INV_Add0~21_sumout\,
	datae => \REG_RETORNO|ALT_INV_DOUT\(5),
	combout => \MUXProxPC|saida_MUX[5]~5_combout\);

\PC|DOUT[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \MUXProxPC|saida_MUX[5]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC|DOUT\(5));

\incrementaPC|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \incrementaPC|Add0~25_sumout\ = SUM(( \PC|DOUT\(6) ) + ( GND ) + ( \incrementaPC|Add0~22\ ))
-- \incrementaPC|Add0~26\ = CARRY(( \PC|DOUT\(6) ) + ( GND ) + ( \incrementaPC|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC|ALT_INV_DOUT\(6),
	cin => \incrementaPC|Add0~22\,
	sumout => \incrementaPC|Add0~25_sumout\,
	cout => \incrementaPC|Add0~26\);

\REG_RETORNO|DOUT[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \incrementaPC|Add0~25_sumout\,
	ena => \DEC_Instrucao|saida~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \REG_RETORNO|DOUT\(6));

\MUXProxPC|saida_MUX[6]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \MUXProxPC|saida_MUX[6]~6_combout\ = ( \REG_RETORNO|DOUT\(6) & ( (!\DEC_Instrucao|Equal10~0_combout\ & (((\incrementaPC|Add0~25_sumout\)))) # (\DEC_Instrucao|Equal10~0_combout\ & (!\MUXProxPC|Equal1~0_combout\ & ((\incrementaPC|Add0~25_sumout\) # 
-- (\DEC_Instrucao|saida~9_combout\)))) ) ) # ( !\REG_RETORNO|DOUT\(6) & ( (\incrementaPC|Add0~25_sumout\ & ((!\DEC_Instrucao|Equal10~0_combout\) # ((!\DEC_Instrucao|saida~9_combout\ & !\MUXProxPC|Equal1~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011101010000100001111101000000000111010100001000011111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \DEC_Instrucao|ALT_INV_Equal10~0_combout\,
	datab => \DEC_Instrucao|ALT_INV_saida~9_combout\,
	datac => \MUXProxPC|ALT_INV_Equal1~0_combout\,
	datad => \incrementaPC|ALT_INV_Add0~25_sumout\,
	datae => \REG_RETORNO|ALT_INV_DOUT\(6),
	combout => \MUXProxPC|saida_MUX[6]~6_combout\);

\PC|DOUT[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \MUXProxPC|saida_MUX[6]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC|DOUT\(6));

\incrementaPC|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \incrementaPC|Add0~29_sumout\ = SUM(( \PC|DOUT\(7) ) + ( GND ) + ( \incrementaPC|Add0~26\ ))
-- \incrementaPC|Add0~30\ = CARRY(( \PC|DOUT\(7) ) + ( GND ) + ( \incrementaPC|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC|ALT_INV_DOUT\(7),
	cin => \incrementaPC|Add0~26\,
	sumout => \incrementaPC|Add0~29_sumout\,
	cout => \incrementaPC|Add0~30\);

\REG_RETORNO|DOUT[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \incrementaPC|Add0~29_sumout\,
	ena => \DEC_Instrucao|saida~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \REG_RETORNO|DOUT\(7));

\MUXProxPC|saida_MUX[7]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \MUXProxPC|saida_MUX[7]~7_combout\ = ( \REG_RETORNO|DOUT\(7) & ( (!\DEC_Instrucao|Equal10~0_combout\ & (((\incrementaPC|Add0~29_sumout\)))) # (\DEC_Instrucao|Equal10~0_combout\ & (!\MUXProxPC|Equal1~0_combout\ & ((\incrementaPC|Add0~29_sumout\) # 
-- (\DEC_Instrucao|saida~9_combout\)))) ) ) # ( !\REG_RETORNO|DOUT\(7) & ( (\incrementaPC|Add0~29_sumout\ & ((!\DEC_Instrucao|Equal10~0_combout\) # ((!\DEC_Instrucao|saida~9_combout\ & !\MUXProxPC|Equal1~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011101010000100001111101000000000111010100001000011111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \DEC_Instrucao|ALT_INV_Equal10~0_combout\,
	datab => \DEC_Instrucao|ALT_INV_saida~9_combout\,
	datac => \MUXProxPC|ALT_INV_Equal1~0_combout\,
	datad => \incrementaPC|ALT_INV_Add0~29_sumout\,
	datae => \REG_RETORNO|ALT_INV_DOUT\(7),
	combout => \MUXProxPC|saida_MUX[7]~7_combout\);

\PC|DOUT[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \MUXProxPC|saida_MUX[7]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC|DOUT\(7));

\incrementaPC|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \incrementaPC|Add0~33_sumout\ = SUM(( \PC|DOUT\(8) ) + ( GND ) + ( \incrementaPC|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \PC|ALT_INV_DOUT\(8),
	cin => \incrementaPC|Add0~30\,
	sumout => \incrementaPC|Add0~33_sumout\);

\ROM1|memROM~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~8_combout\ = (\PC|DOUT\(1) & ((!\PC|DOUT\(2) & (\PC|DOUT\(0) & \PC|DOUT\(3))) # (\PC|DOUT\(2) & ((!\PC|DOUT\(3))))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100010000000000110001000000000011000100000000001100010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(0),
	datab => \PC|ALT_INV_DOUT\(1),
	datac => \PC|ALT_INV_DOUT\(2),
	datad => \PC|ALT_INV_DOUT\(3),
	combout => \ROM1|memROM~8_combout\);

\REG_RETORNO|DOUT[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \incrementaPC|Add0~33_sumout\,
	ena => \DEC_Instrucao|saida~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \REG_RETORNO|DOUT\(8));

\MUXProxPC|saida_MUX[8]~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \MUXProxPC|saida_MUX[8]~8_combout\ = ( \ROM1|memROM~8_combout\ & ( \REG_RETORNO|DOUT\(8) & ( (!\MUXProxPC|Equal2~0_combout\ & (((\incrementaPC|Add0~33_sumout\)))) # (\MUXProxPC|Equal2~0_combout\ & (((!\MUXProxPC|Equal1~0_combout\)) # 
-- (\DEC_Instrucao|saida[4]~0_combout\))) ) ) ) # ( !\ROM1|memROM~8_combout\ & ( \REG_RETORNO|DOUT\(8) & ( (!\MUXProxPC|Equal2~0_combout\ & ((\incrementaPC|Add0~33_sumout\))) # (\MUXProxPC|Equal2~0_combout\ & (!\MUXProxPC|Equal1~0_combout\)) ) ) ) # ( 
-- \ROM1|memROM~8_combout\ & ( !\REG_RETORNO|DOUT\(8) & ( (!\MUXProxPC|Equal2~0_combout\ & (((\incrementaPC|Add0~33_sumout\)))) # (\MUXProxPC|Equal2~0_combout\ & (\DEC_Instrucao|saida[4]~0_combout\ & (\MUXProxPC|Equal1~0_combout\))) ) ) ) # ( 
-- !\ROM1|memROM~8_combout\ & ( !\REG_RETORNO|DOUT\(8) & ( (!\MUXProxPC|Equal2~0_combout\ & \incrementaPC|Add0~33_sumout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000011100110100110000111111000011000111111101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \DEC_Instrucao|ALT_INV_saida[4]~0_combout\,
	datab => \MUXProxPC|ALT_INV_Equal2~0_combout\,
	datac => \MUXProxPC|ALT_INV_Equal1~0_combout\,
	datad => \incrementaPC|ALT_INV_Add0~33_sumout\,
	datae => \ROM1|ALT_INV_memROM~8_combout\,
	dataf => \REG_RETORNO|ALT_INV_DOUT\(8),
	combout => \MUXProxPC|saida_MUX[8]~8_combout\);

\PC|DOUT[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \MUXProxPC|saida_MUX[8]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC|DOUT\(8));

\DEC_Instrucao|saida[4]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DEC_Instrucao|saida[4]~0_combout\ = ( !\PC|DOUT\(8) & ( (!\PC|DOUT\(4) & (!\PC|DOUT\(5) & (!\PC|DOUT\(6) & !\PC|DOUT\(7)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000010000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(4),
	datab => \PC|ALT_INV_DOUT\(5),
	datac => \PC|ALT_INV_DOUT\(6),
	datad => \PC|ALT_INV_DOUT\(7),
	datae => \PC|ALT_INV_DOUT\(8),
	combout => \DEC_Instrucao|saida[4]~0_combout\);

\ROM1|memROM~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \ROM1|memROM~4_combout\ = (!\PC|DOUT\(1) & ((!\PC|DOUT\(3) & (\PC|DOUT\(0))) # (\PC|DOUT\(3) & ((\PC|DOUT\(2)))))) # (\PC|DOUT\(1) & (!\PC|DOUT\(0) & (!\PC|DOUT\(2) & !\PC|DOUT\(3))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110010000001100011001000000110001100100000011000110010000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(0),
	datab => \PC|ALT_INV_DOUT\(1),
	datac => \PC|ALT_INV_DOUT\(2),
	datad => \PC|ALT_INV_DOUT\(3),
	combout => \ROM1|memROM~4_combout\);

\REG_RETORNO|DOUT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \incrementaPC|Add0~1_sumout\,
	ena => \DEC_Instrucao|saida~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \REG_RETORNO|DOUT\(0));

\MUXProxPC|saida_MUX[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \MUXProxPC|saida_MUX[0]~0_combout\ = ( \MUXProxPC|Equal1~0_combout\ & ( \REG_RETORNO|DOUT\(0) & ( (!\MUXProxPC|Equal2~0_combout\ & (((\incrementaPC|Add0~1_sumout\)))) # (\MUXProxPC|Equal2~0_combout\ & (\DEC_Instrucao|saida[4]~0_combout\ & 
-- ((\ROM1|memROM~4_combout\)))) ) ) ) # ( !\MUXProxPC|Equal1~0_combout\ & ( \REG_RETORNO|DOUT\(0) & ( (\MUXProxPC|Equal2~0_combout\) # (\incrementaPC|Add0~1_sumout\) ) ) ) # ( \MUXProxPC|Equal1~0_combout\ & ( !\REG_RETORNO|DOUT\(0) & ( 
-- (!\MUXProxPC|Equal2~0_combout\ & (((\incrementaPC|Add0~1_sumout\)))) # (\MUXProxPC|Equal2~0_combout\ & (\DEC_Instrucao|saida[4]~0_combout\ & ((\ROM1|memROM~4_combout\)))) ) ) ) # ( !\MUXProxPC|Equal1~0_combout\ & ( !\REG_RETORNO|DOUT\(0) & ( 
-- (\incrementaPC|Add0~1_sumout\ & !\MUXProxPC|Equal2~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000110000001100000011010100111111001111110011000000110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \DEC_Instrucao|ALT_INV_saida[4]~0_combout\,
	datab => \incrementaPC|ALT_INV_Add0~1_sumout\,
	datac => \MUXProxPC|ALT_INV_Equal2~0_combout\,
	datad => \ROM1|ALT_INV_memROM~4_combout\,
	datae => \MUXProxPC|ALT_INV_Equal1~0_combout\,
	dataf => \REG_RETORNO|ALT_INV_DOUT\(0),
	combout => \MUXProxPC|saida_MUX[0]~0_combout\);

\PC|DOUT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \MUXProxPC|saida_MUX[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PC|DOUT\(0));

\DEC_Instrucao|saida[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \DEC_Instrucao|saida[0]~1_combout\ = ( !\ROM1|memROM~3_combout\ & ( (\ROM1|memROM~0_combout\ & (\DEC_Instrucao|saida[4]~0_combout\ & (!\ROM1|memROM~1_combout\ & \ROM1|memROM~2_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010000000000000000000000000000000100000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~0_combout\,
	datab => \DEC_Instrucao|ALT_INV_saida[4]~0_combout\,
	datac => \ROM1|ALT_INV_memROM~1_combout\,
	datad => \ROM1|ALT_INV_memROM~2_combout\,
	datae => \ROM1|ALT_INV_memROM~3_combout\,
	combout => \DEC_Instrucao|saida[0]~1_combout\);

\DEC_Instrucao|saida[2]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \DEC_Instrucao|saida[2]~3_combout\ = ( \ROM1|memROM~3_combout\ ) # ( !\ROM1|memROM~3_combout\ & ( ((!\DEC_Instrucao|saida[4]~0_combout\) # ((!\ROM1|memROM~1_combout\) # (\ROM1|memROM~2_combout\))) # (\ROM1|memROM~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111110111111111111111111111111111111101111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~0_combout\,
	datab => \DEC_Instrucao|ALT_INV_saida[4]~0_combout\,
	datac => \ROM1|ALT_INV_memROM~1_combout\,
	datad => \ROM1|ALT_INV_memROM~2_combout\,
	datae => \ROM1|ALT_INV_memROM~3_combout\,
	combout => \DEC_Instrucao|saida[2]~3_combout\);

\DEC_Instrucao|saida[4]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \DEC_Instrucao|saida[4]~4_combout\ = ( !\ROM1|memROM~3_combout\ & ( (\DEC_Instrucao|saida[4]~0_combout\ & (!\ROM1|memROM~1_combout\ & (!\ROM1|memROM~0_combout\ $ (!\ROM1|memROM~2_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000100000000000000000000000010000001000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~0_combout\,
	datab => \DEC_Instrucao|ALT_INV_saida[4]~0_combout\,
	datac => \ROM1|ALT_INV_memROM~1_combout\,
	datad => \ROM1|ALT_INV_memROM~2_combout\,
	datae => \ROM1|ALT_INV_memROM~3_combout\,
	combout => \DEC_Instrucao|saida[4]~4_combout\);

\DEC_Instrucao|saida[5]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \DEC_Instrucao|saida[5]~5_combout\ = ( \ROM1|memROM~3_combout\ & ( (\DEC_Instrucao|saida[4]~0_combout\ & (!\ROM1|memROM~1_combout\ & !\ROM1|memROM~2_combout\)) ) ) # ( !\ROM1|memROM~3_combout\ & ( (\DEC_Instrucao|saida[4]~0_combout\ & 
-- (!\ROM1|memROM~1_combout\ & (!\ROM1|memROM~0_combout\ $ (!\ROM1|memROM~2_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000100000001100000000000000010000001000000011000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~0_combout\,
	datab => \DEC_Instrucao|ALT_INV_saida[4]~0_combout\,
	datac => \ROM1|ALT_INV_memROM~1_combout\,
	datad => \ROM1|ALT_INV_memROM~2_combout\,
	datae => \ROM1|ALT_INV_memROM~3_combout\,
	combout => \DEC_Instrucao|saida[5]~5_combout\);

\DEC_Instrucao|saida[1]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \DEC_Instrucao|saida[1]~2_combout\ = (!\PC|DOUT\(4) & (!\PC|DOUT\(5) & (!\PC|DOUT\(6) & !\PC|DOUT\(7))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000100000000000000010000000000000001000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(4),
	datab => \PC|ALT_INV_DOUT\(5),
	datac => \PC|ALT_INV_DOUT\(6),
	datad => \PC|ALT_INV_DOUT\(7),
	combout => \DEC_Instrucao|saida[1]~2_combout\);

\DEC_Instrucao|saida[6]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \DEC_Instrucao|saida[6]~6_combout\ = ( \ROM1|memROM~2_combout\ & ( !\ROM1|memROM~3_combout\ & ( (!\PC|DOUT\(8) & (!\ROM1|memROM~0_combout\ & (\DEC_Instrucao|saida[1]~2_combout\ & !\ROM1|memROM~1_combout\))) ) ) ) # ( !\ROM1|memROM~2_combout\ & ( 
-- !\ROM1|memROM~3_combout\ & ( (!\PC|DOUT\(8) & (!\ROM1|memROM~0_combout\ & (\DEC_Instrucao|saida[1]~2_combout\ & \ROM1|memROM~1_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001000000010000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \PC|ALT_INV_DOUT\(8),
	datab => \ROM1|ALT_INV_memROM~0_combout\,
	datac => \DEC_Instrucao|ALT_INV_saida[1]~2_combout\,
	datad => \ROM1|ALT_INV_memROM~1_combout\,
	datae => \ROM1|ALT_INV_memROM~2_combout\,
	dataf => \ROM1|ALT_INV_memROM~3_combout\,
	combout => \DEC_Instrucao|saida[6]~6_combout\);

\DEC_Instrucao|saida~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \DEC_Instrucao|saida~7_combout\ = ( \ROM1|memROM~3_combout\ & ( (\ROM1|memROM~0_combout\ & (\DEC_Instrucao|saida[4]~0_combout\ & (!\ROM1|memROM~1_combout\ & \ROM1|memROM~2_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000001000000000000000000000000000000010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~0_combout\,
	datab => \DEC_Instrucao|ALT_INV_saida[4]~0_combout\,
	datac => \ROM1|ALT_INV_memROM~1_combout\,
	datad => \ROM1|ALT_INV_memROM~2_combout\,
	datae => \ROM1|ALT_INV_memROM~3_combout\,
	combout => \DEC_Instrucao|saida~7_combout\);

\DEC_Instrucao|Equal4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DEC_Instrucao|Equal4~0_combout\ = ( \ROM1|memROM~3_combout\ & ( (!\ROM1|memROM~0_combout\ & (\DEC_Instrucao|saida[4]~0_combout\ & (!\ROM1|memROM~1_combout\ & \ROM1|memROM~2_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000010000000000000000000000000000000100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ROM1|ALT_INV_memROM~0_combout\,
	datab => \DEC_Instrucao|ALT_INV_saida[4]~0_combout\,
	datac => \ROM1|ALT_INV_memROM~1_combout\,
	datad => \ROM1|ALT_INV_memROM~2_combout\,
	datae => \ROM1|ALT_INV_memROM~3_combout\,
	combout => \DEC_Instrucao|Equal4~0_combout\);

\CLOCK_50~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

\KEY[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(1),
	o => \KEY[1]~input_o\);

\KEY[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(2),
	o => \KEY[2]~input_o\);

\KEY[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(3),
	o => \KEY[3]~input_o\);

ww_PC_OUT(0) <= \PC_OUT[0]~output_o\;

ww_PC_OUT(1) <= \PC_OUT[1]~output_o\;

ww_PC_OUT(2) <= \PC_OUT[2]~output_o\;

ww_PC_OUT(3) <= \PC_OUT[3]~output_o\;

ww_PC_OUT(4) <= \PC_OUT[4]~output_o\;

ww_PC_OUT(5) <= \PC_OUT[5]~output_o\;

ww_PC_OUT(6) <= \PC_OUT[6]~output_o\;

ww_PC_OUT(7) <= \PC_OUT[7]~output_o\;

ww_PC_OUT(8) <= \PC_OUT[8]~output_o\;

ww_Palavra_Controle(0) <= \Palavra_Controle[0]~output_o\;

ww_Palavra_Controle(1) <= \Palavra_Controle[1]~output_o\;

ww_Palavra_Controle(2) <= \Palavra_Controle[2]~output_o\;

ww_Palavra_Controle(3) <= \Palavra_Controle[3]~output_o\;

ww_Palavra_Controle(4) <= \Palavra_Controle[4]~output_o\;

ww_Palavra_Controle(5) <= \Palavra_Controle[5]~output_o\;

ww_Palavra_Controle(6) <= \Palavra_Controle[6]~output_o\;

ww_Palavra_Controle(7) <= \Palavra_Controle[7]~output_o\;

ww_Palavra_Controle(8) <= \Palavra_Controle[8]~output_o\;

ww_Palavra_Controle(9) <= \Palavra_Controle[9]~output_o\;

ww_Palavra_Controle(10) <= \Palavra_Controle[10]~output_o\;

ww_Palavra_Controle(11) <= \Palavra_Controle[11]~output_o\;

ww_flag <= \flag~output_o\;
END structure;


