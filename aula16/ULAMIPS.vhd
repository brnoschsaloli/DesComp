library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;    -- Biblioteca IEEE para funções aritméticas

entity ULAMIPS is
    generic (
        larguraDados : natural := 32
    );
    port (
        entradaA, entradaB : in  std_logic_vector(larguraDados-1 downto 0);
        seletor           : in  std_logic_vector(3 downto 0);
        saida             : out std_logic_vector(larguraDados-1 downto 0);
		  zero              : out std_logic
    );
end entity;

architecture comportamento of ULAMIPS is

    -- Sinais de controle
    signal slt       : std_logic;
    signal inverteA  : std_logic;
    signal inverteB  : std_logic;
    signal sel       : std_logic_vector(1 downto 0);

    -- Vetores de sinais intermediários
    signal muxA      : std_logic_vector(larguraDados-1 downto 0);
    signal muxB      : std_logic_vector(larguraDados-1 downto 0);
    signal soma      : std_logic_vector(larguraDados-1 downto 0);
    signal c         : std_logic_vector(larguraDados downto 0);  -- Vetor de carry com um bit extra
	 signal entrada3_MUX : std_logic_vector(larguraDados-1 downto 0);

begin

    -- Atribuição dos sinais de controle
    inverteA <= seletor(3);
    inverteB <= seletor(2);
    sel      <= seletor(1 downto 0);

    -- Inicialização do carry-in geral
    c(0) <= inverteB;

    -- Atribuição do sinal 'slt' (Set Less Than)
    slt <= (c(larguraDados) xor c(larguraDados-1)) xor soma(larguraDados-1);
	 
	 
	 -- Inicialização do vetor 'entrada3_MUX'
    entrada3_MUX <= (0 => slt, others => '0');
	 
	 zero <= '1' when unsigned(saida) = 0 else '0';

    -- Geração dos bits de 0 a (larguraDados - 1)
    gen_bits : for i in 0 to larguraDados-1 generate

        -- MUXB[i]: Seleção entre B[i] e seu complemento
        MUXB_inst : entity work.muxGenerico2x1
            generic map (larguraDados => 1)
            port map(
                entradaA_MUX => (0 => entradaB(i)),
                entradaB_MUX => (0 => not entradaB(i)),
                seletor_MUX  => inverteB,
                saida_MUX    => muxB(i downto i)
            );

        -- MUXA[i]: Seleção entre A[i] e seu complemento
        MUXA_inst : entity work.muxGenerico2x1
            generic map (larguraDados => 1)
            port map(
                entradaA_MUX => (0 => entradaA(i)),
                entradaB_MUX => (0 => not entradaA(i)),
                seletor_MUX  => inverteA,
                saida_MUX    => muxA(i downto i)
            );

        -- SOMADOR[i]: Somador completo de 1 bit
        SOMADOR_inst : entity work.somadorMIPS
            port map(
                A        => muxA(i),
                B        => muxB(i),
                CarryIn  => c(i),
                Sum      => soma(i),
                CarryOut => c(i+1)
            );

        -- MUX[i]: Seleção da operação com base no seletor 'sel'
        MUX_inst : entity work.muxGenerico4x1
            generic map (larguraDados => 1)
            port map(
                entrada0_MUX => (0 => muxB(i) and muxA(i)),
                entrada1_MUX => (0 => muxB(i) or muxA(i)),
                entrada2_MUX => (0 => soma(i)),
                entrada3_MUX => (0 => entrada3_MUX(i)),
                seletor_MUX  => sel,
                saida_MUX    => saida(i downto i)
            );

    end generate;

end architecture;
