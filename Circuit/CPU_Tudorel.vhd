library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity CPU_Tudorel is 
	Port(
	CLK: in STD_LOGIC;
	FirstRegisterValue: out STD_LOGIC_VECTOR(7 downto 0);
	CLK_BLOCK: out STD_LOGIC
	);
end CPU_Tudorel;

architecture CPU_Tudorel of CPU_Tudorel is	
----------------------------------------------
component SmecheriaSuprema 
	Port(
	ALU_sel: in STD_LOGIC_VECTOR(3 downto 0); --
	SEL1: in STD_LOGIC_VECTOR (2 downto 0); -- SEL_CE;
	SEL2: in STD_LOGIC_VECTOR (2 downto 0);	--  
	CLK: in STD_LOGIC; --
	Number: in STD_LOGIC_VECTOR(7 downto 0);  --
	ZeroFlag: out STD_LOGIC; --
	PrintRegOut: out STD_LOGIC_VECTOR(7 downto 0) --
	);
end component;
---------------------------------------------- 
component ROMMemory
  Port ( 
    CLK: in STD_LOGIC;
    selectie : in STD_LOGIC_VECTOR (4 downto 0);
    output : out STD_LOGIC_VECTOR (14 downto 0)
   );
end component;
---------------------------------------------- 
component Numarator
	Port(
	CLK: in STD_LOGIC;
	IsJump: in STD_LOGIC_VECTOR(3 downto 0); -- OROM(14 downto 11)
	ZF: in STD_LOGIC; -- ALU RESULT
	PI: in STD_LOGIC_VECTOR(4 downto 0); -- OROM (10 downto 6)
	SELECTIE: out STD_LOGIC_VECTOR(4 downto 0)
	);
end component;
----------------------------------------------
signal OROM: STD_LOGIC_VECTOR (14 downto 0);  
signal SelNrtor: STD_LOGIC_VECTOR(4 downto 0);
signal ZeroFlag: STD_LOGIC;
begin
	CLK_Block <= not (OROM(14) or OROM(13) or OROM(12) or OROM(11));
	Numaratorul: Numarator port map (CLK => CLK, IsJump => OROM(14 downto 11), ZF => ZeroFlag, PI => OROM (10 downto 6), SELECTIE => SelNrtor);
	Smecheria: SmecheriaSuprema port map ( ALU_sel => OROM(14 downto 11), SEL1 => OROM(10 downto 8), SEL2 => OROM(7 downto 5), CLK => CLK, Number => OROM(7 downto 0), ZeroFlag=> ZeroFlag, PrintRegOut =>FirstRegisterValue);
	MemoriaROM: ROMMemory port map ( CLK => CLK, selectie => SelNrtor, output => OROM);

end CPU_Tudorel;
