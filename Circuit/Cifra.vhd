library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Cifra is
	Port (
	A, B, C, D: in STD_LOGIC;
	Segmente: out STD_LOGIC_VECTOR(7 downto 0)
	);
end Cifra;
   
architecture Cifra of Cifra is
begin
	Segmente(1) <= (A or B) and (B or D) and (A or C or D) and (A or not C or not D) and (not A or C or not D);
	Segmente(2) <= (A or C) and (A or not D) and (C or not D) and (A or not B) and (not A or B);
	Segmente(3) <= (not A or C) and (A or B or D) and (B or not C or not D) and (not B or C or not D) and (not B or not C or D);
	Segmente(4) <= (B or D) and (not C or D) and (not A or not C) and (not A or not B) ;
	Segmente(5) <= (C or D) and (not B or D) and (not A or B) and (not A or not C) and (A or not B or C);
	Segmente(0) <= (B or D) and (A or not C) and (not B or not C) and (not A or D) and (A or not B or not D) and (not A or B or C);
	Segmente(6) <= (B or not C) and (not C or D) and (not A or B) and (not A or not D) and (A or not B or C) ;
	Segmente(7) <= '1';
end Cifra;
