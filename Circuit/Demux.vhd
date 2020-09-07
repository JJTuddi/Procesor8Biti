library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Demux is
	Port(
	SEL: in STD_LOGIC_VECTOR (2 downto 0);
	OUTS: out STD_LOGIC_VECTOR(7 downto 0)
	);
end Demux;

architecture Demux of Demux is
begin
	OUTS(0) <= not SEL(0) and not SEL(1) and not SEL(2);
	OUTS(1) <= SEL(0) and not SEL(1) and not SEL(2);
	OUTS(2) <= not SEL(0) and SEL(1) and not SEL(2);
	OUTS(3) <= SEL(0) and SEL(1) and not SEL(2);
	OUTS(4) <= not SEL(0) and not SEL(1) and SEL(2);
	OUTS(5) <= SEL(0) and not SEL(1) and SEL(2);
	OUTS(6) <= not SEL(0) and SEL(1) and SEL(2);
	OUTS(7) <= SEL(0) and SEL(1) and SEL(2);
end Demux;
