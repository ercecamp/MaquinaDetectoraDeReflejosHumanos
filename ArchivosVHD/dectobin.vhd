library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity dectobin is
	Port ( Ent: in STD_LOGIC_VECTOR(15 downto 0);
		Salida : OUT STD_LOGIC_VECTOR(3 downto 0)
		);
end dectobin;

Architecture sol of dectobin is
Begin
	With Ent Select
		Salida <= 	"0001" when "0000000000000001",
						"0010" when "0000000000000010",
						"0011" when "0000000000000100",
						"0100" when "0000000000001000",
						"0101" when "0000000000010000",
						"0110" when "0000000000100000",
						"0111" when "0000000001000000",
						"1000" when "0000000010000000",
						"1001" when "0000000100000000",
						"1010" when "0000001000000000",
						"1011" when "0000010000000000",
						"1100" when "0000100000000000",
						"1101" when "0001000000000000",
						"1110" when "0010000000000000",
						"1111" when "0100000000000000",
						"0000" when others;
end sol;