library ieee;
use ieee.std_logic_1164.all;

entity LogicaDesvio is
  port ( entrada_flag : in std_logic;
			entrada_jeq  : in std_logic;
			entrada_jmp  : in std_logic;
         saida : out std_logic
  );
end entity;

architecture comportamento of LogicaDesvio is

  begin
saida <= (entrada_flag and entrada_jeq) or entrada_jmp;
end architecture;