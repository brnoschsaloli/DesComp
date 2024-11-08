 library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;


entity deslocadorGenerico is
    generic (
        larguraDadoEntrada : natural  :=    8;
        larguraDadoSaida   : natural  :=    8;
        deslocamento : natural := 2  );
    port (
        -- Input ports
        sinalIN : in  std_logic_vector(larguraDadoEntrada-1 downto 0);
        -- Output ports
        sinalOUT: out std_logic_vector(larguraDadoSaida-1 downto 0) );
end entity deslocadorGenerico;
	  
architecture comportamento of deslocadorGenerico is
begin

    sinalOUT <= sinalIN sla deslocamento;

end architecture;