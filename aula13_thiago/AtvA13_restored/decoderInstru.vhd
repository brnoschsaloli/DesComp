library ieee;
use ieee.std_logic_1164.all;

entity decoderInstru is
  port ( opcode : in std_logic_vector(5 downto 0);
         saida : out std_logic_vector(2 downto 0)
  );
end entity;

architecture comportamento of decoderInstru is

  constant SOMA  : std_logic_vector(5 downto 0) := "110000";
  constant SUB  : std_logic_vector(5 downto 0) := "110010";

	 
  begin
saida <= "101" when opcode = SOMA else
         "110" when opcode = SUB else
         "000";  -- NOP para os opcodes Indefinidos
end architecture;