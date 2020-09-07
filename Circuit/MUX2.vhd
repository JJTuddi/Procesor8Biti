library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MUX2 is 
	Port(
	In1: in STD_LOGIC_VECTOR(7 downto 0);
	In2: in STD_LOGIC_VECTOR(7 downto 0);
	SEL: in STD_LOGIC;
	OutMux: out STD_LOGIC_VECTOR(7 downto 0)
	);
end MUX2;
										 

architecture MUX2 of MUX2 is
begin
	OutMux(0) <= (not SEL and In1(0)) or (SEL and In2(0));
	OutMux(1) <= (not SEL and In1(1)) or (SEL and In2(1));
	OutMux(2) <= (not SEL and In1(2)) or (SEL and In2(2));
	OutMux(3) <= (not SEL and In1(3)) or (SEL and In2(3));
	OutMux(4) <= (not SEL and In1(4)) or (SEL and In2(4));
	OutMux(5) <= (not SEL and In1(5)) or (SEL and In2(5));
	OutMux(6) <= (not SEL and In1(6)) or (SEL and In2(6));
	OutMux(7) <= (not SEL and In1(7)) or (SEL and In2(7));
end MUX2;
