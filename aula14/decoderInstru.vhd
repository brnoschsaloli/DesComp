library ieee;
use ieee.std_logic_1164.all;

entity decoderInstru is
  port ( opcode : in std_logic_vector(11 downto 0);
         saida : out std_logic_vector(10 downto 0)
  );
end entity;

architecture comportamento of decoderInstru is

	 
  begin
saida <= "00000000000";
end architecture;