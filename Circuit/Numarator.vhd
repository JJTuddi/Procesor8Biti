library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
entity Numarator is	
	Port(
	CLK: in STD_LOGIC;
	IsJump: in STD_LOGIC_VECTOR(3 downto 0); -- OROM(14 downto 11)
	ZF: in STD_LOGIC; -- ALU RESULT
	PI: in STD_LOGIC_VECTOR(4 downto 0); -- OROM (10 downto 6)
	SELECTIE: out STD_LOGIC_VECTOR(4 downto 0)
	);
end Numarator;
					 

architecture Numarator of Numarator is
begin

	process(CLK)
	variable nrtor: STD_LOGIC_VECTOR(4 downto 0) := "00000"; 
	variable PL: STD_LOGIC := '0';
	begin													
		if CLK = '1' and CLK'EVENT then
			PL := (IsJump(0) and not IsJump(1) and IsJump(2) and IsJump(3)) or (not IsJump(0) and IsJump(1) and IsJump(2) and IsJump(3) and ZF);
			if (PL = '1') then
				nrtor := PI;
			else 						 
				if (nrtor /= "11111") then
					nrtor := nrtor + "00001";
				end if;
			end if;
		end if;	
		SELECTIE <= nrtor;
	end process;
end Numarator;
