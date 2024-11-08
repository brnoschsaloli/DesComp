library ieee;
use ieee.std_logic_1164.all;

entity atv14 is
  -- Total de bits das entradas e saidas
  generic ( larguraDadosROM : natural := 32;
        larguraEnderecosROM : natural := 32;
		  larguraRegistradores : natural := 32;
        simulacao : boolean := TRUE -- para gravar na placa, altere de TRUE para FALSE
  );

  port   (
    CLOCK_50 : in std_logic;
    KEY: in std_logic_vector(3 downto 0);
	 INSTRUCTIONS : in std_logic_vector(9 downto 0);
	 SAIDA_ULA : out std_logic_vector(31 downto 0);
	 SAIDA_BRS : out std_logic_vector(31 downto 0);
	 SAIDA_BRT : out std_logic_vector(31 downto 0);
	 ENTRADA_RS: out std_logic_vector(4 downto 0);
	 
	 PROX_PC: out std_logic_vector(31 downto 0)
  );
end entity;


architecture arquitetura of atv14 is

	signal saidaROM: std_logic_vector(31 downto 0);
		signal opcode: std_logic_vector(5 downto 0);
		signal rs: std_logic_vector(4 downto 0);
		signal rt: std_logic_vector(4 downto 0);
		signal rd: std_logic_vector(4 downto 0);
		signal shamt: std_logic_vector(4 downto 0);
		signal funct : std_logic_vector (5 downto 0);
		signal imediato: std_logic_vector(15 downto 0);
		
	signal imediatoExt: std_logic_vector(31 downto 0);
	signal entradaULAB: std_logic_vector(31 downto 0);
	signal reg3: std_logic_vector(4 downto 0);
	signal saidaPC : std_logic_vector (31 downto 0);
	signal proxPC : std_logic_vector (31 downto 0);
	signal saidaULA : std_logic_vector (31 downto 0);
	signal saidaBRs : std_logic_vector (31 downto 0);
	signal saidaBRt : std_logic_vector (31 downto 0);
	signal CLK : std_logic;
	signal muxBeqJmp: std_logic;
	signal muxRtRd: std_logic;
	signal habEscritaReg: std_logic;
	signal muxRtImediato: std_logic;
	signal ULActrl: std_logic_vector(1 downto 0);
	signal muxULAMem: std_logic;
	signal beq: std_logic;
	signal re: std_logic;
	signal wr: std_logic;
	signal muxBeq1: std_logic_vector(31 downto 0);
	signal z: std_logic;
	signal muxBeqSaida: std_logic_vector(31 downto 0);
	signal muxPCSaida: std_logic_vector(31 downto 0);
	signal saidaRAM: std_logic_vector(31 downto 0);
	signal muxULAMemSaida: std_logic_vector(31 downto 0);

begin

-- Para simular, fica mais simples tirar o edgeDetector
gravar:  if simulacao generate
CLK <= KEY(0);
else generate
detectorSub0: work.edgeDetector(bordaSubida)
        port map (clk => CLOCK_50, entrada => (not KEY(0)), saida => CLK);
end generate;

-- Instanciando os componentes:

MUXRDRT :  entity work.muxGenerico2x1 generic map (larguraDados => 5)
        port map( entradaA_MUX => rt,
                 entradaB_MUX =>  rd,
                 seletor_MUX => muxRtRd,
                 saida_MUX => reg3);
					  
MUXSAIDABR :  entity work.muxGenerico2x1 generic map (larguraDados => 32)
        port map( entradaA_MUX => saidaBRt,
                 entradaB_MUX =>  imediatoExt,
                 seletor_MUX => muxRtImediato,
                 saida_MUX => entradaULAB);

ROM : entity work.ROMMIPS generic map(dataWidth => 32, addrWidth => 32, memoryAddrWidth => 6 )
          port map (Endereco => saidaPC, Dado => saidaROM);

-- O port map completo da ULA:
ULA1 : entity work.ULASomaSub  generic map(larguraDados => 32)
			 port map (entradaA => saidaBRs, entradaB => entradaULAB, saida => saidaULA, seletor => ULActrl, zero => z);
				 
	-- O port map completo do Prog Counter.
PC : entity work.registradorGenerico   generic map (larguraDados => 32)
			 port map (DIN => muxPCSaida, DOUT => saidaPC, ENABLE => '1', CLK => CLK, RST => '0');

INCREMENTAPC :  entity work.somaConstante  generic map (larguraDados => 32, constante => 4)
		  port map( entrada => saidaPC, saida => proxPC);
		  
BANCOREG : entity work.bancoRegistradores   generic map (larguraDados => 32, larguraEndBancoRegs => 5)
          port map ( clk => CLK,
              enderecoA => rs,
              enderecoB => rt,
              enderecoC => reg3,
              dadoEscritaC => muxULAMemSaida,
              escreveC => habEscritaReg,
              saidaA => saidaBRs,
              saidaB  => saidaBRt);
				  
EXTSINAL : entity work.estendeSinalGenerico   generic map (larguraDadoEntrada => 16, larguraDadoSaida => 32)
          port map (estendeSinal_IN => imediato, estendeSinal_OUT =>  imediatoExt);


SOMADORIMEDPROXPC :  entity work.somadorGenerico  generic map (larguraDados => 32)
        port map( entradaA => proxPC, entradaB =>  imediatoExt(29 downto 0) & "00", saida => muxBeq1);
		  
MUXBEQ :  entity work.muxGenerico2x1 generic map (larguraDados => 32)
        port map( entradaA_MUX => proxPC,
                 entradaB_MUX =>  muxBeq1,
                 seletor_MUX => beq and z,
                 saida_MUX => muxBeqSaida);
					  
MUXPC :  entity work.muxGenerico2x1 generic map (larguraDados => 32)
        port map( entradaA_MUX => muxBeqSaida,
                 entradaB_MUX =>  proxPC(31 downto 28) & saidaROM(25 downto 0) & "00",
                 seletor_MUX => muxBeqJmp,
                 saida_MUX => muxPCSaida);
				  
				  
RAMMIPS : entity work.RAMMIPS 
          port map (Endereco => saidaULA,
						  we => wr,
						  re => re,
						  habilita  => '1',
						  Dado_in => saidaBRt,
						  Dado_out => saidaRAM,
						  clk => CLK);

MUXULARAM :  entity work.muxGenerico2x1 generic map (larguraDados => 32)
        port map( entradaA_MUX => saidaULA,
                 entradaB_MUX =>  saidaRAM,
                 seletor_MUX => muxULAMem,
                 saida_MUX => muxULAMemSaida);		  

opcode <= saidaROM(31 downto 26);
rs <= saidaROM(25 downto 21);
rt <= saidaROM(20 downto 16);
rd <= saidaROM(15 downto 11);
shamt <= saidaROM(10 downto 6);
funct <= saidaROM(5 downto 0);
imediato <= saidaROM(15 downto 0);


muxBeqJmp <= INSTRUCTIONS(9);
muxRtRd <= INSTRUCTIONS(8);
habEscritaReg <= INSTRUCTIONS(7);
muxRtImediato <= INSTRUCTIONS(6);
ULActrl <= INSTRUCTIONS(5 downto 4);
muxULAMem <= INSTRUCTIONS(3);
beq <= INSTRUCTIONS(2);
re <= INSTRUCTIONS(1);
wr <= INSTRUCTIONS(0);

PROX_PC <= proxPC;		
SAIDA_ULA <= saidaULA; 
SAIDA_BRS <= saidaBRs;
SAIDA_BRT<= saidaBRt;
ENTRADA_RS <= rs;
end architecture;
