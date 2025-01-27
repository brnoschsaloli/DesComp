library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;    -- Biblioteca IEEE para funções aritméticas

entity ULAMIPS is
    generic ( larguraDados : natural := 32 );
    port (
      entradaA, entradaB:  in STD_LOGIC_VECTOR((larguraDados-1) downto 0);
      seletor:  in STD_LOGIC_VECTOR(3 downto 0);
      saida:    out STD_LOGIC_VECTOR((larguraDados-1) downto 0)
		);
end entity;

architecture comportamento of ULAMIPS is
	
	signal slt : std_logic;
	signal inverteA : std_logic;
	signal inverteB : std_logic;
	signal sel : std_logic_vector(1 downto 0);
	signal muxA0 : std_logic;
	signal muxB0 : std_logic;
	signal soma0 : std_logic;
	signal c01 : std_logic;
	signal muxA1 : std_logic;
	signal muxB1 : std_logic;
	signal soma1 : std_logic;
	signal c12 : std_logic;
	signal muxA2 : std_logic;
	signal muxB2 : std_logic;
	signal soma2 : std_logic;
	signal c23 : std_logic;
	signal muxA3 : std_logic;
	signal muxB3 : std_logic;
	signal soma3 : std_logic;
	signal c34 : std_logic;
	signal muxA4 : std_logic;
	signal muxB4 : std_logic;
	signal soma4 : std_logic;
	signal c45 : std_logic;
	signal muxA5 : std_logic;
	signal muxB5 : std_logic;
	signal soma5 : std_logic;
	signal c56 : std_logic;
	signal muxA6 : std_logic;
	signal muxB6 : std_logic;
	signal soma6 : std_logic;
	signal c67 : std_logic;
	signal muxA7 : std_logic;
	signal muxB7 : std_logic;
	signal soma7 : std_logic;
	signal c78 : std_logic;
	signal muxA8 : std_logic;
	signal muxB8 : std_logic;
	signal soma8 : std_logic;
	signal c89 : std_logic;
	signal muxA9 : std_logic;
	signal muxB9 : std_logic;
	signal soma9 : std_logic;
	signal c910 : std_logic;
	signal muxA10 : std_logic;
	signal muxB10 : std_logic;
	signal soma10 : std_logic;
	signal c1011 : std_logic;
	signal muxA11 : std_logic;
	signal muxB11 : std_logic;
	signal soma11 : std_logic;
	signal c1112 : std_logic;
	signal muxA12 : std_logic;
	signal muxB12 : std_logic;
	signal soma12 : std_logic;
	signal c1213 : std_logic;
	signal muxA13 : std_logic;
	signal muxB13 : std_logic;
	signal soma13 : std_logic;
	signal c1314 : std_logic;
	signal muxA14 : std_logic;
	signal muxB14 : std_logic;
	signal soma14 : std_logic;
	signal c1415 : std_logic;
	signal muxA15 : std_logic;
	signal muxB15 : std_logic;
	signal soma15 : std_logic;
	signal c1516 : std_logic;
	signal muxA16 : std_logic;
	signal muxB16 : std_logic;
	signal soma16 : std_logic;
	signal c1617 : std_logic;
	signal muxA17 : std_logic;
	signal muxB17 : std_logic;
	signal soma17 : std_logic;
	signal c1718 : std_logic;
	signal muxA18 : std_logic;
	signal muxB18 : std_logic;
	signal soma18 : std_logic;
	signal c1819 : std_logic;
	signal muxA19 : std_logic;
	signal muxB19 : std_logic;
	signal soma19 : std_logic;
	signal c1920 : std_logic;
	signal muxA20 : std_logic;
	signal muxB20 : std_logic;
	signal soma20 : std_logic;
	signal c2021 : std_logic;
	signal muxA21 : std_logic;
	signal muxB21 : std_logic;
	signal soma21 : std_logic;
	signal c2122 : std_logic;
	signal muxA22 : std_logic;
	signal muxB22 : std_logic;
	signal soma22 : std_logic;
	signal c2223 : std_logic;
	signal muxA23 : std_logic;
	signal muxB23 : std_logic;
	signal soma23 : std_logic;
	signal c2324 : std_logic;
	signal muxA24 : std_logic;
	signal muxB24 : std_logic;
	signal soma24 : std_logic;
	signal c2425 : std_logic;
	signal muxA25 : std_logic;
	signal muxB25 : std_logic;
	signal soma25 : std_logic;
	signal c2526 : std_logic;
	signal muxA26 : std_logic;
	signal muxB26 : std_logic;
	signal soma26 : std_logic;
	signal c2627 : std_logic;
	signal muxA27 : std_logic;
	signal muxB27 : std_logic;
	signal soma27 : std_logic;
	signal c2728 : std_logic;
	signal muxA28 : std_logic;
	signal muxB28 : std_logic;
	signal soma28 : std_logic;
	signal c2829 : std_logic;
	signal muxA29 : std_logic;
	signal muxB29 : std_logic;
	signal soma29 : std_logic;
	signal c2930 : std_logic;
	signal muxA30 : std_logic;
	signal muxB30 : std_logic;
	signal soma30 : std_logic;
	signal c3031 : std_logic;
	signal muxA31 : std_logic;
	signal muxB31 : std_logic;
	signal soma31 : std_logic;
	signal c310 : std_logic;
	

	
    begin

-- BIT 0

MUXB0 :  entity work.muxGenerico2x1 generic map (larguraDados => 1)
        port map( entradaA_MUX => entradaB(0),
                  entradaB_MUX =>  not(entradaB(0),
                  seletor_MUX => inverteB,
                  saida_MUX => muxB0);
						
MUXA0 :  entity work.muxGenerico2x1 generic map (larguraDados => 1)
        port map( entradaA_MUX => entradaA(0),
                  entradaB_MUX =>  not(entradaA(0),
                  seletor_MUX => inverteA,
                  saida_MUX => muxA0);

					  
SOMADOR0   :  entity work.somador_completo_1bit
		  port map( A        => muxA0,
						B        => muxB0,
						CarryIn  => inverteB,
						Sum      => soma0,
						CarryOut => c01);	
	 
MUX0 :  entity work.muxGenerico4x1 generic map (larguraDados => 1)
        port map( entrada0_MUX =>  muxB0 and muxA0,
                  entrada1_MUX =>  muxB0 or muxA0,
					   entrada2_MUX =>  soma0,
					   entrada3_MUX =>  slt,				  
                  seletor_MUX => sel,
                  saida_MUX => saida(0));
						
						
-- BIT 1

MUXB1 :  entity work.muxGenerico2x1 generic map (larguraDados => 1)
        port map( entradaA_MUX => entradaB(1),
                  entradaB_MUX =>  not(entradaB(1),
                  seletor_MUX => inverteB,
                  saida_MUX => muxB1);
						
MUXA1 :  entity work.muxGenerico2x1 generic map (larguraDados => 1)
        port map( entradaA_MUX => entradaA(1),
                  entradaB_MUX =>  not(entradaA(1),
                  seletor_MUX => inverteA,
                  saida_MUX => muxA1);

					  
SOMADOR1   :  entity work.somador_completo_1bit
		  port map( A        => muxA1,
						B        => muxB1,
						CarryIn  => inverteB,
						Sum      => soma1,
						CarryOut => c12);	
	 
MUX1 :  entity work.muxGenerico4x1 generic map (larguraDados => 1)
        port map( entrada0_MUX =>  muxB1 and muxA1,
                  entrada1_MUX =>  muxB1 or muxA1,
					   entrada2_MUX =>  soma1,
					   entrada3_MUX =>  '0',				  
                  seletor_MUX => sel,
                  saida_MUX => saida(1));
						
						
-- BIT 2

MUXB2 :  entity work.muxGenerico2x1 generic map (larguraDados => 1)
        port map( entradaA_MUX => entradaB(2),
                  entradaB_MUX =>  not(entradaB(2),
                  seletor_MUX => inverteB,
                  saida_MUX => muxB2);
						
MUXA2 :  entity work.muxGenerico2x1 generic map (larguraDados => 1)
        port map( entradaA_MUX => entradaA(2),
                  entradaB_MUX =>  not(entradaA(2),
                  seletor_MUX => inverteA,
                  saida_MUX => muxA2);

					  
SOMADOR2   :  entity work.somador_completo_1bit
		  port map( A        => muxA2,
						B        => muxB2,
						CarryIn  => inverteB,
						Sum      => soma2,
						CarryOut => c23);	
	 
MUX2 :  entity work.muxGenerico4x1 generic map (larguraDados => 1)
        port map( entrada0_MUX =>  muxB2 and muxA2,
                  entrada1_MUX =>  muxB2 or muxA2,
					   entrada2_MUX =>  soma2,
					   entrada3_MUX =>  '0',				  
                  seletor_MUX => sel,
                  saida_MUX => saida(2));
						
-- BIT 3

MUXB3 :  entity work.muxGenerico2x1 generic map (larguraDados => 1)
        port map( entradaA_MUX => entradaB(3),
                  entradaB_MUX =>  not(entradaB(3),
                  seletor_MUX => inverteB,
                  saida_MUX => muxB3);
						
MUXA3 :  entity work.muxGenerico2x1 generic map (larguraDados => 1)
        port map( entradaA_MUX => entradaA(3),
                  entradaB_MUX =>  not(entradaA(3),
                  seletor_MUX => inverteA,
                  saida_MUX => muxA3);

					  
SOMADOR3   :  entity work.somador_completo_1bit
		  port map( A        => muxA3,
						B        => muxB3,
						CarryIn  => inverteB,
						Sum      => soma3,
						CarryOut => c34);	
	 
MUX3 :  entity work.muxGenerico4x1 generic map (larguraDados => 1)
        port map( entrada0_MUX =>  muxB3 and muxA3,
                  entrada1_MUX =>  muxB3 or muxA3,
					   entrada2_MUX =>  soma3,
					   entrada3_MUX =>  '0',				  
                  seletor_MUX => sel,
                  saida_MUX => saida(3));
						
						
-- BIT 4

MUXB4 :  entity work.muxGenerico2x1 generic map (larguraDados => 1)
        port map( entradaA_MUX => entradaB(4),
                  entradaB_MUX =>  not(entradaB(4),
                  seletor_MUX => inverteB,
                  saida_MUX => muxB4);
						
MUXA4 :  entity work.muxGenerico2x1 generic map (larguraDados => 1)
        port map( entradaA_MUX => entradaA(4),
                  entradaB_MUX =>  not(entradaA(4),
                  seletor_MUX => inverteA,
                  saida_MUX => muxA4);

					  
SOMADOR4   :  entity work.somador_completo_1bit
		  port map( A        => muxA4,
						B        => muxB4,
						CarryIn  => inverteB,
						Sum      => soma4,
						CarryOut => c45);	
	 
MUX4 :  entity work.muxGenerico4x1 generic map (larguraDados => 1)
        port map( entrada0_MUX =>  muxB4 and muxA4,
                  entrada1_MUX =>  muxB4 or muxA4,
					   entrada2_MUX =>  soma4,
					   entrada3_MUX =>  '0',				  
                  seletor_MUX => sel,
                  saida_MUX => saida(4));
						
-- BIT 5
-- BIT 6
-- BIT 7
-- BIT 8
-- BIT 9
-- BIT 10
-- BIT 11
-- BIT 12
-- BIT 13
-- BIT 14
-- BIT 15
-- BIT 16
-- BIT 17
-- BIT 18
-- BIT 19
-- BIT 20
-- BIT 21
-- BIT 22
-- BIT 23
-- BIT 24
-- BIT 25
-- BIT 26
-- BIT 27
-- BIT 28
-- BIT 29

		  
-- BIT 30

MUXB30 :  entity work.muxGenerico2x1 generic map (larguraDados => 1)
        port map( entradaA_MUX => entradaB(30),
                  entradaB_MUX =>  not(entradaB(30),
                  seletor_MUX => inverteB,
                  saida_MUX => muxB30);
						
MUXA30 :  entity work.muxGenerico2x1 generic map (larguraDados => 1)
        port map( entradaA_MUX => entradaA(30),
                  entradaB_MUX =>  not(entradaA(30),
                  seletor_MUX => inverteA,
                  saida_MUX => muxA30);

					  
SOMADOR30   :  entity work.somador_completo_1bit
		  port map( A        => muxA30,
						B        => muxB30,
						CarryIn  => inverteB,
						Sum      => soma30,
						CarryOut => c3031);	
	 
MUX30 :  entity work.muxGenerico4x1 generic map (larguraDados => 1)
        port map( entrada0_MUX =>  muxB30 and muxA30,
                  entrada1_MUX =>  muxB30 or muxA30,
					   entrada2_MUX =>  soma30,
					   entrada3_MUX =>  '0',				  
                  seletor_MUX => sel,
                  saida_MUX => saida(30));
						
-- BIT 31

MUXB31 :  entity work.muxGenerico2x1 generic map (larguraDados => 1)
        port map( entradaA_MUX => entradaB(31),
                  entradaB_MUX =>  not(entradaB(31),
                  seletor_MUX => inverteB,
                  saida_MUX => muxB31);
						
MUXA31 :  entity work.muxGenerico2x1 generic map (larguraDados => 1)
        port map( entradaA_MUX => entradaA(31),
                  entradaB_MUX =>  not(entradaA(31),
                  seletor_MUX => inverteA,
                  saida_MUX => muxA31);

					  
SOMADOR31   :  entity work.somador_completo_1bit
		  port map( A        => muxA31,
						B        => muxB31,
						CarryIn  => inverteB,
						Sum      => soma31,
						CarryOut => c310);	
	 
MUX31 :  entity work.muxGenerico4x1 generic map (larguraDados => 1)
        port map( entrada0_MUX =>  muxB31 and muxA31,
                  entrada1_MUX =>  muxB31 or muxA31,
					   entrada2_MUX =>  soma31,
					   entrada3_MUX =>  '0',				  
                  seletor_MUX => sel,
                  saida_MUX => saida(31));						
						
	
slt <= (c310 xor c3031) xor soma31;
inverteA <= seletor(3);		  
inverteB <= seletor(2);
sel <= seletor(1 downto 0);



end architecture;