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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "10/29/2024 19:14:50"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          atv14
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY atv14_vhd_vec_tst IS
END atv14_vhd_vec_tst;
ARCHITECTURE atv14_arch OF atv14_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLOCK_50 : STD_LOGIC;
SIGNAL ENTRADA_RS : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL INSTRUCTIONS : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL KEY : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL PROX_PC : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL SAIDA_BRS : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL SAIDA_BRT : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL SAIDA_ULA : STD_LOGIC_VECTOR(31 DOWNTO 0);
COMPONENT atv14
	PORT (
	CLOCK_50 : IN STD_LOGIC;
	ENTRADA_RS : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
	INSTRUCTIONS : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
	KEY : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	PROX_PC : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	SAIDA_BRS : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	SAIDA_BRT : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	SAIDA_ULA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : atv14
	PORT MAP (
-- list connections between master ports and signals
	CLOCK_50 => CLOCK_50,
	ENTRADA_RS => ENTRADA_RS,
	INSTRUCTIONS => INSTRUCTIONS,
	KEY => KEY,
	PROX_PC => PROX_PC,
	SAIDA_BRS => SAIDA_BRS,
	SAIDA_BRT => SAIDA_BRT,
	SAIDA_ULA => SAIDA_ULA
	);
-- INSTRUCTIONS[9]
t_prcs_INSTRUCTIONS_9: PROCESS
BEGIN
	INSTRUCTIONS(9) <= '0';
WAIT;
END PROCESS t_prcs_INSTRUCTIONS_9;
-- INSTRUCTIONS[8]
t_prcs_INSTRUCTIONS_8: PROCESS
BEGIN
	INSTRUCTIONS(8) <= '0';
	WAIT FOR 40000 ps;
	INSTRUCTIONS(8) <= '1';
	WAIT FOR 40000 ps;
	INSTRUCTIONS(8) <= '0';
WAIT;
END PROCESS t_prcs_INSTRUCTIONS_8;
-- INSTRUCTIONS[7]
t_prcs_INSTRUCTIONS_7: PROCESS
BEGIN
	INSTRUCTIONS(7) <= '0';
	WAIT FOR 20000 ps;
	INSTRUCTIONS(7) <= '1';
	WAIT FOR 60000 ps;
	INSTRUCTIONS(7) <= '0';
WAIT;
END PROCESS t_prcs_INSTRUCTIONS_7;
-- INSTRUCTIONS[6]
t_prcs_INSTRUCTIONS_6: PROCESS
BEGIN
	INSTRUCTIONS(6) <= '1';
	WAIT FOR 40000 ps;
	INSTRUCTIONS(6) <= '0';
WAIT;
END PROCESS t_prcs_INSTRUCTIONS_6;
-- INSTRUCTIONS[5]
t_prcs_INSTRUCTIONS_5: PROCESS
BEGIN
	INSTRUCTIONS(5) <= '0';
WAIT;
END PROCESS t_prcs_INSTRUCTIONS_5;
-- INSTRUCTIONS[4]
t_prcs_INSTRUCTIONS_4: PROCESS
BEGIN
	INSTRUCTIONS(4) <= '0';
WAIT;
END PROCESS t_prcs_INSTRUCTIONS_4;
-- INSTRUCTIONS[3]
t_prcs_INSTRUCTIONS_3: PROCESS
BEGIN
	INSTRUCTIONS(3) <= '0';
	WAIT FOR 20000 ps;
	INSTRUCTIONS(3) <= '1';
	WAIT FOR 20000 ps;
	INSTRUCTIONS(3) <= '0';
WAIT;
END PROCESS t_prcs_INSTRUCTIONS_3;
-- INSTRUCTIONS[2]
t_prcs_INSTRUCTIONS_2: PROCESS
BEGIN
	INSTRUCTIONS(2) <= '0';
WAIT;
END PROCESS t_prcs_INSTRUCTIONS_2;
-- INSTRUCTIONS[1]
t_prcs_INSTRUCTIONS_1: PROCESS
BEGIN
	INSTRUCTIONS(1) <= '0';
	WAIT FOR 20000 ps;
	INSTRUCTIONS(1) <= '1';
	WAIT FOR 20000 ps;
	INSTRUCTIONS(1) <= '0';
WAIT;
END PROCESS t_prcs_INSTRUCTIONS_1;
-- INSTRUCTIONS[0]
t_prcs_INSTRUCTIONS_0: PROCESS
BEGIN
	INSTRUCTIONS(0) <= '1';
	WAIT FOR 20000 ps;
	INSTRUCTIONS(0) <= '0';
WAIT;
END PROCESS t_prcs_INSTRUCTIONS_0;

-- KEY[0]
t_prcs_KEY_0: PROCESS
BEGIN
	KEY(0) <= '1';
	WAIT FOR 10000 ps;
	FOR i IN 1 TO 4
	LOOP
		KEY(0) <= '0';
		WAIT FOR 10000 ps;
		KEY(0) <= '1';
		WAIT FOR 10000 ps;
	END LOOP;
	KEY(0) <= '0';
WAIT;
END PROCESS t_prcs_KEY_0;
END atv14_arch;
