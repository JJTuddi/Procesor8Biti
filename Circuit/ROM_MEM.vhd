library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity ROMMemory is
  Port ( 
    CLK: in STD_LOGIC;
    selectie : in STD_LOGIC_VECTOR (4 downto 0);
    output : out STD_LOGIC_VECTOR (14 downto 0)
   );
end ROMMemory;

architecture Behavioral of ROMMemory is

begin
    process(CLK)
    variable ROM_MEM : STD_LOGIC_VECTOR (479 downto 0) := "001000000010100001000100010000010100000100000011100000000000001001000010001001001100000011001010000010011011101000000000011110000000000001110000100000000100010000000010100001100000100100001100000000100001000000000100000100000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    variable result: STD_LOGIC_VECTOR(14 downto 0);
    variable number : integer range 0 to 31;
    begin
        if (CLK = '1' and CLK'EVENT) then
            number := 0;
            if (selectie(0) = '1') then
                number := 1;
            end if;
            if (selectie(1) = '1') then
                number := number + 2;
            end if;
            if (selectie(2) = '1') then
                number := number + 4;
            end if;
            if (selectie(3) = '1') then
                number := number + 8;
            end if;
            if (selectie(4) = '1') then
                number := number + 16;
            end if;	
			number := 31 - number;
            result := ROM_MEM((number+1)*15-1 downto number*15);
            output <= result;
        end if;
    end process;
end Behavioral;
