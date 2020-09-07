library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity SmecheriaSuprema is
	Port(
	ALU_sel: in STD_LOGIC_VECTOR(3 downto 0); --
	SEL1: in STD_LOGIC_VECTOR (2 downto 0); -- SEL_CE;
	SEL2: in STD_LOGIC_VECTOR (2 downto 0);	--  
	CLK: in STD_LOGIC; --
	Number: in STD_LOGIC_VECTOR(7 downto 0);  --
	ZeroFlag: out STD_LOGIC; --
	PrintRegOut: out STD_LOGIC_VECTOR(7 downto 0) --
	);
end SmecheriaSuprema;


architecture SmecheriaSuprema of SmecheriaSuprema is	
-------------------------------------------------------
component ALU 
	port (
	in1: in STD_LOGIC_VECTOR(7 downto 0);
	in2: in STD_LOGIC_VECTOR(7 downto 0);
	ALU_select: in STD_LOGIC_VECTOR (3 downto 0);
	result: out STD_LOGIC_VECTOR(7 downto 0);
	ZF: out STD_LOGIC
	);
end component;
-------------------------------------------------------
component Registru 
	Port(
	CLK: in STD_LOGIC;
	CE: in STD_LOGIC; 
	InputRegistru: in STD_LOGIC_VECTOR(7 downto 0);
	OutputRegistru: out STD_LOGIC_VECTOR(7 downto 0)
	);
end component;
-------------------------------------------------------
component MUX 
    Port(
        I0: in STD_LOGIC_VECTOR (7 downto 0);
        I1: in STD_LOGIC_VECTOR (7 downto 0);
        I2: in STD_LOGIC_VECTOR (7 downto 0);
        I3: in STD_LOGIC_VECTOR (7 downto 0);
        I4: in STD_LOGIC_VECTOR (7 downto 0);
        I5: in STD_LOGIC_VECTOR (7 downto 0);
        I6: in STD_LOGIC_VECTOR (7 downto 0);
        I7: in STD_LOGIC_VECTOR (7 downto 0);
        Sel: in STD_LOGIC_VECTOR (2 downto 0);
        O: out STD_LOGIC_VECTOR (7 downto 0)
    );
end component;
--------------------------------------------------------
component Demux
	Port(
	SEL: in STD_LOGIC_VECTOR (2 downto 0);
	OUTS: out STD_LOGIC_VECTOR(7 downto 0)
	);
end component;
--------------------------------------------------------
component MUX2 
	Port(
	In1: in STD_LOGIC_VECTOR(7 downto 0);
	In2: in STD_LOGIC_VECTOR(7 downto 0);
	SEL: in STD_LOGIC;
	OutMux: out STD_LOGIC_VECTOR(7 downto 0)
	);
end component;
----------------------------------------------------------
signal OutRegistru1, OutRegistru2, OutRegistru3, OutRegistru4, OutRegistru5, OutRegistru6, OutRegistru7, OutRegistru0: STD_LOGIC_VECTOR(7 downto 0);
signal OutMux1, OutMux2, OutMux23: STD_LOGIC_VECTOR(7 downto 0);
signal InMUX23: STD_LOGIC_VECTOR(7 downto 0);
signal CE: STD_LOGIC_VECTOR (7 downto 0);
signal SelectNumber: STD_LOGIC;
signal InputRegister: STD_LOGIC_VECTOR (7 downto 0);
begin
	PrintRegOut <= OutRegistru0;
	PrintRegister: Registru port map( CLK => CLK, CE => CE(0), InputRegistru => InputRegister, OutputRegistru => OutRegistru0);
	Registru1: Registru port map( CLK => CLK, CE => CE(1), InputRegistru => InputRegister, OutputRegistru => OutRegistru1);
	Registru2: Registru port map( CLK => CLK, CE => CE(2), InputRegistru => InputRegister, OutputRegistru => OutRegistru2);
	Registru3: Registru port map( CLK => CLK, CE => CE(3), InputRegistru => InputRegister, OutputRegistru => OutRegistru3);
	Registru4: Registru port map( CLK => CLK, CE => CE(4), InputRegistru => InputRegister, OutputRegistru => OutRegistru4);
	Registru5: Registru port map( CLK => CLK, CE => CE(5), InputRegistru => InputRegister, OutputRegistru => OutRegistru5);
	Registru6: Registru port map( CLK => CLK, CE => CE(6), InputRegistru => InputRegister, OutputRegistru => OutRegistru6);
	Registru7: Registru port map( CLK => CLK, CE => CE(7), InputRegistru => InputRegister, OutputRegistru => OutRegistru7);
	
	MUXU1: MUX port map (I0 => OutRegistru0, I1 => OutRegistru1, I2 => OutRegistru2, I3 => OutRegistru3, I4 => OutRegistru4, I5 => OutRegistru5, I6 => OutRegistru6, I7 => OutRegistru7, SEL => SEL1, O => OutMux1);
	MUXU2: MUX port map (I0 => OutRegistru0, I1 => OutRegistru1, I2 => OutRegistru2, I3 => OutRegistru3, I4 => OutRegistru4, I5 => OutRegistru5, I6 => OutRegistru6, I7 => OutRegistru7, SEL => SEL2, O => OutMux2);
	DemuxCE: Demux port map ( SEL => SEL1, OUTS => CE);
	
	arithmeticLogicUnit: ALU port map(in1 => OutMux1, in2 => OutMux2, ALU_select => ALU_sel, result => InMUX23, ZF => ZeroFlag );	  
	
	SelectNumber <= not ALU_sel(0) and ALU_sel(1) and not ALU_sel(2) and not ALU_SEL(3);
	MUX28: MUX2 port map (In1 => InMUX23, In2 => Number, SEL => SelectNumber, OutMux => InputRegister);
	
end SmecheriaSuprema;
