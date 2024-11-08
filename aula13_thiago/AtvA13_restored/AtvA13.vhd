library ieee;
use ieee.std_logic_1164.all;

entity atvA13 is
  -- Total de bits das entradas e saidas
  generic ( larguraDados_ROM : natural := 32;
        larguraEnderecos_ROM : natural := 32;
		  larguraRegistradores : natural := 32;
        simulacao : boolean := TRUE -- para gravar na placa, altere de TRUE para FALSE
  );

  port   (
	 Simulacao_saida_ula : out std_logic_vector(31 downto 0);
    CLOCK_50 : in std_logic;
    KEY: in std_logic_vector(3 downto 0) 
  );
end entity;


architecture arquitetura of atvA13 is

	signal saida_ROM: std_logic_vector(larguraDados_ROM-1 downto 0);
	signal saida_PC : std_logic_vector (larguraEnderecos_ROM-1 downto 0);
	signal proxPC : std_logic_vector (larguraEnderecos_ROM-1 downto 0);
	signal saida_ULA : std_logic_vector (larguraDados_ROM-1 downto 0);
	signal saida_BRs : std_logic_vector (larguraRegistradores-1 downto 0);
	signal saida_BRt : std_logic_vector (larguraRegistradores-1 downto 0);
	signal saida_DEC : std_logic_vector (2 downto 0);
	signal zero_signal : std_logic;
	signal Operacao_ULA : std_logic_vector (1 downto 0);
	signal escreve_C : std_logic;
	signal CLK : std_logic;

begin

-- Para simular, fica mais simples tirar o edgeDetector
gravar:  if simulacao generate
CLK <= KEY(0);
else generate
detectorSub0: work.edgeDetector(bordaSubida)
        port map (clk => CLOCK_50, entrada => (not KEY(0)), saida => CLK);
end generate;

-- Instanciando os componentes:

ROM1 : entity work.ROMMIPS   generic map (dataWidth => larguraDados_ROM, addrWidth => larguraEnderecos_ROM, memoryAddrWidth => 6)
          port map (Endereco => saida_PC, Dado => saida_ROM);

-- O port map completo da ULA:
ULA1 : entity work.ULASomaSub  generic map(larguraDados => larguraDados_ROM)
			 port map (entradaA => saida_BRs, entradaB => saida_BRt, saida => Saida_ULA, seletor => Operacao_ULA, flagZero => zero_signal);
				 
	-- O port map completo do Prog Counter.
PC : entity work.registradorGenerico   generic map (larguraDados => larguraEnderecos_ROM)
			 port map (DIN => ProxPC, DOUT => saida_PC, ENABLE => '1', CLK => CLK, RST => '0');

incrementaPC :  entity work.somaConstante  generic map (larguraDados => larguraEnderecos_ROM, constante => 4)
		  port map( entrada => saida_PC, saida => proxPC);
		  
bancoREG : entity work.bancoRegistradores   generic map (larguraDados => 32, larguraEndBancoRegs => 5)
          port map ( clk => CLK,
              enderecoA => saida_ROM(25 downto 21),
              enderecoB => saida_ROM(20 downto 16),
              enderecoC => saida_ROM(15 downto 11),
              dadoEscritaC => saida_ULA,
              escreveC => escreve_C,
              saidaA => saida_BRs,
              saidaB  => saida_BRt);
		  
decoderI : entity work.decoderInstru
		 port map (
			opcode => saida_ROM(5 downto 0),
			saida => saida_DEC
		 );
		 
Operacao_ULA <= saida_DEC(1 downto 0);
escreve_C <= saida_DEC(2);
simulacao_saida_ula <= saida_ula;
		 
end architecture;