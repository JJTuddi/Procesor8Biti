library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Registru is	
	Port(
	CLK: in STD_LOGIC;
	CE: in STD_LOGIC; 
	InputRegistru: in STD_LOGIC_VECTOR(7 downto 0);
	OutputRegistru: out STD_LOGIC_VECTOR(7 downto 0)
	);
end Registru;

architecture Registru of Registru is
begin

	process(CLK)
	variable Registrul: STD_LOGIC_VECTOR(7 downto 0) := "00000000";
	begin
		if (CLK = '1' and CLK'EVENT and CE = '1') then
			Registrul := InputRegistru;
		end if;
		OutputRegistru <= Registrul;
	end process;
end Registru;
