library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity ALU is  
	port (
	in1: in STD_LOGIC_VECTOR(7 downto 0);
	in2: in STD_LOGIC_VECTOR(7 downto 0);
	ALU_select: in STD_LOGIC_VECTOR (3 downto 0);
	result: out STD_LOGIC_VECTOR(7 downto 0);
	ZF: out STD_LOGIC
	);
end ALU;

architecture ALU of ALU is
begin

	process(ALU_select, in1, in2)
	variable ZeroFlag: STD_LOGIC := '0';
	variable RegResult: STD_LOGIC_VECTOR (7 downto 0);
	variable MulResult: STD_LOGIC_VECTOR (15 downto 0);
	begin
		if (ALU_select = "0000" or ALU_select = "0010" or ALU_select = "1101" or ALU_select = "1110") then
			RegResult := in1;
		elsif (ALU_select = "0001") then
			RegResult := in2;
		elsif ALU_select = "0011" then
			RegResult := in1 - in2;
		elsif ALU_select = "0100" then
			RegResult := in1 + in2;
		elsif ALU_select = "0101" then
			MulResult := in1 * in2;
			RegResult := MulResult(7 downto 0);
		elsif ALU_select = "0110" then
			RegResult(7 downto 1) := in1(6 downto 0);
			RegResult(0) := '0';
		elsif ALU_select = "0111" then
			RegResult(6 downto 0) := in1(7 downto 1);
			RegResult(7) := '0';
		elsif ALU_select = "1000" then
			RegResult := not in1;
		elsif ALU_select = "1001" then
			RegResult := in1 and in2;
		elsif ALU_select = "1010" then
			RegResult := in1 or in2;
		elsif ALU_select = "1011" then
			RegResult := in1 xor in2;
		elsif ALU_select = "1100" then
			RegResult := not (in1 xor in2);
		end if;
		if (RegResult = "00000000") then
			ZeroFlag := '1';
		else
			ZeroFlag := '0';
		end if;
		result <= RegResult;
		ZF <= ZeroFlag;
	end process;

end ALU;
