 library ieee;
use ieee.std_logic_1164.all;

entity atv52 is
  -- Total de bits das entradas e saidas
  generic ( larguraDados : natural := 13;
        larguraEnderecos : natural := 9;
        simulacao : boolean := TRUE -- para gravar na placa, altere de TRUE para FALSE
  );
  port   (
    CLOCK_50 : in std_logic;
    KEY: in std_logic_vector(3 downto 0);
   PC_OUT: out std_logic_vector(larguraEnderecos-1 downto 0);
	Palavra_Controle: out std_logic_vector(8 downto 0);
	OpULA: out std_logic_vector(1 downto 0);
	EntradaB_ULA: out std_logic_vector(7 downto 0);
	RegistradorA: out std_logic_vector(7 downto 0)
  );
end entity;


architecture arquitetura of atv52 is

  signal Saida_MUX : std_logic_vector (larguraDados-6 downto 0);
  signal Saida_MUX_PC : std_logic_vector (larguraDados-5 downto 0);
  signal REG1_ULA_A : std_logic_vector (larguraDados-6 downto 0);
  signal Entrada_Flag : std_logic;
  signal Saida_Flag : std_logic;
  signal Saida_ULA : std_logic_vector (larguraDados-6 downto 0);
  signal Saida_ROM : std_logic_vector (12 downto 0);
  signal Saida_RAM : std_logic_vector (7 downto 0);
  signal Saida_Decoder : std_logic_vector (8 downto 0);
  signal Endereco : std_logic_vector (8 downto 0);
  signal proxPC : std_logic_vector (8 downto 0);
  signal Operacao_ULA : std_logic_vector (1 downto 0);
  signal CLK : std_logic;
  signal SelMUX : std_logic;
  signal JMP : std_logic;
  signal SelMUXPC : std_logic;
  signal JEQ : std_logic;
  signal Habilita_A : std_logic;
  signal habLeituraMEM : std_logic;
  signal habEscritaMEM : std_logic;
  signal habFlagIgual : std_logic;

begin

-- Instanciando os componentes:

-- Para simular, fica mais simples tirar o edgeDetector
gravar:  if simulacao generate
CLK <= KEY(0);
else generate
detectorSub0: work.edgeDetector(bordaSubida)
        port map (clk => CLOCK_50, entrada => (not KEY(0)), saida => CLK);
end generate;

-- O port map completo do MUX.
MUX1 :  entity work.muxGenerico2x1  generic map (larguraDados => larguraDados-5)
        port map( entradaA_MUX => Saida_RAM,
                 entradaB_MUX =>  Saida_ROM(7 downto 0),
                 seletor_MUX => SelMUX,
                 saida_MUX => Saida_MUX);

					  
-- O port map completo do JMP.
MUXProxPC :  entity work.muxGenerico2x1  generic map (larguraDados => larguraDados-4)
        port map( entradaA_MUX => proxPC,
                 entradaB_MUX =>  Saida_ROM(8 downto 0),
                 seletor_MUX => SelMUXPC,
                 saida_MUX => Saida_MUX_PC);

-- O port map completo do Acumulador.
REGA : entity work.registradorGenerico   generic map (larguraDados => larguraDados-5)
          port map (DIN => Saida_ULA, DOUT => REG1_ULA_A, ENABLE => Habilita_A, CLK => CLK, RST => '0');

FlagZero : entity work.FlipFlop   generic map (larguraDados => 1)											 -- MUDEI A ULA, MUDAR O PORTMAP E OQ VEM AQUI NA FLAG
          port map (DIN => Entrada_Flag, DOUT => Saida_Flag, ENABLE => habFlagIgual, CLK => CLK, RST => '0');

-- O port map completo do Program Counter.
PC : entity work.registradorGenerico   generic map (larguraDados => larguraEnderecos)
          port map (DIN => Saida_MUX_PC, DOUT => Endereco, ENABLE => '1', CLK => CLK, RST => '0');

incrementaPC :  entity work.somaConstante  generic map (larguraDados => larguraEnderecos, constante => 1)
        port map( entrada => Endereco, saida => proxPC);


-- O port map completo da ULA:
ULA1 : entity work.ULASomaSub  generic map(larguraDados => larguraDados - 5)
          port map (entradaA => REG1_ULA_A, entradaB => Saida_MUX, saida => Saida_ULA, seletor => Operacao_ULA, porta_nor => Entrada_Flag);

-- Falta acertar o conteudo da ROM (no arquivo memoriaROM.vhd)
ROM1 : entity work.memoriaROM   generic map (dataWidth => larguraDados, addrWidth => larguraEnderecos)
          port map (Endereco => Endereco, Dado => Saida_ROM);
			 
			 
RAM1 : entity work.memoriaRAM   generic map (dataWidth => larguraDados - 5, addrWidth => larguraEnderecos - 1)
          port map (addr => Endereco(7 downto 0), we => Saida_Decoder(0), re => Saida_Decoder(1), habilita  => Saida_ROM(8), dado_in => REG1_ULA_A, dado_out => Saida_RAM, clk => CLK);
			 		 
			 
-- O port map completo do decoderInstru.
DEC_Instrucao :  entity work.decoderInstru 
        port map( 
				opcode => Saida_ROM(12 downto 9),
            saida =>  Saida_Decoder
			);
			
LogicaDesvio1 : entity work.LogicaDesvio
			port map(
				entrada_flag => Saida_Flag,
				entrada_jeq  => JEQ,
				entrada_jmp  => JMP,
				saida        => SelMUXPC
			);
			

JMP <= Saida_Decoder(8);
JEQ <= Saida_Decoder(7);
SelMUX <= Saida_Decoder(6);
Habilita_A <= Saida_Decoder(5);
Operacao_ULA <= Saida_Decoder(4 downto 3);
habFlagIgual <= Saida_Decoder(2);
habLeituraMEM <= Saida_Decoder(1);
habEscritaMEM <= Saida_Decoder(0);



PC_OUT <= Endereco;
Palavra_Controle <= Saida_Decoder;
OpULA <= Operacao_ULA;
EntradaB_ULA <= Saida_MUX;
RegistradorA <= REG1_ULA_A;

end architecture;