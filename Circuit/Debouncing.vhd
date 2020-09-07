  
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Debouncing is
    Port ( Buton : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Buton_Out : out STD_LOGIC);
end Debouncing;

architecture Behavioral of Debouncing is
signal Debounce: STD_LOGIC_VECTOR (3 downto 0);
begin
    process (CLK)
    begin
        if (CLK='1' and CLK'EVENT) then
            Debounce( 3 downto 1) <= Debounce (2 downto 0);
            Debounce(0) <= Buton;
        end if;
    end process;
    Buton_Out <= Debounce(0) and Debounce(1) and Debounce(2) and Debounce(3);
end Behavioral;