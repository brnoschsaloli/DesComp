library ieee;
use ieee.std_logic_1164.all;

entity atv13 is
  -- Total de bits das entradas e saidas
  generic ( larguraDadosROM : natural := 32;
        larguraEnderecosROM : natural := 32;
		  larguraRegistradores : natural := 32;
        simulacao : boolean := TRUE -- para gravar na placa, altere de TRUE para FALSE
  );

  port   (
    CLOCK_50 : in std_logic;
    KEY: in std_logic_vector(3 downto 0); 
	 SAIDA_ULA: out std_logic_vector(31 downto 0);
	 SAIDA_INSTRU: out std_logic
  );
end entity;


architecture arquitetura of atv13 is

	signal saidaROM: std_logic_vector(31 downto 0);
	signal saidaPC : std_logic_vector (31 downto 0);
	signal proxPC : std_logic_vector (31 downto 0);
	signal saidaULA : std_logic_vector (31 downto 0);
	signal saidaBRs : std_logic_vector (31 downto 0);
	signal saidaBRt : std_logic_vector (31 downto 0);
	signal funct : std_logic_vector (5 downto 0);
	signal selULA : std_logic_vector (2 downto 0);
	signal CLK : std_logic;
	signal saidaInstru : std_logic;

begin

-- Para simular, fica mais simples tirar o edgeDetector
gravar:  if simulacao generate
CLK <= KEY(0);
else generate
detectorSub0: work.edgeDetector(bordaSubida)
        port map (clk => CLOCK_50, entrada => (not KEY(0)), saida => CLK);
end generate;

-- Instanciando os componentes:

ROM : entity work.ROMMIPS generic map(dataWidth => 32, addrWidth => 32, memoryAddrWidth => 6 )
          port map (Endereco => saidaPC, Dado => saidaROM);

-- O port map completo da ULA:
ULA1 : entity work.ULASomaSub  generic map(larguraDados => 32)
			 port map (entradaA => saidaBRs, entradaB => saidaBRt, saida => saidaULA, seletor => selULA);
				 
	-- O port map completo do Prog Counter.
PC : entity work.registradorGenerico   generic map (larguraDados => 32)
			 port map (DIN => ProxPC, DOUT => saidaPC, ENABLE => '1', CLK => CLK, RST => '0');

incrementaPC :  entity work.somaConstante  generic map (larguraDados => 32, constante => 4)
		  port map( entrada => saidaPC, saida => proxPC);
		  
bancoREG : entity work.bancoRegistradores   generic map (larguraDados => 32, larguraEndBancoRegs => 5)
          port map ( clk => CLK,
              enderecoA => saidaROM(25 downto 21),
              enderecoB => saidaROM(20 downto 16),
              enderecoC => saidaROM(15 downto 11),
              dadoEscritaC => saidaULA,
              escreveC => saidaInstru,
              saidaA => saidaBRs,
              saidaB  => saidaBRt);
				  
decoderINSTRU :  entity work.decoderInstru
        port map( opcode => saidaROM(31 downto 26),
                 saida => saidaInstru);
					  
decoderFUNCT : entity work.decoderFunct
		  port map( entrada => funct,
						saida => selULA);
				  
funct <= saidaROM(5 downto 0);
SAIDA_ULA <= saidaULA;
SAIDA_INSTRU <= saidaInstru;
		 
end architecture;