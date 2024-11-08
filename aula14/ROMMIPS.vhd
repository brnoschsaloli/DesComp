library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity ROMMIPS IS
   generic (
          dataWidth: natural := 32;
          addrWidth: natural := 32;
       memoryAddrWidth:  natural := 6 );   -- 64 posicoes de 32 bits cada
   port (
          Endereco : in  std_logic_vector (addrWidth-1 downto 0);
          Dado     : out std_logic_vector (dataWidth-1 downto 0) );
end entity;

architecture assincrona OF ROMMIPS IS
  type blocoMemoria IS ARRAY(0 TO 2**memoryAddrWidth - 1) OF std_logic_vector(dataWidth-1 downto 0);
-- opcode + rs + rt + rd + shamt + funct
-- opcode + rs + rt + imed(16b)
-- opcode + imed(26b)
  signal memROM: blocoMemoria := (
      0 =>  "000000" & "01101" & "01001" & "0000000000000011", -- sw -> mem[rs + imed] = rt -> mem[25] = 10
		1 =>  "000000" & "01101" & "01010" & "0000000000000011", -- lw -> rt = mem[rs + imed] -> r[10] = 10
		2 =>  "000000" & "01010" & "01101" & "01100" & "00000" & "000000", -- add -> rd = rs + rt -> r[12] = 10 + 22
      -- Adicione outras instruções aqui, se necessário
      others => (others => '0')  -- Preenche o restante com zeros
  );
  attribute ram_init_file : string;
  attribute ram_init_file of memROM:
  signal is "ROMcontent.mif";

-- Utiliza uma quantidade menor de endereços locais:
   signal EnderecoLocal : std_logic_vector(memoryAddrWidth-1 downto 0);

begin
  EnderecoLocal <= Endereco(memoryAddrWidth+1 downto 2);
  Dado <= memROM (to_integer(unsigned(EnderecoLocal)));
end architecture;