 library ieee;
use ieee.std_logic_1164.all;

entity atv6 is
  -- Total de bits das entradas e saidas
  generic ( larguraDados : natural := 13;
        larguraEnderecos : natural := 9;
        simulacao : boolean := FALSE -- para gravar na placa, altere de TRUE para FALSE
  );
  port   (
    CLOCK_50 : in std_logic;
    KEY: in std_logic_vector(3 downto 0);
	 LEDR: out std_logic_vector(9 downto 0)
  );
end entity;

architecture arquitetura of atv6 is

  signal WR : std_logic;
  signal RD : std_logic;
  signal Data_Address : std_logic_vector (8 downto 0);
  signal Data_IN : std_logic_vector (7 downto 0);
  signal ROM_Address : std_logic_vector (8 downto 0);
  signal Data_OUT : std_logic_vector (7 downto 0);
  signal Instruction_IN : std_logic_vector (12 downto 0);
  signal Saida_Decoder_Enderecos : std_logic_vector (7 downto 0);
  signal Saida_Decoder_Blocos : std_logic_vector (7 downto 0);
  signal CLK : std_logic;

begin

-- Instanciando os componentes:

-- Para simular, fica mais simples tirar o edgeDetector
gravar:  if simulacao generate
CLK <= KEY(0);
else generate
detectorSub0: work.edgeDetector(bordaSubida)
        port map (clk => CLOCK_50, entrada => (not KEY(0)), saida => CLK);
end generate;

CPU : entity work.CPU
			 port map (CLK => CLK, Reset => '0', Instruction_IN => Instruction_IN, Data_IN => Data_IN, ROM_Address => ROM_Address, WR => WR, RD => RD, Data_Address => Data_Address, Data_OUT => Data_OUT);

ROM1 : entity work.memoriaROM   generic map (dataWidth => larguraDados, addrWidth => larguraEnderecos)
          port map (Endereco => ROM_Address, Dado => Instruction_IN);
			 
			 
RAM1 : entity work.memoriaRAM   generic map (dataWidth => 8, addrWidth => 6)
          port map (addr => Data_Address(5 downto 0), we => WR, re => RD, habilita  => Saida_Decoder_Blocos(0), dado_in => Data_OUT, dado_out => Data_IN, clk => CLK);
			 		 
DEC3X8_BLOCOS :  entity work.decoder3x8
        port map( entrada => Data_Address(8 downto 6),
                 saida => Saida_Decoder_Blocos);

DEC3X8_ENDERECOS :  entity work.decoder3x8
        port map( entrada => Data_Address(2 downto 0),
                 saida => Saida_Decoder_Enderecos);

FFLED9 : entity work.FlipFlop   generic map (larguraDados => 1)											 
          port map (DIN => Data_OUT(0), DOUT => LEDR(9), ENABLE => (WR and Saida_Decoder_Blocos(4) and Saida_Decoder_Enderecos(2)), CLK => CLK, RST => '0'); 

FFLED8 : entity work.FlipFlop   generic map (larguraDados => 1)											 
          port map (DIN => Data_OUT(0), DOUT => LEDR(8), ENABLE => (WR and Saida_Decoder_Blocos(4) and Saida_Decoder_Enderecos(1)), CLK => CLK, RST => '0');	 

REGLEDR : entity work.registradorGenerico   generic map (larguraDados => 8)
          port map (DIN => Data_OUT, DOUT => LEDR(7 downto 0), ENABLE => (WR and Saida_Decoder_Blocos(4) and Saida_Decoder_Enderecos(0)), CLK => CLK, RST => '0');
			 

			 
end architecture;