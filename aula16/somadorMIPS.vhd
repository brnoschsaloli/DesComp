library IEEE;
use IEEE.std_logic_1164.all;

entity somadorMIPS is
  port (
    A        : in  std_logic;
    B        : in  std_logic;
    CarryIn  : in  std_logic;
    Sum      : out std_logic;
    CarryOut : out std_logic
  );
end entity somadorMIPS;

architecture comportamento of somadorMIPS is
begin
  -- Processo combinacional para o somador completo
  process(A, B, CarryIn)
  begin
    -- Cálculo da soma e do carry-out
    Sum      <= A xor B xor CarryIn;
    CarryOut <= (A and B) or (A and CarryIn) or (B and CarryIn);
  end process;
end architecture comportamento;