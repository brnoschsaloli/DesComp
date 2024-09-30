library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity memoriaROM is
   generic (
          dataWidth: natural := 4;
          addrWidth: natural := 3
    );
   port (
          Endereco : in std_logic_vector (addrWidth-1 DOWNTO 0);
          Dado : out std_logic_vector (dataWidth-1 DOWNTO 0)
    );
end entity;

architecture assincrona of memoriaROM is

  type blocoMemoria is array(0 TO 2**addrWidth - 1) of std_logic_vector(dataWidth-1 DOWNTO 0);
  
  constant NOP  : std_logic_vector(3 downto 0) := "0000";
  constant LDA  : std_logic_vector(3 downto 0) := "0001";
  constant SOMA : std_logic_vector(3 downto 0) := "0010";
  constant SUB  : std_logic_vector(3 downto 0) := "0011";
  constant LDI  : std_logic_vector(3 downto 0) := "0100";
  constant STA  : std_logic_vector(3 downto 0) := "0101";
  constant JMP  : std_logic_vector(3 downto 0) := "0110";
  constant JEQ  : std_logic_vector(3 downto 0) := "0111";
  constant CEQ  : std_logic_vector(3 downto 0) := "1000";
  constant JSR  : std_logic_vector(3 downto 0) := "1001";
  constant RET  : std_logic_vector(3 downto 0) := "1010";
  

  function initMemory
        return blocoMemoria is variable tmp : blocoMemoria := (others => (others => '0'));
  begin
      -- Palavra de Controle = SelMUX, Habilita_A, Reset_A, Operacao_ULA
      -- Inicializa os endereços:
        tmp(0)  := LDI & STD_LOGIC_VECTOR(to_unsigned(1, 9));
        tmp(1)  := STA & STD_LOGIC_VECTOR(to_unsigned(0, 9));
        tmp(2)  := SOMA & STD_LOGIC_VECTOR(to_unsigned(0, 9));
        tmp(3)  := STA & STD_LOGIC_VECTOR(to_unsigned(1, 9));
        tmp(4)  := LDA & STD_LOGIC_VECTOR(to_unsigned(0, 9));
        tmp(5)  := STA & STD_LOGIC_VECTOR(to_unsigned(257, 9));
        tmp(6)  := STA & STD_LOGIC_VECTOR(to_unsigned(258, 9));
        tmp(7)  := LDI & STD_LOGIC_VECTOR(to_unsigned(85, 9));
        tmp(8)  := STA & STD_LOGIC_VECTOR(to_unsigned(256, 9));
        tmp(9)  := LDI & STD_LOGIC_VECTOR(to_unsigned(170, 9));
        tmp(10)  := STA & STD_LOGIC_VECTOR(to_unsigned(256, 9));
        tmp(11)  := JMP & STD_LOGIC_VECTOR(to_unsigned(11, 9));
		  return tmp;
    end initMemory;

    signal memROM : blocoMemoria := initMemory;

begin
    Dado <= memROM (to_integer(unsigned(Endereco)));
end architecture;