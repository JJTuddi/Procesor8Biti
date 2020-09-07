
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity nrt_8biti is 
	port (
	clk, clr : in std_logic;
	Q: out std_logic_vector (7 downto 0) );
end nrt_8biti;

architecture mixt of nrt_8biti is
component clock_div is port (
   clk_in: in std_logic; 
   clk_out: out std_logic 
  );
end component;
signal clk_temp: std_logic;
signal temp: std_logic_vector (7 downto 0);
begin
	C1: clock_div port map(clk,clk_temp);
	process (clk, clr)
	begin
		if ((clk = '1' and clk'EVENT) and ((clr = '1') or (temp > x"7D") ) ) then
			temp <= "00000000";
		elsif ((clk = '1' and clk'EVENT)) then
			temp <= temp + "00000001";
		end if;
	end process;
	C2: Q <= temp;
end mixt;		
