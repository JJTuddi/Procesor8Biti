library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity CPU_Divizat is
	Port(
	Anozi: out STD_LOGIC_VECTOR(7 downto 0);
	Catozi: out STD_LOGIC_VECTOR(7 downto 0);
	Buton: in STD_LOGIC;
	CLK: in STD_LOGIC;
	LED: out STD_LOGIC_VECTOR(7 downto 0)
	);
end CPU_Divizat;				  

architecture CPU_Divizat of CPU_Divizat is	
-------------------------------------------
component BinaryToBCD  
	Port(
	CLK: in STD_LOGIC;
	Intrari: in STD_LOGIC_VECTOR(7 downto 0);
	Anozi: out STD_LOGIC_VECTOR(7 downto 0);
	Catozi: out STD_LOGIC_VECTOR (7 downto 0)
	);
end component;
--------------------------------------------
component DivizorFrecventa
    Port ( clk : in STD_LOGIC;
           ClkDelay : out STD_LOGIC);
end component;
--------------------------------------------
component Debouncing 
    Port ( Buton : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Buton_Out : out STD_LOGIC);
end component;
--------------------------------------------
component CPU_Tudorel  
	Port(
	CLK: in STD_LOGIC;
	FirstRegisterValue: out STD_LOGIC_VECTOR(7 downto 0);
	CLK_BLOCK: out STD_LOGIC
	);
end component;
----------------------------------------------	 
signal CLKDivizat, CLK_circuit, StopSys: STD_LOGIC;
signal PrintRegister: STD_LOGIC_VECTOR(7 downto 0);
begin						
    LED <= PrintRegister;																		
	CPU_ul: CPU_Tudorel port map(CLK => CLK_circuit, FirstRegisterValue => PrintRegister, CLK_BLOCK => StopSys);
	DivFrecv: DivizorFrecventa port map(clk => CLK, CLKDelay => CLKDivizat);
	Deb: Debouncing port map(Buton => Buton, CLK => CLKDivizat, Buton_Out => CLK_circuit);
	Afisare: BinaryToBCD port map(CLK => CLKDivizat, Intrari=> PrintRegister, Anozi=> Anozi, Catozi=> Catozi);
end CPU_Divizat;
