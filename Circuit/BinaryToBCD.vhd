library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity BinaryToBCD is  
	Port(
	CLK: in STD_LOGIC;
	Intrari: in STD_LOGIC_VECTOR(7 downto 0);
	Anozi: out STD_LOGIC_VECTOR(7 downto 0);
	Catozi: out STD_LOGIC_VECTOR (7 downto 0)
	);
end BinaryToBCD;
		   

architecture BinaryToBCD of BinaryToBCD is	   
------------------------------------------
component Cifra
	Port (
	A, B, C, D: in STD_LOGIC;
	Segmente: out STD_LOGIC_VECTOR(7 downto 0)
	);
end component;
------------------------------------------
signal Segmente1, Segmente2: STD_LOGIC_VECTOR(7 downto 0);
begin
	Anozi(7 downto 2) <= "111111";
	process(CLK)
	begin
		if (CLK = '1') then
			Anozi(1) <= '0';
			Anozi(0) <= '1';
			Catozi <= Segmente1;
		else
			Anozi(1) <= '1';
			Anozi(0) <= '0';
			Catozi <= Segmente2;
	   end if;
	end process;
	CalcSegm1: Cifra port map(A=>Intrari(7),B=>Intrari(6),C=>Intrari(5),D=>Intrari(4),Segmente=>Segmente1);
	CalcSegm2: Cifra port map(A=>Intrari(3),B=>Intrari(2),C=>Intrari(1),D=>Intrari(0),Segmente=>Segmente2);
end BinaryToBCD;
