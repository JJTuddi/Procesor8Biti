library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DivizorFrecventa is
    Port ( clk : in STD_LOGIC;
           ClkDelay : out STD_LOGIC);
end DivizorFrecventa;

architecture Behavioral of DivizorFrecventa is
signal Nrt: STD_LOGIC_VECTOR (19 downto 0) := x"00000";
begin
    process (clk)
    begin
        if (clk ='1' and clk'EVENT) then
            if (Nrt > x"30D40") then
                Nrt <= x"00000";
            else
                Nrt <= Nrt + x"00001";
            end if;
        end if;
    end process;
    ClkDelay <= '0' when Nrt < x"186A0" else '1';
end Behavioral;