library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX is
    Port(
        I0: in STD_LOGIC_VECTOR (7 downto 0);
        I1: in STD_LOGIC_VECTOR (7 downto 0);
        I2: in STD_LOGIC_VECTOR (7 downto 0);
        I3: in STD_LOGIC_VECTOR (7 downto 0);
        I4: in STD_LOGIC_VECTOR (7 downto 0);
        I5: in STD_LOGIC_VECTOR (7 downto 0);
        I6: in STD_LOGIC_VECTOR (7 downto 0);
        I7: in STD_LOGIC_VECTOR (7 downto 0);
        Sel: in STD_LOGIC_VECTOR (2 downto 0);
        O: out STD_LOGIC_VECTOR (7 downto 0)
    );
end MUX;

architecture Behavioral of MUX is

begin
    O(0) <= (not Sel(0) and not Sel(1) and not Sel(2) and I0(0)) or (Sel(0) and not Sel(1) and not Sel(2) and I1(0)) or (not Sel(0) and Sel(1) and not Sel(2) and I2(0)) or (Sel(0) and Sel(1) and not Sel(2) and I3(0)) or (not Sel(0) and not Sel(1) and Sel(2) and I4(0)) or (Sel(0) and not Sel(1) and Sel(2) and I5(0)) or (not Sel(0) and Sel(1) and Sel(2) and I6(0)) or (Sel(0) and Sel(1) and Sel(2) and I7(0));
    O(1) <= (not Sel(0) and not Sel(1) and not Sel(2) and I0(1)) or (Sel(0) and not Sel(1) and not Sel(2) and I1(1)) or (not Sel(0) and Sel(1) and not Sel(2) and I2(1)) or (Sel(0) and Sel(1) and not Sel(2) and I3(1)) or (not Sel(0) and not Sel(1) and Sel(2) and I4(1)) or (Sel(0) and not Sel(1) and Sel(2) and I5(1)) or (not Sel(0) and Sel(1) and Sel(2) and I6(1)) or (Sel(0) and Sel(1) and Sel(2) and I7(1));
    O(2) <= (not Sel(0) and not Sel(1) and not Sel(2) and I0(2)) or (Sel(0) and not Sel(1) and not Sel(2) and I1(2)) or (not Sel(0) and Sel(1) and not Sel(2) and I2(2)) or (Sel(0) and Sel(1) and not Sel(2) and I3(2)) or (not Sel(0) and not Sel(1) and Sel(2) and I4(2)) or (Sel(0) and not Sel(1) and Sel(2) and I5(2)) or (not Sel(0) and Sel(1) and Sel(2) and I6(2)) or (Sel(0) and Sel(1) and Sel(2) and I7(2));
    O(3) <= (not Sel(0) and not Sel(1) and not Sel(2) and I0(3)) or (Sel(0) and not Sel(1) and not Sel(2) and I1(3)) or (not Sel(0) and Sel(1) and not Sel(2) and I2(3)) or (Sel(0) and Sel(1) and not Sel(2) and I3(3)) or (not Sel(0) and not Sel(1) and Sel(2) and I4(3)) or (Sel(0) and not Sel(1) and Sel(2) and I5(3)) or (not Sel(0) and Sel(1) and Sel(2) and I6(3)) or (Sel(0) and Sel(1) and Sel(2) and I7(3));
    O(4) <= (not Sel(0) and not Sel(1) and not Sel(2) and I0(4)) or (Sel(0) and not Sel(1) and not Sel(2) and I1(4)) or (not Sel(0) and Sel(1) and not Sel(2) and I2(4)) or (Sel(0) and Sel(1) and not Sel(2) and I3(4)) or (not Sel(0) and not Sel(1) and Sel(2) and I4(4)) or (Sel(0) and not Sel(1) and Sel(2) and I5(4)) or (not Sel(0) and Sel(1) and Sel(2) and I6(4)) or (Sel(0) and Sel(1) and Sel(2) and I7(4));
    O(5) <= (not Sel(0) and not Sel(1) and not Sel(2) and I0(5)) or (Sel(0) and not Sel(1) and not Sel(2) and I1(5)) or (not Sel(0) and Sel(1) and not Sel(2) and I2(5)) or (Sel(0) and Sel(1) and not Sel(2) and I3(5)) or (not Sel(0) and not Sel(1) and Sel(2) and I4(5)) or (Sel(0) and not Sel(1) and Sel(2) and I5(5)) or (not Sel(0) and Sel(1) and Sel(2) and I6(5)) or (Sel(0) and Sel(1) and Sel(2) and I7(5));
    O(6) <= (not Sel(0) and not Sel(1) and not Sel(2) and I0(6)) or (Sel(0) and not Sel(1) and not Sel(2) and I1(6)) or (not Sel(0) and Sel(1) and not Sel(2) and I2(6)) or (Sel(0) and Sel(1) and not Sel(2) and I3(6)) or (not Sel(0) and not Sel(1) and Sel(2) and I4(6)) or (Sel(0) and not Sel(1) and Sel(2) and I5(6)) or (not Sel(0) and Sel(1) and Sel(2) and I6(6)) or (Sel(0) and Sel(1) and Sel(2) and I7(6));
    O(7) <= (not Sel(0) and not Sel(1) and not Sel(2) and I0(7)) or (Sel(0) and not Sel(1) and not Sel(2) and I1(7)) or (not Sel(0) and Sel(1) and not Sel(2) and I2(7)) or (Sel(0) and Sel(1) and not Sel(2) and I3(7)) or (not Sel(0) and not Sel(1) and Sel(2) and I4(7)) or (Sel(0) and not Sel(1) and Sel(2) and I5(7)) or (not Sel(0) and Sel(1) and Sel(2) and I6(7)) or (Sel(0) and Sel(1) and Sel(2) and I7(7));

end Behavioral;
