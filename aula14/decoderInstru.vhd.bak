library ieee;
use ieee.std_logic_1164.all;

entity decoderInstru is
  port ( opcode : in std_logic_vector(5 downto 0);
         saida : out std_logic
  );
end entity;

architecture comportamento of decoderInstru is

  constant TIPOR  : std_logic_vector(5 downto 0) := "000000";

  begin
saida <= '1' when opcode = TIPOR else
			'0';  -- NOP para os opcodes Indefinidos
end architecture;